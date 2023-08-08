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


def msg_sub():
    rospy.Subscriber("/ready_state",String,ready_callback,queue_size=1)

def thread_job():
    rospy.spin() 

if __name__ == "__main__":
    ready_state = ''
    msg_sub()
    add_thread = threading.Thread(target = thread_job)
    add_thread.start()
    play_ready("load")
    play_ready("load_net")
    cmd_stand = ['roslaunch taurus_pkg cam_net.launch']
    open_terminal(cmd_stand)
    while not rospy.is_shutdown():
        if ready_state =='1':
             break
    play_ready("net_finish")
    play_ready("load_nav")
    cmd_stand = ['roslaunch ucar_nav navi_fast.launch']
    open_terminal(cmd_stand)
    rospy.sleep(10)
    """while not rospy.is_shutdown():
        if ready_state =='2':
             break
    """
    play_ready("nav_finish")
    play_ready("load_main")
    play_ready(final_result)
    if final_result=='D1':
        cmd_stand = ['roslaunch taurus_pkg smartcar_net_d1.launch']
        open_terminal(cmd_stand)
    elif final_result=='D2':
        cmd_stand = ['roslaunch taurus_pkg smartcar_net_d2.launch']
        open_terminal(cmd_stand)
    elif final_result=='D3':
        cmd_stand = ['roslaunch taurus_pkg smartcar_net_d3.launch']
        open_terminal(cmd_stand)
    while not rospy.is_shutdown():
        if ready_state =='3':
             break
    play_ready("main_finish")
    play_ready("load_voice")
    cmd_stand = ['roslaunch xf_mic_asr_offline xf_mic_asr_offline.launch']
    open_terminal(cmd_stand)
    while not rospy.is_shutdown():
        if ready_state =='4':
             break
    play_ready("voice_finish")
    play_ready("load_finish")
    play_ready("wait_start")
    rospy.signal_shutdown("finish")
    
    
    
    #cmd="play ~/ucar_ws/src/taurus_pkg/mp3/final.mp3"
    #os.system(cmd)
