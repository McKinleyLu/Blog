---
title: STL
categories:
  - 基础算法
tags:
  - STL
abbrlink: 9423
date: 2021-10-25 16:26:10
---

```java
vector  变长数组
    init
        vector<int> n ;
        vector<int> n(10,3)
    size()
    empty()
    clear()
    自动变长，一旦发现自己空间不够时，立即扩大原来一倍
    front()
    back()
    push_back()
    pop_back();
    begin()
    end()
    注意，使用迭代器直接使用 auto it = begin()
    支持比较运算，按照字典来比 v(4,3) > v(3,4)
pair<int, int >
    first
    second
    init
        p = make_pair()
        p = (20,3)
string
    size()
    clear()
    empty()
    substr(pos,num)
    substr(pos)
    c_str()         first address of string
queue
    push()
    front()
    back()
    pop()
    size()
priority_queue
    push()
    top()
    pop()
    默认大顶堆
    priority<int , vector<int> , greater<int> > // 小顶堆
stack
    push()
    pop()
    top()
    empty()
    size()
deque 双端队列
    clear()
    ........
    

set          维护有序数列
    insert()
    find()  不存在返回end()
    count()
    erase
        erase(x)  输入一个数是x，删除了所有x
    lower_bound() 返回大于等于x的最小的数
    upper_bound()
multiset
    允许元素重复    

map / multiset
    insert()
    erase()
    find()
        map<int,int> a;
        a['bbb'] = ccc;

unorder_set/_map
    增删改查时间是O(1)
    凡是和排序有关的操作一律不支持

biset 压位
    bit<set> s(1000);
    ~ | & >> << == !=
    count()
    any()  判断是否至少有一个一
    none() 是否全为零
    reset() 把所有位变成零
    flip()  取反   

```

