#! /usr/bin/env python
import rospy
import numpy as np
import matplotlib.pyplot as plt
from map_msgs.msg import OccupancyGridUpdate

#car_stop_point=[0,0] #x,y
car_local_pointx=True   #小车的局部相对x坐标
car_local_pointy=True   #小车的局部相对y坐标


def show_map_img(msg):
    map_datalist=msg.data
    width=msg.width
    global car_local_pointx
    global car_local_pointy
    #car_toflat_dis=0.4 #小车到平板的真实距离
    car_stop_point=[0,0] #小车开始节点时停车地方的xy坐标
    resolution=1/40 #分辨率
    point_list=[]   #障碍物激光点相对车辆的坐标
    result_point_list=[]
    if car_local_pointx==True and car_local_pointy==True:
        index=len(map_datalist)-1
        car_local_pointx=((index%width)*resolution)/2
        car_local_pointy=((index/width)*resolution)/2
        #print("calculation now!")
    #print("car_x:",car_local_pointx,"car_y:",car_local_pointy)
    for index in range(0,len(map_datalist)):
        if map_datalist[index]>=90:
            x=(index%width)*resolution
            y=(index/width)*resolution
            point_tocarx_w=x-car_local_pointx+car_stop_point[0] #障碍的世界x坐标
            point_tocary_w=y-car_local_pointy+car_stop_point[1] #障碍的世界y坐标
            point_list.append([point_tocarx_w,point_tocary_w])
    point_list=np.array(point_list)
    x_range=[-0.55,0.55]
    y_range=[-0.55,0.55]
    for point in point_list:
        if point[0]<x_range[0] or point[0]>x_range[1] or point[1]<y_range[0] or point[1]>y_range[1]:
            continue
        result_point_list.append(point.tolist())
    result_point_list=np.array(result_point_list)
    plt.scatter(result_point_list[:,0],result_point_list[:,1])
    #plt.scatter(point_list[:,0],point_list[:,1])
    plt.pause(0.4)     #设置暂停时间，太快图表无法正常显示
    plt.ioff()       # 关闭画图的窗口，即关闭交互模式
    plt.show()       # 显示图片，防止闪退

if __name__ == "__main__":
    plt.ion()
    #2.初始化 ROS 节点:命名(唯一)
    rospy.init_node("listener_map")
    #3.实例化 订阅者 对象
    rospy.Subscriber("/move_base/local_costmap/costmap_updates",OccupancyGridUpdate,show_map_img,queue_size=10)
    #4.处理订阅的消息(回调函数)
    #5.设置循环调用回调函数
    rospy.spin()
