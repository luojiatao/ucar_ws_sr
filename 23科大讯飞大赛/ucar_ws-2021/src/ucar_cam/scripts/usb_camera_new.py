#!/usr/bin/env python3
# coding:utf-8
import numpy as np
import cv2
import time
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from std_msgs.msg import Int8
import os
import threading
import sys


def callback(data):
    global frame2
    print(data.data)
    if data.data == 20:
        print("INFO:arrvie:21 Darknet ")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg", frame2)
        print("INFO:Capture1")
    if data.data == 21:
        print("INFO:arrvie:22 Darknet ")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg", frame2)
        print("INFO:Capture2")
    if data.data == 22:
        print("INFO:arrvie:23 Darknet ")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/2.jpg", frame2)
        print("INFO:Capture3")
    if data.data == 23:
        print("INFO:arrvie:24 Darknet ")
        cv2.imwrite("/home/ucar/ucar_ws/src/taurus_pkg/darknet/3.jpg", frame2)
        print("INFO:Capture4")
        rospy.signal_shutdown("finish")
    if data.data == 3:
        sys.exit()


def main():
    global frame2
    print("ucar_cam-ROS-node")
    cap = cv2.VideoCapture("/dev/ucar_video")
    rospy.init_node('ucar_cam', anonymous=True)
    bridge = CvBridge()
    image_pub = rospy.Publisher("/usb_cam/image_raw", Image, queue_size=1)
    weight = 640
    height = 480
    cap.set(
        3, weight
    )  # 设置分辨率 3和4 分别代表摄像头的属性值。你可以使用函数 cap.get(propId) 来获得视频的一些参数信息。这里propId 可以是 0 到 18 之间的任何整数。每一个数代表视频的一个属性,见表其中的一些值可以使用cap.set(propId,value) 来修改,value 就是你想要设置成的新值。例如,我可以使用 cap.get(3) 和 cap.get(4) 来查看每一帧的宽和高。默认情况下得到的值是 640X480。但是我可以使用 ret=cap.set(3,320)和 ret=cap.set(4,240) 来把宽和高改成 320X240。
    cap.set(4, height)
    codec = cv2.VideoWriter.fourcc('M', 'J', 'P', 'G')
    print(codec)
    cap.set(cv2.CAP_PROP_FOURCC, codec)
    #fps =cap.get(cv2.CAP_PROP_FPS) #获取视频帧数
    # cap.set(cv2.CAP_PROP_AUTOFOCUS, False)  # 禁止自动对焦
    print("Wait for arrvie")
    add_thread = threading.Thread(target=thread_job)
    add_thread.start()
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        frame2 = cv2.flip(frame, 1)  ##图像左右颠倒
        image_pub.publish(bridge.cv2_to_imgmsg(frame2, "bgr8"))
        #cv2.imshow('Camera_USB', frame)
        if cv2.waitKey(1) & 0xFF == 27:
            break
    cap.release()
    cv2.destroyAllWindows()


def thread_job():
    rospy.Subscriber("/goal_arrive", Int8, callback)
    rospy.spin()


if __name__ == '__main__':
    main()

#  这是一个ROS节点,用于获取USB摄像头的图像,并在接收到/goal_arrive话题的消息时保存图像。
# 主要功能:
# 1. 初始化ROS节点,创建发布器和订阅器。发布器发布摄像头的原始图像,订阅器订阅/goal_arrive话题。
# 2. 使用OpenCV打开USB摄像头,设置图像宽高和编码格式。
# 3. 进入无限循环,在循环中读取摄像头的图像,左右翻转后发布。
# 4. 定义了一个回调函数callback,当接收到/goal_arrive话题的消息时,根据消息的数据保存图像。
# 5. 启动一个线程来处理ROS的回调函数和事件。
# 6. 当节点关闭时,释放摄像头资源和销毁窗口。
# 主要变量:
# - frame2:存储翻转后的图像帧。
# - cap:USB摄像头的视频捕获对象。
# - bridge:CvBridge,用于在OpenCV和ROS图像消息之间进行转换。
# - image_pub:发布/usb_cam/image_raw话题的发布器。
# - weight和height:图像的宽度和高度。
# - codec:视频编码格式。
# 主要函数:
# - main():主函数,用于打开摄像头,设置参数并进入循环。
# - thread_job():运行在独立线程中的函数,用于处理ROS的回调函数和事件。
# - callback():回调函数,在接收到/goal_arrive话题的消息时根据消息保存图像。
# 总的来说,这个节点订阅/goal_arrive话题,在接收到消息时保存USB摄像头的图像,并持续发布原始图像供其他节点使用。