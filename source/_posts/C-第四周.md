---
title: C++第四周
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - C++
abbrlink: 38739
date: 2021-07-17 07:09:03
---

### C++面对对象程序设计第一节

#### 类的相关知识

1. 与java不同，类的最后}需要加分号

2. 成员函数外部描述方式<!-- more -->

   ```java
   int CRectangle :: Area()
   {
       return weight*high;
   }
   ```

   

3. 注意：如果在类外写成员函数，需要在类定义中声明

   ```java
   class A{
        int a ,b;
        void Print();
   };
   void A ::Print()
   {
       cout << endl;
   }
   ```

4. 类的可访问范围
   与java不同的是，如果不写范围，默认为private

5. 设置私有成员机制 —隐藏

6. 设置私有成员目的 —强制对成员进行隐藏

   #### 类的相关函数

   ##### 内联成员函数

   定义的两种方式:

7. line + 成员函数

8. 整个函数出现在类定义外部

   ##### 重载成员函数

9. 定义: 成员函数可带缺省值

10. 注意！！！:使用缺省函数注意避免函数重载的歧义

    ```java
    class A
    {
        void value(int val = 0 ) {x = val ;}
        void value()             {cout << endl ;}   //歧义
    };
     A m ;
     m.value();    //编译器不知道要调用哪个成员函数
    ```

##### 复制(拷贝)构造函数

1. 若没有复制构造函数，则默认生成

   ```java
   complex c1 ;    //拷贝(初始化语句，并非赋值语句)
   complex c2 = c1 ;
   complex c3(c2);
   
   //赋值语句
   c3 = c2
   ```

2. 复制构造函数的参数必须是对象的引用，且参数只有一个、没有返回值

   ```java
   complex (complex & a)  //正确
   complex (complex   a)  //错误
   ```

3. 复制构造函数使用的三种情况

   - 初始化新的对象
   - 函数调用时输入形参，形参到实参其实是自已利用复制构造函数自己有生成了并初始化了一个新的对象
   - 函数返回一个对象，其实是自已利用复制构造函数自己有生成了并初始化了一个新的对象，并将其返回

4. 注意问题

   如果复制构造函数是自己写的，那么可能就与上面三种情况结果不同(不一定返回对象，对象性质不一定相同等等)

   ##### 强制类型转换函数

5. 目的：实现类的自动转换

6. 特点

   - 只有一个参数
   - 并非复制构造函数

7. 实例

   ```java
   class A{
       public:
          double real ,imag;
          complex(int i)u;
          {
              cout << "intconstructor called"<<endl;
              real = 2 ; imag = 0;
          }
          complex (double r , double i) {real = r ; imag = }
   
   };
   
   int main()
   {
       complex c1(7,8);
       complex c2 = c1;
       c1 = 9 ;        //12以及9被自动转换成一个临时的complex对象
   }
   ```

##### 析构函数

1. 成员函数中的一种，名字与类名相同，没有参数也没有返回值，一个类最多只有一个析构函数
2. 对象消亡时，自动被调用
3. 在析构函数加入delete运算符，可以释放new申请的空间
4. 对象数组的每个元素的析构函数都会被调用
5. 注意:
   - 语句块结束后，自动调用析构函数
   - 函数结束，自动调用析构函数
