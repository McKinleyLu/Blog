<<<<<<< HEAD
<<<<<<< HEAD
---
title: C++入门
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - C++
abbrlink: 51130
date: 2021-05-23 17:19:11
---

### 第一节 函数指针与命令行参数

#### 函数指针

1.格式
类型名 + (*指针变量名) + (参数一类型、参数二类型….);<!-- more -->
示例

```c++
#include <stdio.h> 
#include <stdio.h>  
void PrintMin(int a,int b)   
{  
    if( a<b )  
    { 
        printf("%d",a);
    }  
    else       
    { 
        printf("%d",b);
    }  
}  
int main() 
{    
    void (* pf)(int ,int);  
    int x = 4, y = 5;  
    pf = PrintMin;  
    pf(x,y);  
    return 0;  
}
```

2.C++的qsort()函数使用
qsort(起始地址,长度,每个元素字节大小,排序规则)；
示例如下:

```c++
#include <stdio.h>   
#include <stdlib.h>  
int MyCompare( const void * elem1, const void * elem2 )
{
    unsigned int * p1, * p2;
    p1 = (unsigned int *) elem1; // “* elem1” 非法
    p2 = (unsigned int *) elem2; // “* elem2” 非法
    return (* p1 % 10) - (* p2 % 10 );
}

#define NUM 5
int main()
{
    unsigned int an[NUM] = { 8,123,11,10,4 };
    qsort( an,NUM,sizeof(unsigned int), MyCompare);
    for( int i = 0;i < NUM; i ++ )
    printf("%d ",an[i]);
    return 0;
}
```



#### 命令行参数

1.格式:

```c++
int main(int argc , char* argv[])
```



其中，argc为参数个数，argv为char**类型
2.命令行参数以空格或回车为一个参数的结束，若参数包含回车，请用” “包裹起来

### 第二节 位运算

#### &（与）运算

eg: 21 & 18 = 16
即这个数的二进制数对应位均为1时，则该位为1，其余任何时刻均为0
应用:

某些位清零，其他位不变

获取变量中的某一位

#### |(或)运算

eg: 21 | 18 = 23

将某些位置置为1，其他不变

#### ^(异或)

eg: 21 ^ 18 = 23
规律:
若 a ^ b = c
则有：
c ^ a = b ;
c ^ b = a ;

#### ~(取反)运算

#### <<(左运算)

eg: 9 << 4 = 144
9的二进制编码: 0000 1001
左移四位:
1001 0000

左移一位乘2，左移n位乘2的n次方

#### >>(右移)运算

- 对于有符号的数，前面补充的数为符号对应的数
- 对于无符号的数，前面补0

右移一位除2，右移n位除以2的n次方

如果除不尽，则向较小的整数靠近

### 第三节 引用

```
类型名 & 引用名 = 某变量名
```

注意一下几个规则

- 定义引用时必须初始化成某一 变量

- 一旦初始化，不能再引用其他变量，”=”仅仅时赋值

- 只能引用变量

- 变量可以做函数返回值

- const & r 为常引用，不能通过该引用改变被引用的变量值

  变量做函数返回值示例

  ```java
  int n = 4;
  int & SetValue()
  {
        return n; 
  }
  int main()
  {
      SetValue() = 40;
      cout << n;
      return 0;
  } //输出： 40
  ```

=======
---
title: C++入门
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - C++
abbrlink: 51130
date: 2021-05-23 17:19:11
---

### 第一节 函数指针与命令行参数

#### 函数指针

1.格式
类型名 + (*指针变量名) + (参数一类型、参数二类型….);<!-- more -->
示例

```c++
#include <stdio.h> 
#include <stdio.h>  
void PrintMin(int a,int b)   
{  
    if( a<b )  
    { 
        printf("%d",a);
    }  
    else       
    { 
        printf("%d",b);
    }  
}  
int main() 
{    
    void (* pf)(int ,int);  
    int x = 4, y = 5;  
    pf = PrintMin;  
    pf(x,y);  
    return 0;  
}
```

2.C++的qsort()函数使用
qsort(起始地址,长度,每个元素字节大小,排序规则)；
示例如下:

```c++
#include <stdio.h>   
#include <stdlib.h>  
int MyCompare( const void * elem1, const void * elem2 )
{
    unsigned int * p1, * p2;
    p1 = (unsigned int *) elem1; // “* elem1” 非法
    p2 = (unsigned int *) elem2; // “* elem2” 非法
    return (* p1 % 10) - (* p2 % 10 );
}

#define NUM 5
int main()
{
    unsigned int an[NUM] = { 8,123,11,10,4 };
    qsort( an,NUM,sizeof(unsigned int), MyCompare);
    for( int i = 0;i < NUM; i ++ )
    printf("%d ",an[i]);
    return 0;
}
```



#### 命令行参数

1.格式:

```c++
int main(int argc , char* argv[])
```



其中，argc为参数个数，argv为char**类型
2.命令行参数以空格或回车为一个参数的结束，若参数包含回车，请用” “包裹起来

### 第二节 位运算

#### &（与）运算

eg: 21 & 18 = 16
即这个数的二进制数对应位均为1时，则该位为1，其余任何时刻均为0
应用:

某些位清零，其他位不变

获取变量中的某一位

#### |(或)运算

eg: 21 | 18 = 23

将某些位置置为1，其他不变

#### ^(异或)

eg: 21 ^ 18 = 23
规律:
若 a ^ b = c
则有：
c ^ a = b ;
c ^ b = a ;

#### ~(取反)运算

#### <<(左运算)

eg: 9 << 4 = 144
9的二进制编码: 0000 1001
左移四位:
1001 0000

左移一位乘2，左移n位乘2的n次方

#### >>(右移)运算

- 对于有符号的数，前面补充的数为符号对应的数
- 对于无符号的数，前面补0

右移一位除2，右移n位除以2的n次方

如果除不尽，则向较小的整数靠近

### 第三节 引用

```
类型名 & 引用名 = 某变量名
```

注意一下几个规则

- 定义引用时必须初始化成某一 变量

- 一旦初始化，不能再引用其他变量，”=”仅仅时赋值

- 只能引用变量

- 变量可以做函数返回值

- const & r 为常引用，不能通过该引用改变被引用的变量值

  变量做函数返回值示例

  ```java
  int n = 4;
  int & SetValue()
  {
        return n; 
  }
  int main()
  {
      SetValue() = 40;
      cout << n;
      return 0;
  } //输出： 40
  ```

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: C++入门
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - C++
abbrlink: 51130
date: 2021-05-23 17:19:11
---

### 第一节 函数指针与命令行参数

#### 函数指针

1.格式
类型名 + (*指针变量名) + (参数一类型、参数二类型….);<!-- more -->
示例

```c++
#include <stdio.h> 
#include <stdio.h>  
void PrintMin(int a,int b)   
{  
    if( a<b )  
    { 
        printf("%d",a);
    }  
    else       
    { 
        printf("%d",b);
    }  
}  
int main() 
{    
    void (* pf)(int ,int);  
    int x = 4, y = 5;  
    pf = PrintMin;  
    pf(x,y);  
    return 0;  
}
```

2.C++的qsort()函数使用
qsort(起始地址,长度,每个元素字节大小,排序规则)；
示例如下:

```c++
#include <stdio.h>   
#include <stdlib.h>  
int MyCompare( const void * elem1, const void * elem2 )
{
    unsigned int * p1, * p2;
    p1 = (unsigned int *) elem1; // “* elem1” 非法
    p2 = (unsigned int *) elem2; // “* elem2” 非法
    return (* p1 % 10) - (* p2 % 10 );
}

#define NUM 5
int main()
{
    unsigned int an[NUM] = { 8,123,11,10,4 };
    qsort( an,NUM,sizeof(unsigned int), MyCompare);
    for( int i = 0;i < NUM; i ++ )
    printf("%d ",an[i]);
    return 0;
}
```



#### 命令行参数

1.格式:

```c++
int main(int argc , char* argv[])
```



其中，argc为参数个数，argv为char**类型
2.命令行参数以空格或回车为一个参数的结束，若参数包含回车，请用” “包裹起来

### 第二节 位运算

#### &（与）运算

eg: 21 & 18 = 16
即这个数的二进制数对应位均为1时，则该位为1，其余任何时刻均为0
应用:

某些位清零，其他位不变

获取变量中的某一位

#### |(或)运算

eg: 21 | 18 = 23

将某些位置置为1，其他不变

#### ^(异或)

eg: 21 ^ 18 = 23
规律:
若 a ^ b = c
则有：
c ^ a = b ;
c ^ b = a ;

#### ~(取反)运算

#### <<(左运算)

eg: 9 << 4 = 144
9的二进制编码: 0000 1001
左移四位:
1001 0000

左移一位乘2，左移n位乘2的n次方

#### >>(右移)运算

- 对于有符号的数，前面补充的数为符号对应的数
- 对于无符号的数，前面补0

右移一位除2，右移n位除以2的n次方

如果除不尽，则向较小的整数靠近

### 第三节 引用

```
类型名 & 引用名 = 某变量名
```

注意一下几个规则

- 定义引用时必须初始化成某一 变量

- 一旦初始化，不能再引用其他变量，”=”仅仅时赋值

- 只能引用变量

- 变量可以做函数返回值

- const & r 为常引用，不能通过该引用改变被引用的变量值

  变量做函数返回值示例

  ```java
  int n = 4;
  int & SetValue()
  {
        return n; 
  }
  int main()
  {
      SetValue() = 40;
      cout << n;
      return 0;
  } //输出： 40
  ```

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
