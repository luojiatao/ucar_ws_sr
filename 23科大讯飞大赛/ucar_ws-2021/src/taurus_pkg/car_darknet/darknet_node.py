#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy, os
from std_msgs.msg import String
from std_msgs.msg import Int8
from darknet_msgs.msg import darknet, darknet2
import my_darknet
import match
import sys

rospy.init_node('darknet_node', anonymous=False)
darknet_pub = rospy.Publisher("/darknet_result", darknet2, queue_size=1)
ready_state_pub = rospy.Publisher("/ready_state", String, queue_size=1)
darknet_data = darknet()
darknet2_data = darknet2()


def callback(data):
    global net
    global meta
    global darknet2_data
    if data.data == 3:
        global darknet_pub
        global darknet_data
        #global net
        #global meta
        #net,meta=my_darknet.load_net_for_ready()   #倒入网络用net，meta保存
        if (os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg")):
            match.match_2img(
                "/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg",
                "/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg", 10)
            path = '/home/ucar/ucar_ws/src/taurus_pkg/darknet/connect.jpg'  #图片地址
            result = my_darknet.darknet(path, net, meta)  #识别返回结果
            darknet_data.LN = result['LN']
            darknet_data.LY = result['LY']
            darknet_data.SN = result['SN']
            darknet_data.SY = result['SY']
            #print("NODE:"+darknet_data +"\n")
            print("NODE:" + str(result))
            darknet_pub.publish(darknet_data)
            rospy.signal_shutdown("finish")
    elif data.data == 1:
        if (os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg")):
            path = '/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg'
            result = my_darknet.darknet(path, net, meta)  #识别返回结果1
            darknet2_data.SY0 = result['SY0']
            darknet2_data.SN1 = result['SN1']
            darknet2_data.SY2 = result['SY2']
            darknet2_data.SN3 = result['SN3']
            darknet2_data.LY4 = result['LY4']
            darknet2_data.LY5 = result['LY5']
            darknet2_data.LN6 = result['LN6']
            darknet2_data.LY7 = result['LY7']
            print("Photo1:" + str(result))
    #elif data.data==11:
    #print("NODE:"+darknet_data +"\n")
        if (os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg")):
            path = '/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg'  #图片2地址
            result = my_darknet.darknet(path, net, meta)  #识别返回结果2
            darknet2_data.SY0 = darknet2_data.SY0 + result['SY0']
            darknet2_data.SN1 = darknet2_data.SN1 + result['SN1']
            darknet2_data.SY2 = darknet2_data.SY2 + result['SY2']
            darknet2_data.SN3 = darknet2_data.SN3 + result['SN3']
            darknet2_data.LY4 = darknet2_data.LY4 + result['LY4']
            darknet2_data.LY5 = darknet2_data.LY5 + result['LY5']
            darknet2_data.LN6 = darknet2_data.LN6 + result['LN6']
            darknet2_data.LY7 = darknet2_data.LY7 + result['LY7']
            print("Photo2:" + str(result))
            darknet_pub.publish(darknet2_data)

    elif data.data == 41:
        #print("NODE:"+darknet_data +"\n")
        if (os.path.exists("/home/ucar/ucar_ws/src/taurus_pkg/darknet/3.jpg")):
            path = '/home/ucar/ucar_ws/src/taurus_pkg/darknet/2.jpg'  #图片2地址
            result = my_darknet.darknet(path, net, meta)  #识别返回结果3
            darknet2_data.SY0 = darknet2_data.SY0 + result['SY0']
            darknet2_data.SN1 = darknet2_data.SN1 + result['SN1']
            darknet2_data.SY2 = darknet2_data.SY2 + result['SY2']
            darknet2_data.SN3 = darknet2_data.SN3 + result['SN3']
            darknet2_data.LY4 = darknet2_data.LY4 + result['LY4']
            darknet2_data.LY5 = darknet2_data.LY5 + result['LY5']
            darknet2_data.LN6 = darknet2_data.LN6 + result['LN6']
            darknet2_data.LY7 = darknet2_data.LY7 + result['LY7']
            print("Photo3:" + str(result))
            #print("NODE:"+darknet_data +"\n")
            path = '/home/ucar/ucar_ws/src/taurus_pkg/darknet/3.jpg'  #图片2地址
            result = my_darknet.darknet(path, net, meta)  #识别返回结果4
            darknet2_data.SY0 = darknet2_data.SY0 + result['SY0']
            darknet2_data.SN1 = darknet2_data.SN1 + result['SN1']
            darknet2_data.SY2 = darknet2_data.SY2 + result['SY2']
            darknet2_data.SN3 = darknet2_data.SN3 + result['SN3']
            darknet2_data.LY4 = darknet2_data.LY4 + result['LY4']
            darknet2_data.LY5 = darknet2_data.LY5 + result['LY5']
            darknet2_data.LN6 = darknet2_data.LN6 + result['LN6']
            darknet2_data.LY7 = darknet2_data.LY7 + result['LY7']
            print("Photo4:" + str(result))
            print(darknet2_data)
            darknet_pub.publish(darknet2_data)
            rospy.signal_shutdown("finish")


if __name__ == '__main__':
    print("Darknet 启动")
    rospy.Subscriber("/goal_arrive", Int8, callback)
    #global net
    #global meta
    ready_data = String()
    net, meta = my_darknet.load_net_for_ready()
    print("Darknet Done")
    ready_data.data = '1'
    ready_state_pub.publish(ready_data)

    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("text node terminated.")

#  这是一个ROS节点,用于启动Darknet进行物体检测,并发布检测结果。主要功能如下:
# 1. 初始化ROS节点并创建发布器和订阅器。发布器发布检测结果,订阅器订阅/goal_arrive话题。
# 2. 定义一个回调函数callback,在接收到/goal_arrive话题的消息时会被调用。回调函数根据消息的值来执行匹配、检测和发布操作。
# 3. 调用my_darknet模块的函数加载Darknet网络。
# 4. 如果接收到的值为3,则调用match模块的函数match_2img来匹配两张图片,并使用Darknet对匹配后的图片进行检测。
# 5. 如果接收到的值为1,则对单张图片进行Darknet检测。如果接收到的值为41,则对两组图片(两张和两张)进行Darknet检测。
# 6. Darknet检测的结果通过darknet_pub发布器发布到/darknet_result话题。
# 7. 定义darknet_data和darknet2_data消息类型,用于封装Darknet检测结果并发布。
# 8. 进入ROS的spin循环,ROS会处理所有的回调函数和事件。
# 9. 如果遇到异常,打印一条信息并退出。
# 主要变量:
# - net和meta:Darknet网络和元数据。
# - darknet_pub:发布/darknet_result话题的发布器。
# - darknet_data和darknet2_data:消息类型,用于封装和发布检测结果。
# 主要函数:
# - callback():回调函数,在接收到/goal_arrive话题的消息时被调用。
# - load_net_for_ready():从my_darknet模块导入的函数,用于加载Darknet网络。
# - match_2img():从match模块导入的函数,用于匹配两张图片。
# - darknet():从my_darknet模块导入的函数,用于使用Darknet进行检测。
# 总的来说,这个节点使用Darknet进行物体检测,并在获取到/goal_arrive话题的消息时执行检测和发布操作。检测结果通过/darknet_result话题发布。