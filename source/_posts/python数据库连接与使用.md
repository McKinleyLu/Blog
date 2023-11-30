<<<<<<< HEAD
<<<<<<< HEAD
---
title: python数据库连接与使用
categories:
  - 计算机语言笔记
tags:
  - 数据库基础
  - python
abbrlink: 23830
date: 2021-12-22 15:08:10
---
### python连接数据库

#### anaconda安装

1. 下载地址

   ```
   https://www.anaconda.com/products/individual
   ```

2. 安装完毕后，务必手动将anaconda文件夹下的`python.exe`路径添加到系统环境变量

#### python连接数据库

1. 安装pymysql

   ```she
   pip install pymysql
   ```

2. 连接数据库并使用

   ```python
   from pymysql import connect 
   class JD(object):
       def __init__(self):
           #连接数据库
           self.conn = connect(host='localhost',port=3306,user='root',password='1234',database ='jingdong',charset='utf8' )
           #获取游标对象
           self.cs1 = self.conn.cursor()                        
           pass
       
       def __del__(self):
           #关闭cursor对象
           self.cs1.close()
           #关闭数据库链接
           self.conn.close()
           pass
           
           
       def show_all_items(self):
           sql = "select * from  goods;"
           self.cs1.execute(sql)  #执行查询语句
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass
       
       def pirnts():
           print("----京东----")
           print("1.所有商品")
           print("2.所有商品分类")
           print("3.查询商品品牌分类")
           return eval(input("请输入功能对应的序号:"))
       
       def show_goods_classify(self):
           sql = "select name from goods;"
           self.cs1.execute(sql)
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass        
       def run(self):
           while True:
               if self.pirnts() == 1 :
                   #查询所有商品
                   self.show_all_items()
               elif self.pirnts() == 2:
                   self.show_goods_classify()
   def main():
       #创建一个京东商城对象
       jd = JD()
       #调用这个对象的run方法,让其运行
       jd.run()
   
   
   if __name__ == '__main__':
       main()
       
   ```

   

=======
---
title: python数据库连接与使用
categories:
  - 计算机语言笔记
tags:
  - 数据库基础
  - python
abbrlink: 23830
date: 2021-12-22 15:08:10
---
### python连接数据库

#### anaconda安装

1. 下载地址

   ```
   https://www.anaconda.com/products/individual
   ```

2. 安装完毕后，务必手动将anaconda文件夹下的`python.exe`路径添加到系统环境变量

#### python连接数据库

1. 安装pymysql

   ```she
   pip install pymysql
   ```

2. 连接数据库并使用

   ```python
   from pymysql import connect 
   class JD(object):
       def __init__(self):
           #连接数据库
           self.conn = connect(host='localhost',port=3306,user='root',password='1234',database ='jingdong',charset='utf8' )
           #获取游标对象
           self.cs1 = self.conn.cursor()                        
           pass
       
       def __del__(self):
           #关闭cursor对象
           self.cs1.close()
           #关闭数据库链接
           self.conn.close()
           pass
           
           
       def show_all_items(self):
           sql = "select * from  goods;"
           self.cs1.execute(sql)  #执行查询语句
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass
       
       def pirnts():
           print("----京东----")
           print("1.所有商品")
           print("2.所有商品分类")
           print("3.查询商品品牌分类")
           return eval(input("请输入功能对应的序号:"))
       
       def show_goods_classify(self):
           sql = "select name from goods;"
           self.cs1.execute(sql)
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass        
       def run(self):
           while True:
               if self.pirnts() == 1 :
                   #查询所有商品
                   self.show_all_items()
               elif self.pirnts() == 2:
                   self.show_goods_classify()
   def main():
       #创建一个京东商城对象
       jd = JD()
       #调用这个对象的run方法,让其运行
       jd.run()
   
   
   if __name__ == '__main__':
       main()
       
   ```

   

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: python数据库连接与使用
categories:
  - 计算机语言笔记
tags:
  - 数据库基础
  - python
abbrlink: 23830
date: 2021-12-22 15:08:10
---
### python连接数据库

#### anaconda安装

1. 下载地址

   ```
   https://www.anaconda.com/products/individual
   ```

2. 安装完毕后，务必手动将anaconda文件夹下的`python.exe`路径添加到系统环境变量

#### python连接数据库

1. 安装pymysql

   ```she
   pip install pymysql
   ```

2. 连接数据库并使用

   ```python
   from pymysql import connect 
   class JD(object):
       def __init__(self):
           #连接数据库
           self.conn = connect(host='localhost',port=3306,user='root',password='1234',database ='jingdong',charset='utf8' )
           #获取游标对象
           self.cs1 = self.conn.cursor()                        
           pass
       
       def __del__(self):
           #关闭cursor对象
           self.cs1.close()
           #关闭数据库链接
           self.conn.close()
           pass
           
           
       def show_all_items(self):
           sql = "select * from  goods;"
           self.cs1.execute(sql)  #执行查询语句
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass
       
       def pirnts():
           print("----京东----")
           print("1.所有商品")
           print("2.所有商品分类")
           print("3.查询商品品牌分类")
           return eval(input("请输入功能对应的序号:"))
       
       def show_goods_classify(self):
           sql = "select name from goods;"
           self.cs1.execute(sql)
           for temp in self.cs1.fetchall():#获取查询语句内容,返回元组
               print(temp)
           pass        
       def run(self):
           while True:
               if self.pirnts() == 1 :
                   #查询所有商品
                   self.show_all_items()
               elif self.pirnts() == 2:
                   self.show_goods_classify()
   def main():
       #创建一个京东商城对象
       jd = JD()
       #调用这个对象的run方法,让其运行
       jd.run()
   
   
   if __name__ == '__main__':
       main()
       
   ```

   

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
