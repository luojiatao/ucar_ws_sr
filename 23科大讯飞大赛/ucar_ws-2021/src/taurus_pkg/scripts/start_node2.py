#!/usr/bin/env python 
# -*- coding: utf-8 -*-

import rospy #导入rospy库
import os,inspect #导入os库
from std_msgs.msg import String #导入标准消息的字符串消息数据格式
from std_msgs.msg import Int8
import yaml
import time
import threading
import shutil


final_result=""

final_result = rospy.get_param('/final_goal')

xf_pub = rospy.Publisher('xf_launch', String, queue_size=1) #实例化一个消息发布函数

#初始化节点
rospy.init_node('start_node',anonymous=False)

def open_terminal(commands):
    '''
    打开一个新的终端并执行命令
    未作参数检查，不要试图在传入的命令字符串中添加多余的引号，可能会引发错误
    '''
    cmd_list = []
    for cmd in commands:
        cmd_list.append(""" gnome-terminal --tab -e "bash -c '%s;exec bash'" >/dev/null  2>&1 """ %cmd)

    os.system(';'.join(cmd_list))


def play_ready(filepath):
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/ready/"+filepath+".mp3"
    os.system(cmd)

def ready_callback(data):
    global ready_state
    ready_state = data.data
    print(ready_state)

def ros_node_num():
    ros_node_str=os.popen("rosnode list")
    node_list=ros_node_str.read().split("\n")
    #print(node_list)
    #for ele in ros_node_str.read().split("\n"):
    #    print(ele)
    node_list.remove('')
    print(node_list)
    print(len(node_list))
    return len(node_list)

def msg_sub():
    rospy.Subscriber("/ready_state",String,ready_callback,queue_size=1)

def thread_job():
    rospy.spin() 

if __name__ == "__main__":
    ready_state = ''
    msg_sub()
    add_thread = threading.Thread(target = thread_job)
    add_thread.start()
    play_ready(final_result)
    play_ready("load")
    task_count = 0
    xf_flag = 0
    flag = 0
    start_time = rospy.Time.now().to_sec()
    while not rospy.is_shutdown():
        now_time = rospy.Time.now().to_sec()
        if ready_state =='1':
            play_ready("net_finish")
            task_count = task_count+1
            ready_state=''
        if ready_state =='3':
            play_ready("main_finish")
            task_count = task_count+1
            ready_state=''
        if ready_state =='4':
            play_ready("voice_finish")
            task_count = task_count+1
            ready_state=''
        if (now_time-start_time)>10 and flag==0:
            play_ready("nav_finish")
            task_count = task_count+1
            flag=1
        if task_count == 3 and xf_flag==0:
            xf_data = String()
            xf_data.data = 'Y'
            xf_pub.publish(xf_data)
            xf_flag = 1
        if task_count ==4:
            break
        if (now_time-start_time)>90:
           play_ready("error_timeout")
           cmd="sudo poweroff"
           os.system(cmd)
    
    if ros_node_num() < 13:
        play_ready("error_check")
        cmd="sudo poweroff"
        os.system(cmd)
    else:
        play_ready("load_finish")
        play_ready("wait_start")
        rospy.signal_shutdown("finish")
