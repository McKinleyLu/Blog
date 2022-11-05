---
title: python数据分析
categories:
  - 计算机语言笔记
tags:
  - numpy
abbrlink: 64269
date: 2022-04-18 15:11:00
---
## Numpy

### 特殊表示

* `numpy.nan `
* `numpy.inf`
* `numpy.pi`
* `numpy.e`

### 时间表示

* `datetime64()`
* `timedetla`
* `np.datetime64('today','D') `   获取今天日期

### 单位数组

* `eye`
* `identify`
* `diag`(数组名,对角线编号)

### 数组生成

* `array`

  * `ndim`
  * `shape`
  * `itemsize`
  * `order`
  * `copy`

* `asarray`

* frombuffer    `np.frombuffer(buffer,dtype='S1')`

* fromiter

* fromfunction   `np.fromfunction(f,(5,4),dtype=int)`

  ```python
  # 通过fromfunction()进行创建
  import numpy as np
  def f(x,y):
      return 10 * x  + y
  print(np.fromfunction(f,(5,4),dtype=int))
  ```

* `linspace(x,y,n)`  产生x和y之间等间隔的n个数，如果n = 1，返回结果为y

* `logspace(start=开始值，stop=结束值，num=元素个数，base=指定对数的底，endpoint=是否包含结束值)`

### 数组索引

* `s = slice[2,7,2]   a[s]`

* `y = x[[0,1,2],[0,1,0]]`

* `rows = np.array([[0,0],[3,3]])   cols = np.array([[0,2],[0,2]])   y = x[rows,cols]    `  

  ```python
  # 获取对角四个元素
  import numpy as np
  x = np.random.randint(1,100,(5,5))
  print(x)
  r = np.array([[0,1],[3,4]])  #取出(第 0 1 3 4 行所有元素)
  print("==================")
  print(x[r])
  # 取第1行和第5行
  r = np.array([[0,0],[4,4]])
  # 取第1列和第5列
  c = np.array([[0,4],[0,4]])
  print(x[r,c]) 
  # 取出(0,0) (0,4) (4,0) (4,4) 四个点
  ```

* dot索引 `a[...,1:]`

### Numpy 广播

### 数组操作

* `flat` 将数组转换为一维迭代器
* `flatten()` 将数组转换为一维`数组`,返回一份数组拷贝，对拷贝所做的修改不会影响原始数组
* `ravel()`展平数组,可以设计order
* `transpose()`数组翻转

### 更改维度

* `newaxis`   增加维度   eg. x[:,newaxis]
* `squeeze`   降低维度  eg.squeeze(a,axis=0)

### 数组组合

* `concatenate`   eg. np.concatenate([x,y],axis=0)

  ```python
  x = np.array([[1, 2, 3], [4, 5, 6]])
  y = np.array([[7, 8, 9], [10, 11, 12]])
  z = np.concatenate([x,y],axis=1)
  # 输出 
  '''
  [[ 1  2  3  7  8  9]
   [ 4  5  6 10 11 12]]
  '''
  ```

* `stack`              eg. np.stack([x,y],axis=1)

  ```python
  x = np.array([1, 2, 3])
  y = np.array([7, 8, 9])
  z = np.stack([x,y])
  print(z)
  # 输出
  '''
  [[1 2 3]
   [7 8 9]]
  '''
  ```

* `vstack `           垂直堆叠

  ```python
  a = np.arange(10).reshape([2, -1])
  b = np.repeat(1, 10).reshape([2, -1])
  print(np.vstack([a,b]))
  '''
  [[0 1 2 3 4]
   [5 6 7 8 9]
   [1 1 1 1 1]
   [1 1 1 1 1]]
  '''      
  ```

* `hstack`            水平

### 数组拆分

* `split`

  splite  如果是一个整数，就用该数平均切分

  ​           如果是数组，则左开右闭，沿轴切开，默认是横向切割axis = 0

### 数组相等判断

* `allclose(x,y)`

### 数组平铺

* `np.tile`

### 数组重复

* `np.repeat`

### 删除重复元素

*  `c,s,p = np.unique(A, return_index=True, return_inverse=True)`
   * return_index=True    表示返回新列表元素在旧列表中的位置，并以列表形式储存在s中
   * return_inverse=True 表示返回旧列表元素在新列表中的位置，并以列表形式储存在p中
   * c 是去重的新数组

### 数学函数

* 四舍五入  `np.around(array,decimals=number)`
* 向上取整   `np.ceil`
* 向下取整   `np.floor`
* 取倒数       `np.reciprocal`
* 幂运算        `np.power`

### 统计函数

* 延指定轴返回最大最小值   `np.amin   np.amax`
* 返回中位数   `np.median`
* 返回平均值    `np.mean`
* 返回加权平均值  `np.average`
* 返回标准差    `np.std`
* 返回方差    `np.var`

### 数组排序

* 返回排序结果   `sort(array,axis,kind)`

* 返回排序索引    `argsort()`

* 对多个序列进行排序  `lexsort(b,a)`  先排a，再在a基础上使用b对a排序，最后返回a数组

* 分组: `partition(num)`  将大于`num`放在数组右边，反之放在数组左边

* 给定轴返回最大和最小元素索引`argmax   argmin`

* 函数根据条件返回满足的元素    `np.extract(condition,array)`

  ```python
  # numpy.extract() 函数根据某个条件从数组中抽取元素，返回满条件的元素。
  a = np.arange(12).reshape((3,4))
  print(a)
  condition = np.mod(a,2) == 0
  print(condition)
  print(np.extract(condition,a))
  '''
  [[ 0  1  2  3]
   [ 4  5  6  7]
   [ 8  9 10 11]]
   
  [[ True False  True False]
   [ True False  True False]
   [ True False  True False]]
   
  [ 0  2  4  6  8 10]
  '''
  ```

### 线性代数

* 构造矩阵: `np.matrix`

* 一维内积和,二维矩阵乘法 `np.dot`

  * np.dot(a,b)	                         普通内积(a,b ∈ 1D ndarray)	结果为scalar
    np.dot(a,b)	                         矩阵乘法(a,b ∈ matrix)	a.cols=b.rows
    np.dot(a,b)	                         数量积(a,b ∈ ndarray,scalar) 可交换位置

    如果两个矩阵是 2x3 2x3  则inner可用，dot不可用
    如果两个矩阵是 2x3 3x2  则dot可用，inner不可用

* 一维内积和,二维矩阵乘法 `np.inner`

* 行列式计算  `n.linalg.det()`

* 线性方程组计算 ` AX = B   A(-1) = np.linagle.inv(a)  X = A(-1)B   `

### Numpy IO

* 二进制文件
  * 读文件  `np.load`
  * 写文件`np.save`，后缀位`.npy`
  * 写多个数组进入文件`np.savez(file,a1=数组名1，a2=数组名2,...)`，返回`.npz`下标文件
* 普通文件读取
  * 读文件 `np.loadtxt(file,delimeter)`
  * 写文件 `np.savetxt(file,array,fmt,delimeter)`

### matplotlib绘图

* 绘图子区域   `plt.subplot(nrows,ncols,plot_number)`
* 在一同图上，绘制多个曲线，两个数组为一组，`plt.plot(a,a*1.5,a,a*2.5,a,a*4.5)`
* 中文显示  `matplotlib.rcParams['font.family'] = 'SimHei'`
  * rcParam参数，`font.family`，`font.style`,`font.size`
* 中文显示第二种方法，

```python
import numpy as np 
import matplotlib.pyplot as plt 
# 计算正弦和余弦曲线上的点的 x 和 y 坐标 
x = np.arange(0,  3  * np.pi,  0.1) 
x_tan = np.arange(0,  3  * np.pi,  np.pi/2) 
y_sin = np.sin(x) 
y_cos = np.cos(x) 
y_tan = np.tan(x_tan) 
# 建立 subplot 网格，高为 2，宽为 1  
# 激活第一个 subplot
plt.subplot(3,  1,  1)  # 3代表行，1代表列，所以一共有3个图，1代表此时绘制第一个图。
# 绘制第一个图像 
plt.plot(x, y_sin) 
plt.title('Sine')  
# 将第二个 subplot 激活，并绘制第二个图像
plt.subplot(3,  1,  2) 
plt.plot(x, y_cos) 
plt.title('Cosine')  
# 将第三个 subplot 激活，并绘制第三个图像
plt.subplot(3,  1,  3) 
plt.plot(x_tan, y_tan) 
plt.title('Tanan')  
# 展示图像
plt.show()
```

### matplotlib绘制条形图

```python
# pyplot 子模块提供 bar() 函数来生成条形图
import matplotlib.pyplot as plt 
x =  [5,8,10] 
y =  [12,16,6] 
x2 =  [6,9,11] 
y2 =  [6,15,7] 
plt.bar(x,y,align='center')
plt.bar(x2,y2,color='r',align='center')
plt.title("bar Graph")
plt.xlabel('x asix')
plt.ylabel('y asix')
plt.show()
```

### matplotlib绘制扇形图

```python
import matplotlib.pyplot as plt
import numpy as np
labels = ['dogs','cats','pigs','bird']
sizes = [15,30,20,35]
explode = (0,0,0.1,0)   # explode 指的是这个扇形脱离大扇形多少,autopact表示精确度
plt.pie(sizes,labels=labels,explode=explode,autopct='%1.1f%%',shadow=False,startangle=90)
plt.show()
plt.axis('equal')
```

### matplotlib绘制扇形图

```python
import matplotlib.pyplot as plt
import numpy as np

N = 20
theta = np.linspace(0.0,2*np.pi,N,endpoint=False)
radii = 10*np.random.rand(N) 
width = np.pi / 4 * np.random.rand(N)

# 在创建子图时，使用projection时使用polar时,变可以绘制极坐标
ax = plt.subplot(111,projection='polar')
bars = ax.bar(theta,radii,width=width,bottom=0.0)# 设置一个扇形的长宽高
# theta == angle  radii == height  
for r,bar in zip(radii,bars):
    bar.set_facecolor(plt.cm.viridis(r/10.))
    bar.set_alpha(0.5)
plt.show() #numpy1.png
```

![picture](/img/numpy1.png)

### matplotlib保存图像

```python
plt.save(filename,dpi=number)
```

### matplotlib散点图绘制

```python
import numpy as np
import matplotlib.pyplot as plt

fig,ax = plt.subplots()
ax.plot(10*np.random.randn(100),10*np.random.randn(100),'o')
ax.set_title("Simple Scatter")

plt.show()
```

### CSV文件

* 只能有效地存一维以及二维数组
* 使用`np.savetxt`，`np.loadtxt`

### 多维数据存储

* 写文件 `tofile(frame,sep='',format='')`
* 读文件  `fromfile(frame,dtype='',count='',format='')` 
  * `count`代表读取元素个数，-1代表读取全部

### 随机数

* 返回[0,1)之间的一个数:`random.rand`
* 返回标准正态分布一个数:`random.randn`
* 返回一个在区间的随机整数:`random.randint(left,right,shape)`

## Pandas

### Series

由一组数据以及与之相关的数据索引组成

```python
import pandas as pd
a = pd.Series(range(4),index=['a','b','c','d'])
```

### Series创建方式

* 小括号代表元组，方括号代表列表，大花括号代表字典

* 从标量值创建

  ```python
  import pandas as pd
  s = pd.Series(25,index=['a','b','c'])
  ```

* 从字典创建

  ```python
  import pandas as pd
  e = pd.Series({'a':9,'b':8,'c':7})
  print(e)
  ```

* 从`nadarray`创建

  ```python
  import pandas as pd
  import numpy as np
  n = pd.Series(np.arange(5),index=np.arange(9,4,-1))
  print(n)
  ```

### Series相关操作(与ndarray类型相同)

* `index`  获取相关索引
* `values` 获取对用值
* `.cusum`累加求和
* 两套索引，自动索引并自动保存索引，注意两个不能同时使用

```python
import pandas as pd
import numpy as np
n = pd.Series([9,8,7,6],['a','b','c','d'])
print(n['c'])
print(n[2])
```

* 相关操作

  * `mean()`

  * 类似于python的字典操作

    * 通过自定义索引访问

    * 保留字`in`操作

    * 使用`.get()`方法

      ```python
      print(n.get('s',200))  # 如果s存在输出其在字典中的值，如果不存在输出200
      ```

* Series对象和索引都可以有一个名字

* Series是一维带标签数组

### DataFrame

一个索引对应多个数组

#### 创建方式

* 从一维数组创建

  ```python
  import numpy as np
  import pandas as pd
  d = pd.DataFrame(np.arange(10).reshape(2,5))
  print(d)
  ```

* 从二维数组创建

  * 自定义行索引
  * 自定义列索引
  * 数据根据索引自动补齐

  ```python
  import numpy as np
  import pandas as pd
  dt = {
      'one':pd.Series([1,2,3],index=['a','b','c']),
      'two':pd.Series([23,12,12],index = ['e','f','g'])}
  print(pd.DataFrame(d))
  ```

* 从列表类型的字典中创建

  ```python
  import pandas as pd
  dl = {'one':[1,2,3,4],'two':[9,8,7,6]}
  d = pd.DataFrame(dl,index=['a','b','c','d'])
  print(d)
  ```

### Series和Dataframe的操作

* 增加或重排:重新索引

* 删除:`drop`

* `.reindex` 能够改变或者重排它们的索引

  ```python
  # 对于二维数组，可以对其行或者列进行索引
  d = d.reindex(colunms=['c2','c2','c4','c1'])
  d = d.reindex(index=['b','d','a','c'])
  ```

#### 索引类型常用方法

* 连接另一个index对象,产生新的index对象`.appened(idx)`  

* 计算差集,产生新的index对象`.diff(idx)`

* 删除`loc`位置处的元素`.delete(loc)`

* 在`loc`位置增加一个元素e`.insert(loc,e)`

* 使用方法如下,注意一定是在最后进行`reindex`

  ```python
  import numpy as np
  import pandas as pd 
  data = {
          '证券名称' : ['格力电器','视觉中国','成都银行','中国联通','格力电器','视觉中国','成都银行','中国联通'],
          '摘要': ['证券买入','证券买入','证券买入','证券买入','证券卖出','证券卖出','证券卖出','证券卖出'],
          '成交数量' : [500,1000,1500,2000,500,500,1000,1500],
          '成交金额' : [-5000,-10000,-15000,-20000,5500,5500,11000,15000]
     }
  dt = pd.DataFrame(data,index=['a','b','c','d','e','f','g','h'])
  print(dt)
  nc = dt.columns.delete(2)
  ni = dt.index.insert(5,'i')
  nd = dt.reindex(index=ni,columns=nc).ffill()
  print(nd)
  ```

  