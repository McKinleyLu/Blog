---
title: Git Usage
categories:
  - dke
tags:
  - git
abbrlink: 39759
date: 2022-03-15 09:32:01
---

### GIT

This document will exhibit how to use GIT tool to make cooperation simply and  efficient.

### Directory

* Version Control

* The classification of the controllers

* Install Git 

* Fundamental Linux Instruction

* Deploy Git 

* Set up GIT project

* Use GITHUB

* GIT branch

  

### Version  Control

When we modify  a program ，we can use GIT to control programs' version which can save the history program.

### The classification of the control

It includes three genre: Local  version control 、Centralized version control、

#### Local version Control

Document and save the program data  every time , this method is always adopted to personal , such as RCS 

#### Centralized version control

All the program versions put on the server , the users only have their own versions on their personal PC , which means when the server break down , all the users only have their versions.

#### Distributed version control

All the user have all the version of the program , but it is not safe ,when someone leave company ,he may reveal the program .

### Install  Git 

Download the software on official website , install it with next steps till it is installed.

Attention : we do not need to deploy the environment path.

### Fundamental Linux Instruction

1. `cd`
2. `ls`
3. `pwd`
4. `touch `
5. `rm -r`    : delete a directory
6. `mkdir  `
7. `mv`
8. `reset`
9. `clear`
10. `#` : comment

### Deploy Git

1. After installing GIT , We need to set the email and user's name at first. The instructions as followed:

   ```shell
   git config --global user.name  [username]
   git config --global user.email [useremail]
   ```

   All the setting is stored in `C:\Users\[username]\.gitconfig`

2. The process of using GIT

   * PUSH

     `git add files => git commit => git push`. 

     Attention: `git add .` mean push all the modified files to remote repo.

   * PULL

     

3. Explanation the definitions

   - workplace: the place you save your programs in your PC.
   - Index/Stage: just a sort of documents , they will appear when you executed  the instruction `git add files`
   - Repository: local code library : the Head document content `ref : refs/heads/master` , the master means main branch, this is the push direction
   - Remote: remote repo

#### Set up GIT project

We only need to remember six instructions to use GIT : `git init`、`git clone`

1. `git init `: initialize the project   or  use `git clone + url `to create project from remote repo

2. `git status` :  show whether has untracked files or not

3. `git add files` : Store files to store area  which will be pushed to remote repo

4. `git commit -m` : add some notes

5. `git push` : push files to repo

6. we can use the file  `gitgnore` to prevent some files which you  do not want to push to remote repo

   ```shell
   # commit
   *.txt    # ingore all .txt files
   !lib.txt # do not push the file which name is lib.txt
   /temp    # only ignore the TODO type files  under the directory temp\
   build/   # all the files under the document build will not push to remote repo
   doc/*.txt # under the document doc , all .txt files will not push to remote repo
   
   ```

### Use GITHUB

1. create your own account

2. create `shh-keygen` in your local PC and deploy it to GITHUB(Password-free login)

   ```shell
   shh-keygen -t rsa   # use rsa to encode
   # open c:/user/[usename]/id_rsa.pub copy the code and deploy it to GITHUB
   ```

### GIT branch

Main  Branch : `Master`

Branch Instruction

```shell
git branch                                     # List all local branches
git branch -r                                  # List all remote branches
git branch [name]                              # Create new branch
git chechout -b [name]                         # Switch branch
git merge [name]                               # Merge a branch into current branch
git branch -d   [name]                         # Delete branch [name]

### delete remote branch
git push origin --delete  branch name
git branch - dr [remote/branch]
```



