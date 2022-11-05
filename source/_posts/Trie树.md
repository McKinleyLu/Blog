---
title: Trie树
date: 2021-10-21 22:45:59
categories:
  - 基础算法
tags:
  - trie树
  - week2
abbrlink: 3592
---

## Trie树

高效存储和查找字符串     集合的结构 <!-- more -->

树的构造如下：

![picture](/img/ssjc1.jpg.jpg)

![picture](/img/jcsf9.jpg)

### 代码模板

```java
//2022.3.2复习
#include<iostream>
using namespace std;

int son[N][26] , cnt[N] , idx ;    //下标为0， 即是根节点 ， 又是空节点
// son：  N 个节点  26个英文字母，做多26个分叉       
// cnt：  当前节点子节点数   
// idx：  当前用到的下标

// 存储操作
void insert(){
    int p =  0 ;   // 根节点
    //从根节点开始，从前向后遍历
    for(int i = 0 ; str[i] ; i++ ){
    	int u = str[i] - 'a' ;                      // 将小写字母映射成0-25 , u 为子节点
    	if(!son[p][u])  son[p][u] = ++idx;          // 如果没有此节点，则创建
    	p = son[p][u];
    }
    
    cnt[p]++;    //以p结尾的单词加一
}


// 查询
int query(char ch[]){
	int p = 0 ;
	for(int i =  0 ; str[i] ; i++){
	   int u  = str[i] - 'a';
	   if(!son[p][u])    return 0 ;
	   p = son[p][u]
	}
	return cnt[p];
}

int main(){
    int n ; 
    cin >> n ;
    while(n--){
    	char op[2];
    	cin >> op >> str;
    	if(op[0] == 'I')  insert(str);
    	else              cout<<query(str)<<endl;
    }

	return 0 ;
}
```





