---
title: Django学习(二)
categories:
  - 计算机WEB应用
tags:
  - Django
abbrlink: 25314
date: 2022-01-26 21:52:44
---
# Django框架URL路由配置
每一个页面请求都是通过一个URL地址进行请求，最后执行对应的程序，得到对应的结果。
### 初始相关操作
1. 创建新项目
```shell
Django-admain startproject mydemo
cd mydemo
```
2. 创建应用
```shell
cd mydemo
python manage.py startapp myapp
python manage.py runserver
```
3. 通过浏览器访问服务
浏览器 => 根路由 => 加载子路由 => 正则匹配访问路径 => 视图函数 => 响应的内容

4. 配置相关文件
### 路径转换器(用于加参数)
* 要从`URL`获取一个值，使用尖括号括起来，一般使用`字符串`或者`数字`,使用如下:
```python
#urls.py
path("find/<int:sid>/<str:name>",views.find),
#views.py
def find(request,sid=0,name=""):  # 加默认值 sid = 0
    return HttpResponse("find......%d:%s"%(sid,name))
```
访问`localhost:8001/find/12/lisi`即可。
* 使用正则表达式的两种方法
第一种时不写参数名称,栗子如下:
```python
re_path(r"^fun/([0-9]{4})/([0-9]{2})$",views.fun)
```
第二种时需要写参数，同时`views.py`中也要写参数，并且名称需要和`urls.py`中的参数名称一致
```python
# urls.py
re_path(r"^funs/(?P<year>[0-9]{4})/(?P<month>[0-9]{2})$",views.funs),
# views.py
def funs(request,year,month):  #如果带名字，必须和视图中参数名字保持一致
    return HttpResponse("%s年%s月"%(year,month))
```
### 错误处理
常见错误有`404`,`403`,`400`,`500`可以自己根据错误设置自己的报错模板
1. 首先准备一个自己写好的404页面
2. 在`settings.py`中配置`DEBUG=False`
```python
   #settings.py
      TEMPLATES = [
       {
           'BACKEND': 'django.template.backends.django.DjangoTemplates',
           'DIRS': [os.path.join(BASE_DIR,"templates")],  #这里的"templates"可以更改
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
```
   最终的总路由代码展示:
```python
from django.contrib import admin
from django.urls import path,re_path
from myapp import views      #导入自己的应用
urlpatterns = [
    #path('admin/', admin.site.urls),
    path("",views.index),
    path("add/",views.add),
    path("find/<int:sid>/<str:name>",views.find),
    path("update/",views.update),
    path("edit/",views.edit),
    re_path(r"^fun/([0-9]{4})/([0-9]{2})$",views.fun),
    re_path(r"^funs/(?P<year>[0-9]{4})/(?P<month>[0-9]{2})$",views.funs),
]
```
3. 在`settings.py`中配置`TEMPLATES = [{'DIRS': [os.path.join(BASE_DIR,'templates')] }]`
4. 在根目录下创建`templates`文件夹，并把写好的404网页放入其中
5. 关闭调试模式，可以看404页面显示结果
```python
   #settings.py
   DEBUG = False     #调成开发模式
   #views.py
   from django.http import Http404
   def  edit(request):
      raise Http404("编辑页面不存在")
```
6. 其他的URLconf设置

   当路由太多时，多个应用拥有自己的子路由：在每个应用中创建`urls.py`子路由

   ```python
     #子路由 myapp/urls.py
     from django.contrib import admin
     from django.urls import path,include
     from myapp import views      #导入自己的应用
     urlpatterns = [
         #path('admin/', admin.site.urls),
         path("",include('myapp.urls')),  #在当前根路由中，导入子路由
     ]
     #根路由 myapp/urls.py
     from django.contrib import admin
     from django.urls import path,include
     from myapp import views      #导入自己的应用
     urlpatterns = [
         #path('admin/', admin.site.urls),
         path("",include('myapp.urls')),  #在当前根路由中，导入子路由
     ]
     访问 http://127.0.0.1:8001/myapp/edit/ 打开预定的404
   ```

7. 页面跳转(重定向)
* 首先给每一个urls.py中的操作起名字,同时修改view.py文件,之后每访问一次，在终端打印出跳转的地址，同时注意下面展示的加参数方法
```python
  #views.py
  from django.urls import reverse #用来生成url地址
  def index(request):  #request代表相应对象
    print(reverse("add"))  #通过路由名称反向生成url地址
    print(reverse("index"))  #通过路由名称反向生成url地址
    print(reverse("find2",args=(101,'lisi')))  #通过路由名称反向生成url地址
    return HttpResponse("Hello world!")  # 相应内容为Hello world!
  
  #urls.py
    path("",views.index,name="index"),  #name反向解析找
    path("add/",views.add,name="add"),
```
* 接下来,在`views,py`加重定向即可
```python 
  # views.py
    from django.shortcuts import redirect
  # Create your views here.
  def index(request):  #request代表相应对象
      print(reverse("add"))  #通过路由名称反向生成url地址
      print(reverse("index"))  #通过路由名称反向生成url地址
      print(reverse("find2",args=(101,'lisi')))  #通过路由名称反向生成url地址
      return redirect(reverse("find2",args=(101,'lisi')))
```
  打开初始页面`http://127.0.0.1:8001`,最后页面跳转到`http://127.0.0.1:8001/find/101/lisi`中。