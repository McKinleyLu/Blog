<<<<<<< HEAD
<<<<<<< HEAD
---
title: Docker Usage
categories:
  - 计算机基础技术
tags:
  - docker
abbrlink: 23336
date: 2022-03-15 09:40:47
---

## Docker

### 目录

* Docker概述
* Docker安装
* Docker命令
  * 镜像命令
  * 容器命令
  * 操作命令
* Docker镜像
* DockerFile
* Docker网络原理

### Docker概述

使用`docker`,采用镜像文件，下载镜像即可使用。

Docker思想来自于集装箱

隔离：Docker核心思想，打包装箱，每个箱子互相隔离。

#### Docker作用

类似于一个虚拟机作用。

虚拟机技术：资源占用多大，冗余步骤多，启动慢

容器化技术: 不是模拟一个操作系统，每一个容器可以运行在操作系统内核种，且独立运行

#### Docker基本组成

镜像(image)：一个模板，通过模板运行容器服务，通过镜像可以创建多个容器。

容器(container):独立运行一个或者一组应用，通过镜像创建:启动，停止，删除，基本命令。

仓库(repository):仓库就是存放镜像的大方，同时配置镜像加速。

client：

构建容器:docker build

拉取容器:docker pull

运行容器:docker run  

### Docker安装

看docker官方[帮助文档](docs.docker.com)

卸载旧的docker

```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
```

安装需要的包

```shell
sudo apt-get update
sudo apt-get install \
ca-certificates \
curl \
gnupg \
lsb-release

```

添加官方GPG密钥

```shel
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

选择稳定版仓库

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

安装docker(docker-ce 社区版)

```shell
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

启动docker

```shell
docker version
```

测试`Hello word`

1. 首先如果没有镜像，自动到docker-hub拉取镜像,如果没有就会报错
2. 查看下载的镜像列表

```shell
sudo docker run hello-world
sudo docker images           
```

卸载docker

```shell
# 卸载依赖
sudo apt-get purge docker-ce docker-ce-cli containerd.io

# 卸载资源
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

腾讯云镜像加速构建

```shell
# 修改配置文件
sudo vi /lib/systemd/system/docker.service
# 文件内操作(修改)
ExecStart=/usr/bin/dockerd -H fd:// --registry-mirror=https://mirror.ccs.tencentyun.com
# 保存一次执行如下命令
sudo service docker restart
sudo systemctl daemon-reload
sudo service docker restart
# 运行下面命令，确认docker info中的Registry Mirror值为https://mirror.ccs.tencentyun.com
sudo docker info 
#info 

```

![picture](/img/docker.png)

### Docker命令

docker底层原理:Docker是一个Client-Server结构系统，Docker的守护进程运行在主机上。通过Socket从客户端访问！
DockerSever接收到Docker-Clinet指令，就行执行指令。
Docker利用宿主主机内核，vm是需要OS的，因此速度很快。

1. Docker帮助命令

   ```shell
   docker  version   # 显示docker的版本信息 
   docker  info      # 显示docker的系统信息，包括镜像和容器数量
   docker 命令 --help # 查看命令参考
   ```

2. 查看镜像

   ```shell
   docker images -a  # 列出镜像
   ```

3. 搜索镜像

   ```shell
   docker search [环境名字]
   ## eg docker search mysql
   #使用--filter过滤
   ## eg docker search mysql --filter=STARS=5000
   ```

4. 下载镜像

   ```shell
   docker pull [镜像名字]
   docker pull [镜像名字]  tag
   # eg  docker pull mysq:5.7
   ```

5. 删除镜像

   ```shell
   docker rmi -f [镜像ID]               # 删除一个容器
   docker rmi -f $(docker images -aq)   # 删除多个容器
   ```

6. 新建容器并使用

   ```shell
   docker pull ubuntu:20.04
   docker run [参数] image
   
   # 参数内容
   --name="Name"  容器名字，用于区分容器
   -d             后台运行
   -it            使用交互方式运行,进入容器内查看
   -p        
       -p ip:主机端口:容器端口
       -p 主机端口:容器端口 (常用)
       -p 容器端口
    -p  随机指定端口
    
   # 测试
   启动并进入容器:docker run -it ubuntu /bin/bash
   #退出容器
   退出并停止:exit
   仅仅推出容器:Ctrl + P + Q 
   # 查看运行的容器
   列出正在运行的容器: docker ps 
   列出正在和历史运行的容器: docker ps -a
   列出当前当前运行容器的编号: docker ps -aq
   # 删除容器
   docker rm [id]   # 不能删除正在运行的容器
   # 启动/重启/停止容器
   docker start      [容器id]
   docker restart    [容器id]
   docker stop       [容器id]
   docker kill       [容器id]
    # 查看容器内发生了什么
    docker inspect   [容器id]
   ```

7. 常用其他命令

   ```shell
   # docker 容器使用后台运行，必须要有一个前台进程,docker发现没有应用就会自动停止
   docker run -d
   # docker 日志信息
   docker logs -f -t
   ```

8. 进入正在运行的容器

   ```shell
   # 命令一
   docker exec -it [ID] /bin/bash
   # 命令二
   docker attach [ID]            # 打开的是正在运行的命令行而不是新的窗口
   ```

9. 从容器内拷贝文件到容器外

   ```shell
   docker cp 容器id:文件路径  容器外路径
   ```

10. 删除容器

   ```shell
docker rmi 容器名
   ```

### 发布自己的镜像至Github-Hub

```shell
docker login -u mckinleylu
docker tag [id]  [标签]
docker push [mckinleylu]/REPOSITORY:1.0
```

### 发布自己的镜像至阿里云

```shell
创建命名空间(一个账号只能创建三个)
创建容器镜像
上传镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
$ docker push registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
下载镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker pull registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
```

### Dockerfile

用来构建docker镜像文件，即命令参数文件。

构建步骤

1. 编写一个dockerfile文件
2. docker build 构建一个镜像
3. docker run 运行镜像
4. docker push 发布镜像

```dockerfile
FROM                                 # 基础镜像 -- 一切从这里开始
MAINTAINER                           # 镜像是谁写的
RUN                                  # 镜像构建的时候需要运行的命令
ADD                                  # 步骤
WORKDIR                              # 镜像工作目录
VOLUME                               # 挂载目录
EXPOSE                               # 指定对外端口  和 -p 一样
CMD                                  # 指定容器启动的时候要运行的命令，只有最后一个会生效
ENTRYPOINT                           # 指定容器启动的时候要运行的命令，可以进行追加
ONBUILD                              # 当构建一个被继承 Dockerfile 这个时候会运行 这个指令
COPY                                 # 将文件拷贝到镜像中
ENV                                  # 构建的时候涉及环境变量
```

### 自写镜像

Docker Hub 中 99%的镜像都是从这个基础镜像`FROM scrarch`来的

```dockerfile
# dockerfileOne
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
RUN        apt install flex
RUN        apt install basion
EXPOSE 80
CMD  echo $MYPATH
CMD  echo "---end---"
CMD   ["ls","-a"]
CMD   ["mkdir","home"]
CMD   ["mkdir","/home/mckinleylu"]
CMD /bin/bash                         # 只有最后一个CMD被执行，即这句话
```

```shell
$ docker build -f [dockerfilename] -t [标签]:[版本号]
$ docker history [容器id]
```

```dockerfile
#DockerFileTwo
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
ENTRYPOINT ["ls","-a"]
ENTRYPOINT ["mkdir","home"]
```

### Docker 网络

1. 清空环境

```shell
$ docker rm -f $(docker ps -aq)        
$ docker rmi -f $(docker images -aq)    
```

2. 测试获取ip

   ```shell
   ip addr
   # ln  本地回环地址
   # etho: 内网地址
   # docker0: docker0d
   ```

3. 容器网络访问

   ```shell
   $ docker run -d -P --name tomcat01 tomcat
   $ docker exec -it tomcat01 ip addr
   ```

   * 每启动一个docker容器，docker容器就会给docker容器分配一个ip,只要安装了docker就会有一个网课，采用桥接模式，使用的技术是enth-pair技术

   * 容器带来的网卡是一对的,一对虚拟设备接口(enth-pair)

   * 利用(enth-pair)作为桥梁，连接各种虚拟网路设备

   * 容器直接也可以互相ping通

     ![picture](/img/docker01.png)

4. 自定义网络

   ```shell
   # 显示所有网路
   docker network ls 
   # 网络模式
   bridge 桥接(默认)   
   none   不配置网络(默认)
   host   和宿主机共享网络
   
   # 创建网络
   # 直接启动命令  默认 --net bridge  这是docker0如此默认设置
   # docker0特点 ， 默认 ，域名不能访问     -- link就可以打通连接
   $ docker run -d -P --name tomcat01 tomcat <==> docker run -d -P --name tomcat01 -- net bridge tomcat 
   
   # 创建网络
   docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
   #查看自己配置的网路详情
   docker network inspect mynet
   
   
   再创建容器
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker run -d -P --name tomcat01-net-02 --net mynet tomcat
   
   # ping测试
   docker exec -it tomcat01-net-01 ping 192.168.0.3
   #### 自定义的我网络docker可以互相ping,维护好容器之间的关系，容器之间可以互相访问
   ```

   ![picture](/img/docker02.png)

5. 网络互联

   如图，两个网络不可以实现互相访问

   ![picture](/img/docker03.png)

    ```shell
   docker run -d -P --name tomcat01 tomcat
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker exec -it tomcat01 ping tomcat-net-01    # 无法ping,需要打通两个网路
    ```

连通两个网路:（tomcat01-net-01 === tomcat01 ）

```shell
$ docker network connect mynet tomcat01
$ docker network inspect mynet
# 这使得tomcat01拥有两个ip，使得tomcat01和tomcat01-net-01可以连通
```

![picture](/img/docker04.png)
=======
---
title: Docker Usage
categories:
  - 计算机基础技术
tags:
  - docker
abbrlink: 23336
date: 2022-03-15 09:40:47
---

## Docker

### 目录

* Docker概述
* Docker安装
* Docker命令
  * 镜像命令
  * 容器命令
  * 操作命令
* Docker镜像
* DockerFile
* Docker网络原理

### Docker概述

使用`docker`,采用镜像文件，下载镜像即可使用。

Docker思想来自于集装箱

隔离：Docker核心思想，打包装箱，每个箱子互相隔离。

#### Docker作用

类似于一个虚拟机作用。

虚拟机技术：资源占用多大，冗余步骤多，启动慢

容器化技术: 不是模拟一个操作系统，每一个容器可以运行在操作系统内核种，且独立运行

#### Docker基本组成

镜像(image)：一个模板，通过模板运行容器服务，通过镜像可以创建多个容器。

容器(container):独立运行一个或者一组应用，通过镜像创建:启动，停止，删除，基本命令。

仓库(repository):仓库就是存放镜像的大方，同时配置镜像加速。

client：

构建容器:docker build

拉取容器:docker pull

运行容器:docker run  

### Docker安装

看docker官方[帮助文档](docs.docker.com)

卸载旧的docker

```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
```

安装需要的包

```shell
sudo apt-get update
sudo apt-get install \
ca-certificates \
curl \
gnupg \
lsb-release

```

添加官方GPG密钥

```shel
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

选择稳定版仓库

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

安装docker(docker-ce 社区版)

```shell
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

启动docker

```shell
docker version
```

测试`Hello word`

1. 首先如果没有镜像，自动到docker-hub拉取镜像,如果没有就会报错
2. 查看下载的镜像列表

```shell
sudo docker run hello-world
sudo docker images           
```

卸载docker

```shell
# 卸载依赖
sudo apt-get purge docker-ce docker-ce-cli containerd.io

# 卸载资源
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

腾讯云镜像加速构建

```shell
# 修改配置文件
sudo vi /lib/systemd/system/docker.service
# 文件内操作(修改)
ExecStart=/usr/bin/dockerd -H fd:// --registry-mirror=https://mirror.ccs.tencentyun.com
# 保存一次执行如下命令
sudo service docker restart
sudo systemctl daemon-reload
sudo service docker restart
# 运行下面命令，确认docker info中的Registry Mirror值为https://mirror.ccs.tencentyun.com
sudo docker info 
#info 

```

![picture](/img/docker.png)

### Docker命令

docker底层原理:Docker是一个Client-Server结构系统，Docker的守护进程运行在主机上。通过Socket从客户端访问！
DockerSever接收到Docker-Clinet指令，就行执行指令。
Docker利用宿主主机内核，vm是需要OS的，因此速度很快。

1. Docker帮助命令

   ```shell
   docker  version   # 显示docker的版本信息 
   docker  info      # 显示docker的系统信息，包括镜像和容器数量
   docker 命令 --help # 查看命令参考
   ```

2. 查看镜像

   ```shell
   docker images -a  # 列出镜像
   ```

3. 搜索镜像

   ```shell
   docker search [环境名字]
   ## eg docker search mysql
   #使用--filter过滤
   ## eg docker search mysql --filter=STARS=5000
   ```

4. 下载镜像

   ```shell
   docker pull [镜像名字]
   docker pull [镜像名字]  tag
   # eg  docker pull mysq:5.7
   ```

5. 删除镜像

   ```shell
   docker rmi -f [镜像ID]               # 删除一个容器
   docker rmi -f $(docker images -aq)   # 删除多个容器
   ```

6. 新建容器并使用

   ```shell
   docker pull ubuntu:20.04
   docker run [参数] image
   
   # 参数内容
   --name="Name"  容器名字，用于区分容器
   -d             后台运行
   -it            使用交互方式运行,进入容器内查看
   -p        
       -p ip:主机端口:容器端口
       -p 主机端口:容器端口 (常用)
       -p 容器端口
    -p  随机指定端口
    
   # 测试
   启动并进入容器:docker run -it ubuntu /bin/bash
   #退出容器
   退出并停止:exit
   仅仅推出容器:Ctrl + P + Q 
   # 查看运行的容器
   列出正在运行的容器: docker ps 
   列出正在和历史运行的容器: docker ps -a
   列出当前当前运行容器的编号: docker ps -aq
   # 删除容器
   docker rm [id]   # 不能删除正在运行的容器
   # 启动/重启/停止容器
   docker start      [容器id]
   docker restart    [容器id]
   docker stop       [容器id]
   docker kill       [容器id]
    # 查看容器内发生了什么
    docker inspect   [容器id]
   ```

7. 常用其他命令

   ```shell
   # docker 容器使用后台运行，必须要有一个前台进程,docker发现没有应用就会自动停止
   docker run -d
   # docker 日志信息
   docker logs -f -t
   ```

8. 进入正在运行的容器

   ```shell
   # 命令一
   docker exec -it [ID] /bin/bash
   # 命令二
   docker attach [ID]            # 打开的是正在运行的命令行而不是新的窗口
   ```

9. 从容器内拷贝文件到容器外

   ```shell
   docker cp 容器id:文件路径  容器外路径
   ```

10. 删除容器

   ```shell
docker rmi 容器名
   ```

### 发布自己的镜像至Github-Hub

```shell
docker login -u mckinleylu
docker tag [id]  [标签]
docker push [mckinleylu]/REPOSITORY:1.0
```

### 发布自己的镜像至阿里云

```shell
创建命名空间(一个账号只能创建三个)
创建容器镜像
上传镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
$ docker push registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
下载镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker pull registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
```

### Dockerfile

用来构建docker镜像文件，即命令参数文件。

构建步骤

1. 编写一个dockerfile文件
2. docker build 构建一个镜像
3. docker run 运行镜像
4. docker push 发布镜像

```dockerfile
FROM                                 # 基础镜像 -- 一切从这里开始
MAINTAINER                           # 镜像是谁写的
RUN                                  # 镜像构建的时候需要运行的命令
ADD                                  # 步骤
WORKDIR                              # 镜像工作目录
VOLUME                               # 挂载目录
EXPOSE                               # 指定对外端口  和 -p 一样
CMD                                  # 指定容器启动的时候要运行的命令，只有最后一个会生效
ENTRYPOINT                           # 指定容器启动的时候要运行的命令，可以进行追加
ONBUILD                              # 当构建一个被继承 Dockerfile 这个时候会运行 这个指令
COPY                                 # 将文件拷贝到镜像中
ENV                                  # 构建的时候涉及环境变量
```

### 自写镜像

Docker Hub 中 99%的镜像都是从这个基础镜像`FROM scrarch`来的

```dockerfile
# dockerfileOne
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
RUN        apt install flex
RUN        apt install basion
EXPOSE 80
CMD  echo $MYPATH
CMD  echo "---end---"
CMD   ["ls","-a"]
CMD   ["mkdir","home"]
CMD   ["mkdir","/home/mckinleylu"]
CMD /bin/bash                         # 只有最后一个CMD被执行，即这句话
```

```shell
$ docker build -f [dockerfilename] -t [标签]:[版本号]
$ docker history [容器id]
```

```dockerfile
#DockerFileTwo
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
ENTRYPOINT ["ls","-a"]
ENTRYPOINT ["mkdir","home"]
```

### Docker 网络

1. 清空环境

```shell
$ docker rm -f $(docker ps -aq)        
$ docker rmi -f $(docker images -aq)    
```

2. 测试获取ip

   ```shell
   ip addr
   # ln  本地回环地址
   # etho: 内网地址
   # docker0: docker0d
   ```

3. 容器网络访问

   ```shell
   $ docker run -d -P --name tomcat01 tomcat
   $ docker exec -it tomcat01 ip addr
   ```

   * 每启动一个docker容器，docker容器就会给docker容器分配一个ip,只要安装了docker就会有一个网课，采用桥接模式，使用的技术是enth-pair技术

   * 容器带来的网卡是一对的,一对虚拟设备接口(enth-pair)

   * 利用(enth-pair)作为桥梁，连接各种虚拟网路设备

   * 容器直接也可以互相ping通

     ![picture](/img/docker01.png)

4. 自定义网络

   ```shell
   # 显示所有网路
   docker network ls 
   # 网络模式
   bridge 桥接(默认)   
   none   不配置网络(默认)
   host   和宿主机共享网络
   
   # 创建网络
   # 直接启动命令  默认 --net bridge  这是docker0如此默认设置
   # docker0特点 ， 默认 ，域名不能访问     -- link就可以打通连接
   $ docker run -d -P --name tomcat01 tomcat <==> docker run -d -P --name tomcat01 -- net bridge tomcat 
   
   # 创建网络
   docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
   #查看自己配置的网路详情
   docker network inspect mynet
   
   
   再创建容器
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker run -d -P --name tomcat01-net-02 --net mynet tomcat
   
   # ping测试
   docker exec -it tomcat01-net-01 ping 192.168.0.3
   #### 自定义的我网络docker可以互相ping,维护好容器之间的关系，容器之间可以互相访问
   ```

   ![picture](/img/docker02.png)

5. 网络互联

   如图，两个网络不可以实现互相访问

   ![picture](/img/docker03.png)

    ```shell
   docker run -d -P --name tomcat01 tomcat
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker exec -it tomcat01 ping tomcat-net-01    # 无法ping,需要打通两个网路
    ```

连通两个网路:（tomcat01-net-01 === tomcat01 ）

```shell
$ docker network connect mynet tomcat01
$ docker network inspect mynet
# 这使得tomcat01拥有两个ip，使得tomcat01和tomcat01-net-01可以连通
```

![picture](/img/docker04.png)
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: Docker Usage
categories:
  - 计算机基础技术
tags:
  - docker
abbrlink: 23336
date: 2022-03-15 09:40:47
---

## Docker

### 目录

* Docker概述
* Docker安装
* Docker命令
  * 镜像命令
  * 容器命令
  * 操作命令
* Docker镜像
* DockerFile
* Docker网络原理

### Docker概述

使用`docker`,采用镜像文件，下载镜像即可使用。

Docker思想来自于集装箱

隔离：Docker核心思想，打包装箱，每个箱子互相隔离。

#### Docker作用

类似于一个虚拟机作用。

虚拟机技术：资源占用多大，冗余步骤多，启动慢

容器化技术: 不是模拟一个操作系统，每一个容器可以运行在操作系统内核种，且独立运行

#### Docker基本组成

镜像(image)：一个模板，通过模板运行容器服务，通过镜像可以创建多个容器。

容器(container):独立运行一个或者一组应用，通过镜像创建:启动，停止，删除，基本命令。

仓库(repository):仓库就是存放镜像的大方，同时配置镜像加速。

client：

构建容器:docker build

拉取容器:docker pull

运行容器:docker run  

### Docker安装

看docker官方[帮助文档](docs.docker.com)

卸载旧的docker

```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
```

安装需要的包

```shell
sudo apt-get update
sudo apt-get install \
ca-certificates \
curl \
gnupg \
lsb-release

```

添加官方GPG密钥

```shel
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

选择稳定版仓库

```shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

安装docker(docker-ce 社区版)

```shell
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

启动docker

```shell
docker version
```

测试`Hello word`

1. 首先如果没有镜像，自动到docker-hub拉取镜像,如果没有就会报错
2. 查看下载的镜像列表

```shell
sudo docker run hello-world
sudo docker images           
```

卸载docker

```shell
# 卸载依赖
sudo apt-get purge docker-ce docker-ce-cli containerd.io

# 卸载资源
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

腾讯云镜像加速构建

```shell
# 修改配置文件
sudo vi /lib/systemd/system/docker.service
# 文件内操作(修改)
ExecStart=/usr/bin/dockerd -H fd:// --registry-mirror=https://mirror.ccs.tencentyun.com
# 保存一次执行如下命令
sudo service docker restart
sudo systemctl daemon-reload
sudo service docker restart
# 运行下面命令，确认docker info中的Registry Mirror值为https://mirror.ccs.tencentyun.com
sudo docker info 
#info 

```

![picture](/img/docker.png)

### Docker命令

docker底层原理:Docker是一个Client-Server结构系统，Docker的守护进程运行在主机上。通过Socket从客户端访问！
DockerSever接收到Docker-Clinet指令，就行执行指令。
Docker利用宿主主机内核，vm是需要OS的，因此速度很快。

1. Docker帮助命令

   ```shell
   docker  version   # 显示docker的版本信息 
   docker  info      # 显示docker的系统信息，包括镜像和容器数量
   docker 命令 --help # 查看命令参考
   ```

2. 查看镜像

   ```shell
   docker images -a  # 列出镜像
   ```

3. 搜索镜像

   ```shell
   docker search [环境名字]
   ## eg docker search mysql
   #使用--filter过滤
   ## eg docker search mysql --filter=STARS=5000
   ```

4. 下载镜像

   ```shell
   docker pull [镜像名字]
   docker pull [镜像名字]  tag
   # eg  docker pull mysq:5.7
   ```

5. 删除镜像

   ```shell
   docker rmi -f [镜像ID]               # 删除一个容器
   docker rmi -f $(docker images -aq)   # 删除多个容器
   ```

6. 新建容器并使用

   ```shell
   docker pull ubuntu:20.04
   docker run [参数] image
   
   # 参数内容
   --name="Name"  容器名字，用于区分容器
   -d             后台运行
   -it            使用交互方式运行,进入容器内查看
   -p        
       -p ip:主机端口:容器端口
       -p 主机端口:容器端口 (常用)
       -p 容器端口
    -p  随机指定端口
    
   # 测试
   启动并进入容器:docker run -it ubuntu /bin/bash
   #退出容器
   退出并停止:exit
   仅仅推出容器:Ctrl + P + Q 
   # 查看运行的容器
   列出正在运行的容器: docker ps 
   列出正在和历史运行的容器: docker ps -a
   列出当前当前运行容器的编号: docker ps -aq
   # 删除容器
   docker rm [id]   # 不能删除正在运行的容器
   # 启动/重启/停止容器
   docker start      [容器id]
   docker restart    [容器id]
   docker stop       [容器id]
   docker kill       [容器id]
    # 查看容器内发生了什么
    docker inspect   [容器id]
   ```

7. 常用其他命令

   ```shell
   # docker 容器使用后台运行，必须要有一个前台进程,docker发现没有应用就会自动停止
   docker run -d
   # docker 日志信息
   docker logs -f -t
   ```

8. 进入正在运行的容器

   ```shell
   # 命令一
   docker exec -it [ID] /bin/bash
   # 命令二
   docker attach [ID]            # 打开的是正在运行的命令行而不是新的窗口
   ```

9. 从容器内拷贝文件到容器外

   ```shell
   docker cp 容器id:文件路径  容器外路径
   ```

10. 删除容器

   ```shell
docker rmi 容器名
   ```

### 发布自己的镜像至Github-Hub

```shell
docker login -u mckinleylu
docker tag [id]  [标签]
docker push [mckinleylu]/REPOSITORY:1.0
```

### 发布自己的镜像至阿里云

```shell
创建命名空间(一个账号只能创建三个)
创建容器镜像
上传镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
$ docker push registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
下载镜像
$ docker login --username=mckinl**** registry.cn-hangzhou.aliyuncs.com
$ docker pull registry.cn-hangzhou.aliyuncs.com/20220309/mckinleylu:[镜像版本号]
```

### Dockerfile

用来构建docker镜像文件，即命令参数文件。

构建步骤

1. 编写一个dockerfile文件
2. docker build 构建一个镜像
3. docker run 运行镜像
4. docker push 发布镜像

```dockerfile
FROM                                 # 基础镜像 -- 一切从这里开始
MAINTAINER                           # 镜像是谁写的
RUN                                  # 镜像构建的时候需要运行的命令
ADD                                  # 步骤
WORKDIR                              # 镜像工作目录
VOLUME                               # 挂载目录
EXPOSE                               # 指定对外端口  和 -p 一样
CMD                                  # 指定容器启动的时候要运行的命令，只有最后一个会生效
ENTRYPOINT                           # 指定容器启动的时候要运行的命令，可以进行追加
ONBUILD                              # 当构建一个被继承 Dockerfile 这个时候会运行 这个指令
COPY                                 # 将文件拷贝到镜像中
ENV                                  # 构建的时候涉及环境变量
```

### 自写镜像

Docker Hub 中 99%的镜像都是从这个基础镜像`FROM scrarch`来的

```dockerfile
# dockerfileOne
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
RUN        apt install flex
RUN        apt install basion
EXPOSE 80
CMD  echo $MYPATH
CMD  echo "---end---"
CMD   ["ls","-a"]
CMD   ["mkdir","home"]
CMD   ["mkdir","/home/mckinleylu"]
CMD /bin/bash                         # 只有最后一个CMD被执行，即这句话
```

```shell
$ docker build -f [dockerfilename] -t [标签]:[版本号]
$ docker history [容器id]
```

```dockerfile
#DockerFileTwo
FROM ubuntu
MAINTAINER  mckinleylu
ENV  MYPATH /usr/local
WORKDIR    $MYPATH
ENTRYPOINT ["ls","-a"]
ENTRYPOINT ["mkdir","home"]
```

### Docker 网络

1. 清空环境

```shell
$ docker rm -f $(docker ps -aq)        
$ docker rmi -f $(docker images -aq)    
```

2. 测试获取ip

   ```shell
   ip addr
   # ln  本地回环地址
   # etho: 内网地址
   # docker0: docker0d
   ```

3. 容器网络访问

   ```shell
   $ docker run -d -P --name tomcat01 tomcat
   $ docker exec -it tomcat01 ip addr
   ```

   * 每启动一个docker容器，docker容器就会给docker容器分配一个ip,只要安装了docker就会有一个网课，采用桥接模式，使用的技术是enth-pair技术

   * 容器带来的网卡是一对的,一对虚拟设备接口(enth-pair)

   * 利用(enth-pair)作为桥梁，连接各种虚拟网路设备

   * 容器直接也可以互相ping通

     ![picture](/img/docker01.png)

4. 自定义网络

   ```shell
   # 显示所有网路
   docker network ls 
   # 网络模式
   bridge 桥接(默认)   
   none   不配置网络(默认)
   host   和宿主机共享网络
   
   # 创建网络
   # 直接启动命令  默认 --net bridge  这是docker0如此默认设置
   # docker0特点 ， 默认 ，域名不能访问     -- link就可以打通连接
   $ docker run -d -P --name tomcat01 tomcat <==> docker run -d -P --name tomcat01 -- net bridge tomcat 
   
   # 创建网络
   docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
   #查看自己配置的网路详情
   docker network inspect mynet
   
   
   再创建容器
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker run -d -P --name tomcat01-net-02 --net mynet tomcat
   
   # ping测试
   docker exec -it tomcat01-net-01 ping 192.168.0.3
   #### 自定义的我网络docker可以互相ping,维护好容器之间的关系，容器之间可以互相访问
   ```

   ![picture](/img/docker02.png)

5. 网络互联

   如图，两个网络不可以实现互相访问

   ![picture](/img/docker03.png)

    ```shell
   docker run -d -P --name tomcat01 tomcat
   docker run -d -P --name tomcat01-net-01 --net mynet tomcat
   docker exec -it tomcat01 ping tomcat-net-01    # 无法ping,需要打通两个网路
    ```

连通两个网路:（tomcat01-net-01 === tomcat01 ）

```shell
$ docker network connect mynet tomcat01
$ docker network inspect mynet
# 这使得tomcat01拥有两个ip，使得tomcat01和tomcat01-net-01可以连通
```

![picture](/img/docker04.png)
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
