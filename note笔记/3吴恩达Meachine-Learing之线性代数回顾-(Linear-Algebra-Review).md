![线性代数，不知多少人对这本书很是熟悉，哈哈](http://upload-images.jianshu.io/upload_images/4340772-6d5a90dce8026e93.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>本文主要讨论神魔是矩阵和向量，谈谈如何加减乘矩阵及向量，讨论逆矩阵和转置矩阵的概念！！如果十分熟悉这些概念，可以很快的浏览一遍，如果对这些概念有些许的不确定，可以细看一下，慢慢咀嚼！

##3.1 矩阵和向量

如图 ：这个 ：这个 是 4×2矩阵 ，即 4行 2列，如 m为行， 为行， n为列，那么 为列，那么 为列，那么 m×n即 4×2
![矩阵](http://upload-images.jianshu.io/upload_images/4340772-a79ea1ad00485b33.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


矩阵的维数即行数×列数
矩阵元素（矩阵项）：
![](http://upload-images.jianshu.io/upload_images/4340772-e128b7ca2d813c65.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/4340772-39101576361f3b2d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/4340772-eb3ebb52f902774e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##3.2 加法 和标量乘加法 
矩阵的加法：行列数相等的可以加。

![](http://upload-images.jianshu.io/upload_images/4340772-68af41b4e3cc49d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

矩阵的乘法：每个元素都要乘

![](http://upload-images.jianshu.io/upload_images/4340772-1b30e64eb93e27a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
组合算法也类似。

## 3.3 矩阵向量乘法
矩阵和向量的乘法如图：m×n 的矩阵乘以 n×1 的向量，得到的是 m×1 的向量

![](http://upload-images.jianshu.io/upload_images/4340772-8818792dcab96753.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
算法 举例： 

![](http://upload-images.jianshu.io/upload_images/4340772-57439f777b7d06b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 3.4 矩阵乘法
矩阵乘法：
m×n 矩阵乘以 n×o 矩阵，变成 m×o 矩阵。
如果这样说不好理解的话就举一个例子来说明一下，比如说现在有两个矩阵 A 和 B，那
么它们的乘积就可以表示为图中所示的形式。

![](http://upload-images.jianshu.io/upload_images/4340772-770440c37042c866.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 3.5 矩阵乘法的性质
矩阵乘法的性质：
* 矩阵的乘法不满足交换律：A×B≠B×A
* 矩阵的乘法满足结合律。即：A×（B×C）=（A×B）×C
* 单位矩阵：在矩阵的乘法中，有一种矩阵起着特殊的作用，如同数的乘法中的 1,我们称
这种矩阵为单位矩阵．它是个方阵，一般用 I 或者 E 表示，本讲义都用 I 代表单位矩阵，从
左上角到右下角的对角线（称为主对角线）上的元素均为 1 以外全都为 0。如：

![](http://upload-images.jianshu.io/upload_images/4340772-dac241cf3d2e2173.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 对于单位矩阵，有 AI=IA=A
## 3.6 逆、转置
**矩阵的逆**：如矩阵 A 是一个 m×m 矩阵（方阵），如果有逆矩阵，则：

![](http://upload-images.jianshu.io/upload_images/4340772-9bfa5e1ba265fd0a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
我们一般在 OCTAVE 或者 MATLAB 中进行计算矩阵的逆矩阵。
**矩阵的转置**：设 A 为 m×n 阶矩阵（即 m 行 n 列），第 i 行 j 列的元素是 a(i,j)，即：
A=a(i,j)
定义 A 的转置为这样一个 n×m 阶矩阵 B，满足 B=a(j,i)，即 b (i,j)=a (j,i)（B 的第 i 行第
j 列元素是 A 的第 j 行第 i 列元素），记 A
T=B。(有些书记为 A'=B）
直观来看，将 A 的所有元素绕着一条从第 1 行第 1 列元素出发的右下方 45 度的射线作
镜面反转，即得到 A 的转置。

![](http://upload-images.jianshu.io/upload_images/4340772-6496da9c345b3a01.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 矩阵的转置基本性质:

![](http://upload-images.jianshu.io/upload_images/4340772-cf8b4a015a9fcced.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

matlab 中矩阵转置：
直接打一撇，x=y'。

---
课程代码：https://github.com/HuangCongQing/MachineLearning_Ng
本文参考自-黄海广博士 斯坦福大学 2014机器学习教程中文 笔记
链接：[http://pan.baidu.com/s/1dF2asvf](http://pan.baidu.com/s/1dF2asvf#1ewf) 密码：1ewf

分享吴恩达机器学习视频 下载 链接： 
链接： http://pan.baidu.com/s/1pKLATJl 密码： xn4w

---
好看的人儿，点个喜欢❤ 你会更好看哦~~
