---
title: spfa求最短路
categories:
  - 基础算法
tags:
  - 最短路
  - week3
abbrlink: 55024
date: 2022-03-11 17:09:39
---
### 题目描述

给定一个n个点m条边的有向图，图中可能存在重边和自环， 边权可能为负数。
请你求出1号点到n号点的最短距离，如果无法从1号点走到n号点，则输出impossible。
数据保证不存在负权回路。

### 输入格式

第一行包含整数n和m。

接下来m行每行包含三个整数x，y，z，表示存在一条从点x到点y的有向边，边长为z。

### 输出格式

输出一个整数，表示1号点到n号点的最短距离。

如果路径不存在，则输出”impossible”。

### 数据范围

```java
1≤n,m≤1051≤n,m≤105,
图中涉及边长绝对值均不超过10000。
```

### 输入样例

```java
3 3
1 2 5
2 3 -3
1 3 4
```

### 输出样例

```java
2
```

### 参考代码

```java
#include <iostream>
#include <cstring>
#include <algorithm>
#include <queue>
using namespace std ;
const int N = 1e5+10;
int n , m ;
int h[N] , en[N],ne[N] , w[N];
int dist[N];
bool used[N];
int idx = 0 ;
//稀疏图，邻接表存储
void add_node(int a , int b , int c){
    en[idx] = b , ne[idx] = h[a] , w[idx] = c , h[a] = idx++ ;
}

int spfa(){
    memset(dist,0x3f,sizeof dist);
    dist[1] = 0 ;

    queue<int> q ;
    q.push(1);
    used[1] = true ;

    while(q.size()){
        int t = q.front() ;
        q.pop();

        used[t] = false;
        
        for(int i = h[t] ; i != -1 ; i = ne[i])
        {
              int j = en[i];
              if(dist[j] > dist[t] + w[i])
              {
                  dist[j] = dist[t] + w[i];
                  if(!used[j]){
                      q.push(j);
                      used[j] = true ;
                  }
              }
        }

    }


    if(dist[n] > 0x3f3f3f3f /2 )  return -10000;
    return dist[n];
}

int main(int argc, char const *argv[])
{
    cin >> n >> m;
    memset(h , -1 , sizeof h);
    
    while(m --){

    int a , b , c  ;
    cin >> a >> b >> c ;
    add_node(a,b,c);
    }
    int res = spfa();
    if(res == -999999)  {puts("impossible"); return 0;}
    cout<<res<<endl;
    return 0;
}
```



