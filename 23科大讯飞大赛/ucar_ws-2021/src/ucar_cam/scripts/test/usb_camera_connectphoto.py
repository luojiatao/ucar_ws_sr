#!/usr/bin/env python
# coding:utf-8 
import numpy as np
import cv2
import time
import rospy
#from sensor_msgs.msg import Image
#from cv_bridge import CvBridge
from std_msgs.msg import Int8
import os
import threading
import match
from geometry_msgs.msg import Pose, Point, Quaternion, Twist #导入四个消息数据类型，姿态，目标点，四元数，运动消息Twist
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=5) #实例化一个消息发布函数
photo_count = 200

def move_for(xspeed,tspeed,time_second):
    twist_data=Twist()
    twist_data.linear.x=xspeed
    twist_data.angular.z=tspeed
    time_start=time.time()
    while time.time()-time_start<time_second:
        cmd_vel_pub.publish(twist_data)
    cmd_vel_pub.publish(Twist())

def callback(data):
    global frame2
    global photo_count
    print(data.data)
    if data.data==5:
        print ("Capture:"+str(photo_count)+".0")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg",frame2)
        move_for(0,-0.4,2.5)
        rospy.sleep(0.5)
        print ("Capture:"+str(photo_count)+".1")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg",frame2)
        match.match_2img("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg","/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg",20,photo_count)
        print ("Finish:"+str(photo_count))
        move_for(0,0.4,2.5)
        photo_count = photo_count+1
        

def main():
    global frame2
    print("ucar_cam-ROS-node")
    cap = cv2.VideoCapture("/dev/ucar_video")
    rospy.init_node('ucar_cam', anonymous=True)
    #bridge = CvBridge()
    #image_pub = rospy.Publisher("/usb_cam/image_raw",Image, queue_size=1)
    weight=640
    height=480
    cap.set(3, weight)  # 设置分辨率 3和4 分别代表摄像头的属性值。你可以使用函数 cap.get(propId) 来获得视频的一些参数信息。这里propId 可以是 0 到 18 之间的任何整数。每一个数代表视频的一个属性,见表其中的一些值可以使用cap.set(propId,value) 来修改,value 就是你想要设置成的新值。例如,我可以使用 cap.get(3) 和 cap.get(4) 来查看每一帧的宽和高。默认情况下得到的值是 640X480。但是我可以使用 ret=cap.set(3,320)和 ret=cap.set(4,240) 来把宽和高改成 320X240。
    cap.set(4, height)
    codec = cv2.VideoWriter.fourcc('M', 'J', 'P', 'G')
    print(codec)
    cap.set(cv2.CAP_PROP_FOURCC, codec)
    #fps =cap.get(cv2.CAP_PROP_FPS) #获取视频帧数
    # cap.set(cv2.CAP_PROP_AUTOFOCUS, False)  # 禁止自动对焦
    print("Wait for arrvie")
    rospy.Subscriber("/goal_arrive", Int8, callback)
    add_thread = threading.Thread(target = thread_job)
    add_thread.start()
    while(True):
        ret, frame = cap.read()
        frame2 = cv2.flip(frame,1)   ##图像左右颠倒
        #cv2.imshow('Camera_USB', frame2)
        k = cv2.waitKey(1)
        if k == 27:
           break 
    cap.release()
    cv2.destroyAllWindows()

def thread_job():
    rospy.spin()

  
if __name__ == '__main__':
    main()
