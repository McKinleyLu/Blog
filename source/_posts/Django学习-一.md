---
title: Django学习(一)
author: 瑾年
mathjax: true
categories:
  - 2022WinterPlan
  - Django
tags:
  - Django
abbrlink: 41542
date: 2022-01-25 15:11:13
---
# DjangoWinterLearn

## 快速体验
### 模块一:搭配框架
1. python manage.py runserver
2. 修改settings.py里的代码`30`行，为`ALLOWED_HOSTS = ["*"]`,
### 模块二:创建应用
1. 指令:`python manage.py startapp myapp`
2. 创建一个视图
* 打开`myapp => views.py`，写如下代码
```python
   def index(request):
         return 
```
* 在`/myapp`下创建一个路由文件`urls.py`
* 编写`uls.py`
* 之后在总路由下,添加相应路由
4. 更改启动端口
```shell
  python manage.py runserver 指定的端口号
```
### 模块三:项目模型`即数据库连接操作`
1. 打开`settings.py`文件，进行相关的配置，样例如下
   ```sql
         DATABASES = {
          'default': {
              'ENGINE': 'django.db.backends.sqlite3',
              'NAME': 'mydemo',
              'USER': 'root',
              'PASSWORD': '',
              'HOST': 'localhost',
              'PORT': '3306',
          }
      }
   ```
   同时需要根据不同数据库，修改`settings.py`文件中的不同引擎
   ```python
    其中ENGINE设置为数据库后端使用。内置数据库后端有：
   'django.db.backends.postgresql'         
   'django.db.backends.mysql'
   'django.db.backends.sqlite3'
   'django.db.backends.oracle'
   ```
   最后，在`__int__.py`中添加如下代码
   ```python
   import pymysql
   pymysql.install_as_MySQLdb()
   # 如果没有，使用 pip install mysqlclient 安装
   ```
2. 在`models.py`中，添加操作代码，这里举一个栗子
   ```python
   class Stu(models.Model):
    '''自定义Stu表对应的Model类 类名可以随便取'''
    #定义属性：默认主键自增id字段可不写
    id = models.AutoField(primary_key=True)
   
    # 定义默认输出格式
    def __str__(self):
        return "%d"%(self.id).decode('utf-8')
   
    # 自定义对应的表名，默认表名：myapp_stu
    class Meta:
        db_table="catinfo"  # 这个“catTest”代表数据库中的表名字
   ```
3. 在`settings.py`中，添加代码
   ```python
   INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'myapp.apps.MyappConfig',  # 添加代码]
   ```
4. 测试数据库访问操作
* shell版
```shell
python manage.py shell
```
在下面依次输入以下命令
```python
from myapp.models import Stu
mod = Stu.objects
mod.get(catId=1)
```

* web版，在用户`views.py`中添加以下内容
```python
def example(request):
    mod = Stu.objects
    mod.get(catId=1)
    return HttpResponse("my example")
```


### 模块四:启用网站Admin管理

1. 数据迁移(用程序直接生成数据库信息)
   执行如下命令:
   
   ```shell
   python manage.py migrate
   python manage.py createsuperuser
      - Username : mckinletlu
      - Email : lutong@mckinleylu.com
      - Password(至少八位): 12345678
    python manage.py runserver 8001
    访问:`localhost:8001/admin/`即可
   ```
2. 修改时区
   在`settings.py`文件中，修改如下:
   ```python
   LANGUAGE_CODE = 'zh-Hans'
   
   TIME_ZONE = 'Asia/Shanghai'
   ```
3. 将自定义的应用程序的加入到后台管理
   打开`myapp/admin.py`,将下面信息加入到其中
   ```python
   from myapp.models import Stu
   
   admin.site.register(Stu)
   ```
4. 深入设置后台管理
   ```python
   class Stu(models.Model):
    '''自定义Stu表对应的Model类'''
    #定义属性：默认主键自增id字段可不写
    catId     = models.AutoField("喵ID",primary_key=True)
    catName   = models.CharField("喵名",max_length=20)
    catHobby  = models.CharField("喵爱好",max_length=20)
    catGender = models.CharField("喵性别",max_length=20)
    catSchool = models.CharField("喵学校",max_length=20)
    catHouse  = models.CharField("喵住所",max_length=20)
    catAge    = models.IntegerField("喵年龄")
    catHealth = models.CharField("喵健康程度",max_length=20)
    # 定义默认输出格式
    def __str__(self):
        return "%d:%s:%s:%s:%s:%s:%d:%s"%(self.catId,self.catName,self.catHobby,self.catGender,self.catSchool,self.catHouse,self.catAge,self.catHealth)
   
    # 自定义对应的表名，默认表名：myapp_stu
    class Meta:
        db_table="catInfo"  # 这个“stu”代表数据库中的表名字
        verbose_name = '喵喵信息查看'
        verbose_name_plural = "喵喵信息管理"
   ```