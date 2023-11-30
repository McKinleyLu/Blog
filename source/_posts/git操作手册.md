<<<<<<< HEAD
<<<<<<< HEAD
---
title: git操作手册
author: 瑾年
tags:
  - git
categories:
  - 计算机基础技术
abbrlink: 47854
date: 2022-06-12 19:28:00
---
### git使用  完全版
#### git密钥生成与问题解决
##### 密钥生成
1. 打开终端,执行如下命令
```shell
ssh-keygen -t rsa -C “your_email.com”
```
密钥生成在id_rsa.pub中
2. 配置GitHub
   * github => setting => SSH => 填入密钥
   * 在本地终端使用 ssh -T git@github.com 判断是否连接成功
3. 连接云服务器
   * 将本地的id_rsa.pub传入/root/.ssh文件夹中
   * 使用cat id_rsa.pub >> ~/.ssh/authorized_keys
   通过此三步，实现ssh免密进行仓库维护
4. 问题处理
   * 本地上传代码到远程仓库,发现显示仓库不存在or远程仓库无法连接，则将本地./ssh中的known_hosts以及known_hosts_old文件删除即可

#### git本地分支创建与远程关联
1. 查看分支
```shell
git branch -a
```
其中白色为本地分支
    绿色为当前分支
    红色为远程分支
2. 创建新分支
```shell
git brach [new branch name]
```
3. 将新创建的分支提交远程
`git push <远程主机名> <本地分支名>:<远程分支名>`
```shell
git push origin newBranch:newBranch
```
4. 从远程更新(关联远程分支是否成功)已经选好的分支
```shell
git pull
```
提示`Already up-to-date.`表示关联成功
5. 创建分支存在的问题
  * 问题一：fatal: Not a valid object name: 'master'.
    * 问题描述:一个非法的master,原因：本地还没有创建master，你可以执行以下git branch，会发现没有看到本地分支列表
    * 解决方法：随便添加一个文件，然后执行`git add .`,此时master创建成功，再执行创建新的branch代码
  * 问题二: warning: adding embedded git repository: NeteaseCloudMusicApi
      * 问题描述:  使用 `git add .` 时，出现上述错误,是因为在当前 git 仓库中同时包含有另一个 git 仓库。
      * 解决方法：找到被嵌套的 git 仓库，并删除` .git `文件
      
#### git clone
1. 克隆指定分支
```shell
git clone -b 分支名字 xxx（链接）
```

#### git切换分支
```shell
git checkout [branch name]
```
为避免麻烦，请一定提交本地分支后，再切换分支，修改其他分支！！！

#### git分支合并

1. 合并本地分支代码
   ```shell
    # 切换到develop分支
   git checkout develop
   # 合并到新的分支
   git merge newBranch
   # 提交commit到远程（newBranch分支有多少个commit就会生成几个）
   git push
   ```

2. 远程分支合并

	```shell
	# 切换到本地分支
	git checkout newBrach
	# 从远程更新代码
	git pull
	# 回到develop分支
	git chechout develop
	# 合并分支
	git merge newBrach
	# 或者直接将远程分支newBranch pull过来给develop
	git pull origin newBranch
	```

3. 解决由合并带来的问题

如果待合并分支代码跟当前分支前几次commit修改了同一文件，就会出现"Merge failed"的报错
解决方法：
  * 打开报错文件
    ![picture](/img/git1.JPG)
  * 修改报错文件
    ![picture](/img/git2.JPG)
    告诉git冲突已经解决
```shell
git add -A
```
合并完成,提交代码:
```shell
git commit -m "[master]-合并newBranch代码"
git push
```
使用`git log`指令查看代码提交记录

#### git删除分支
1. 删除本地分支
```shell
# "-d" 如果该分支代码未合并到其他分支，将无法删除；
# "-D" 强制删除分支，不会出现任何提示；
git branch -D xxxx
```
2. 删除远程分支
```shell
git push origin --delete newBranch
```
3. 常见问题
  * 问题一:error: Cannot delete branch
    * 解决方法:此错误是在git删除分支时报的错误，删除分支时，当前分支不能停留在要删除的分支上，要切换到其他任意分支，再去删除目标分支。
    
#### git其他问题
1. 已经提交(`git add .`),如何放弃提交内容
```shell
git rm -r --cached .
```
2. 出现报错:fatal does not appear to be a git repository
  * 使用`git remote add [远程分支名]  远程仓库名进行`进行重新添加
3. 输入`git pull`时，出现如下警告
  * ```shell
  # 警告
  You asked to pull from the remote 'xxx', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.
    ```
=======
---
title: git操作手册
author: 瑾年
tags:
  - git
categories:
  - 计算机基础技术
abbrlink: 47854
date: 2022-06-12 19:28:00
---
### git使用  完全版
#### git密钥生成与问题解决
##### 密钥生成
1. 打开终端,执行如下命令
```shell
ssh-keygen -t rsa -C “your_email.com”
```
密钥生成在id_rsa.pub中
2. 配置GitHub
   * github => setting => SSH => 填入密钥
   * 在本地终端使用 ssh -T git@github.com 判断是否连接成功
3. 连接云服务器
   * 将本地的id_rsa.pub传入/root/.ssh文件夹中
   * 使用cat id_rsa.pub >> ~/.ssh/authorized_keys
   通过此三步，实现ssh免密进行仓库维护
4. 问题处理
   * 本地上传代码到远程仓库,发现显示仓库不存在or远程仓库无法连接，则将本地./ssh中的known_hosts以及known_hosts_old文件删除即可

#### git本地分支创建与远程关联
1. 查看分支
```shell
git branch -a
```
其中白色为本地分支
    绿色为当前分支
    红色为远程分支
2. 创建新分支
```shell
git brach [new branch name]
```
3. 将新创建的分支提交远程
`git push <远程主机名> <本地分支名>:<远程分支名>`
```shell
git push origin newBranch:newBranch
```
4. 从远程更新(关联远程分支是否成功)已经选好的分支
```shell
git pull
```
提示`Already up-to-date.`表示关联成功
5. 创建分支存在的问题
  * 问题一：fatal: Not a valid object name: 'master'.
    * 问题描述:一个非法的master,原因：本地还没有创建master，你可以执行以下git branch，会发现没有看到本地分支列表
    * 解决方法：随便添加一个文件，然后执行`git add .`,此时master创建成功，再执行创建新的branch代码
  * 问题二: warning: adding embedded git repository: NeteaseCloudMusicApi
      * 问题描述:  使用 `git add .` 时，出现上述错误,是因为在当前 git 仓库中同时包含有另一个 git 仓库。
      * 解决方法：找到被嵌套的 git 仓库，并删除` .git `文件
      
#### git clone
1. 克隆指定分支
```shell
git clone -b 分支名字 xxx（链接）
```

#### git切换分支
```shell
git checkout [branch name]
```
为避免麻烦，请一定提交本地分支后，再切换分支，修改其他分支！！！

#### git分支合并

1. 合并本地分支代码
   ```shell
    # 切换到develop分支
   git checkout develop
   # 合并到新的分支
   git merge newBranch
   # 提交commit到远程（newBranch分支有多少个commit就会生成几个）
   git push
   ```

2. 远程分支合并

	```shell
	# 切换到本地分支
	git checkout newBrach
	# 从远程更新代码
	git pull
	# 回到develop分支
	git chechout develop
	# 合并分支
	git merge newBrach
	# 或者直接将远程分支newBranch pull过来给develop
	git pull origin newBranch
	```

3. 解决由合并带来的问题

如果待合并分支代码跟当前分支前几次commit修改了同一文件，就会出现"Merge failed"的报错
解决方法：
  * 打开报错文件
    ![picture](/img/git1.JPG)
  * 修改报错文件
    ![picture](/img/git2.JPG)
    告诉git冲突已经解决
```shell
git add -A
```
合并完成,提交代码:
```shell
git commit -m "[master]-合并newBranch代码"
git push
```
使用`git log`指令查看代码提交记录

#### git删除分支
1. 删除本地分支
```shell
# "-d" 如果该分支代码未合并到其他分支，将无法删除；
# "-D" 强制删除分支，不会出现任何提示；
git branch -D xxxx
```
2. 删除远程分支
```shell
git push origin --delete newBranch
```
3. 常见问题
  * 问题一:error: Cannot delete branch
    * 解决方法:此错误是在git删除分支时报的错误，删除分支时，当前分支不能停留在要删除的分支上，要切换到其他任意分支，再去删除目标分支。
    
#### git其他问题
1. 已经提交(`git add .`),如何放弃提交内容
```shell
git rm -r --cached .
```
2. 出现报错:fatal does not appear to be a git repository
  * 使用`git remote add [远程分支名]  远程仓库名进行`进行重新添加
3. 输入`git pull`时，出现如下警告
  * ```shell
  # 警告
  You asked to pull from the remote 'xxx', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.
    ```
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: git操作手册
author: 瑾年
tags:
  - git
categories:
  - 计算机基础技术
abbrlink: 47854
date: 2022-06-12 19:28:00
---
### git使用  完全版
#### git密钥生成与问题解决
##### 密钥生成
1. 打开终端,执行如下命令
```shell
ssh-keygen -t rsa -C “your_email.com”
```
密钥生成在id_rsa.pub中
2. 配置GitHub
   * github => setting => SSH => 填入密钥
   * 在本地终端使用 ssh -T git@github.com 判断是否连接成功
3. 连接云服务器
   * 将本地的id_rsa.pub传入/root/.ssh文件夹中
   * 使用cat id_rsa.pub >> ~/.ssh/authorized_keys
   通过此三步，实现ssh免密进行仓库维护
4. 问题处理
   * 本地上传代码到远程仓库,发现显示仓库不存在or远程仓库无法连接，则将本地./ssh中的known_hosts以及known_hosts_old文件删除即可

#### git本地分支创建与远程关联
1. 查看分支
```shell
git branch -a
```
其中白色为本地分支
    绿色为当前分支
    红色为远程分支
2. 创建新分支
```shell
git brach [new branch name]
```
3. 将新创建的分支提交远程
`git push <远程主机名> <本地分支名>:<远程分支名>`
```shell
git push origin newBranch:newBranch
```
4. 从远程更新(关联远程分支是否成功)已经选好的分支
```shell
git pull
```
提示`Already up-to-date.`表示关联成功
5. 创建分支存在的问题
  * 问题一：fatal: Not a valid object name: 'master'.
    * 问题描述:一个非法的master,原因：本地还没有创建master，你可以执行以下git branch，会发现没有看到本地分支列表
    * 解决方法：随便添加一个文件，然后执行`git add .`,此时master创建成功，再执行创建新的branch代码
  * 问题二: warning: adding embedded git repository: NeteaseCloudMusicApi
      * 问题描述:  使用 `git add .` 时，出现上述错误,是因为在当前 git 仓库中同时包含有另一个 git 仓库。
      * 解决方法：找到被嵌套的 git 仓库，并删除` .git `文件
      
#### git clone
1. 克隆指定分支
```shell
git clone -b 分支名字 xxx（链接）
```

#### git切换分支
```shell
git checkout [branch name]
```
为避免麻烦，请一定提交本地分支后，再切换分支，修改其他分支！！！

#### git分支合并

1. 合并本地分支代码
   ```shell
    # 切换到develop分支
   git checkout develop
   # 合并到新的分支
   git merge newBranch
   # 提交commit到远程（newBranch分支有多少个commit就会生成几个）
   git push
   ```

2. 远程分支合并

	```shell
	# 切换到本地分支
	git checkout newBrach
	# 从远程更新代码
	git pull
	# 回到develop分支
	git chechout develop
	# 合并分支
	git merge newBrach
	# 或者直接将远程分支newBranch pull过来给develop
	git pull origin newBranch
	```

3. 解决由合并带来的问题

如果待合并分支代码跟当前分支前几次commit修改了同一文件，就会出现"Merge failed"的报错
解决方法：
  * 打开报错文件
    ![picture](/img/git1.JPG)
  * 修改报错文件
    ![picture](/img/git2.JPG)
    告诉git冲突已经解决
```shell
git add -A
```
合并完成,提交代码:
```shell
git commit -m "[master]-合并newBranch代码"
git push
```
使用`git log`指令查看代码提交记录

#### git删除分支
1. 删除本地分支
```shell
# "-d" 如果该分支代码未合并到其他分支，将无法删除；
# "-D" 强制删除分支，不会出现任何提示；
git branch -D xxxx
```
2. 删除远程分支
```shell
git push origin --delete newBranch
```
3. 常见问题
  * 问题一:error: Cannot delete branch
    * 解决方法:此错误是在git删除分支时报的错误，删除分支时，当前分支不能停留在要删除的分支上，要切换到其他任意分支，再去删除目标分支。
    
#### git其他问题
1. 已经提交(`git add .`),如何放弃提交内容
```shell
git rm -r --cached .
```
2. 出现报错:fatal does not appear to be a git repository
  * 使用`git remote add [远程分支名]  远程仓库名进行`进行重新添加
3. 输入`git pull`时，出现如下警告
  * ```shell
  # 警告
  You asked to pull from the remote 'xxx', but did not specify
a branch. Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.
    ```
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
  * 解决方法 `git pull xxx  master(由于自己的是esc的esc，就写的esc，即git pull esc esc) `