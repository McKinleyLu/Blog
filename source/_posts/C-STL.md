---
title: C++ STL
toc: true
cover: /img/1.jpg
categories:
  - 编程语言
  - STL
tags:
  - C++
abbrlink: 15764
date: 2021-07-17 07:12:49
---

### Why C++

1. 很多好用函数如reverse()、sort()函数等
2. C++标准STL、string类等功能大大降低C语言编写代码的代价<!-- more -->

### C++输入与输出

C++的cin用于输入、cout用于输出，但时间比scanf()、printf()高。当使用C++string类时，需要
使用cin与cout

### C++头文件

建议一般别写万能头文件，因为有时会因万能头文件而超时

```C++
#include <bits/stdc++.h> // 万能头文件
#include <cmath>         // 相当于C语⾔⾥⾯的#include <math.h>
#include <cstdio>        // 相当于C语⾔⾥⾯的#include <stdio.h>
#include <cctype>        // 相当于C语⾔⾥⾯的#include <ctype.h>
#include <cstring>       // 相当于C语⾔⾥⾯的#include <string.h
#include <vector>        
#include <string.h>
```



### C++的string使用

1. 无法用scanf()以及printf()处理

   ```C++
   string s = "hello world"; // 赋值字符串
   string s2 = s;
   string s3 = s + s2; // 字符串拼接直接⽤+号就可以
   string s4;
   cin >> s4; // 读⼊字符串
   cout << s; // 输出字符串
   ```

2. string空格结束或回车输入，如果字符串中有空格，请用getline()

   ```c++
   string s; // 定义⼀个空字符串s
   getline(cin, s); // 读取⼀⾏的字符串，包括空格
   cout << s.length(); // 输出字符串s的⻓度
   ```

3. string其他功能

   - string 中还有个很常⽤的函数叫做 substr ，作⽤是截取某个字符串中的⼦串，⽤法有两种形式：

     ```c++
     string s2 = s.substr(4); // 表示从下标4开始⼀直到结束
     string s3 = s.substr(5, 3); // 表示从下标5开始，3个字符
     ```

   - string的size()或length()函数，可以直接获得string的长度

   - string的begin()以及end()方法可以用于sort排序

### C++ STL之动态数组vector（⽮量）的使⽤

1. 基本使用方法

   ```c++
   #include <iostream>
   #include <vector>
    int main() 
    {
      vector<int> v1; // 定义⼀个vector v1，定义的时候没有分配⼤⼩
      cout << v1.size(); // 输出vector v1的⼤⼩，此处应该为0
       return 0;
    }
   ```

2. vector 可以⼀开始不定义⼤⼩，之后⽤ resize ⽅法分配⼤⼩，也可以⼀开始就定义⼤⼩，之后还可以对它插⼊删除动态改变它的⼤⼩；它都能够直接将所有的值初始化为0（不⽤显式地写出来，默认就是所有的元素为0)

   ```C++
   vector<int> v(10); // 直接定义⻓度为10的int数组，默认这10个元素值都为0
   // 或者
   vector<int> v1;
   v1.resize(8); //先定义⼀个vector变量v1，然后将⻓度resize为8，默认这8个元素都是0
   // 在定义的时候就可以对vector变量进⾏初始化
   vector<int> v3(100, 9);// 把100⻓度的数组中所有的值都初始化为9
   // 访问的时候像数组⼀样直接⽤[]下标访问即可～(也可以⽤迭代器访问，下⾯会讲～)
   v[1] = 2;
   cout << v[0];
   ```

3. vectcor常用方法示例

   ```c++
   #include <iostream>
   #include <vector>
   using namespace std;
   int main() 
   {
      vector<int> a; // 定义的时候不指定vector的⼤⼩
      cout << a.size() << endl; // 这个时候size是0
      for (int i = 0; i < 10; i++) 
      {
       a.push_back(i); // 在vector a的末尾添加⼀个元素i
      }
      cout << a.size() << endl; // 此时会发现a的size变成了10
       vector<int> b(15); // 定义的时候指定vector的⼤⼩，默认b⾥⾯元素都是0
      cout << b.size() << endl;
      for (int i = 0; i < b.size(); i++) 
     {
       b[i] = 15;
     }
      for (int i = 0; i < b.size(); i++) 
     {
       cout << b[i] << " ";
     }
      cout << endl;
     vector<int> c(20, 2); // 定义的时候指定vector的⼤⼩并把所有的元素赋⼀个指定的值
     for (int i = 0; i < c.size(); i++)
     {
      cout << c[i] << " ";
     }
     cout << endl;
     for (auto it = c.begin(); it != c.end(); it++) { 
      cout << *it << " ";// 使⽤迭代器的⽅式访问vector
     }
     return 0;
    }
   ```

4. 容器 vector 、 set 、 map 这些遍历的时候都是使⽤迭代器访问的。
   c.begin() 是⼀个指针，指向容器的第⼀个元素， c.end() 指向容器的最后⼀个元素的后⼀个位置，所以迭代器指针 it 的for循环判断条件是 it != c.end()

### C++ STL之集合set的使⽤

1. set是集合，一个set里面的各个元素是各不相同的，而且set会按照元素从大到小排序(既能保证元素不重复，又能从大到小排序)

2. set的常用用法

   ```java
   #include <iostream>
   #include <set>
   using namespace std;
   int main()
   {
     set<int> s ;    //定义一个空set集合s
     s.insert(1);    //向集合s里插入一个1
     cout<<*(s.begin()) << endl; //输出集合的第一个元素
     for(int i = 0 ; i < 6 ; i)
     {
       s.insert(i);   //向集合s插入i
     }
     for(auto it = s.begin() ; it != s.end() ; it++)
     {
       //用迭代器遍历集合中的每一个元素
       cout<<*it<<" ";
     }
     cout<<endl<<(s.find(2) != s.end()) <<endl;
     //查找集合s中的值，如果结果等于s.end()表示为未找到(因为s.end()表示s的最后一个元素的下一个所在位置)
     cout<<(s.find(10) != s.end()) << endl ;//s.find(10) != s.end()表示能找到10这个元素
     s.erase(1); //删除集合s中的1这个元素
     cout<<(s.find(1) != s.end()) << end; //这时1将无法找到
     return 0 ;
    }
   ```

