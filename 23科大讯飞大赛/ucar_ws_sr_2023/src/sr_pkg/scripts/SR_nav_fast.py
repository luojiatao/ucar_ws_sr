#!/usr/bin/env python2 
# -*- coding: utf-8 -*-

import rospy #导入rospy库
import actionlib #导入actionlib 库
import os,inspect #导入os库
from actionlib_msgs.msg import * #导入actionlib的所有模块
from geometry_msgs.msg import Pose, Point, Quaternion, Twist #导入四个消息数据类型，姿态，目标点，四元数，运动消息Twist
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal #导入movebase的两个消息数据类型
from tf.transformations import quaternion_from_euler #导入tf变换库的欧拉角转四元数库
from math import pi #导入圆周率pi
from std_msgs.msg import String #导入标准消息的字符串消息数据格式
from std_msgs.msg import Int8
from darknet_msgs.msg import darknet
import yaml
import time
import threading
import shutil
import my_darknet_SR
from sensor_msgs.msg import Image

nav_goals=[]
goal_dict=dict()
place_name=""

#初始化节点
rospy.init_node('smartcar_test',anonymous=False)
square_size = 1.0
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=5) #实例化一个消息发布函数
move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction) #action服务器连接

goal_arrive_pub = rospy.Publisher('/goal_arrive',String,queue_size=1)
xf_pub = rospy.Publisher('xf_launch', String, queue_size=1) #实例化一个消息发布函数


#end_pub = rospy.Publisher('/move_base_simple/goal_arrive',Int8,queue_size=1)


#设置参数 
rospy.loginfo('等待move_base action服务器连接...')
move_base.wait_for_server(rospy.Duration(30))
rospy.loginfo('已连接导航服务')

yaml_path = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))) + "/goal.yaml"
#添加导航坐标点,输入x（前）坐标，y（左）坐标，th（平面朝向0～360度）
def nav_to(x,y,th):
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id='map'
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose = pose_e(x,y,th)
    move(goal)

def get_state(timeout):
    start_time = rospy.Time.now().to_sec()
    while  not rospy.is_shutdown():
        state = move_base.get_state()
        #print(str(state))
        now_time = rospy.Time.now().to_sec()
        if state == 3:
           return True
        if (now_time-start_time)>timeout:
           return False

#写一个函数 用于任务完成提示。
def move(goal):
    move_base.send_goal(goal)
    if get_state(18):
        rospy.loginfo(place_name+'导航成功！')
    else:
        while not rospy.is_shutdown():
            rospy.loginfo('时间超时，进入恢复状态，重新导航。')
            move_for(0,-1.2,1)
            move_base.send_goal(goal)
            if get_state(8):
                break
    
def shutdown():
    rospy.loginfo('机器人任务停止')
    move_base.cancel_goal()
    rospy.sleep(2)
    cmd_vel_pub.publish(Twist)
    rospy.sleep(1)
    
def pose_e(x,y,th):#输入x（前）坐标，y（左）坐标，th（平面朝向0～360度）
    new_pose=Pose()
    new_pose.position.x=float(x)
    new_pose.position.y=float(y)
    #机器朝向，平面朝向弧度转化成四元数空间位姿
    q=quaternion_from_euler(0.0,0.0,float(th)/180.0*pi)
    new_pose.orientation.x=q[0]
    new_pose.orientation.y=q[1]
    new_pose.orientation.z=q[2]
    new_pose.orientation.w=q[3]
    return  new_pose

def yaml_read():
    global goal_dict
    global nav_goals
    f = open(yaml_path) 
    cfg =  f.read()
    goal_dict = yaml.load(cfg)
    nav_goals=goal_dict.keys()



def nav_callback(data):
    g=data.data
    goal=g.decode("utf-8")
    if goal in nav_goals:
        goal_data=goal_dict[goal]
        nav_to(goal_data[0],goal_data[1],goal_data[2])




def nav_place(place):
    global place_name
    place_name=place
    print("尝试导航去:"+place_name)
    goal=place
    if goal in nav_goals:
        goal_data=goal_dict[goal]
        nav_to(goal_data[0],goal_data[1],goal_data[2])
        
        

def move_for(xspeed,tspeed,time_second):
    twist_data=Twist()
    twist_data.linear.x=xspeed
    twist_data.angular.z=tspeed
    time_start=time.time()
    while time.time()-time_start<time_second:
        cmd_vel_pub.publish(twist_data)
    cmd_vel_pub.publish(Twist())

def move_forward_x(xspeed,time_second):
    twist=Twist()
    twist.linear.x=xspeed
    time_start=time.time()
    while time.time()-time_start<time_second:
        cmd_vel_pub.publish(twist)
    cmd_vel_pub.publish(Twist())

def move_forward_y(yspeed,time_second):
    twist=Twist()
    twist.linear.y=yspeed
    time_start=time.time()
    while time.time()-time_start<time_second:
        cmd_vel_pub.publish(twist)
    cmd_vel_pub.publish(Twist())

# def msg_sub():
#     rospy.Subscriber("/darknet_result",darknet,darknet_callback,queue_size=1)
#     rospy.Subscriber("/start_move",String,start_callback,queue_size=1)

def thread_job():
    rospy.spin() 


#yolov3实时检测回调函数：####################################################
def image_callback(msg):
  # 处理图像消息
    cv_image = bridge.imgmsg_to_cv2(msg,desired_encoding='bgr8')
  # BGR转RGB
    cv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2RGB)
    #检测结果是一个list,每个元素是一个tuple
    result= my_darknet_SR.detect( net, meta, cv_image)
    for item in result:
       set(result_class).append(item[0])  # 只能添加元素,不能计数
############################################################################################

if __name__ == "__main__":
    global E_result
    global D_result
    global C_result
    global B_result  
    global F_result
    global net
    global meta

    E_result = []
    D_result = []
    C_result = []
    B_result = []
    F_max={}
    F_result = []
    F1_result = []
    F2_result = []
    F3_result = []
    F4_result = []
    F5_result = []

    #result_class 是一个包含检测结果的列表
    result_class = []
    target_set1= ['cuv', 'riv', 'whv', 'cov']
    target_set2 = ['cuf1', 'cuf2', 'cuf3', 'cof1','cof2','waf']


    #视觉方面的代码：yolov3实时检测################################################

    print("开始加载darknet yolov3神经网络!")
    net,meta =my_darknet_SR.load_net_for_ready()
    print("数据载入成功!  darknet yolov3神经网络成功接入!")

    # rospy.init_node('darknet_node', anonymous=False)
    image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, image_callback) 

 ##############################################################################

    yaml_read()
    shutil.rmtree("/home/luo/ucar_ws_sr/src/sr_pkg/darknet",ignore_errors=True)
    os.mkdir("/home/luo/ucar_ws_sr/src/sr_pkg/darknet")
    # msg_sub()
    add_thread = threading.Thread(target = thread_job)
    add_thread.start()

    # xf_data = String()
    # xf_data.data = 'Y'
    # xf_pub.publish(xf_data)


    print("Wait for start!!!")
    move_forward_x(1.0,1.0)
##################################################################
    #进入E区域进行实时识别
    nav_place("E2")
    if not (set(target_set1) &set(result_class)):
        #没有检测到目标，继续寻找
        nav_place("E3")
        if not (set(target_set1) &set(result_class)):
            move_for(0,-1.2,1)
    try:
        E_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 
    ####################################################################
    nav_place("D1")
    result_class=[]
    if not (set(target_set1) &set(result_class)):
        nav_place("D2")
        if not (set(target_set1) &set(result_class)):
            nav_place("D3")
    try:
        D_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 

####################################################################
    nav_place("Z1")
    nav_place("Z2")
    ####################################################################
    nav_place("C1")
    result_class=[]
    if not (set(target_set1) &set(result_class)):
        nav_place("C2")
        if not (set(target_set1) &set(result_class)):
            move_forward_x(1.0,1.0)
    try:
        C_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 

##################################################################
    nav_place("B1")
    result_class=[]
    if not (set(target_set1) &set(result_class)):
        nav_place("B2")
        if not (set(target_set1) &set(result_class)):
            move_forward_x(1.0,1.0)
    try:
        B_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 

###################################################################
    nav_place("Z3")
    nav_place("Z4")
###################################BACK
    nav_place("E4")
####################################BACK
    nav_place("A1")
    nav_place("A2")
    result_class=[]
    nav_place("F1")
    if not (set(target_set2) &set(result_class)):
        nav_place("F2")
    try:
        F1_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 

###################################################################
    nav_place("F3")
    result_class=[]
    if not (set(target_set2) &set(result_class)):
            nav_place("F31")
    try:
        F2_result = result_class[0]
    except IndexError:
        # 列表为空,进行相应处理
        pass 

###################################################################

    rospy.signal_shutdown('Closing node') 

#####################################################################
    F_result=F1_result + F2_result

    cof = 0 
    cuf = 0
    waf = 0

    for result in F_result:
        if result == 'cuf1':
            cuf += 1
        elif result == 'cuf2':
            cuf += 2
        elif result == 'cuf3':
            cuf += 3
        elif result == 'cof1':
            cof += 1
        elif result == 'cof2':    
            cof += 2
        elif result == 'waf':
            waf += 1
            
    max_val = 0
    max_key = None
    max_count = 0

    if cuf > max_val:
        max_val = cuf
        max_key = 'cuf'
        max_count = cuf 
    if cof > max_val:
        max_val = cof
        max_key = 'cof' 
        max_count = cof
    if waf > max_val:
        max_key = 'waf'
        max_count = waf
    
    F_max={max_key:max_count}
################################################################################

    print("识别结果:")
    print(B_result,C_result,D_result,E_result,F_max)
            



