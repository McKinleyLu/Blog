---
title: C++第二周
date: 2021-05-23 18:18:40
toc: true
cover: /img/1.jpg
categories: 
  - 编程语言
  - C++
tags: 
  - C++
---

### 第一节 相关函数补充

#### C++ STL中的Binary search（二分查找）

##### 头文件<!-- more -->

```c++
#include <algorithm>
```

##### binary_search(参数一、参数二、参三)

1. 函数模板

   ```c++
   binary_search(arr[],arr[]+size ,  indx)
   ```

1. 参数说明
   (1)arr[]:数组首地址
   (2)size:数组元素个数
   (3)indx:需要查找的值

2. 函数功能

   在数组以二分法检索的方式查找，若在数组(要求数组元素非递减)中找到indx元素则返回true，否则false

##### lower_bound(参数一、参数二、参三)

1. 函数模板

   ```c++
   lower_bound(arr[],arr[]+size ,  indx)
   ```

2. 参数说明
   (1)arr[]:数组首地址
   (2)size:数组元素个数
   (3)indx:需要查找的值

3. 函数功能

   函数lower_bound()在first和last中的前闭后开区间进行二分查找，返回大于或等于val的第一个元素位置(注意是地址)。如果所有元素都小于val，则返回last的位置

##### upper_bound(参数一、参数二、参三)

1. 函数模板

   ```c++
   upper_bound(arr[],arr[]+size ,  indx)
   ```

2. 参数说明
   (1)arr[]:数组首地址
   (2)size:数组元素个数
   (3)indx:需要查找的值

3. 函数功能

   函数upper_bound()返回的在前闭后开区间查找的关键字的上界，返回大于val的第一个元素位置
