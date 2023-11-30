<<<<<<< HEAD
---
title: 树与图的存储与DFS使用
categories:
  - 基础算法
tags:
  - DFS
  - week3
abbrlink: 28912
date: 2021-11-20 15:49:44
---
### 知识点总结

树与图的存储

​	由于树是特殊的图，因此只关注图的存储<!-- more -->

​	有向图的存储 ：  临界矩阵 或者  邻接表: n个单链表   O(n + m)的遍历消耗

### 题目描述

给定一颗树，树中包含n个结点（编号1~n）和n-1条无向边。

请你找到树的重心，并输出将重心删除后，剩余各个连通块中点数的最大值。

重心定义：重心是指树中的一个结点，如果将这个点删除后，剩余各个连通块中点数的最大值最小，那么这个节点被称为树的重心。

#### 输入格式

第一行包含整数n，表示树的结点数。

接下来n-1行，每行包含两个整数a和b，表示点a和点b之间存在一条边。

#### 输出格式

输出一个整数m，表示重心的所有的子树中最大的子树的结点数目。

#### 数据范围

1≤n≤10^5

#### 输入样例

```java
9
1 2
1 7
1 4
2 8
2 5
4 3
3 9
4 6
```

#### 输出样例：

```java
4
```

#### 题目分析：

如图所示，即找出如此结构，使得剩余各个连通块中点数的最大值最小

![picture](/img/treedfs.png)

#### 参考代码

```java
/*除去一个点，产生连通分量的最大值的最小值  即 argmax*/
#include <iostream>
#include <cstring>
using namespace std ;
/***
 * 
 *   首先，选取一个点，然后图分成两个连通块，删除这个点，这个点的子孩子构成的
 *   子树通过dfs可以直到节点个数，通过使用树的节点总数 - dfs节点数 - 1(删除的节点) = 另一个子图节点数个数
 *   最后求 ans = max(ans,上一次最大值)  即可
 * 
 */
const int N = 1e5 + 10 ;
int h[N],en[N],ne[N],idx = 0,n;
void init(){
    memset(h,-1,sizeof h );
}
void insert(int x , int y){
     en[idx]  = y , ne[idx] = h[x] , h[x] = idx++;
}

bool used[N];
int ans = N ;
int dfs(int u ){    // 求以u为根节点的子树最大节点个数             
     used[u] = true ;

     int sum = 1  ,res = 0 ; 
     for(int i = h[u] ; i != -1 ; i = ne[i]){
         int j = en[i];
         if(!used[j]){
            int s =  dfs(j);
            res = max(res,s);  
            sum += s ;    // sum记录的是以u为根节点的树的节点总个数
         }
     }
     res = max(res,n - sum); // 求出当前两个连通分量的最大值
     ans = min(ans,res);     // ans为全局变量，记录连通分量最大值的最小值argmin

     return sum ;
}
int main(int argc, char const *argv[])
{
    cin >> n ;
    init();
    for(int i = 0; i < n - 1 ; ++i){
        int x , y ;
        cin >> x >> y ;
        insert(x,y),insert(y,x);
    }
    dfs(1);
    cout << ans << endl;
    return 0;
}
```

=======
---
title: 树与图的存储与DFS使用
categories:
  - 基础算法
tags:
  - DFS
  - week3
abbrlink: 28912
date: 2021-11-20 15:49:44
---
### 知识点总结

树与图的存储

​	由于树是特殊的图，因此只关注图的存储<!-- more -->

​	有向图的存储 ：  临界矩阵 或者  邻接表: n个单链表   O(n + m)的遍历消耗

### 题目描述

给定一颗树，树中包含n个结点（编号1~n）和n-1条无向边。

请你找到树的重心，并输出将重心删除后，剩余各个连通块中点数的最大值。

重心定义：重心是指树中的一个结点，如果将这个点删除后，剩余各个连通块中点数的最大值最小，那么这个节点被称为树的重心。

#### 输入格式

第一行包含整数n，表示树的结点数。

接下来n-1行，每行包含两个整数a和b，表示点a和点b之间存在一条边。

#### 输出格式

输出一个整数m，表示重心的所有的子树中最大的子树的结点数目。

#### 数据范围

1≤n≤10^5

#### 输入样例

```java
9
1 2
1 7
1 4
2 8
2 5
4 3
3 9
4 6
```

#### 输出样例：

```java
4
```

#### 题目分析：

如图所示，即找出如此结构，使得剩余各个连通块中点数的最大值最小

![picture](/img/treedfs.png)

#### 参考代码

```java
/*除去一个点，产生连通分量的最大值的最小值  即 argmax*/
#include <iostream>
#include <cstring>
using namespace std ;
/***
 * 
 *   首先，选取一个点，然后图分成两个连通块，删除这个点，这个点的子孩子构成的
 *   子树通过dfs可以直到节点个数，通过使用树的节点总数 - dfs节点数 - 1(删除的节点) = 另一个子图节点数个数
 *   最后求 ans = max(ans,上一次最大值)  即可
 * 
 */
const int N = 1e5 + 10 ;
int h[N],en[N],ne[N],idx = 0,n;
void init(){
    memset(h,-1,sizeof h );
}
void insert(int x , int y){
     en[idx]  = y , ne[idx] = h[x] , h[x] = idx++;
}

bool used[N];
int ans = N ;
int dfs(int u ){    // 求以u为根节点的子树最大节点个数             
     used[u] = true ;

     int sum = 1  ,res = 0 ; 
     for(int i = h[u] ; i != -1 ; i = ne[i]){
         int j = en[i];
         if(!used[j]){
            int s =  dfs(j);
            res = max(res,s);  
            sum += s ;    // sum记录的是以u为根节点的树的节点总个数
         }
     }
     res = max(res,n - sum); // 求出当前两个连通分量的最大值
     ans = min(ans,res);     // ans为全局变量，记录连通分量最大值的最小值argmin

     return sum ;
}
int main(int argc, char const *argv[])
{
    cin >> n ;
    init();
    for(int i = 0; i < n - 1 ; ++i){
        int x , y ;
        cin >> x >> y ;
        insert(x,y),insert(y,x);
    }
    dfs(1);
    cout << ans << endl;
    return 0;
}
```

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
