---
title: xpath
toc: true
cover: /img/2.jpg
categories:
  - 爬虫
  - xpath
tags:
  - python
abbrlink: 64205
date: 2021-09-25 13:24:41
---

## Xpath

### 简介

XPath，全称 XML Path Language，即 XML 路径语言，它是一门在 XML 文档中查找信息的语言。最初是用来搜寻 XML 文档的，但同样适用于 HTML 文档的搜索。所以在做爬虫时完全可以使用 XPath 做相应的信息抽取。

XPath 的选择功能十分强大，它提供了非常简洁明了的路径选择表达式。另外，它还提供了超过 100 个内建函数，用于字符串、数值、时间的匹配以及节点、序列的处理等，几乎所有想要定位的节点都可以用 XPath 来选择。

官方文档：https://www.w3.org/TR/xpath/

### 下载

win + R 打开 cmd

```python
pip install lxml
```

### 路径

* 绝对定位   

  以/单斜杠开头，**从根节点，严格按照顺序**和位置来表达，父/子，不建议使用

* 相对定位

  以//开头，不管元素的位置和顺序，在html页面当中，有没有匹配表达式的元素

### 定位

`@` 选取属性

`*`通配符

`.`当前路径

`..`上一个路径

`contains` 包含

1. 知道父节点，查找子节点              查找属性link4.html的a标签的父节点的class属性

   ```python
   from lxml import etree
   html = etree.parse('./test.html', etree.HTMLParser())
   # 方法一
   result = html.xpath('//a[@href="link4.html"]/../@class')
   #方法二
   result = html.xpath('//a[@href="link4.html"]/parent::*/@class')
   print(result)
   ```
   
2. 属性匹配   

   使用 标签名 + [@ + 属性 + = + 属性值]
   
   ```python
   result = html.xpath('//li[@class="item-inactive"]')
   result = html.xpath('*[@*="item-inactive"]')
   ```
   
3. 文本获取
   
   一种是直接获取，另一种是使用//获取当前标签**以及**子标签内容
   
   ```python
   from lxml import etree
   html = etree.parse('./test.html', etree.HTMLParser())
   # 第一种
   result = html.xpath('//li[@class="item-0"]/a/text()')
   # 第二种
   result = html.xpath('//li[@class="item-0"]//text()')
   print(result)
   ```
   
4. 属性值获取

   ```python
   result = html.xpath('//li/a/@href')
   ```
   
5. contains包含
   
   ```python
   #返回属性值含有sim的li标签
   result = html.xpath('//li[contains(@class, "sim")]/a/text()')
   ```
   
6. position()、last()使用
   
   ```python
   # 获取第一个
   result = html.xpath('//li[1]/a/text()')
   print(result)
   # 获取最后一个
   result = html.xpath('//li[last()]/a/text()')
   print(result)
   # 获取前两个
   result = html.xpath('//li[position()<3]/a/text()')
   print(result)
   # 获取倒数第三个
   result = html.xpath('//li[last()-2]/a/text()')
   ```
   
7. 含有`or`、 `not`、 `and`的定位

   ```python
   //input[@name="phone" and @datatype="m"]
   ```
   
8. 命名元素

* /ename选择一个ename根元素
* ./ename选择ename当前节点的所有子元素。

9. 后代或自我轴

* //ename选择ename文档中的所有元素。

* .//ename选择ename上下文节点或其下的所有元素。
