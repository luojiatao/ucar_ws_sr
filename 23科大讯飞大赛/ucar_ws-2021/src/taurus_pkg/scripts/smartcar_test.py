#!/usr/bin/env python 
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
from darknet_msgs.msg import darknet, darknet2
import yaml
import time
import threading
import tf
import shutil

from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray

count_marker = 0
MARKERS_MAX = 100
markerArray = MarkerArray()

#目标点数组     [x,y,z,x,y,z,w]
goal_point_1 = [[-1.0,0.255,180,0.3],[-1.2,0.255,180,0.17],[-1.4,0.255,180,0.17],[-1.6,0.255,180,0.17]]
goal_point_4 = [[-2.5,-0.21,170,0.2]]
goal_point = [
#[-1.2,0.253,180,0.2],
#[-2.4,-0.18,180,0.3],
#[-2.5,1.24,0,0.3],
#[-1.3,1.74,160,0.1],
[-1.3,1.72,175,0.07],
#[-1.85,1.75,175,0.15],
#[0.135,2.126,-95,0.3]
]
goal_point_2 =[[-1.5,3,0,0.2],[-1.0,3.25,-10,0.25]]
goal_point_3 = [-0.25,1.25,-90,0.85]
goal_index = 0  #发布目标点索引


arcuo_id_list=["0","1","2"]
nav_goals=[]
goal_dict=dict()
place_name=""
aruco_id=""
final_result=""

ready_data = String()

final_result = rospy.get_param('/final_goal')

#初始化节点
rospy.init_node('smartcar_test',anonymous=False)
square_size = 1.0
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=5) #实例化一个消息发布函数
move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction) #action服务器连接

goal_arrive_pub = rospy.Publisher('/goal_arrive',Int8,queue_size=1)

end_pub = rospy.Publisher('/move_base_simple/goal_arrive',Int8,queue_size=1)

ready_state_pub = rospy.Publisher("/ready_state",String,queue_size=1)

tf_listener = tf.TransformListener()

topic = 'visualization_marker_array'
Marker_publisher = rospy.Publisher(topic, MarkerArray)

#设置参数 
rospy.loginfo('等待move_base action服务器连接...')
move_base.wait_for_server(rospy.Duration(30))
rospy.loginfo('已连接导航服务')

yaml_path = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))) + "/goal.yaml"
#添加导航坐标点,输入x（前）坐标，y（左）坐标，th（平面朝向0～360度）

def mark_point(x,y):
    global count_marker
    global MARKERS_MAX
    global markerArray
    global Marker_publisher

    marker = Marker()
    marker.header.frame_id = "map"
    marker.type = marker.SPHERE
    marker.action = marker.ADD
    marker.scale.x = 0.1
    marker.scale.y = 0.1
    marker.scale.z = 0.1
    marker.color.a = 1.0
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 0.0
    marker.pose.orientation.w = 1.0
    marker.pose.position.x = x
    marker.pose.position.y = y
    marker.pose.position.z = 0
    if(count_marker > MARKERS_MAX):
       markerArray.markers.pop(0)
    markerArray.markers.append(marker)
     # Renumber the marker IDs
    id = 0
    for m in markerArray.markers:
       m.id = id
       id += 1
   # Publish the MarkerArray
    Marker_publisher.publish(markerArray)
    count_marker += 1

def reconfigure_zero_y():
    print("set 0 ")
    cmd = "rosrun dynamic_reconfigure dynparam set /move_base/TebLocalPlannerROS max_vel_y 0.0"
    os.system(cmd)
    print("finish set 0")

def reconfigure_nomal_y():
    cmd = "rosrun dynamic_reconfigure dynparam set /move_base/TebLocalPlannerROS max_vel_y 0.3"
    os.system(cmd)


def open_terminal(commands):
    '''
    打开一个新的终端并执行命令
    未作参数检查，不要试图在传入的命令字符串中添加多余的引号，可能会引发错误
    '''
    cmd_list = []
    for cmd in commands:
        cmd_list.append(""" gnome-terminal --tab -e "bash -c '%s;exec bash'" >/dev/null  2>&1 """ %cmd)

    os.system(';'.join(cmd_list))

def get_pos(goal,dis):    
    try:
        (trans, rot) = tf_listener.lookupTransform('/map', '/base_link', rospy.Time(0))
    #rospy_Time(0)指最近时刻存储的数据
    #得到从 '/map' 到 '/base_link' 的变换，在实际使用时，转换得出的坐标是在 '/base_link' 坐标系下的。
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        rospy.loginfo("tf Error")
        return None
    #   euler = transformations.euler_from_quaternion(rot)    #将四元数转换为欧拉角
    #print euler[2] / pi * 180
    pos_x = trans[0]
    pos_y = trans[1]
    if((goal.target_pose.pose.position.x-pos_x)**2+(goal.target_pose.pose.position.y-pos_y)**2  <= dis**2):
        return True
    else:
        #print('not reach the goal')
        return False

def nav_to(x,y,th,timeout,dis):
    mark_point(x,y)
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id='map'
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose = pose_e(x,y,th)
    move(goal,timeout,dis)

def get_state(goal,timeout,dis):
    start_time = rospy.Time.now().to_sec()
    while  not rospy.is_shutdown():
        state = move_base.get_state()
        #print(str(state))
        now_time = rospy.Time.now().to_sec()
        if state == 3 or get_pos(goal,dis) :
           return True
        if (now_time-start_time)>timeout:
           return False

#写一个函数 用于任务完成提示。
def move(goal,timeout,dis):
    move_base.send_goal(goal)
    #state = move_base.get_state()
    #print(str(state))
    #state = move_base.get_state()
    #print(str(state))
    if get_state(goal,timeout,dis):
        rospy.loginfo(place_name+'导航成功！')
    else:
        while not rospy.is_shutdown():
            rospy.loginfo('时间超时，进入恢复状态，重新导航。')
            move_for(0,-1.2,5)
            move_base.send_goal(goal)
            if get_state(goal,timeout,dis):
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

def play_number(filepath):
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/number/"+filepath+".mp3"
    os.system(cmd)
def play_item(filepath):
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/item/"+filepath+".mp3"
    os.system(cmd)
def play_meal(filepath):
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/meal/"+filepath+".mp3"
    os.system(cmd)


# def nav_callback(data):
#     g=data.data
#     goal=g.decode("utf-8")
#     if goal in nav_goals:
#         goal_data=goal_dict[goal]
#         nav_to(goal_data[0],goal_data[1],goal_data[2])

def aruco_callback(data):
    global aruco_id
    aruco_id = data.data
    print(aruco_id)

def darknet_callback(data):
    global person_list
    global get_result
    person_list[0] = data.SY0
    person_list[1] = data.SN1
    person_list[2] = data.SY2
    person_list[3] = data.SN3
    person_list[4] = data.LY4
    person_list[5] = data.LY5
    person_list[6] = data.LN6
    person_list[7] = data.LY7
    for index in range(len(person_list)):
        if person_list[index]>1:
            person_list[index]=1
    person_total = person_list[0] + person_list[1] + person_list[2] + person_list[3] + person_list[4] + person_list[5] + person_list[6] + person_list[7]
    if person_total==2:
        get_result = 2
    else:
        get_result = 1

def start_callback(data):
    global start_game
    if 'g' in data.data:
        start_game = 1
    elif 'p' in data.data:
        start_game = 2

def nav_place(place,timeout,dis):
    global place_name
    place_name=place
    print("尝试导航去:"+place_name)
    goal=place
    if goal in nav_goals:
        goal_data=goal_dict[goal]
        nav_to(goal_data[0],goal_data[1],goal_data[2],timeout,dis)

def move_for(xspeed,tspeed,time_second):
    twist_data=Twist()
    twist_data.linear.x=xspeed
    twist_data.angular.z=tspeed
    time_start=time.time()
    while time.time()-time_start<time_second:
        cmd_vel_pub.publish(twist_data)
    cmd_vel_pub.publish(Twist())

def msg_sub():
    rospy.Subscriber("/easy_aruco_node/aruco_id",String,aruco_callback,queue_size=1)
    rospy.Subscriber("/darknet_result",darknet2,darknet_callback,queue_size=1)
    rospy.Subscriber("/start_move",String,start_callback,queue_size=1)

def arrvie_pub_data(num):
    global goal_arrive_pub
    arrvie_id = Int8()
    arrvie_id.data = num
    goal_arrive_pub.publish(arrvie_id)

def thread_job():
    rospy.spin() 

if __name__ == "__main__":
    global person_list
    global get_result
    global start_game
    #global goal_index
    #global goal_point
    #global final_result
    get_result = 0
    start_game = 0
    person_list = [0,0,0,0,0,0,0,0]
    yaml_read()
    shutil.rmtree("/home/ucar/ucar_ws/src/taurus_pkg/darknet",ignore_errors=True)
    os.mkdir("/home/ucar/ucar_ws/src/taurus_pkg/darknet")
    msg_sub()
    add_thread = threading.Thread(target = thread_job)
    add_thread.start()
    print("Wait for start!!!")
    ready_data.data = '3'
    ready_state_pub.publish(ready_data)
    #reconfigure_zero_y()
    while not rospy.is_shutdown():
        if start_game !=0:
             break

    #reconfigure_zero_y()
    #mark_point(goal_point_1[0][0],goal_point_1[0][1])
    nav_to(goal_point_1[0][0],goal_point_1[0][1],goal_point_1[0][2],10,goal_point_1[0][3])
    
    #mark_point(goal_point_1[1][0],goal_point_1[1][1])
    nav_to(goal_point_1[1][0],goal_point_1[1][1],goal_point_1[1][2],10,goal_point_1[1][3])
    #mark_point(goal_point_1[2][0],goal_point_1[2][1])
    nav_to(goal_point_1[2][0],goal_point_1[2][1],goal_point_1[2][2],10,goal_point_1[2][3])
    #mark_point(goal_point_1[3][0],goal_point_1[3][1])
    nav_to(goal_point_1[3][0],goal_point_1[3][1],goal_point_1[3][2],10,goal_point_1[3][3])
    #reconfigure_nomal_y()

    nav_place("A1",8,0)
    rospy.sleep(0.25)
    arrvie_pub_data(20)
    while not rospy.is_shutdown():
        if(os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg")):
            break
    arrvie_pub_data(10)

    #此处增加多点导航
    for goal_index in range(len(goal_point_4)):  #多点导航
        mark_point(goal_point_4[goal_index][0],goal_point_4[goal_index][1])
        nav_to(goal_point_4[goal_index][0],goal_point_4[goal_index][1],goal_point_4[goal_index][2],10,goal_point_4[goal_index][3])
    

    nav_place("A2",10,0)
    rospy.sleep(0.25)
    arrvie_pub_data(21)
    while not rospy.is_shutdown():
        if(os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg")):
            break
    arrvie_pub_data(11)
    #此处增加多点导航
    
    for goal_index in range(len(goal_point)):  #多点导航
        #mark_point(goal_point[goal_index][0],goal_point[goal_index][1])
        nav_to(goal_point[goal_index][0],goal_point[goal_index][1],goal_point[goal_index][2],10,goal_point[goal_index][3])
        
    
    nav_place("B",10,0)
    arrvie_pub_data(1)
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/meal.mp3"
    os.system(cmd)

    start_time3 = rospy.Time.now().to_sec()
    while not rospy.is_shutdown():
        now_time3 = rospy.Time.now().to_sec()
        if aruco_id =='0':
            play_meal("vegetable")
            break
        elif aruco_id == '1':
            play_meal("fruit")
            break
        elif aruco_id == '2':
            play_meal("meat")
            break
        elif (now_time3-start_time3)>3:
            break
    mark_point(goal_point_2[0][0],goal_point_2[0][1])
    nav_to(goal_point_2[0][0],goal_point_2[0][1],goal_point_2[0][2],10,goal_point_2[0][3])

    mark_point(goal_point_2[1][0],goal_point_2[1][1])
    nav_to(goal_point_2[1][0],goal_point_2[1][1],goal_point_2[1][2],10,goal_point_2[1][3])

    if get_result != 2:
        nav_place("C",10,0)
        rospy.sleep(0.25)
        arrvie_pub_data(22)
        while not rospy.is_shutdown():
            if(os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/2.jpg")):
                break
        move_for(0,-1.1,1.0)
        rospy.sleep(0.3)
        arrvie_pub_data(23)
        while not rospy.is_shutdown():
            if(os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/3.jpg")):
                break
        arrvie_pub_data(41)

    arrvie_id = Int8()
    arrvie_id.data = 4
    #goal_arrive_pub.publish(arrvie_id)

    mark_point(goal_point_3[0],goal_point_3[1])
    nav_to(goal_point_3[0],goal_point_3[1],goal_point_3[2],10,goal_point_3[3])

    nav_place(final_result,10,0)
    end_pub.publish(arrvie_id)
    start_time2 = rospy.Time.now().to_sec()
    while not rospy.is_shutdown():
        now_time2 = rospy.Time.now().to_sec()
        if get_result !=0:
            cmd="play ~/ucar_ws/src/taurus_pkg/mp3/Start.mp3"
            os.system(cmd)
            total = person_list[0]+person_list[1]+person_list[2]+person_list[3]+person_list[4]+person_list[5]+person_list[6]+person_list[7]
            play_number(str(total))
            play_item("Glass")
            Glass = person_list[0]+person_list[2]+person_list[4]+person_list[5]+person_list[7]
            play_number(str(Glass))
            play_item("Long")
            Long = person_list[4]+person_list[5]+person_list[6]+person_list[7]
            play_number(str(Long))
            break
        if (now_time2-start_time2)>5:
            break
    cmd="play ~/ucar_ws/src/taurus_pkg/mp3/final.mp3"
    os.system(cmd)
    rospy.sleep(5)
    #cmd="sudo poweroff"
    #os.system(cmd)
    
    
    #cmd="play ~/ucar_ws/src/taurus_pkg/mp3/final.mp3"
    #os.system(cmd)
