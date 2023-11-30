<<<<<<< HEAD
---
title: bs4
toc: true
cover: /img/1.jpg
categories:
  - 计算机基础技术
tags:
  - 爬虫
  - bs4
abbrlink: 14725
date: 2021-09-24 22:59:29
---

### Bs4数据提取方法

分为如下两个步骤  

1. 标签定位
2. 提取标签内容，存储相应值

### Bs4原理

1. 实例化一个bs4对象，并且将页面源码数据加载到该对象中
2. 通过调用bs4对象中相关的属性或者方法进行标签定义以及数据解析<!-- more -->

### 安装方法

```shell
pip install bs4
pip install lxml
```

### 如何实例化bs对象

1. 将本地html文档数据加载到对象中

   ```python
   from bs4 import BeautifulSoup
   fp = open('./learn/数据解析/bs4/test.html','r',encoding = 'utf-8')
   soup = BeautifulSoup(fp.'lxml')
   ```
2. 将互联网上的文档数据加载到对象中

   ```python
   page_text = responese.content
   soup = BeautifulSoup(page_text.'lxml')
   ```
###  bs四大对象种类

* Tag
* NavigableString
* BeautifulSoup
* Comment

#### 四大对象种类使用介绍

1. Tag

   tag为html中一个对象

   ```python
   soup = BeautifulSoup(html)
   #输出title信息
   print(soup.title    # <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
   #输出head的所有属性，以字典形式输出
   print(soup.head.attrs)  # {'class': ['title'], 'name': 'dromouse'}
   ```
   
2. 得到标签内容以后，获取标签内文字

   ```python
   # <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
   print(soup.p.string)    # The Dormouse's story
   ```
   
3. BeautifulSoup
   BeautifulSoup 对象表示的是一个文档的内容。大部分时候,可以把它当作 Tag 对象，是一个特殊的 Tag
   
4. Comment

   Comment 对象是一个特殊类型的 NavigableString 对象，其输出的内容不包括注释符号。
   
   ```python
   # <a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>
   print soup.a.string
   # Elsie
   ```

### 遍历文档树

1. 直接子节点：`.contents`  `.children` 属性

* .content 属性可以将tag的子节点以列表的方式输出,输出为列表

```python
print (soup.head.contents) 
#[<title>The Dormouse's story</title>]
```

* .children返回不是一个list，但可以通过遍历获取所有子节点

2. 所有子孙节点 `descendants` 属性

   descendants 属性可以对所有tag的子孙节点进行递归循环

### 搜索文档树 

1. find_all(name,attrs,recursive,text,**kwargs)

   * 传字符串

     ```python
     #查找所有b标签，返回字典
     soup.find_all('b')
     ```
     
   * 传入正则表达式
   
     ```python
     #找出所有以b开头的标签,这表示<body>和<b>标签都应该被找到
     import re
     for tag in soup.find_all(re.compile("^b")):
         print(tag.name)
     #输出 body b 
     ```
     
   * 传列表
   
     A.下面代码找到文档中所有`<a>`标签和`<b>`标签
   
     ```python
     soup.find_all(["a", "b"])
     # [<b>The Dormouse's story</b>,
     #  <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
     #  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
     #  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
     ```
   
     **B.keyword参数**
   
     ```python
     soup.find_all(id='link2')
     # [<a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]
     ```
### CSS选择器

这就是另一种与 find_all 方法有异曲同工之妙的查找方法，写CSS时，标签名不加任何装饰，类名前加.,id名前加#

```python
Step 1  查找标签
# 通过标签名称查找
print(soup.select('title'))     #[<title>The Dormouse's story</title>]
#通过类名查找
print(soup.select('.sister'))   #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>
#通过id名查找
print soup.select('#link1')      #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>]
# 直接子标签查找，则使用 > 分隔
print soup.select("head > title")#[<title>The Dormouse's story</title>]
# 属性查找
#查找时还可以加入属性元素，属性需要用中括号括起来，注意属性和标签属于同一节点，所以中间不能加空格，否则会无法匹配到
print soup.select('a[class="sister"]')
#[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>, <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>, <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
 
print soup.select('a[href="http://example.com/elsie"]')
#[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>]

Step 2 获取标签内容
#获取标签内容  使用get_text()或者string获取
soup = BeautifulSoup(html, 'lxml')
print type(soup.select('title'))
print soup.select('title')[0].get_text()
 
for title in soup.select('title'):
    print title.get_text()
    
print(soup.p.string)    
# 获取标签属性值
print(a.get("src"))

```

=======
---
title: bs4
toc: true
cover: /img/1.jpg
categories:
  - 计算机基础技术
tags:
  - 爬虫
  - bs4
abbrlink: 14725
date: 2021-09-24 22:59:29
---

### Bs4数据提取方法

分为如下两个步骤  

1. 标签定位
2. 提取标签内容，存储相应值

### Bs4原理

1. 实例化一个bs4对象，并且将页面源码数据加载到该对象中
2. 通过调用bs4对象中相关的属性或者方法进行标签定义以及数据解析<!-- more -->

### 安装方法

```shell
pip install bs4
pip install lxml
```

### 如何实例化bs对象

1. 将本地html文档数据加载到对象中

   ```python
   from bs4 import BeautifulSoup
   fp = open('./learn/数据解析/bs4/test.html','r',encoding = 'utf-8')
   soup = BeautifulSoup(fp.'lxml')
   ```
2. 将互联网上的文档数据加载到对象中

   ```python
   page_text = responese.content
   soup = BeautifulSoup(page_text.'lxml')
   ```
###  bs四大对象种类

* Tag
* NavigableString
* BeautifulSoup
* Comment

#### 四大对象种类使用介绍

1. Tag

   tag为html中一个对象

   ```python
   soup = BeautifulSoup(html)
   #输出title信息
   print(soup.title    # <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
   #输出head的所有属性，以字典形式输出
   print(soup.head.attrs)  # {'class': ['title'], 'name': 'dromouse'}
   ```
   
2. 得到标签内容以后，获取标签内文字

   ```python
   # <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
   print(soup.p.string)    # The Dormouse's story
   ```
   
3. BeautifulSoup
   BeautifulSoup 对象表示的是一个文档的内容。大部分时候,可以把它当作 Tag 对象，是一个特殊的 Tag
   
4. Comment

   Comment 对象是一个特殊类型的 NavigableString 对象，其输出的内容不包括注释符号。
   
   ```python
   # <a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>
   print soup.a.string
   # Elsie
   ```

### 遍历文档树

1. 直接子节点：`.contents`  `.children` 属性

* .content 属性可以将tag的子节点以列表的方式输出,输出为列表

```python
print (soup.head.contents) 
#[<title>The Dormouse's story</title>]
```

* .children返回不是一个list，但可以通过遍历获取所有子节点

2. 所有子孙节点 `descendants` 属性

   descendants 属性可以对所有tag的子孙节点进行递归循环

### 搜索文档树 

1. find_all(name,attrs,recursive,text,**kwargs)

   * 传字符串

     ```python
     #查找所有b标签，返回字典
     soup.find_all('b')
     ```
     
   * 传入正则表达式
   
     ```python
     #找出所有以b开头的标签,这表示<body>和<b>标签都应该被找到
     import re
     for tag in soup.find_all(re.compile("^b")):
         print(tag.name)
     #输出 body b 
     ```
     
   * 传列表
   
     A.下面代码找到文档中所有`<a>`标签和`<b>`标签
   
     ```python
     soup.find_all(["a", "b"])
     # [<b>The Dormouse's story</b>,
     #  <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
     #  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
     #  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
     ```
   
     **B.keyword参数**
   
     ```python
     soup.find_all(id='link2')
     # [<a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]
     ```
### CSS选择器

这就是另一种与 find_all 方法有异曲同工之妙的查找方法，写CSS时，标签名不加任何装饰，类名前加.,id名前加#

```python
Step 1  查找标签
# 通过标签名称查找
print(soup.select('title'))     #[<title>The Dormouse's story</title>]
#通过类名查找
print(soup.select('.sister'))   #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>
#通过id名查找
print soup.select('#link1')      #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>]
# 直接子标签查找，则使用 > 分隔
print soup.select("head > title")#[<title>The Dormouse's story</title>]
# 属性查找
#查找时还可以加入属性元素，属性需要用中括号括起来，注意属性和标签属于同一节点，所以中间不能加空格，否则会无法匹配到
print soup.select('a[class="sister"]')
#[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>, <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>, <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
 
print soup.select('a[href="http://example.com/elsie"]')
#[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>]

Step 2 获取标签内容
#获取标签内容  使用get_text()或者string获取
soup = BeautifulSoup(html, 'lxml')
print type(soup.select('title'))
print soup.select('title')[0].get_text()
 
for title in soup.select('title'):
    print title.get_text()
    
print(soup.p.string)    
# 获取标签属性值
print(a.get("src"))

```

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
