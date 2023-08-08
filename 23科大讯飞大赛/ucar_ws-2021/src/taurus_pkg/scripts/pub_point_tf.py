#! /usr/bin/env python
# coding=UTF-8
import rospy
import time
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
import tf
#from tf_conversions import transformations    #库函数
from math import pi    #库函数
from tf.transformations import quaternion_from_euler #导入tf变换库的欧拉角转四元数库

#目标点数组     [x,y,z,x,y,z,w]
goal_point = [
[-1.2,0.253,180,0.3],
#[-2.5,-0.25,170,0.35],
[-2.5,1.24,0,0.3],
[-1.242,1.5,95,0.21],
#[-1.25,1.74,180,0.21],
[-2.0,1.755,170,0.25],
[0.135,2.126,-95,0.3]
]
x =0
y = 0
th = 0
goal_index = 0  #发布目标点索引
pub_next_goal = False
#xy_tolerate = 0.3   #离目标点容忍度 /m
point_num = 4   #导航点数目-1


#定义发布目标点函数
def pub_goal():
    global goal_index
    q=quaternion_from_euler(0.0,0.0,float(goal_point[goal_index][2])/180.0*pi)
    mypose.header.frame_id='map' #设置自己的目标
    mypose.pose.position.x=goal_point[goal_index][0]
    mypose.pose.position.y=goal_point[goal_index][1]
    mypose.pose.position.z=0
    mypose.pose.orientation.x=q[0]
    mypose.pose.orientation.y=q[1]
    mypose.pose.orientation.z=q[2]
    mypose.pose.orientation.w=q[3]
    turtle_vel_pub.publish(mypose) #发送自己设置的目标点
    print('success pub goal:%d'%goal_index)

'''
def update_position(odom_data):  
        """更新坐标以及线速度"""
        global x,y
        x = odom_data.pose.pose.position.x
        y = odom_data.pose.pose.position.y
       # print('x=%f'%x)
        #print('y=%f'%y)
'''
#定义更新坐标函数
def get_pos():    
        try:
            (trans, rot) = tf_listener.lookupTransform('/map', '/base_link', rospy.Time(0))
        #rospy_Time(0)指最近时刻存储的数据
        #得到从 '/map' 到 '/base_link' 的变换，在实际使用时，转换得出的坐标是在 '/base_link' 坐标系下的。
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            rospy.loginfo("tf Error")
            return None
        #   euler = transformations.euler_from_quaternion(rot)    #将四元数转换为欧拉角
        #print euler[2] / pi * 180
        global x,y,th
        x = trans[0]
        y = trans[1]
        #th = euler[2] / pi * 180

#定义判断是否到达离目标点指定距离函数
def reach_goal():
    global goal_index
    get_pos()
    #print('x^+y^: %f'%((goal_point[goal_index][0]-x)**2+(goal_point[goal_index][1]-y)**2))
    #print(goal_point[goal_index][0])
    #print(goal_point[goal_index][1])
    #print('x=%f'%x)
    #print('y=%f'%y)
    if((goal_point[goal_index][0]-x)**2+(goal_point[goal_index][1]-y)**2  <= goal_point[goal_index][3]**2):
         print('reach the %d goal'%goal_index)
         goal_index += 1
         return True
    else:
        #print('not reach the goal')
        return False




if __name__ == '__main__':
    rospy.init_node('pubpose')
    turtle_vel_pub = rospy.Publisher('move_base_simple/goal', PoseStamped, queue_size=1)
    tf_listener = tf.TransformListener()

    #odom_sub = rospy.Subscriber("/odom", Odometry, update_position)
    mypose=PoseStamped()
    turtle_vel_pub.publish(mypose) #先发送一个空位置，试探一下，否则第一个包容易丢
    time.sleep(1)
    print('success start!')
    pub_goal()
    while not rospy.is_shutdown():
        if reach_goal():
            print('goal_index = %d'%goal_index)
            #print((goal_point[goal_index][0]-x)**2+(goal_point[goal_index][1]-y)**2)
            print('xy_tolerate**2=%f'%goal_point[goal_index][3]**2)
        
            pub_goal()
            #print('success pub goal:%d'%goal_index)
            if goal_index == point_num:
                break
        time.sleep(0.1)



