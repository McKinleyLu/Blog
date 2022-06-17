title: Pandas自动化处理Excel文件
author: 瑾年
abbrlink: 33283
tags:
  - Pandas
categories:
  - dke
  - Pandas
  - Excel
date: 2022-06-16 22:00:00
---
### Excel文件读取
#### 基本读数据
1. 导入pandas库
2. 使用`read_excel()`方法
3. 打印全部直接输出，打印
  * 打印前几行`people.head(num)`方法
  * 打印尾几行`people.tail(num)`方法
4. 读取excel行列数`shape`方法
```python
# 导入pandas包
import pandas as pd 
# 读文件到内存
people = pd.read_excel("excels.xlsx")
# 读取excel行列数
print(people.shape)
# 打印excel前三行以及尾三行
print(people.head(3))
print(people.tail(2))
```

#### 设置`header`参数读取异常
##### 表头是乱数据
1. 使用`pd.read_excel()`函数,函数默认将第0行设为表头
2. 如果第0行为乱数据，第1行为表头，则设置`header = 1`即可
```python
print("=================")
# pandas读取excel时默认使用第0行作为header
# 如果第0行为乱数据,则手动设置header,但是当第一行全为空时，不用写header=1，自动跳空行
# 读文件到内存
people = pd.read_excel("excels_mass.xlsx",header=1)
# 读取excel行列数
print(people.shape)
print(people)
```

##### Excel表头以及索引异常情况处理
1. 则设置`read_excel()`方法的`header= None`
2. 如果想添加表头，可以使用`.columns`设置
3. 使用`to_excel（）`方法将数据写回excel中
```python
print("=================")
#pandas没有表头,即第一行就是数据，则使
people = pd.read_excel("excels_no_head.xlsx",header=None)
print(people.shape)
#给表设置表头
print("=================")
people.columns=['ID','TYPE','Name','Size','aD']
print(people.shape)
print(people.columns)
# 保存文件
people.to_excel("excels_no_head_output1.xlsx")
# 发现index也被打印到excel中了
```
![picture1](/img/pandas/excel/1.JPG)
4. 使用`set_index()`方法，将索引设置为`ID`
```python
people.columns=['ID','TYPE','Name','Size','aD']
people.set_index('ID',inplace=True)
print(people.shape)
print(people.columns)
# 保存文件
people.to_excel("excels_no_head_output2.xlsx")
```
![picture2](/img/pandas/excel/2.JPG)
5. 当再次在程序打开刚才保存的`excel`文件，你会发现，写回文件又会加入索引，所以还要再次设置
```python
print("=================")
people = pd.read_excel("excels_no_head_output2.xlsx")
print(people.head(5))
people.to_excel("excels_no_head_output3.xlsx")
# 发现又加索引了
# 所以在打开文件时,就设置好索引
people = pd.read_excel("excels_no_head_output2.xlsx",index_col='ID')
print(people.head(5))
people.to_excel("excels_no_head_output4.xlsx")
```

#### 读取指定位置excel
如图，读取如下数据
![picture3](/img/pandas/excel/3.JPG)
1. 使用read_excel()两个属性
  * 前三行为空 跳过 使用 skiprows
  * 前三列为空 跳过  使用 usecols
  ```python
  from os import stat
  import string
  from datetime import date,timedelta
  import pandas as pd 
  # 前三行为空 跳过 使用 skiprows
  # 前三列为空 跳过  使用 usecols
  # 为了防止数据使用浮点数，设置dtype为str
    books = pd.read_excel("week2.1.xlsx",skiprows=3,usecols='C:F',dtype={'ID':str,'InStore':str})
    bookss =  pd.read_excel("week2.1.xlsx",skiprows=3,usecols='C:F',dtype={'ID':str,'InStore':str})
    print(books)
 ```
