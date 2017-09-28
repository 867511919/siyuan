# 附录 
静态背景方案代码
```
# -*- coding:utf-8 -*-
# __@author__Keen
import numpy as np
from scipy.stats import mode
"""
静态背景方案代码
众数模型及其改进
"""
class StaticFrame(object):

    def __init__(self, update, threshold, count_threshold, neighbor):
        self.update = update
        self.threshold = threshold
        self.count_threshold = count_threshold
        self.neighbor = neighbor

    def background(self, input_img):
        fps, length, width = input_img.shape
        input_image = input_img.astype('int')
       
        input_copy = input_image.copy()
        back, count = mode(input_copy[0:self.update, :, :], axis=0)
        # foreground = input_img.astype('int') - back
        # foreground[np.abs(foreground) < self.threshold] = 0
        for k in range(fps):
            if k >= self.update:
                if k % 5 == 0:
                    back=0.8*mode(input_copy[(k-self.update):k,:,:],axis=0)[0] + 0.2*back

            foreground = input_image[k, :, :] - back
            foreground[np.abs(foreground) < self.threshold] = 0
            input_image[k, :, :][foreground[0] == 0] = 0
            input_image[k, :, :][foreground[0] !=0 ] = 255

        # back, count = mode(input_img, axis = 0)
        # foreground = input_img.astype('int') - back
        # foreground[np.abs(foreground) < self.threshold] = 0
        # foreground = self.neighbor_vote(foreground, self.neighbor)
        # foreground = foreground.astype('uint8')

        return input_image

    def neighbor_vote(self, foreground, neighbor):
        fps, length, width = foreground.shape
        for k in range(fps):
            for i in range(neighbor, length-neighbor):
                for j in range(neighbor, width-neighbor):
                    count = np.sum(foreground[k,(i-neighbor):(i+neighbor),(j-neighbor):(j+neighbor)])
                    if count > self.count_threshold:
                        foreground[k,i,j] = 0
        return foreground



```
动态背景Mixture of Gaussian代码

```
# -*- coding:utf-8 -*-
# -*- coding:gbk -*-
import numpy as np
import math
from scipy import stats
from sklearn.mixture import GaussianMixture
"""
动态背景Mixture of Gaussian代码

"""
class AdaGMM(object):

    def __init__(self, K, mu, sigma, omega, alpha, threshold):
        self.K = K
        self.mu = mu
        self.sigma = sigma
        self.omega = omega
        self.alpha = alpha
        self.threshold = threshold

    def gmm_fit(self, input_seq, update_init_sigma, update_init_omega):
        predict_seq = []
        for x_t in input_seq:
            mid = self.gmm_update(x_t,self.mu,self.sigma,self.omega,self.alpha,self.K,self.threshold,
            update_init_sigma, update_init_omega)
            if mid == 1:
                predict_seq.append(1)
            else:
                predict_seq.append(-1)
        return np.array(predict_seq)

    #更新过程（EM算法代替算法）

    @staticmethod
    def gmm_update(x_t, mu, sigma, omega, alpha,K,threshold,update_init_sigma,update_init_omega):

        ind_max = np.argmax(abs(mu - x_t))
        mid = 0
        for i in range(K):
            prob = stats.norm.pdf((x_t)-mu[i]/sigma[i])
            if mu[i] - threshold * math.sqrt(sigma[i]) < x_t < mu[i] + threshold * math.sqrt(sigma[i]):
                mid = 1
                omega[i] = (1 - alpha) * omega[i] + alpha * mid
                omega[np.arange(K) != i] = (1 - alpha) * omega[
                    np.arange(K) != i] + alpha * (1 - mid)
                rho = alpha * prob
                mu[i] = (1 - rho) * mu[i]
                sigma[i] = math.sqrt((1 - rho) * sigma[i] * sigma[i] + rho * (x_t - mu[i]) * (x_t - mu[i]))
        mu[ind_max] = x_t
        sigma[ind_max] = update_init_sigma
        omega[ind_max] = update_init_omega
        return mid

    #利用EM算法对参数进行初始化
    @staticmethod
    def initialize(K, input_seq):

        GMM_Init = GaussianMixture(K, 'diag')
        gmm_init = GMM_Init.fit(input_seq)
        weight = gmm_init.weights_
        mu = gmm_init.means_
        sigma = gmm_init.covariances_
        return weight, mu, sigma

if __name__ == '__main__':
    input = np.load('./input/people.npy')
    count, length, width = input.shape
    weight, mu, sigma = AdaGMM.initialize(5, input.reshape(count, length*width))
    mu = mu.reshape(5, length, width)
    sigma = mu.reshape(5, length, width)

    print weight, mu.shape, sigma.shape

    for i in range(length):
        for j in range(width):
            input_seq = input[:,i,j]
            #weight, mu, sigma = AdaGMM.initialize(3,input_seq.reshape(count,1))
            AdpGMM = AdaGMM(5,mu[:,i,j], sigma[:,i,j],weight,0.1,2.5)

#            AdpGMM = AdaGMM(3,mu.reshape(1,3)[0], sigma.reshape(1,3)[0],weight,0.01,2.5)
            predict_seq =AdpGMM.gmm_fit(input_seq=input_seq, update_init_omega=0, update_init_sigma=2*max(sigma[:,i,j]))
            input[:,i,j][predict_seq != -1] = 0
            input[:,i,j][predict_seq == -1] = 255

    input.dump('./output/GmmOutPeople.npy')


```
记分板算法代码

```
#-*- coding: utf-8 -*-
from scipy.stats import mode
import numpy as np
"""
问题四、计分板算法
输入：
预处理后的视频npy文件。
s对应算法中的起点阈值，e对应算法的终点阈值,z对应算法的步长。
这些阈值的确定是通过后帧减前帧，通过设置不同步长得到的。
输出:
有多组（start,end）的元组列表
"""

def solution(npyfile,s,e,z):
    input_img = np.load(npyfile)
    fsp, height, width = input_img.shape
    input_img[input_img != 0] = 255

    relist = []
    for i in range(fsp):
        a = np.sum(input_img[i])
        # print a
        relist.append(a)

    li = []
    start = 0
    end = 0
    for i in range(fsp - z):
        if relist[i] > s and start == 0 and end == 0:
            flag1 = 0
            for j in range(i, i + z):
                if (relist[j] > s):
                    flag1 = flag1 + 1
            if (flag1 == z):
                start = i
                end = 0
        if relist[i] < e and end == 0 and start != 0:
            flag2 = 0
            for k in range(i, i + z):
                if (relist[k] < e):
                    flag2 = flag2 + 1
            if (flag2 == z):
                end = i
        if (start != 0 and end != 0):
            hh = (start, end)
            li.append(hh)
            start = 0

    return li

print solution("../data/npy/StaticOut6.npy",6600,12000,8)
```

位移监测代码

```
#coding=UTF-8
import numpy as np
import cv2
"""
问题六、位移监测算法
输入：
灰度化视频文件路径infilename，变化阈值number
输出：
无
状态变化已经在视频板上体现。
"""
x=[]
y=[]
s=[]
def solution(infilename,number):
    t=0 #绘图需要
    capture=cv2.VideoCapture(infilename)
    keydots=dict(maxCorners=100,qualityLevel=0.3,minDistance=7,blockSize=6)
    lkdos=dict(winSize=(15,15),maxLevel=2,criteria=(cv2.TERM_CRITERIA_EPS|cv2.TERM_CRITERIA_COUNT,10,0.03))
    color=np.random.randint(0,255,(100,3))
    success,oldfram=capture.read()
    gray=cv2.cvtColor(oldfram,cv2.COLOR_BGR2GRAY)
    p0=cv2.goodFeaturesToTrack(gray,mask=None,**keydots)
    # ii=0 #绘图需要
    while (success):
        Dx = []
        Dy = []
        # print ii
        # if(ii==900):
        #     break
        # ii=ii+1
        success, frame = capture.read()
        framegray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        p1, st, err = cv2.calcOpticalFlowPyrLK(gray, framegray, p0, None, **lkdos)
        fnext = p1[st == 1]
        fpre = p0[st == 1]
        rows1 = frame.shape[0]
        cols1 = frame.shape[1]
        showframe = np.zeros((rows1, cols1, 3), dtype='uint8')
        showframe[:rows1, :cols1] = np.dstack([framegray, framegray, framegray])
        lenth = len(fnext)
        for i, (nt, pe) in enumerate(zip(fnext, fpre)):
            a, b = nt.ravel()
            c, d = pe.ravel()
            gap1 = abs(a - c)
            gap2 = abs(b - d)
            Dx.append(gap1)
            Dy.append(gap2)
            cv2.circle(showframe, (int(c), int(d)), 5, (255, 222, 173), -1)
            cv2.line(showframe, (int(a), int(b)), (int(c), int(d)), color[i].tolist(), 2)
            cv2.circle(showframe, (int(a), int(b)), 5, (255, 0, 0), -1)
        avgedx = sum(Dx) / lenth
        avgedy = sum(Dy) / lenth
        # x.append(d1) #绘图需要
        # y.append(d2)
        if avgedx > number or avgedy > number:
            cv2.putText(showframe, "Boom",
                        (100, 25), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
        else:
            cv2.putText(showframe, "OK",
                        (100, 25), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)



        cv2.imshow('frame.jpg', showframe)
        k = cv2.waitKey(3) & 0xff
        if k == 27:
            break


solution("..\data\mov\Qboom\hei.avi",5)
# xi=range(900)
# x=np.array(x)
# y=np.array(y)
# si=np.sqrt(x*x+y*y)
# plt.plot(xi,si)
# plt.yticks(np.linspace(0,50,8))
# plt.show()
```

