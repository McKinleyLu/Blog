<<<<<<< HEAD
<<<<<<< HEAD
---
title: IncDec序列
toc: true
cover: /img/7.jpg
categories:
  - 算法进阶指南
tags:
  - 差分
abbrlink: 2657
date: 2021-10-10 17:08:05
---

### 题目描述

给定一个长度为 n 的数列 a1,a2,…,an每次可以选择一个区间 [l,r][l,r]，使下标在这个区间内的数都加一或者都减一。<!-- more -->

求至少需要多少次操作才能使数列中的所有数都一样，并求出在保证最少次数的前提下，最终得到的数列可能有多少种。

#### 输入格式

第一行输入正整数 n。

接下来 n 行，每行输入一个整数，第 i+1 行的整数代表 ai。

#### 输出格式

第一行输出最少操作次数。

第二行输出最终能得到多少种结果。

#### 数据范围

0<n≤105
0≤ai<2147483648

#### 输入样例：

```
4
1
1
2
2
```

#### 输出样例：

```
1
2
```

### 知识点

#### 差分

1. 设 an = {a[1],a[2], ... ,a[n]},则数列b：

   b[1] = a[1] 

   b[2] = a[2] - a[1]

   .... .... ....

   b[i] = a[i] - a[i-1]

2. 示例

   a :  a[1]  a[2]  a[3]  a[4]  a[5]

   ​        1      2      4      6        9

   b :  b[1]   b[2]  b[3]  b[4]  b[5]

   ​        1       1      2       2       3

3. 不难发现  a[i] = b[1] + b[2] + ... + b[i]

4. 给定一个区间[L , R]， 使得索引为这个区间的数组元素全部加一，则使用下面的方法即可

   b[L]++ , b[R+1]- - ;

### 本题思路

综合上面的差分知识点，要想所有值一样，使b[2],...,b[n]均为零即可，这样所有的值均为一

首先我们计算分别所有正数以`pos`及负数`neg`绝对值的差分数组b元素之和，让b-- 和b++成对出现

其次，如果最后在2 <= i <= n中，还有b[i]的值不为0，我们就使这个数与b[1]或者b[n+1]成对 b++ 和 b--，最后使得从2 <= i <= n中所有值均为0，如果abs(pos - neg) > 0 ，则b1的取值一共有abs(pos - neg) + 1 种情况

#### 综上所述

这样操作次数至少为  `num ` = min(pos, neg) + abs(pos-neg) = max(pos,neg)

情况一共有 nums = abs(pos - neg) + 1 

### 参考代码

```java
/**
 * @file 11.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2021-10-10
 * 
 * @copyright Copyright (c) 2021
 * 
 *   使用差分法
 *    b[1] = a[1]
 *    b[2] = a[2] - a[1]
 *    b[3] = a[3] - a[2]
 *    a[i] = b[1] + b[2] + ... + b[i]
 * 
 *    要使得[l,r]中的数字加C，则为    b[l] += C  b[r] -= C
 *    
 *    在本题中，想让所有的数保持一致，则b[1] = a[1] b[2] = ...b[n] = 0
 * 
 *    因此分如下四种情况
 *    1. 2<=l,r<=n             如果 正数 == 负数 ，则两边加减一
 *    2. l = 1 , 2<=r<=n      
 *    3. 2<=i<=n   r = n + 1   
 */
#include<iostream>
using namespace std;
typedef long long ll;
const int N = 100005;
int a[N];
int b[N];
int main(){

    int n;
    ll pos = 0,neg = 0 ; 
    cin >> n;

    for(int i =  1; i <= n ; ++i){
        cin >> a[i];
    }

    for(int i = n ;  i >= 2 ; --i){
        a[i] -= a[i-1]; 
        if(a[i]>=0)  {pos += a[i];}
        else         {neg -= a[i];}
    }

    ll smalloperation = min(pos,neg) + abs(pos-neg);
    ll method         = abs(pos-neg)+1;
    cout<<smalloperation<<endl;
    cout<<method<<endl;
}
```



=======
---
title: IncDec序列
toc: true
cover: /img/7.jpg
categories:
  - 算法进阶指南
tags:
  - 差分
abbrlink: 2657
date: 2021-10-10 17:08:05
---

### 题目描述

给定一个长度为 n 的数列 a1,a2,…,an每次可以选择一个区间 [l,r][l,r]，使下标在这个区间内的数都加一或者都减一。<!-- more -->

求至少需要多少次操作才能使数列中的所有数都一样，并求出在保证最少次数的前提下，最终得到的数列可能有多少种。

#### 输入格式

第一行输入正整数 n。

接下来 n 行，每行输入一个整数，第 i+1 行的整数代表 ai。

#### 输出格式

第一行输出最少操作次数。

第二行输出最终能得到多少种结果。

#### 数据范围

0<n≤105
0≤ai<2147483648

#### 输入样例：

```
4
1
1
2
2
```

#### 输出样例：

```
1
2
```

### 知识点

#### 差分

1. 设 an = {a[1],a[2], ... ,a[n]},则数列b：

   b[1] = a[1] 

   b[2] = a[2] - a[1]

   .... .... ....

   b[i] = a[i] - a[i-1]

2. 示例

   a :  a[1]  a[2]  a[3]  a[4]  a[5]

   ​        1      2      4      6        9

   b :  b[1]   b[2]  b[3]  b[4]  b[5]

   ​        1       1      2       2       3

3. 不难发现  a[i] = b[1] + b[2] + ... + b[i]

4. 给定一个区间[L , R]， 使得索引为这个区间的数组元素全部加一，则使用下面的方法即可

   b[L]++ , b[R+1]- - ;

### 本题思路

综合上面的差分知识点，要想所有值一样，使b[2],...,b[n]均为零即可，这样所有的值均为一

首先我们计算分别所有正数以`pos`及负数`neg`绝对值的差分数组b元素之和，让b-- 和b++成对出现

其次，如果最后在2 <= i <= n中，还有b[i]的值不为0，我们就使这个数与b[1]或者b[n+1]成对 b++ 和 b--，最后使得从2 <= i <= n中所有值均为0，如果abs(pos - neg) > 0 ，则b1的取值一共有abs(pos - neg) + 1 种情况

#### 综上所述

这样操作次数至少为  `num ` = min(pos, neg) + abs(pos-neg) = max(pos,neg)

情况一共有 nums = abs(pos - neg) + 1 

### 参考代码

```java
/**
 * @file 11.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2021-10-10
 * 
 * @copyright Copyright (c) 2021
 * 
 *   使用差分法
 *    b[1] = a[1]
 *    b[2] = a[2] - a[1]
 *    b[3] = a[3] - a[2]
 *    a[i] = b[1] + b[2] + ... + b[i]
 * 
 *    要使得[l,r]中的数字加C，则为    b[l] += C  b[r] -= C
 *    
 *    在本题中，想让所有的数保持一致，则b[1] = a[1] b[2] = ...b[n] = 0
 * 
 *    因此分如下四种情况
 *    1. 2<=l,r<=n             如果 正数 == 负数 ，则两边加减一
 *    2. l = 1 , 2<=r<=n      
 *    3. 2<=i<=n   r = n + 1   
 */
#include<iostream>
using namespace std;
typedef long long ll;
const int N = 100005;
int a[N];
int b[N];
int main(){

    int n;
    ll pos = 0,neg = 0 ; 
    cin >> n;

    for(int i =  1; i <= n ; ++i){
        cin >> a[i];
    }

    for(int i = n ;  i >= 2 ; --i){
        a[i] -= a[i-1]; 
        if(a[i]>=0)  {pos += a[i];}
        else         {neg -= a[i];}
    }

    ll smalloperation = min(pos,neg) + abs(pos-neg);
    ll method         = abs(pos-neg)+1;
    cout<<smalloperation<<endl;
    cout<<method<<endl;
}
```



>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: IncDec序列
toc: true
cover: /img/7.jpg
categories:
  - 算法进阶指南
tags:
  - 差分
abbrlink: 2657
date: 2021-10-10 17:08:05
---

### 题目描述

给定一个长度为 n 的数列 a1,a2,…,an每次可以选择一个区间 [l,r][l,r]，使下标在这个区间内的数都加一或者都减一。<!-- more -->

求至少需要多少次操作才能使数列中的所有数都一样，并求出在保证最少次数的前提下，最终得到的数列可能有多少种。

#### 输入格式

第一行输入正整数 n。

接下来 n 行，每行输入一个整数，第 i+1 行的整数代表 ai。

#### 输出格式

第一行输出最少操作次数。

第二行输出最终能得到多少种结果。

#### 数据范围

0<n≤105
0≤ai<2147483648

#### 输入样例：

```
4
1
1
2
2
```

#### 输出样例：

```
1
2
```

### 知识点

#### 差分

1. 设 an = {a[1],a[2], ... ,a[n]},则数列b：

   b[1] = a[1] 

   b[2] = a[2] - a[1]

   .... .... ....

   b[i] = a[i] - a[i-1]

2. 示例

   a :  a[1]  a[2]  a[3]  a[4]  a[5]

   ​        1      2      4      6        9

   b :  b[1]   b[2]  b[3]  b[4]  b[5]

   ​        1       1      2       2       3

3. 不难发现  a[i] = b[1] + b[2] + ... + b[i]

4. 给定一个区间[L , R]， 使得索引为这个区间的数组元素全部加一，则使用下面的方法即可

   b[L]++ , b[R+1]- - ;

### 本题思路

综合上面的差分知识点，要想所有值一样，使b[2],...,b[n]均为零即可，这样所有的值均为一

首先我们计算分别所有正数以`pos`及负数`neg`绝对值的差分数组b元素之和，让b-- 和b++成对出现

其次，如果最后在2 <= i <= n中，还有b[i]的值不为0，我们就使这个数与b[1]或者b[n+1]成对 b++ 和 b--，最后使得从2 <= i <= n中所有值均为0，如果abs(pos - neg) > 0 ，则b1的取值一共有abs(pos - neg) + 1 种情况

#### 综上所述

这样操作次数至少为  `num ` = min(pos, neg) + abs(pos-neg) = max(pos,neg)

情况一共有 nums = abs(pos - neg) + 1 

### 参考代码

```java
/**
 * @file 11.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2021-10-10
 * 
 * @copyright Copyright (c) 2021
 * 
 *   使用差分法
 *    b[1] = a[1]
 *    b[2] = a[2] - a[1]
 *    b[3] = a[3] - a[2]
 *    a[i] = b[1] + b[2] + ... + b[i]
 * 
 *    要使得[l,r]中的数字加C，则为    b[l] += C  b[r] -= C
 *    
 *    在本题中，想让所有的数保持一致，则b[1] = a[1] b[2] = ...b[n] = 0
 * 
 *    因此分如下四种情况
 *    1. 2<=l,r<=n             如果 正数 == 负数 ，则两边加减一
 *    2. l = 1 , 2<=r<=n      
 *    3. 2<=i<=n   r = n + 1   
 */
#include<iostream>
using namespace std;
typedef long long ll;
const int N = 100005;
int a[N];
int b[N];
int main(){

    int n;
    ll pos = 0,neg = 0 ; 
    cin >> n;

    for(int i =  1; i <= n ; ++i){
        cin >> a[i];
    }

    for(int i = n ;  i >= 2 ; --i){
        a[i] -= a[i-1]; 
        if(a[i]>=0)  {pos += a[i];}
        else         {neg -= a[i];}
    }

    ll smalloperation = min(pos,neg) + abs(pos-neg);
    ll method         = abs(pos-neg)+1;
    cout<<smalloperation<<endl;
    cout<<method<<endl;
}
```



>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
