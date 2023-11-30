<<<<<<< HEAD
<<<<<<< HEAD
---
title: Python基础语法二
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 2227
date: 2021-10-01 23:47:51
---

## Python基础语法二

### 分支结构

1. 条件分支结<!-- more -->

   if  - elif  - else 结构，注意每一个关键字后面都要添加冒号

2. 程序异常处理

   try：

   except：

   else:

      语句在没发生异常情况下执行

   finally:

      此处语句一定执行

### 循环结构

1. for  ... in 结构

   ```
   for  <循环变量> in <遍历结构> :
   	<语句块>
   	
   for  c  in s:   # s是字符串，遍历每一个字符
   	<语句块>
   ```

2. range()函数

   * range(M)           # 范围0 - M-1
   * range(M,N,K)    #以步长为K进行加数

3. 无限循环

   while <条件>：

   ​	<语句块>

### random库

1. 基本随机函数
   * seed(a = None)        # 初始化给定的随机种子
   * random()                  # 生成[0.0,1.0)之间的小数
2. 扩展随机函数
   * randint()                    # 生成一个[a,b]之间的整数
   * randrange(m,n[,k])    # 生成步长为k的在M和N之间的随机整数
   * uniform(a,b)              # 生成一个[a,b]之间的随机小数
   * choice(seq)              # 从seq随机选择一个元素
   * shuffle(seq)              # 将序列seq随机打乱

### 集合

1. 集合的定义
   * 集合用`{}`表示，元素用逗号分隔
   * 建立集合使用`{}`或者`set()`
   * 建立空集合，必须用`set`
2. 集合操作
   * 交 `|`
   * 差  `-`
   * 并  `&`
   * 补 `^`
   * 子集  `<=`
   * 包含  `>=`
3. 集合处理函数
   * add()                # 如果x不在集合中，则x加入集合中
   * discard()          # 移除集合中的x ， 若x不存在，不报错
   * remove()         # 移除集合中的x ， 若x不存在，报KeyError异常
   * clear()             # 移除S中所有元素
   * pop()               # 随机返回S中一个元素,更新S，若S为空，报KeyError异常
   * len()                # 返回S中元素个数
   * x in S              # 判断x是否在S中
   * set(x)              # 将其他类型转成集合类型
4. 集合元素用途
   * 数据去重
   * 包含比较关系

### 序列定义以及使用

1. 序列中元素类型可以不同
2. 方法操作类似与字符串
3. 序列类型包含： 字符串、元组类型、列表类型

### 元组类型定义以及使用

1. 使用()定义或者tuple()定义，元素用逗号分隔
2. 元组创建以后不可以修改，因此无特殊操作
3. 使用情景： 不希望元素被修改

### 列表定义以及使用

1. 使用[]或者list()创建，元素类型可以不同，用逗号隔开
2. 操作函数以及方法
   * append()                    # 向列表后面添加元素
   * insert(pos，x)            # 向列表的第i个位置添加元素x
   * reverse()                    # 将列表ls中的元素反转
   * del ls[i]                       # 删除列表中第i个元素
   * remove()                    # 删除x第一次出现在列表中的元素 

### 字典类型的定义

1. 定义

   * 字典是键值对的集合
   * 采用`{}`或者`dic()`创建

2. 相关函数

   del d[k]                                             # 删除字典d中键k对应的数据值

   item()                                               # 返回字典d中所有键值对信息

   **get(k,`<defalut>`)**                            # 键K存在，返回相应值，否则返回`<defalut>`

   pop(k,`<defalut>`)                           # 键K存在，取出相应值，否则返回`<defalut>`

### jieba库的使用

1. jieba库是中文分词第三方库

2. 安装 

   ```python
   pip install jieba
   ```

3. 相关函数

   * lcut(s)                                     # 精确模式
   * lcut(s,cut_all = True)              # 全模式
   * lcut_for_search(s)                 # 搜索引擎模式
   * add_word(w)                         # 添加字符

### 文件的使用

1. 打开文件 

   * open(文件名，打开方式，编码方式)

     ```python
     with open("test.txt","w",encoding= "utf-8") as fp:
     	fp.write("test")
     ```

   * 打开方式

     | 字符 |   含义   |
     | :--: | :------: |
     |  w   | 只读模式 |
     |  r   |  覆盖写  |
     |  a   |  追加写  |

2. 关闭文件  close()

3. 读取文件

   * read()           # 读取size个长度
   * readlines()    # 读取size行
   
4. 写文件

   * write()            # 写一个字符
   * writelines()     # 写一个列表等，写一行
   
5. 文件定位
   
   * seek(offset)   # 将文件指针定位到offset

### 数据处理

1. 一位数据处理： 使用join或者split()函数，借助列表处理
2. 二维数据处理
   * 每个元素也是一个列表
   * csv格式，逗号分隔为一维,按行分隔为二维
   * 二维数据处理 : for + split() 和 join()

### 词云wordcloud库

1. 安装

   ```shell
   pip install wordcloud
   ```

2. wordcloud.WordCloud()，代表一个词云

3. 相关方法

   * generate(txt)               # 向WordCloud对象w中添加文本

   * to_file(filename)          # 将词云输出为文件,png或者jpg

   * width()                         # 词云长度

   * height()                        # 词云高度

   * max_words()                # 词云中词的最多个数

   * stop_words()                # s不得显示在词云中

   * background_color        # 背景颜色    w = wordcloud.WordCloud(background_color = 'white')

   * mask()                          # 指定词云形状，需要引用imread()指定图片

     ```
     mk =  imread('a.png')
     w  =  wordcloud.WordCloud(mask=mk)
     ```

## python基础语法到此结束

 
=======
---
title: Python基础语法二
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 2227
date: 2021-10-01 23:47:51
---

## Python基础语法二

### 分支结构

1. 条件分支结<!-- more -->

   if  - elif  - else 结构，注意每一个关键字后面都要添加冒号

2. 程序异常处理

   try：

   except：

   else:

      语句在没发生异常情况下执行

   finally:

      此处语句一定执行

### 循环结构

1. for  ... in 结构

   ```
   for  <循环变量> in <遍历结构> :
   	<语句块>
   	
   for  c  in s:   # s是字符串，遍历每一个字符
   	<语句块>
   ```

2. range()函数

   * range(M)           # 范围0 - M-1
   * range(M,N,K)    #以步长为K进行加数

3. 无限循环

   while <条件>：

   ​	<语句块>

### random库

1. 基本随机函数
   * seed(a = None)        # 初始化给定的随机种子
   * random()                  # 生成[0.0,1.0)之间的小数
2. 扩展随机函数
   * randint()                    # 生成一个[a,b]之间的整数
   * randrange(m,n[,k])    # 生成步长为k的在M和N之间的随机整数
   * uniform(a,b)              # 生成一个[a,b]之间的随机小数
   * choice(seq)              # 从seq随机选择一个元素
   * shuffle(seq)              # 将序列seq随机打乱

### 集合

1. 集合的定义
   * 集合用`{}`表示，元素用逗号分隔
   * 建立集合使用`{}`或者`set()`
   * 建立空集合，必须用`set`
2. 集合操作
   * 交 `|`
   * 差  `-`
   * 并  `&`
   * 补 `^`
   * 子集  `<=`
   * 包含  `>=`
3. 集合处理函数
   * add()                # 如果x不在集合中，则x加入集合中
   * discard()          # 移除集合中的x ， 若x不存在，不报错
   * remove()         # 移除集合中的x ， 若x不存在，报KeyError异常
   * clear()             # 移除S中所有元素
   * pop()               # 随机返回S中一个元素,更新S，若S为空，报KeyError异常
   * len()                # 返回S中元素个数
   * x in S              # 判断x是否在S中
   * set(x)              # 将其他类型转成集合类型
4. 集合元素用途
   * 数据去重
   * 包含比较关系

### 序列定义以及使用

1. 序列中元素类型可以不同
2. 方法操作类似与字符串
3. 序列类型包含： 字符串、元组类型、列表类型

### 元组类型定义以及使用

1. 使用()定义或者tuple()定义，元素用逗号分隔
2. 元组创建以后不可以修改，因此无特殊操作
3. 使用情景： 不希望元素被修改

### 列表定义以及使用

1. 使用[]或者list()创建，元素类型可以不同，用逗号隔开
2. 操作函数以及方法
   * append()                    # 向列表后面添加元素
   * insert(pos，x)            # 向列表的第i个位置添加元素x
   * reverse()                    # 将列表ls中的元素反转
   * del ls[i]                       # 删除列表中第i个元素
   * remove()                    # 删除x第一次出现在列表中的元素 

### 字典类型的定义

1. 定义

   * 字典是键值对的集合
   * 采用`{}`或者`dic()`创建

2. 相关函数

   del d[k]                                             # 删除字典d中键k对应的数据值

   item()                                               # 返回字典d中所有键值对信息

   **get(k,`<defalut>`)**                            # 键K存在，返回相应值，否则返回`<defalut>`

   pop(k,`<defalut>`)                           # 键K存在，取出相应值，否则返回`<defalut>`

### jieba库的使用

1. jieba库是中文分词第三方库

2. 安装 

   ```python
   pip install jieba
   ```

3. 相关函数

   * lcut(s)                                     # 精确模式
   * lcut(s,cut_all = True)              # 全模式
   * lcut_for_search(s)                 # 搜索引擎模式
   * add_word(w)                         # 添加字符

### 文件的使用

1. 打开文件 

   * open(文件名，打开方式，编码方式)

     ```python
     with open("test.txt","w",encoding= "utf-8") as fp:
     	fp.write("test")
     ```

   * 打开方式

     | 字符 |   含义   |
     | :--: | :------: |
     |  w   | 只读模式 |
     |  r   |  覆盖写  |
     |  a   |  追加写  |

2. 关闭文件  close()

3. 读取文件

   * read()           # 读取size个长度
   * readlines()    # 读取size行
   
4. 写文件

   * write()            # 写一个字符
   * writelines()     # 写一个列表等，写一行
   
5. 文件定位
   
   * seek(offset)   # 将文件指针定位到offset

### 数据处理

1. 一位数据处理： 使用join或者split()函数，借助列表处理
2. 二维数据处理
   * 每个元素也是一个列表
   * csv格式，逗号分隔为一维,按行分隔为二维
   * 二维数据处理 : for + split() 和 join()

### 词云wordcloud库

1. 安装

   ```shell
   pip install wordcloud
   ```

2. wordcloud.WordCloud()，代表一个词云

3. 相关方法

   * generate(txt)               # 向WordCloud对象w中添加文本

   * to_file(filename)          # 将词云输出为文件,png或者jpg

   * width()                         # 词云长度

   * height()                        # 词云高度

   * max_words()                # 词云中词的最多个数

   * stop_words()                # s不得显示在词云中

   * background_color        # 背景颜色    w = wordcloud.WordCloud(background_color = 'white')

   * mask()                          # 指定词云形状，需要引用imread()指定图片

     ```
     mk =  imread('a.png')
     w  =  wordcloud.WordCloud(mask=mk)
     ```

## python基础语法到此结束

 
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: Python基础语法二
toc: true
cover: /img/1.jpg
categories:
  - 计算机语言笔记
tags:
  - python
abbrlink: 2227
date: 2021-10-01 23:47:51
---

## Python基础语法二

### 分支结构

1. 条件分支结<!-- more -->

   if  - elif  - else 结构，注意每一个关键字后面都要添加冒号

2. 程序异常处理

   try：

   except：

   else:

      语句在没发生异常情况下执行

   finally:

      此处语句一定执行

### 循环结构

1. for  ... in 结构

   ```
   for  <循环变量> in <遍历结构> :
   	<语句块>
   	
   for  c  in s:   # s是字符串，遍历每一个字符
   	<语句块>
   ```

2. range()函数

   * range(M)           # 范围0 - M-1
   * range(M,N,K)    #以步长为K进行加数

3. 无限循环

   while <条件>：

   ​	<语句块>

### random库

1. 基本随机函数
   * seed(a = None)        # 初始化给定的随机种子
   * random()                  # 生成[0.0,1.0)之间的小数
2. 扩展随机函数
   * randint()                    # 生成一个[a,b]之间的整数
   * randrange(m,n[,k])    # 生成步长为k的在M和N之间的随机整数
   * uniform(a,b)              # 生成一个[a,b]之间的随机小数
   * choice(seq)              # 从seq随机选择一个元素
   * shuffle(seq)              # 将序列seq随机打乱

### 集合

1. 集合的定义
   * 集合用`{}`表示，元素用逗号分隔
   * 建立集合使用`{}`或者`set()`
   * 建立空集合，必须用`set`
2. 集合操作
   * 交 `|`
   * 差  `-`
   * 并  `&`
   * 补 `^`
   * 子集  `<=`
   * 包含  `>=`
3. 集合处理函数
   * add()                # 如果x不在集合中，则x加入集合中
   * discard()          # 移除集合中的x ， 若x不存在，不报错
   * remove()         # 移除集合中的x ， 若x不存在，报KeyError异常
   * clear()             # 移除S中所有元素
   * pop()               # 随机返回S中一个元素,更新S，若S为空，报KeyError异常
   * len()                # 返回S中元素个数
   * x in S              # 判断x是否在S中
   * set(x)              # 将其他类型转成集合类型
4. 集合元素用途
   * 数据去重
   * 包含比较关系

### 序列定义以及使用

1. 序列中元素类型可以不同
2. 方法操作类似与字符串
3. 序列类型包含： 字符串、元组类型、列表类型

### 元组类型定义以及使用

1. 使用()定义或者tuple()定义，元素用逗号分隔
2. 元组创建以后不可以修改，因此无特殊操作
3. 使用情景： 不希望元素被修改

### 列表定义以及使用

1. 使用[]或者list()创建，元素类型可以不同，用逗号隔开
2. 操作函数以及方法
   * append()                    # 向列表后面添加元素
   * insert(pos，x)            # 向列表的第i个位置添加元素x
   * reverse()                    # 将列表ls中的元素反转
   * del ls[i]                       # 删除列表中第i个元素
   * remove()                    # 删除x第一次出现在列表中的元素 

### 字典类型的定义

1. 定义

   * 字典是键值对的集合
   * 采用`{}`或者`dic()`创建

2. 相关函数

   del d[k]                                             # 删除字典d中键k对应的数据值

   item()                                               # 返回字典d中所有键值对信息

   **get(k,`<defalut>`)**                            # 键K存在，返回相应值，否则返回`<defalut>`

   pop(k,`<defalut>`)                           # 键K存在，取出相应值，否则返回`<defalut>`

### jieba库的使用

1. jieba库是中文分词第三方库

2. 安装 

   ```python
   pip install jieba
   ```

3. 相关函数

   * lcut(s)                                     # 精确模式
   * lcut(s,cut_all = True)              # 全模式
   * lcut_for_search(s)                 # 搜索引擎模式
   * add_word(w)                         # 添加字符

### 文件的使用

1. 打开文件 

   * open(文件名，打开方式，编码方式)

     ```python
     with open("test.txt","w",encoding= "utf-8") as fp:
     	fp.write("test")
     ```

   * 打开方式

     | 字符 |   含义   |
     | :--: | :------: |
     |  w   | 只读模式 |
     |  r   |  覆盖写  |
     |  a   |  追加写  |

2. 关闭文件  close()

3. 读取文件

   * read()           # 读取size个长度
   * readlines()    # 读取size行
   
4. 写文件

   * write()            # 写一个字符
   * writelines()     # 写一个列表等，写一行
   
5. 文件定位
   
   * seek(offset)   # 将文件指针定位到offset

### 数据处理

1. 一位数据处理： 使用join或者split()函数，借助列表处理
2. 二维数据处理
   * 每个元素也是一个列表
   * csv格式，逗号分隔为一维,按行分隔为二维
   * 二维数据处理 : for + split() 和 join()

### 词云wordcloud库

1. 安装

   ```shell
   pip install wordcloud
   ```

2. wordcloud.WordCloud()，代表一个词云

3. 相关方法

   * generate(txt)               # 向WordCloud对象w中添加文本

   * to_file(filename)          # 将词云输出为文件,png或者jpg

   * width()                         # 词云长度

   * height()                        # 词云高度

   * max_words()                # 词云中词的最多个数

   * stop_words()                # s不得显示在词云中

   * background_color        # 背景颜色    w = wordcloud.WordCloud(background_color = 'white')

   * mask()                          # 指定词云形状，需要引用imread()指定图片

     ```
     mk =  imread('a.png')
     w  =  wordcloud.WordCloud(mask=mk)
     ```

## python基础语法到此结束

 
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
