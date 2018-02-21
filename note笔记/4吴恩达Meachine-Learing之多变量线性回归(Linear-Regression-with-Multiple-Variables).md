### 4.1 多维特征（Multiple Features）

目前为止，我们探讨了单变量/特征的回归模型，现在我们对房价模型增加更多的特征，
例如房间数楼层等，构成一个含有多个变量的模型，模型中的特征为（x1,x2,...,xn）。


![](http://upload-images.jianshu.io/upload_images/4340772-1f191d21e55d98f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
增添更多特征后，我们引入一系列新的注释：

![](http://upload-images.jianshu.io/upload_images/4340772-180da621f43c6f22.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


此时模型中的参数是一个n+1 维的向量，任何一个训练实例也都是n+1 维的向量，特
征矩阵X 的维度是 m*(n+1)。 因此公式可以简化为：


![](http://upload-images.jianshu.io/upload_images/4340772-edc2e9392908307f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

其中上标T代表矩阵转置

### 多变量梯度下降（Gradient Descent for Multiple Variables）
与单变量线性回归类似，在多变量线性回归中，我们也构建一个代价函数，则这个代价
函数是所有建模误差的平方和，即：


![](http://upload-images.jianshu.io/upload_images/4340772-5f313742fbd494bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![](http://upload-images.jianshu.io/upload_images/4340772-5af73912ae8d57b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 梯度下降法实践 1-特征缩放（Gradient Descent in Practice I - Feature Scaling）

在我们面对多维特征问题的时候，我们要保证这些特征都具有相近的尺度，这将帮助梯
度下降算法更快地收敛。
以房价问题为例，假设我们使用两个特征，房屋的尺寸和房间的数量，尺寸的值为 0-
2000 平方英尺，而房间数量的值则是 0-5，以两个参数分别为横纵坐标，绘制代价函数的等
高线图能，看出图像会显得很扁，梯度下降算法需要非常多次的迭代才能收敛。

![](http://upload-images.jianshu.io/upload_images/4340772-b30d7a4626a448a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**解决的方法是尝试将所有特征的尺度都尽量缩放到-1 到 1 之间**。如图


![](http://upload-images.jianshu.io/upload_images/4340772-af0656dc9495c189.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



![](http://upload-images.jianshu.io/upload_images/4340772-18c515d38ca48058.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 4.4 梯度下降法实践 2-学习率（ 4 - 4 - Gradient Descent in Practice II - Learning Rate ）


![](http://upload-images.jianshu.io/upload_images/4340772-90190186d51141a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.5 特征和多项式回归（Features and Polynomial Regression）
如房价预测问题，

![](http://upload-images.jianshu.io/upload_images/4340772-b18672f4255bf463.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

通常我们需要先观察数据然后再决定准备尝试怎样的模型。 另外，我们可以令：


![](http://upload-images.jianshu.io/upload_images/4340772-7477d879ce940fb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
从而将模型转化为线性回归模型。
根据函数图形特性，我们还可以使：

![](http://upload-images.jianshu.io/upload_images/4340772-d2deb364c6247051.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 4.6 正规方程
到目前为止，我们都在使用梯度下降算法，但是对于某些线性回归问题，正规方程方法
是更好的解决方案。如：

![](http://upload-images.jianshu.io/upload_images/4340772-2e46b29c3f743adb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![](http://upload-images.jianshu.io/upload_images/4340772-a7cf37ccc37d368a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
即：

![](http://upload-images.jianshu.io/upload_images/4340772-f2c0392a7e2d81ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
运用正规方程法求解参数：

![](http://upload-images.jianshu.io/upload_images/4340772-4efdfb007caab334.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![](http://upload-images.jianshu.io/upload_images/4340772-2acc7854d7bc1022.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

总结一下，只要特征变量的数目并不大，标准方程是一个很好的计算参数 θ 的替代方
法。具体地说，**只要特征变量数量小于一万，我通常使用标准方程法，而不使用梯度下降法。**
随着我们要讲的学习算法越来越复杂，例如，当我们讲到分类算法，像逻辑回归算法，
我们会看到， 实际上对于那些算法，并不能使用标准方程法。**对于那些更复杂的学习算法，
我们将不得不仍然使用梯度下降法。**因此，梯度下降法是一个非常有用的算法，可以用在有
大量特征变量的线性回归问题。或者我们以后在课程中，会讲到的一些其他的算法，因为标
准方程法不适合或者不能用在它们上。但对于这个特定的线性回归模型，标准方程法是一个
比梯度下降法更快的替代算法。所以，根据具体的问题，以及你的特征变量的数量，这两种
算法都是值得学习的。



---
课程代码：https://github.com/HuangCongQing/MachineLearning_Ng
本文参考自-黄海广博士 斯坦福大学 2014机器学习教程中文 笔记
链接：[http://pan.baidu.com/s/1dF2asvf](http://pan.baidu.com/s/1dF2asvf#1ewf) 密码：1ewf

分享吴恩达机器学习视频 下载 链接： 
链接： http://pan.baidu.com/s/1pKLATJl 密码： xn4w

---
好看的人儿，点个喜欢❤ 你会更好看哦~~
