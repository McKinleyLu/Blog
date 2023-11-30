<<<<<<< HEAD
---
title: python数据分析与展示(一)
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 15293
date: 2021-10-06 23:01:31
---

## Python数据分析与展示

### Python之Numpy库相关使用方法

​     python中用列表保存一组值，可将列表当数组使用。另外，python中有array模块，但它不支持多维数组，无论是时列表还是array模块都没有科学运算函数，不适合做矩阵等科学计算。numpy没有使用python本身的数组机制，而是提供了ndarray对象，该对象不仅能方便地存取数组，而且拥有丰富的数组计算函数。<!-- more -->

#### 安装  

```shell
pip install numpy
```

### 数据分类

1. 一维数据: 由对等关系的有序或无序数据构成，采用线性方式组织
2. 区别
* 列表：数据类型可以不同
* 数组：数组类型相同
3. 二维数据：由多个一维数据构成，是一维数据的组合形式 ,例如表格
4. 高维数据：高维数据 仅利用最基本的二元关系 展示数据间的复杂结构 (键值对)
5. 数据总结
*  一维数据 : 列表 + 集合
*  二维数据 : 列表数据
*  多维数据 : 列表数据
*  高维数据 : 字典类型，或 数据表示格式(JSON XML YAML)

### Numpy数组对象ndarray

1. 性质

   * N维数据对象

   * 数组间可以计算

   * 线性代数、傅里叶变换、随机数生成等

   *  底层用C++实现

2. 使用

   ```python
   import numpy as np 
   ```

3. ndarray属性

   * 轴axis： 保存数据的维度   秩: 轴的数量
   * .ndim    秩
   * .shape    返回n行m列
   * .size    元素个数
   * .dtype    元素类型
   * .itemsize  元素大小
   * axis = 0 列     axis = 1 行

4. ndarray元素数据类型

   * 布尔类  bool
   * 整形类   intc 、 int8(-128,127) 、 int16 、 int32 、 int64
   * 浮点类   float16(1sign 5E 10M) 、float32 、 float64
   * 复数类   complex64 、 complex128
   
5. ndarray数组创建方式
   * 使用元组或者列表创建 a = np.array(list / tuple[, dtype = int32])
   * .arange(n)
   * .ones(shape)
   * zeros(shaple)
   * .full_like(a,val)
   
6. 使用其他函数创建ndarray

   * .linspace(n,m,k,endpoint=bool)
   * .concatenate()
   
7. 数组变换

   * reshape(shape)
   * .resize(shape)                                                   #除了这个，其他的否返回新的array，flatten返回一维数组
   * .swapaxes(ax1,ax2)
   * .flatten()                                                             #降到一维，默认是按行的方向降
   
8. 数据类型变换:   .astype(new_type)

9. 数组变列表:     .tolist()

10. 数组运算

11. Numpy 一维函数  数组运算

    * abs()
    * fabs()
    * sqrt()
    * square()
    * ceil()
    * floor()
    * rint()
    * sign()
    * exp()
    * cos()
    * modf()                                      #返回x的整数部分与小数部分，两部分的数值符号与x相同，整数部分以浮点型表示
12. Numpy 二维函数   数组运算

    *  \+ - * / **

    * < <= >= == !=

    * .mod(x,y)

    * .fmax()

    * .fmin()
### Numpy 数据存取与函数

1. csv 只能存取 一维和二维数据
   * *.savetxt(frame,array,fmt="%.18e",delimiter = None)                              #delimiter = ',' 元素之间用逗号分隔
   * *.loadtxt(frame,dtype=np.float,delimiter = None ,unpack=Fasle)            #frame=可以是.gz或者.bz2 unpack=可将数据不同变量

2. 存储读取任意维度数据 
   
   * a.tofile(frame,sep='',format='%s')                                                            #frame可以是文件、字符串  
   
   * c = np.fromfile(frame,dtype=float,count=-1,sep='')                                  #count代表读取字符个数，-1代表读取所有
   
   tofile()要和fromfile()配合使用

3. Numpy便捷文件存取
   *  **.save(frame,array)                                                                                #文件名要以.np或者压缩扩展名.npz*
   * *.load(fname)   

### Numpy 随机函数

#### np.random.*

1.  np.random.seed()
2.  np.random.randint()                                       # 返回随机整数
3. np.random.rand()                                           # 返回均匀分布[0,1]的浮点数
4. np.random.randn()                                          # 返回标准分布
5. np.random.uniform(low,high,size)                   # 返回[low,high]的均匀分布
6. np.random.normal(loc,scale,size)                   # 返回均值为loc，方差为scale的正态分布

### Numpy 统计函数

1. np.sum(a,axis=None)                                       # 不带axis默认是整个数组范围，否则是某个轴范围
2.  .mean() 
3. .average(a,axis=0,weight=[10,2,3])                  # 计算加权平均值                   
4. .std
5. .var
6. .max
7. .min
8. .median
9. .ptp
10. .gradient(f)                                                         # 返回数据梯度 a,b,c,其中b的梯度为:(c - a) / 2 





=======
---
title: python数据分析与展示(一)
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 15293
date: 2021-10-06 23:01:31
---

## Python数据分析与展示

### Python之Numpy库相关使用方法

​     python中用列表保存一组值，可将列表当数组使用。另外，python中有array模块，但它不支持多维数组，无论是时列表还是array模块都没有科学运算函数，不适合做矩阵等科学计算。numpy没有使用python本身的数组机制，而是提供了ndarray对象，该对象不仅能方便地存取数组，而且拥有丰富的数组计算函数。<!-- more -->

#### 安装  

```shell
pip install numpy
```

### 数据分类

1. 一维数据: 由对等关系的有序或无序数据构成，采用线性方式组织
2. 区别
* 列表：数据类型可以不同
* 数组：数组类型相同
3. 二维数据：由多个一维数据构成，是一维数据的组合形式 ,例如表格
4. 高维数据：高维数据 仅利用最基本的二元关系 展示数据间的复杂结构 (键值对)
5. 数据总结
*  一维数据 : 列表 + 集合
*  二维数据 : 列表数据
*  多维数据 : 列表数据
*  高维数据 : 字典类型，或 数据表示格式(JSON XML YAML)

### Numpy数组对象ndarray

1. 性质

   * N维数据对象

   * 数组间可以计算

   * 线性代数、傅里叶变换、随机数生成等

   *  底层用C++实现

2. 使用

   ```python
   import numpy as np 
   ```

3. ndarray属性

   * 轴axis： 保存数据的维度   秩: 轴的数量
   * .ndim    秩
   * .shape    返回n行m列
   * .size    元素个数
   * .dtype    元素类型
   * .itemsize  元素大小
   * axis = 0 列     axis = 1 行

4. ndarray元素数据类型

   * 布尔类  bool
   * 整形类   intc 、 int8(-128,127) 、 int16 、 int32 、 int64
   * 浮点类   float16(1sign 5E 10M) 、float32 、 float64
   * 复数类   complex64 、 complex128
   
5. ndarray数组创建方式
   * 使用元组或者列表创建 a = np.array(list / tuple[, dtype = int32])
   * .arange(n)
   * .ones(shape)
   * zeros(shaple)
   * .full_like(a,val)
   
6. 使用其他函数创建ndarray

   * .linspace(n,m,k,endpoint=bool)
   * .concatenate()
   
7. 数组变换

   * reshape(shape)
   * .resize(shape)                                                   #除了这个，其他的否返回新的array，flatten返回一维数组
   * .swapaxes(ax1,ax2)
   * .flatten()                                                             #降到一维，默认是按行的方向降
   
8. 数据类型变换:   .astype(new_type)

9. 数组变列表:     .tolist()

10. 数组运算

11. Numpy 一维函数  数组运算

    * abs()
    * fabs()
    * sqrt()
    * square()
    * ceil()
    * floor()
    * rint()
    * sign()
    * exp()
    * cos()
    * modf()                                      #返回x的整数部分与小数部分，两部分的数值符号与x相同，整数部分以浮点型表示
12. Numpy 二维函数   数组运算

    *  \+ - * / **

    * < <= >= == !=

    * .mod(x,y)

    * .fmax()

    * .fmin()
### Numpy 数据存取与函数

1. csv 只能存取 一维和二维数据
   * *.savetxt(frame,array,fmt="%.18e",delimiter = None)                              #delimiter = ',' 元素之间用逗号分隔
   * *.loadtxt(frame,dtype=np.float,delimiter = None ,unpack=Fasle)            #frame=可以是.gz或者.bz2 unpack=可将数据不同变量

2. 存储读取任意维度数据 
   
   * a.tofile(frame,sep='',format='%s')                                                            #frame可以是文件、字符串  
   
   * c = np.fromfile(frame,dtype=float,count=-1,sep='')                                  #count代表读取字符个数，-1代表读取所有
   
   tofile()要和fromfile()配合使用

3. Numpy便捷文件存取
   *  **.save(frame,array)                                                                                #文件名要以.np或者压缩扩展名.npz*
   * *.load(fname)   

### Numpy 随机函数

#### np.random.*

1.  np.random.seed()
2.  np.random.randint()                                       # 返回随机整数
3. np.random.rand()                                           # 返回均匀分布[0,1]的浮点数
4. np.random.randn()                                          # 返回标准分布
5. np.random.uniform(low,high,size)                   # 返回[low,high]的均匀分布
6. np.random.normal(loc,scale,size)                   # 返回均值为loc，方差为scale的正态分布

### Numpy 统计函数

1. np.sum(a,axis=None)                                       # 不带axis默认是整个数组范围，否则是某个轴范围
2.  .mean() 
3. .average(a,axis=0,weight=[10,2,3])                  # 计算加权平均值                   
4. .std
5. .var
6. .max
7. .min
8. .median
9. .ptp
10. .gradient(f)                                                         # 返回数据梯度 a,b,c,其中b的梯度为:(c - a) / 2 





>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
