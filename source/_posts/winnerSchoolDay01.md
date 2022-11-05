---
title: winnerSchoolDay01
top: true
password: 0c2baa6084e92bab3a2aa81c8791b37730b9bc4e1f6c13730ba44c5850d7cfd4
categories:
  - 计算机基础知识
tags:
  - dke2022寒假培训
abbrlink: 49604
date: 2022-01-12 21:01:00
---

# 2022 Winter School 

## DAY 1

### GitPod

1. 打开
   * 方法一 ：开启[代理软件](https://chrome.google.com/webstore/detail/gitpod-always-ready-to-co/dodmmooeoklaejobgleioelladacbeki?utm_source=chrome-ntp-icon),去谷歌浏览器商店下载`GitPod`插件，会发现github的仓库旁边有`GitPod`图标，打开就会出现在线编程<!-- more -->
   * 方法二：使用`#`，即使用`https://gitpod.io/#` + 仓库地址，如`https://gitpod.io/#https://github.com/McKinleyLu/Dke_Winter`

2. 退出

   ![操作一](/img/2022/1.png)

   ![操作二](/img/2022/2.png)

   ​                   

3. 容器管理

   * 首先打开Open Dashboard

     ![Open Dashboard](/img/2022/3.png))          

   * 再点击Workspaces

     * 容器左边是绿点代表容器正在打开
     * 灰色代表容器关闭
     * 点击容器最右边下拉条，再点击`pin`，可以使得容器不被官方删除(如果不点击pin，14天后将被系统自动删除)

     ![点击Workspaces](/img/2022/4.png)

     ![点击pin](/img/2022/5.png)

4. 权限，这里指的是GitPod获取的Github仓库权限

   * 首先点击`Settings => Intergrations => 带绿色点的Github=>Edit permitission`

     ![点击](/img/2022/6.png)

     ![Edit permitission](/img/2022/7.png)

   * 全打勾，点击`Update Permission`

     ![Update Permission](/img/2022/8.png)

5. 配置

   下载自己喜欢的插件，推荐`coplot`、`C++`、`python`等

### Vscode入门

1. 插件推荐

   * Auto Close Tag
   * Better C++ Syntax
   * C/C++
   * C/C++ Extension Pack
   * C++ Intellisense
   * Cmake
   * Code Runner
   * Debugger for Java
   * Docker
   * Github Copilot
   * Gitpod
   * Gitpod Romote
   * Go
   * Jupyter
   * Python
   * Python Type Hint
   * Remote - SSH
   * Remote - Containers
   * Remote - WSL
   * vscode-icons

2. python文件调试方法

   * 首先打开`小虫子 => Add Configuration`

     ![小虫子 => Add Configuration](/img/2022/9.png)

     * 然后点击之前的源文件，设置断点，按`F5`，开始调试

3. 课上重点是，当我们实验想要添加的代码是否可用时，点击`terminal`框里的`DEBUG CONSOLE`，输入python代码，验证想要加的代码是否正确即可

4. 快捷键

   调试 ：`F5`

   调用插件: `ctrl + p + >`

### Linux命令基础

1. 源更新与包安装

   *  从服务器更新包列表 :`sudo apt update`
   *  再滚动更新本地列表 :`sudo apt full-upgrade `
   *  判断机器是否其他人也在用系统: `finger`
   *  重启，重新加载操作系统内核：`reboot `
   *  安装包:`sudo apt install 包名

2. 显示乌班图系统信息

   * 安装:`apt-get install neofetch`
   * 执行`neofetch`
     ![乌班图系统信息](/img/2022/10.png)

3. `apt`解释

   * apt-get 包管理器，非交互下，使用
   * apt对人类友好的交互

4. `clear`   清空控制台代码

5. `tldr`可以告诉命令具体的使用方法

   * 列出git用法:`tldr git`
   * 告诉你二级指令使用，即加一个减号:`tldr git-remote`

6. `ls`

   * 以列表方式列出文件:`ls -l`
   * 逆序:`ls -r`
   * 时间排序:`ls -t`
   * Example:`ls -r -t -l`

7. `cd`

8. `mkdir` 创建目录

9. 权限

   * d:列出目录内容

10. mv

    * 重命名文件夹 :`mv a.md   new.md`
    * 移动:` mv aa.md   fold`

11. `cp` 复制

    * `cp a.md ./b.md`

12. rm

    * 递归删除 ，删除目录：`rm -r`
    * 删除文件:`rm a.md `
    * 删库(f表示强制删除):`rm -rf / `

13. 软件包删除

    `sudo apt remove 包名字`

14. 光标移动

    * 光标移到前面  `ctrl a` 
    * 光标移到最后`ctrl e`

15. 株连九族的删除包

    * `sudo apt  purge   包名`

16. 删除过程依赖的包

    `sudo apt  autoclean`

17. 当前CPU中的进程

    * `htop`

18. 查看网络本机信息

    * `iftop`

19. 查看当前目录下文件占用空间

    * `du -h`

20. 查看电脑物理存储使用情况 (-h以人类方式查看)

    * `df -h`

21. 查看谁使用了电脑   (cd /var/log/lastlog)

    * `last`

22. 查看文件头几行或者尾几行

    * `head -n2 文件路径`
    * `tail -n2 文件路径`

23. `vim`快捷键

    * k上  l右 h左
    * 查看模式
    * 编辑模式    insert(`输入i`)  
    * 返回查看模式  `esc`
    * 删除           按  `v` ，用鼠标选择，再按`d`删除
    * 删除一行    `dd`
    * 命令模式    `esc+:`
    * 命令模式下  `:! 指令`，即可运行这个指令
    * 光标回到当前行最后一个位置   'shift  a'

24. 查看进程`ps`

    * `ps aux |      grep "gitpod"     |     grep -v  "grep"  > out.txt`
    * `grep "gitpod" `     所有带gitpod的程序拿出来
    * `grep -v  "grep" `   不把“grep”拿出来
    * `out.txt    `                 把结果写在文件out.txt中
    * ps aux | awk  '{ print $1  $2  $5}'  > temp .txt   拿取第1 2 5 列的内容

25. 下载文件

    * `wget -L url`

26. `netcat`(也可以使用nc命令调用)

    * `nc -vz ip `端口   判断目标主机端口是否打开

27. `ping`

    * 安装：                                 `sudo apt install iputils-ping`
    * 使用(c4指的是ping四次)       `ping -c4 ip`

28. `nslookup`

    * 安装
    
    * 查看网站ip信息
    
### 课后任务
#### ssh-copy-id

1. 首先 在本地机器打开终端输入`ssh-keygen -t rsa`，一路点回车，记住`key`放在的目录
2. 将目录中的`.pub`文件拷贝远程服务器的`~/.ssh`
3. 执行`cat id_dsa.pub >> ~/.ssh/authorized_keys`
4. 本地机器首次连接远程服务器需要密码，之后无需再需要输入密码

