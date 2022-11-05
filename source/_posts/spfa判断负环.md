---
title: spfa判断负环
categories:
  - 基础算法
tags:
  - 最短路
  - week3
abbrlink: 21681
date: 2022-03-11 17:09:55
---
### 题目描述
给定一个 n 个点 m 条边的有向图，图中可能存在重边和自环， 边权可能为负数。
请你判断图中是否存在负权回路。

### 输入格式

第一行包含整数 n 和 m。

接下来 mm 行每行包含三个整数 x,y,z，表示存在一条从点 x 到点 y 的有向边，边长为 z。

### 输出格式

如果图中**存在**负权回路，则输出 `Yes`，否则输出 `No`。

### 数据范围

```java
1≤n≤2000,
1≤m≤10000,
图中涉及边长绝对值均不超过 10000。
```

### 输入样例

```java
3 3
1 2 -1
2 3 4
3 1 -4
```

### 输出样例

```java
Yes
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
int h[N] , en[N],ne[N] , w[N],cnt[N];
int dist[N];
bool used[N];
int idx = 0 ;
//稀疏图，邻接表存储
void add_node(int a , int b , int c){
    en[idx] = b , ne[idx] = h[a] , w[idx] = c , h[a] = idx++ ;
}

bool spfa(){
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
                  cnt[j] = cnt[t] + 1;
                  if(cnt[j] >= n) return false ;
                  if(!used[j]){
                      q.push(j);
                      used[j] = true ;
                  }
              }
        }

    }
    return true;
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
    bool res = spfa();
    if(res)  puts("No");
    else     puts("Yes");
    return 0;
}
```



