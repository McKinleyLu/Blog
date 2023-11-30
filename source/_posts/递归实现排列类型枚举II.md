<<<<<<< HEAD
---
title: 递归实现排列类型枚举II
categories:
  - 基础算法
tags:
  - DFS
abbrlink: 28289
date: 2022-03-11 16:59:58
---
### 题目描述

从 1∼n这 n 个整数中随机选取任意多个，输出所有可能的选择方案。

### 输入格式

输入一个整数 n。

### 输出格式

每行输出一种方案。

同一行内的数必须升序排列，相邻两个数用恰好 1 个空格隔开。

对于没有选任何数的方案，输出空行。

本题有自定义校验器（SPJ），各行（不同方案）之间的顺序任意。

### 数据范围

```java
1≤n≤15
```

### 输入样例

```java
3
```

### 输出样例

```java
3
2
2 3
1
1 3
1 2
1 2 3
```

### 参考代码

```java
#include <iostream>
using namespace std;
const int N = 10;
int a[N],used[N],path[N];
int n  ;
void dfs(int u){
     if(u > n){
         for(int i = 1 ; i <= n ; ++i) printf("%d ",path[i]);
         puts("");
         return ;
     }

     for(int i = 1 ; i <= n ; ++i){
         if(!used[i]){
            path[i] = i;
            used[i] = true ;
            dfs(u + 1);
            used[i] = false ;
         }
     }
}
int main(int argc, char const *argv[])
{
    cin >> n ;
    for(int i = 1 ; i <= n ; ++i) {cin >> a[i];}
    dfs(1);
    return 0;
}
```

=======
---
title: 递归实现排列类型枚举II
categories:
  - 基础算法
tags:
  - DFS
abbrlink: 28289
date: 2022-03-11 16:59:58
---
### 题目描述

从 1∼n这 n 个整数中随机选取任意多个，输出所有可能的选择方案。

### 输入格式

输入一个整数 n。

### 输出格式

每行输出一种方案。

同一行内的数必须升序排列，相邻两个数用恰好 1 个空格隔开。

对于没有选任何数的方案，输出空行。

本题有自定义校验器（SPJ），各行（不同方案）之间的顺序任意。

### 数据范围

```java
1≤n≤15
```

### 输入样例

```java
3
```

### 输出样例

```java
3
2
2 3
1
1 3
1 2
1 2 3
```

### 参考代码

```java
#include <iostream>
using namespace std;
const int N = 10;
int a[N],used[N],path[N];
int n  ;
void dfs(int u){
     if(u > n){
         for(int i = 1 ; i <= n ; ++i) printf("%d ",path[i]);
         puts("");
         return ;
     }

     for(int i = 1 ; i <= n ; ++i){
         if(!used[i]){
            path[i] = i;
            used[i] = true ;
            dfs(u + 1);
            used[i] = false ;
         }
     }
}
int main(int argc, char const *argv[])
{
    cin >> n ;
    for(int i = 1 ; i <= n ; ++i) {cin >> a[i];}
    dfs(1);
    return 0;
}
```

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
