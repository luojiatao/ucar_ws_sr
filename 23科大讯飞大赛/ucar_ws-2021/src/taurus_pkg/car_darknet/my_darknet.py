#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from ctypes import *
import math
import random

def sample(probs):
    s = sum(probs)
    probs = [a/s for a in probs]
    r = random.uniform(0, 1)
    for i in range(len(probs)):
        r = r - probs[i]
        if r <= 0:
            return i
    return len(probs)-1

def c_array(ctype, values):
    arr = (ctype*len(values))()
    arr[:] = values
    return arr

class BOX(Structure):
    _fields_ = [("x", c_float),
                ("y", c_float),
                ("w", c_float),
                ("h", c_float)]

class DETECTION(Structure):
    _fields_ = [("bbox", BOX),
                ("classes", c_int),
                ("prob", POINTER(c_float)),
                ("mask", POINTER(c_float)),
                ("objectness", c_float),
                ("sort_class", c_int)]


class IMAGE(Structure):
    _fields_ = [("w", c_int),
                ("h", c_int),
                ("c", c_int),
                ("data", POINTER(c_float))]

class METADATA(Structure):
    _fields_ = [("classes", c_int),
                ("names", POINTER(c_char_p))]

    

#lib = CDLL("/home/pjreddie/documents/darknet/libdarknet.so", RTLD_GLOBAL)
lib = CDLL("/home/ucar/ucar_ws/src/taurus_pkg/car_darknet/libdarknet.so", RTLD_GLOBAL)
lib.network_width.argtypes = [c_void_p]
lib.network_width.restype = c_int
lib.network_height.argtypes = [c_void_p]
lib.network_height.restype = c_int

predict = lib.network_predict
predict.argtypes = [c_void_p, POINTER(c_float)]
predict.restype = POINTER(c_float)

set_gpu = lib.cuda_set_device
set_gpu.argtypes = [c_int]

make_image = lib.make_image
make_image.argtypes = [c_int, c_int, c_int]
make_image.restype = IMAGE

get_network_boxes = lib.get_network_boxes
get_network_boxes.argtypes = [c_void_p, c_int, c_int, c_float, c_float, POINTER(c_int), c_int, POINTER(c_int)]
get_network_boxes.restype = POINTER(DETECTION)

make_network_boxes = lib.make_network_boxes
make_network_boxes.argtypes = [c_void_p]
make_network_boxes.restype = POINTER(DETECTION)

free_detections = lib.free_detections
free_detections.argtypes = [POINTER(DETECTION), c_int]

free_ptrs = lib.free_ptrs
free_ptrs.argtypes = [POINTER(c_void_p), c_int]

network_predict = lib.network_predict
network_predict.argtypes = [c_void_p, POINTER(c_float)]

reset_rnn = lib.reset_rnn
reset_rnn.argtypes = [c_void_p]

load_net = lib.load_network
load_net.argtypes = [c_char_p, c_char_p, c_int]
load_net.restype = c_void_p

do_nms_obj = lib.do_nms_obj
do_nms_obj.argtypes = [POINTER(DETECTION), c_int, c_int, c_float]

do_nms_sort = lib.do_nms_sort
do_nms_sort.argtypes = [POINTER(DETECTION), c_int, c_int, c_float]

free_image = lib.free_image
free_image.argtypes = [IMAGE]

letterbox_image = lib.letterbox_image
letterbox_image.argtypes = [IMAGE, c_int, c_int]
letterbox_image.restype = IMAGE

load_meta = lib.get_metadata
lib.get_metadata.argtypes = [c_char_p]
lib.get_metadata.restype = METADATA

load_image = lib.load_image_color
load_image.argtypes = [c_char_p, c_int, c_int]
load_image.restype = IMAGE

rgbgr_image = lib.rgbgr_image
rgbgr_image.argtypes = [IMAGE]

predict_image = lib.network_predict_image
predict_image.argtypes = [c_void_p, IMAGE]
predict_image.restype = POINTER(c_float)

#全局变量
net = []
meta=[]

def classify(net, meta, im):
    out = predict_image(net, im)
    res = []
    for i in range(meta.classes):
        res.append((meta.names[i], out[i]))
    res = sorted(res, key=lambda x: -x[1])
    return res

def detect(net, meta, image, thresh=.5, hier_thresh=.5, nms=.45):
    im = load_image(image, 0, 0)
    num = c_int(0)
    pnum = pointer(num)
    predict_image(net, im)
    dets = get_network_boxes(net, im.w, im.h, thresh, hier_thresh, None, 0, pnum)
    num = pnum[0]
    if (nms): do_nms_obj(dets, num, meta.classes, nms);

    res = []
    for j in range(num):
        for i in range(meta.classes):
            if dets[j].prob[i] > 0:
                b = dets[j].bbox
                res.append((meta.names[i], dets[j].prob[i], (b.x, b.y, b.w, b.h)))
    res = sorted(res, key=lambda x: -x[1])
    free_image(im)
    free_detections(dets, num)
    return res
    
def darknet(img_path,in_net,in_meta):
    '''识别、处理结果函数'''
    net = in_net
    meta = in_meta
    r = detect(net, meta, img_path.encode('ascii'))
    result={"SY0":0,"SN1":0,"SY2":0,"SN3":0,"LY4":0,"LY5":0,"LN6":0,"LY7":0}    #用以保存结果
    '''
    #1.判断是否有识别框重叠,在有相互重叠的框中删除识别率较低的结果
    for index1 in range(0,len(r)):
        judge=True  #用以判断结果是否可接受，默认为不重叠可接受True
        index1_left =r[index1][2][0]-r[index1][2][2]/2  #index1框的左边界
        index1_right=r[index1][2][0]+r[index1][2][2]/2  #index1框的右边界
        for index2 in range(index1+1,len(r)):
            index2_left =r[index2][2][0]-r[index2][2][2]/2  #index2框的左边界
            index2_right=r[index2][2][0]+r[index2][2][2]/2  #index2框的右边界
            #做重叠判读如果边界关系不符合及认为重叠judge=False
            if r[index1][2][0]<r[index2][2][0]:
                if index1_right>index2_left:
                    judge=False
            else:
                if index1_left<index2_right:
                    judge=False
            #判断judge是否为False,为False则做去重
            if not judge:
                if r[index1][1]>r[index2][1]:
                    r.pop(index2)#删除index2
                else:
                    r.pop(index1)#删除index1
    '''
    #2.统计结果
    print(r)
    for person in r:
        if person[1]<=0.55:
            continue
        result[person[0].decode('ascii')]+=1
    del net,meta    
    return result

def load_net_for_ready():
    '''加载网络'''
    global net,meta #全局变量
    net = load_net("/home/ucar/ucar_ws/src/taurus_pkg/car_darknet/my_yolov3.cfg".encode('ascii'), "/home/ucar/ucar_ws/src/taurus_pkg/car_darknet/my_yolov3_7000_416_416.weights".encode('ascii'), 0)
    meta = load_meta("/home/ucar/ucar_ws/src/taurus_pkg/car_darknet/my_data.data".encode('ascii'))
    return net,meta


if __name__=='__main__':
    '''运行示例'''
    path='/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg'  #图片地址
    net,meta=load_net_for_ready()   #倒入网络用net，meta保存
    #——————————————————————————————————————————————————————
    result=darknet(path,net,meta) #识别返回结果
    print(result)
    
