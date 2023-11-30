<<<<<<< HEAD
---
title: Django学习(三)
categories:
  - 计算机WEB应用
tags:
  - Django
abbrlink: 62016
date: 2022-01-27 19:48:00
---
# Django的Model模型
* 模型包含着存储数据的必要字段和行为
* 通常，一个模型对相应数据库的一个表，每个属性对应一个字段
* 每一个模型都是`Django.db.models.Model`的一个Python子类
* Django提供一套自动生成的用于数据库访问的`API`
* 模型与数据库关系是`ORM`关系(对象-关系-映射)
* Model是`MVC`中的`M`,即负责出具库中存取数据，不需要依赖特定的数据库通过简单的配置就可以轻松更换数据库



### Model开发流程
1. 在`models.py`中定义模型类i，集成`models.Model`

2. 把应用加入到项目的`settings.py`配置文件的`INSTALLED_APPS`项目中

3. 生成迁移文件
   ```shell
   python manage.oy makemigrations
   ```
   
4. 执行迁移
   ```shell
   python manage.py migrate
   ```
   
5. 使用模型类进行`CRUD`操作(不用自己写`CRUD`具体操作)



### 定义Model模型
1. 属性名限制
   * 不能是`python`的保留关键字
   * 由于`Django`的查询方式，不允许使用连续下划线
2. 模型实例对象通过`objects`属性获取，即`Django`为模型类提供的管理器,`objects`:是`Manage`类型的对象,用于进行数据库交互
3. 实例相关方法
   * `__str__(self)`:重写`object`方法，此方法在将对象转换成字符串时将会被调用
   * `save()`:将对象保存到数据表中
   * `delete()`:将模型从数据表中删除



### 实验
#### 创建项目
1. 创建`Django`项目
```shell
Django-admin startproject mydemo
```
2. 创建一个应用
```python
cd mydemo
python manage.py startapp myapp
```
3. 创建模板目录
```shell
mkdir templates
cd template
mkdir myapp
```
4. 数据库相关操作
```python
#setting.py
# 允许所有源访问
ALLOWED_HOSTS = ['*']
# 加入`myapp`应用
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'myapp',
]
# 配置模板
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'template')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
#数据库连接配置
DATABASES = {
        'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mytest',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

5. 定义`Model`类

   ```python
   # models.py
   '''
   1. 主键字段自动加,可以不写
   2. 如果不指定特定表名字，默认表名为"应用名_类名"
   '''
   from django.db import models
   from datetime import datetime
   # Create your models here.
   class Users(models.Model):
       #id = models.AutoField(primary_key=True) #主键可省略不写
       name = models.CharField(max_length=32)
       age = models.IntegerField(default=20)
       phone = models.CharField(max_length=16)
       addtime=models.DateTimeField(default=datetime.now)
   
       def __str__(self):
           return self.name+":"+self.phone
   
       # 自定义对应的表名(即项目名字_类名)，默认表名：myapp_users
       #class Meta:
       #    db_table="myapp_users"
   ```

   

6. 安装mysql_client
```python
#__init__.py
import pymysql
pymysql.install_as_MySQLdb()
```
7. 生成迁移文件,执行完毕以后会发现应用目录下增加了`migrations`文件夹以及相关文件
```shell
#Win
python manage.py makemigrations
#Linux
python3 manage.py makemigrations
```
8. 执行迁移,执行完毕后会发现数据库中多了几张基本表
```shell
python manage.py migrate
```
如果自己不需要相关表格,可以按需生成表,配置在`settings.py`文件中
```python
INSTALLED_APPS = [
    'django.contrib.admin',            # 按需删除
    'django.contrib.auth',             # 按需删除
    'django.contrib.contenttypes',     # 按需删除
    'django.contrib.sessions',         # 按需删除
    'django.contrib.messages',         # 按需删除
    'django.contrib.staticfiles',      # 按需删除
    'myapp',
]
```
### 相关字段解释
#### 字段类型
* `AutoField`：一个根据实际ID自动增长的IntegerField，通常不指定
如果不指定，一个主键字段将自动添加到模型中
* `BooleanField`：true/false 字段，此字段的默认表单控制是CheckboxInput
* `NullBooleanField`：支持null、true、false三种值
* `CharField`(max_length=字符长度)：字符串，默认的表单样式是 TextInput
* `TextField`：大文本字段，一般超过4000使用，默认的表单控件是Textarea
* `IntegerField`：整数
* `DecimalField`(max_digits=None, decimal_places=None)：使用python的Decimal实例表示的十进制浮点数
* `DecimalField.max_digits`：位数总数
* `DecimalField.decimal_places`：小数点后的数字位数
* `FloatField`：用Python的float实例来表示的浮点数
* `DateField`[auto_now=False, auto_now_add=False])：使用Python的datetime.date实例表示的日期
参数DateField.auto_now：每次保存对象时，自动设置该字段为当前时间，用于"最后一次.修改"的时间戳，它总是使用当前日期，默认为false
参数DateField.auto_now_add：当对象第一次被创建时自动设置当前时间，用于创建的时间戳，它总是使用当前日期，默认为false
该字段默认对应的表单控件是一个TextInput. 在管理员站点添加了一个JavaScript写的日历控件，和一个“Today"的快捷按钮，包含了一个额外的invalid_date错误消息键
auto_now_add, auto_now, and default 这些设置是相互排斥的，他们之间的任何组合将会发生错误的结果
* `TimeField`：使用Python的datetime.time实例表示的时间，参数同DateField
* `DateTimeField`：使用Python的datetime.datetime实例表示的日期和时间，参数同DateField
* `FileField`：一个上传文件的字段
* `ImageField`：继承了FileField的所有属性和方法，但对上传的对象进行校验，确保它是个有效的image



### 展示
#### 配置首页
1. 配置view层

```python
from django.shortcuts import render
from django.http import HttpResponse
from myapp.models import Users
# Create your views here.
def index(request):
    # 执行model操作

    # add操作
    ob = Users()              #实例化新对象
    ob.name = "小乔"
    ob.age = 12
    ob.phone = '546121'
    ob.save()                 #新对象就是添加,已存在对象则是修改
 
    ob = Users()
    ob.name = "金蝉" 
    ob.age = 45
    ob.phone = '15423232'
    ob.save()

    ob = Users()
    ob.name = "瑶"
    ob.age = 16
    ob.phone = '98235623'
    ob.save()

    # delete操作
    mod = Users.objects     # 获取users的model对象
    user = mod.get(id=6)    # 获取id值为6的数据信息
    print(user.name)
    user.delete()           # 执行删除操作

    # update 操作
    mods = Users.objects
    users = mods.get(id=2)
    print(users.name)
    users.age = 13 
    users.save()
    return HttpResponse("首页")
def query(request):
    mod = Users.objects
    ulist = mod.all()                     # 获取所有信息
    ulist = mod.filter(name="蔡文姬")      # 获取name值为蔡文姬的所有信息
    ulist = mod.filter(age__gt=20)        # 获取年龄大于20的所有信息
    ulist = mod.order_by("age")[:3]       # 按照年龄排序，默认是升序排序,并取出部分数据
    '''
    gt    大于
    gte   大于等于
    lt    小于
    '''
    for u in ulist:
        print(u.id,u.name,u.age,u.phone)
    print("==========================")

    
    return HttpResponse("查询")

```
2. 配置子路由

```python
# myapp.urls
from django import views
from django.urls import URLPattern, path,re_path
from myapp import views
urlpatterns = [
    path('',views.index,name="index"),
]
```
3. 配置总路由

```python
# urls.py
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    #path('admin/', admin.site.urls),
    path('',include("myapp.urls")),
]
=======
---
title: Django学习(三)
categories:
  - 计算机WEB应用
tags:
  - Django
abbrlink: 62016
date: 2022-01-27 19:48:00
---
# Django的Model模型
* 模型包含着存储数据的必要字段和行为
* 通常，一个模型对相应数据库的一个表，每个属性对应一个字段
* 每一个模型都是`Django.db.models.Model`的一个Python子类
* Django提供一套自动生成的用于数据库访问的`API`
* 模型与数据库关系是`ORM`关系(对象-关系-映射)
* Model是`MVC`中的`M`,即负责出具库中存取数据，不需要依赖特定的数据库通过简单的配置就可以轻松更换数据库



### Model开发流程
1. 在`models.py`中定义模型类i，集成`models.Model`

2. 把应用加入到项目的`settings.py`配置文件的`INSTALLED_APPS`项目中

3. 生成迁移文件
   ```shell
   python manage.oy makemigrations
   ```
   
4. 执行迁移
   ```shell
   python manage.py migrate
   ```
   
5. 使用模型类进行`CRUD`操作(不用自己写`CRUD`具体操作)



### 定义Model模型
1. 属性名限制
   * 不能是`python`的保留关键字
   * 由于`Django`的查询方式，不允许使用连续下划线
2. 模型实例对象通过`objects`属性获取，即`Django`为模型类提供的管理器,`objects`:是`Manage`类型的对象,用于进行数据库交互
3. 实例相关方法
   * `__str__(self)`:重写`object`方法，此方法在将对象转换成字符串时将会被调用
   * `save()`:将对象保存到数据表中
   * `delete()`:将模型从数据表中删除



### 实验
#### 创建项目
1. 创建`Django`项目
```shell
Django-admin startproject mydemo
```
2. 创建一个应用
```python
cd mydemo
python manage.py startapp myapp
```
3. 创建模板目录
```shell
mkdir templates
cd template
mkdir myapp
```
4. 数据库相关操作
```python
#setting.py
# 允许所有源访问
ALLOWED_HOSTS = ['*']
# 加入`myapp`应用
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'myapp',
]
# 配置模板
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'template')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
#数据库连接配置
DATABASES = {
        'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mytest',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

5. 定义`Model`类

   ```python
   # models.py
   '''
   1. 主键字段自动加,可以不写
   2. 如果不指定特定表名字，默认表名为"应用名_类名"
   '''
   from django.db import models
   from datetime import datetime
   # Create your models here.
   class Users(models.Model):
       #id = models.AutoField(primary_key=True) #主键可省略不写
       name = models.CharField(max_length=32)
       age = models.IntegerField(default=20)
       phone = models.CharField(max_length=16)
       addtime=models.DateTimeField(default=datetime.now)
   
       def __str__(self):
           return self.name+":"+self.phone
   
       # 自定义对应的表名(即项目名字_类名)，默认表名：myapp_users
       #class Meta:
       #    db_table="myapp_users"
   ```

   

6. 安装mysql_client
```python
#__init__.py
import pymysql
pymysql.install_as_MySQLdb()
```
7. 生成迁移文件,执行完毕以后会发现应用目录下增加了`migrations`文件夹以及相关文件
```shell
#Win
python manage.py makemigrations
#Linux
python3 manage.py makemigrations
```
8. 执行迁移,执行完毕后会发现数据库中多了几张基本表
```shell
python manage.py migrate
```
如果自己不需要相关表格,可以按需生成表,配置在`settings.py`文件中
```python
INSTALLED_APPS = [
    'django.contrib.admin',            # 按需删除
    'django.contrib.auth',             # 按需删除
    'django.contrib.contenttypes',     # 按需删除
    'django.contrib.sessions',         # 按需删除
    'django.contrib.messages',         # 按需删除
    'django.contrib.staticfiles',      # 按需删除
    'myapp',
]
```
### 相关字段解释
#### 字段类型
* `AutoField`：一个根据实际ID自动增长的IntegerField，通常不指定
如果不指定，一个主键字段将自动添加到模型中
* `BooleanField`：true/false 字段，此字段的默认表单控制是CheckboxInput
* `NullBooleanField`：支持null、true、false三种值
* `CharField`(max_length=字符长度)：字符串，默认的表单样式是 TextInput
* `TextField`：大文本字段，一般超过4000使用，默认的表单控件是Textarea
* `IntegerField`：整数
* `DecimalField`(max_digits=None, decimal_places=None)：使用python的Decimal实例表示的十进制浮点数
* `DecimalField.max_digits`：位数总数
* `DecimalField.decimal_places`：小数点后的数字位数
* `FloatField`：用Python的float实例来表示的浮点数
* `DateField`[auto_now=False, auto_now_add=False])：使用Python的datetime.date实例表示的日期
参数DateField.auto_now：每次保存对象时，自动设置该字段为当前时间，用于"最后一次.修改"的时间戳，它总是使用当前日期，默认为false
参数DateField.auto_now_add：当对象第一次被创建时自动设置当前时间，用于创建的时间戳，它总是使用当前日期，默认为false
该字段默认对应的表单控件是一个TextInput. 在管理员站点添加了一个JavaScript写的日历控件，和一个“Today"的快捷按钮，包含了一个额外的invalid_date错误消息键
auto_now_add, auto_now, and default 这些设置是相互排斥的，他们之间的任何组合将会发生错误的结果
* `TimeField`：使用Python的datetime.time实例表示的时间，参数同DateField
* `DateTimeField`：使用Python的datetime.datetime实例表示的日期和时间，参数同DateField
* `FileField`：一个上传文件的字段
* `ImageField`：继承了FileField的所有属性和方法，但对上传的对象进行校验，确保它是个有效的image



### 展示
#### 配置首页
1. 配置view层

```python
from django.shortcuts import render
from django.http import HttpResponse
from myapp.models import Users
# Create your views here.
def index(request):
    # 执行model操作

    # add操作
    ob = Users()              #实例化新对象
    ob.name = "小乔"
    ob.age = 12
    ob.phone = '546121'
    ob.save()                 #新对象就是添加,已存在对象则是修改
 
    ob = Users()
    ob.name = "金蝉" 
    ob.age = 45
    ob.phone = '15423232'
    ob.save()

    ob = Users()
    ob.name = "瑶"
    ob.age = 16
    ob.phone = '98235623'
    ob.save()

    # delete操作
    mod = Users.objects     # 获取users的model对象
    user = mod.get(id=6)    # 获取id值为6的数据信息
    print(user.name)
    user.delete()           # 执行删除操作

    # update 操作
    mods = Users.objects
    users = mods.get(id=2)
    print(users.name)
    users.age = 13 
    users.save()
    return HttpResponse("首页")
def query(request):
    mod = Users.objects
    ulist = mod.all()                     # 获取所有信息
    ulist = mod.filter(name="蔡文姬")      # 获取name值为蔡文姬的所有信息
    ulist = mod.filter(age__gt=20)        # 获取年龄大于20的所有信息
    ulist = mod.order_by("age")[:3]       # 按照年龄排序，默认是升序排序,并取出部分数据
    '''
    gt    大于
    gte   大于等于
    lt    小于
    '''
    for u in ulist:
        print(u.id,u.name,u.age,u.phone)
    print("==========================")

    
    return HttpResponse("查询")

```
2. 配置子路由

```python
# myapp.urls
from django import views
from django.urls import URLPattern, path,re_path
from myapp import views
urlpatterns = [
    path('',views.index,name="index"),
]
```
3. 配置总路由

```python
# urls.py
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    #path('admin/', admin.site.urls),
    path('',include("myapp.urls")),
]
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
```