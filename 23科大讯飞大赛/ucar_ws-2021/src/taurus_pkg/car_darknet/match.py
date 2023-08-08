#!/usr/bin/env python
# -*- coding: utf-8 -*-
import random
import math
import cv2
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import Image
import numpy as np


def match_2img(imgL_path, imgR_path, MinMatchNum):
    #设置一个至少10个匹配的条件（有MinMatchNum指定）来找目标
    #MinMatchNum = 20
    #读取照片
    L = cv2.imread(imgL_path)  # queryImage
    R = cv2.imread(imgR_path)  # trainImage
    #高斯滤波
    L = cv2.GaussianBlur(L, (3, 3), 0)
    R = cv2.GaussianBlur(R, (3, 3), 0)
    #创建sift检测器
    sift = cv2.xfeatures2d.SIFT_create()
    # 计算所有特征点的特征值kp和特征向量des并获取
    left_kp, left_des = sift.detectAndCompute(R, None)
    righ_kp, righ_des = sift.detectAndCompute(L, None)
    # BFMatcher爆力解决匹配，但是不好的特征值匹配较多
    bf = cv2.BFMatcher()
    matches = bf.knnMatch(left_des, righ_des, k=2)
    # 进行特征点匹配筛选
    BetterChoose1 = []
    for m, n in matches:
        #认为第一近的点小于第二近的点一倍以上是好的匹配BetterChoose1
        if m.distance < 0.5 * n.distance:
            BetterChoose1.append(m)
    # 但是由于爆力匹配的较好结果BetterChoose1匹配效果仍然不理想。
    # 所以我们想到用Ransat的方法优化匹配结果
    BetterChoose2 = np.expand_dims(BetterChoose1, 1)
    #match = cv2.drawMatchesKnn(L, left_kp, R, righ_kp, BetterChoose2[:30], None, flags=2)
    # 判断是否当前模型已经符合超过MinMatchNum个点
    if len(BetterChoose1) > MinMatchNum:
        # 获取关键点的坐标
        src_pts = np.float32([left_kp[m.queryIdx].pt
                              for m in BetterChoose1]).reshape(-1, 1, 2)
        dst_pts = np.float32([righ_kp[m.trainIdx].pt
                              for m in BetterChoose1]).reshape(-1, 1, 2)
        #在这里调用RANSAC方法得到解H
        H, modle = cv2.findHomography(src_pts, dst_pts, cv2.RANSAC, 5.0)
        wrap = cv2.warpPerspective(
            R, H, (R.shape[1] + R.shape[1], R.shape[0] + R.shape[0]))
        wrap[0:R.shape[0], 0:R.shape[1]] = L
        #得到新的位置
        rows, cols = np.where(wrap[:, :, 0] != 0)
        min_row, max_row = min(rows), max(rows) + 1
        min_col, max_col = min(cols), max(cols) + 1
        # 去除黑色无用部分
        LeftAndRight = wrap[min_row:max_row, min_col:max_col, :]
        scal = 0.7
        cv2.imwrite(
            '/home/ucar/ucar_ws/src/taurus_pkg/darknet/connect.jpg',
            cv2.resize(LeftAndRight, (0, 0),
                       fx=scal,
                       fy=scal,
                       interpolation=cv2.INTER_NEAREST))
    del L, R, LeftAndRight, sift, left_kp, left_des, righ_kp, righ_des, bf, matches, BetterChoose1, BetterChoose2, src_pts, dst_pts, H


if __name__ == "__main__":
    print("Match!")
    match_2img("/home/ucar/ucar_ws/src/taurus_pkg/darknet/0.jpg",
               "/home/ucar/ucar_ws/src/taurus_pkg/darknet/1.jpg", 10)

# 这段Python代码的主要目的是将两张图像进行特征匹配并融合，主要利用了OpenCV库中的SIFT特征和BFMatcher函数。以下是对这段代码的详细解释：
# 1. 首先引入所需的python库，包括random，math，cv2，matplotlib.pyplot，matplotlib.image，PIL.Image，numpy等。
# 2. 定义了一个名为`match_2img`的函数，该函数有三个参数：imgL_path（左图像路径），imgR_path（右图像路径）以及MinMatchNum（最小匹配数）。
# 3. 在`match_2img`函数内部，首先读取左侧和右侧的图像并进行高斯滤波处理。
# 4. 利用SIFT特征检测器计算图像的特征点。
# 5. 利用BFMatcher进行图像特征点的匹配。
# 6. 通过RANSAC方法对匹配到的特征点进行优化，以提高匹配精度。
# 7. 如果匹配到的特征点数大于MinMatchNum，就使用对应的仿射矩阵对右图进行透视变换，并将左图与变换后的右图进行融合。
# 8. 最后，将融合后的图像进行剪裁，并保存到指定位置。
# 在最后的`if __name__=="__main__"`部分，该代码将两张指定路径下的图像进行匹配和融合。