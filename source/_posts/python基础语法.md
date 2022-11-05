---
title: python基础语法一
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 3989
date: 2021-10-01 09:41:57
---

## Python基础语法一

### Turtle库  

* turtle的绘制窗体<!-- more -->

  ```python
  turtle.setup(width,height,startx,starty)
  ```

* turtle空间坐标体系

  ```python
  # 走到目标(x,y)
  turtle.goto(x,y)
  # 以半径r走angle度
  turtle.circle(r,angle)
  # 向后退d距离
  turtle.bk(d)
  # 向前走d距离
  turtle.fd(d)
  ```
  
* turtle角度坐标体系

  ```python
  # 改变行进方向
  turtle.seth(angle)
  # 左转angel度
  turtle.left(angle)
  # 右转angle度
  turtle.right(angle)
  ```
  
* turtle其他属性

  ```python
  # 抬起画笔
  turtle.penup()
  # 放下画笔
  turtle.pendown()
  # 设置画笔颜色
  turtle.pencolor()
  # 完成绘画
  turtle.done()
  ```
### 数字类型及其操作

#### 进制

|   进制   | 开头方式 |
| :------: | :------: |
|  二进制  |  0b或0B  |
|  八进制  |  0o或0O  |
| 十六进制 |  0x或0X  |

#### 浮点数

1. 浮点数存在不确定尾数，不是bug

   round(x,d)：对x四舍五入，d是小数截取位数

   ```python
   0.1 + 0.2 == 0.3          False
   round(0.1+0.2,1) == 0.3   True
   ```
   
2. 用科学计数法表示浮点数

   ```python
   格式: <a>e<b>
   例子: 4.3e-3  9.5e6
   ```

#### 数值运算

1. x /y       除

2. x // y     整数除 

3. +x         加x本身

4. x % y    余数，模运算

5. x ** y    幂运算

#### 数值运算函数

1. abs(x)                                                                    求x的绝对值
2. divmod(x,y)                                                           求x / y 的商和余数
3. pow(x,y[,z])                                                           求(x**y)%z,z可以省略
4. round(x[,d])                                                           四舍五入，d为保留位数，默认为0
5. int(x)                                                                      强制将x转化为int类型
6. complex(x)                                                            强制将x转化为复数类型

### 字符串类型以及操作

1. 字符串基础知识
   * 字符串序号
     ![字符串序号](/img/python1.png)
   * 字符串的使用
     单个字符            str[M]
     切片                   str[M:N]
     带步长切片        str[M:N:K]
2. 字符串操作符
   * x + y                   x和y相连接
   * n * x 或 x * n     复制x字符串n次
   * x in s                 若x是s字串，返回True
3. 字符串处理函数
   * len(x)                 返回字符串长度
   * str(x)                  强制将x转化为字符串类型
4. 字符串处理方法
   * str.lower() 或 str.upper()     将字符串全部小写或者大写
   * str.split(sep=None)             返回一个列表，str根据sep被分割
   * str.count(sub)                     计算sub在str中出现的次数
   * str.replace(old,new)            str中的old字串被new替换 
   * str.center(width[,fillchar])     字符串str根据宽度width居中，fillchar可选,fillchar用来填充居中两侧的空格
   * str.strip(chars)                      从str中去除chars的字符
   * str.join(iter)                           在str每一个字符后面加一个iter 
5. 字符串类型的格式化
   * <模板字符串>.format(<逗号分隔参数>)
   * {0:e}  {0:E}  {0:f}  {0:%}  {0:b}  {0:c}  {0:o}   {0:x}  {0:X}

### Time库的使用
1. 时间获取
   * time()                       获取当前时间截
   * ctime()                     获取当前时间   'Fri Jan 26 12:11:16 2018'
   * gmtime()                  获取当前时间 ，表示为计算机可处理的时间格式
2. 时间格式化
   * strftime(tpl,ts)          tpl是格式化模板字符串，ts是计算机内部时间变量      time.strftime("%Y-%m-%d %H:%M:%S",t)

3. 程序计时

   per_counter()

   sleep()

