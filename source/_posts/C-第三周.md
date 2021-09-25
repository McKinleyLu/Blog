---
title: C++第三周
date: 2019-08-18 07:02:31
toc: true
cover: /img/1.jpg
categories: 
  - 编程语言
  - C++
tags: 
  - C++
---

### 第一节 const常量使用

1. 定义常量<!-- more -->

   ```c++
   const int m = 3 ;
   ```

2. 定义常量指针

   ```c++
   const int* m ;
   ```

不可以通过常量指针修改其指向的内容，但可以改动其指向内容的值

1. 定义常引用

   ```c++
   const int& m;
   ```

   不能通过常引用修改其指向的变量

### 第二节 动态内存的分配

1. 用法一:分配一个空间

   ```c++
   int *p = new int;
   ```

2. 用法二:分配一个数组

   ```c++
   int* p = new int[N];
   ```

   分配一片大小为N*sizeof(int)的空间，并将其起始地址返回
   N可以为变量,new的返回值为地址

3. 用delete运算符释放new运算符申请的内存

   ```c++
   //申请 
   int*p = new int ;
   int*s = new int[n];
   
   //释放
   delete p;
   delete[] s;
   ```

### 第三节 C++函数

1. 内联函数
   当函数语句较短多次调用时，采用内联函数，可以降低有函数调用带来的消耗

   ```c++
   inline int func()
   {
       int m = 0 ;
       return 0 ;
   }
   ```

2. 函数重载
   函数名字相同，参数必须不同。

   ```c++
   //eg1
   int max(int a ,int b);
   int max(int a ,int b ,int c);
   
   //eg2(常量成员函数)
   int value(int a ,int b) const {return 0 ;}
   int value(int a ,int b)       {return 0 ;}
   ```

3. 函数缺省参数
   在C++中，定义函数的时候可以让最右边的连续若干个参数有缺省值。
   则调用函数的时候，若相应位置不写参数，参数值就是缺省值。

   ```c++
   void fun(int a ,int b ,int x3 = 3 ){}
   fun(10);                               //等效于fun(10,2,3)
   fun(10,12);                            //等效于(10,12,6)
   ```

   作用:提高了函数的可扩展性。
