---
title: python系统学习
toc: true
author: 瑾年
mathjax: true
tags:
  - python
categories:
  - 计算机语言笔记
abbrlink: 64002
date: 2022-07-06 15:30:02
---

### python系统学习
#### 基础数据结构

##### 字符串

> 字符串一但定义就无法改变,使用replace方法返回的是新的对象

```python
s = "Abc"
print(s.replace('A',1))
print(s)

>>> 1bc
>>> Abc
```

字符串格式化输出

* format

  > 使用字符串的`format()`方法，它会用传入的参数依次替换字符串内的占位符`{0}`、`{1}`…，

  ```python
  # format中的good将放入到{0}的槽中,其他数值依次类推
  print(print("This a {0} {1} which has {2} pounds".format("good","apple",5)))
  
  >>> This a good apple which has 5 pounds
  ```

* f-string

  > 以`f`开头的字符串，称之为`f-string`，它和普通字符串不同之处在于，字符串如果包含`{xxx}`，就会以对应的变量替换
  
  ```python
  r = 2.5 
  s = 3.14*3.26
  print(f'The radius is {r} and {s:.2f}')
  
  >>> The radius is 2.5 and 10.24
  ```
  
##### list 和 tuple

list是一种有序的集合，可以随时添加和删除其中的元素.

```python
# 定义
a = [1,2,3]
# 获取元素
print(a[-1])
>>> 3
# 添加元素
a.append(12)
print(a)
>>> [1,2,3,12]
# 指定位置添加元素
a.insert(0,-1)
print(a)
>>> [-1,1,2,3,12]
# 删除末尾元素
a.pop()
print(a)
>>> [-1,1,2,3]
# 删除指定位置元素
a.pop(0)
print(a)
>>> [1,2,3,12]
# 使用索引直接替换函数
a[1] = 9
print(a)
>>> [1,9,3,12]
# list中可以再放入list
s = [1,3,[2,5]]
print(s)
>>> [1,3,[2,5]]
```

tuple和list非常类似，但是tuple一旦初始化就不能修改.

```python
t = (1,2,3)
print(t)
>>> (1,2,3)
```

> tuple可以是一个空的

```python
t = ()
print(t)
>>> ()
```

> 当tuple初始化时，如果仅仅有一个数字,会解释成一个数字
>
> 当tuple初始化时，如果仅仅有一个数字，再加一个逗号，会解释称元组

```python
t = (1)
print(t)
>>> 1

t = (1,)
print(t)
>>> (1,)
```

> tuple中也可以有不同的数据类型

```python
t = (1,2,["a","b"])
print(t[2][0])
>>> a
```

##### dict 和 set

dict的支持，dict全称dictionary，在其他语言中也称为map，使用键-值（key-value）存储，具有极快的查找速度.

```python
# 定义
dicts = {'CHINA':15,'JAPAN':45,'RUSSIAN':89}
# 通过key获取value
print(dicts["JAPAN"])
>>> 45
print(dicts["Moxica"])
>>> SyntaxError: invalid syntax
# 为防止不在字典中的key获取value出错，使用get方法
# 找到返回value,否则返回-1
print(dicts.get("Moxica",-1))
```

> 和list相比,dict有以下几个特点：
>
> 1. 查找和插入的速度极快，不会随着key的增加而变慢；
> 2. 需要占用大量的内存，内存浪费多。

> 而list相反：
>
> 1. 查找和插入的时间随着元素的增加而增加；
> 2. 占用空间小，浪费内存很少。

> 正确使用dict非常重要，需要牢记的第一条就是dict的key必须是**不可变对象**

set和dict类似，也是一组key的集合，但不存储value。由于key不能重复，所以，在set中，没有重复的key.

```python
# 定义
s = set([1,2,3])
print(s)
>>> {1,2,3}

# 添加
s.add(12)
print(s)
>>> {1,2,3,12}

# 删除
s.remove(1)
print(s)
>>> {2,3,12}

# 集合的交、并运算
a = set([1,2,3])
b = set([1,4,5])
print(a | b)
>>> {1,2,3,4,5}
print(a & b)
>>> {1}
```

> set集合默认保持大顶堆，并且集合内元素不重复。

#### 函数

##### 默认参数

如果函数调用时，没有给参数，则使用默认参数，否则使用输入的参数

```python
def func(a,b,c=12,d="15"):
    print(a,b,c,d)
func()
>>> 1 2 3 15
```

> 定义默认参数要牢记一点：默认参数必须指向不变对象！
>
> 如下,不断调用函数funcs,则会出现返回值不断增多。

```python
def funcs(L= []):
    L.append("a")
    return L
m = funcs()
print(m)
m = funcs()
>>>['a']

print(m)
>>> ['a', 'a']
```

##### 可变参数

在Python函数中，还可以定义可变参数。顾名思义，可变参数就是传入的参数个数是可变的，可以是1个、2个到任意个，还可以是0个。

我们以数学题为例子，给定一组数字a，b，c……，请计算a2 + b2 + c2 + ……。

可以使用list、tuple,或者直接输入数字，此时要把函数参数改为可变参数

```python
def calc(*numbers):
    sum = 0 
    for n in numbers:
        sum = sum + n*n
    return sum
print(sum([1,2,3,4,5]))
>>> 15
```

#####  关键字参数

关键字参数允许你传入0个或任意个含参数名的参数，这些**关键字参数**在函数内部自动组装为一个`dict`。

```python
# 定义
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)
# 使用
# 注意,可变参数必须写成key=value
person("jane",12,city="JAPAN")

>>> name: jane age: 12 other: {'city': 'JAPAN'}
```

##### 命名关键字参数

如果要限制关键字参数的名字，就可以用命名关键字参数，例如，只接收`city`和`job`作为关键字参数。

```python
#定义
def persons(name,age,*,city,job):
    print(name,age,city,job)
# 只接收`city`和`job`作为关键字参数
persons("jane",15,city="China",job="cook")
>>> jane 15 China cook

persons("jane",15,city="China",job="cook",music="micheal")
>>> TypeError: persons() got an unexpected keyword argument 'music'
```

> 如果函数定义中已经有了一个可变参数，后面跟着的命名关键字参数就不再需要一个特殊分隔符`*`了.

```python
def person(name, age, *args, city, job):
    print(name, age, args, city, job)
```

> 命名关键字参数可以有缺省值，从而简化调用。

```python
def person(name, age, *, city='Beijing', job):
    print(name, age, city, job)
person("jane",15,job="cook")

>>> jane 15 Beijing cook
```

##### 参数组合

在Python中定义函数，可以用必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数都可以组合使用。

> 参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。

```python
# 函数1
def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)
f1(12,15,0,[1,2,3,4],city="beijing",job="engeneer")
>>> a = 12 b = 15 c = 0 args = ([1, 2, 3, 4],) kw = {'city': 'beijing', 'job': 'engeneer'}

# 函数2
def f2(a, b, c=0, *, d, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)
f2(1,2,d=99,city="Beijing")
>>> a = 1 b = 2 c = 0 d = 99 kw = {'city': 'Beijing'}
```

#### 高级特性

##### 切片
切片比索引取值更加方便

```python
l =[1,5,6,9,10]
print(l[0:3])
>>> [1,5,6]

#[a:b:c] 在(a,b)区间上以步调c提取元素
print('ABCDEFG'[::2])
>>> ACEG

# Python strip() 方法用于移除字符串头尾指定的字符（默认为空格或换行符）或字符序列
str = "watermelon"
print(str.strip('w'))
>>> atermelon
```

##### 迭代

利用items()输出全部信息

```python
dicts = {'d':1,'c':3,'s':4,'r':7}
for key,value in dicts.items():
    print(key,value)
>>>
d 1
c 3
s 4
r 7
```

同时迭代索引和元素本身

```python
for i,value in enumerate(['A','B','C']):
    print(i,value)
>>> 
0 A
1 B
2 C
```

##### 列表生成式

单循环列表生成式

```python
# 列表生成式
print([x*x for x in range(1,10)])

>>>[1, 4, 9, 16, 25, 36, 49, 64, 81]
```

双重循环列表生成式

```python
print([m + n for m in 'ABC' for n in 'abc'])

>>>['Aa', 'Ab', 'Ac', 'Ba', 'Bb', 'Bc', 'Ca', 'Cb', 'Cc']
```

> 注意,列表生成式,for前面的if...else是表达式,for后面是if的过滤条件,不能带else.

```python
print([i if i % 3 == 0 else  -i for i in range(10) if i % 2 == 0])

>>> [0, -2, -4, 6, -8]
```

##### 生成器

一边循环一边计算，不需要过大的空间

第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator:

```python
g =  (x*x for x in range(10))
# 一次性打印所有元素
for i in g :
    print(i)
    
>>>
0
1
4
9
16
25
36
49
64
81

# 使用next()方法单个打印
next(g)
>>> 0
next(g)
>>>1
next(g)
>>>4
...
```

第二种定义方法:如果一个函数定义中包含`yield`关键字，那么这个函数就不再是一个普通函数，而是一个generator函数.

```python
def odd():
    print('step 1')
    yield 1
    print('step 2')
    yield(3)
    print('step 3')
    yield(5)
    
o = odd()
next(o)
next(o)

>>>
step1
step2
```

> 调用generator函数会创建一个generator对象，多次调用generator函数会创建多个相互独立的generator.

```python
next(odd())
next(odd())
next(odd())

>>> 
step 1
step 1
step 1
```
