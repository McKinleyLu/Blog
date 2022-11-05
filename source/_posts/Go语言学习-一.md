---
title: Go语言学习(一)
author: 瑾年
mathjax: true
categories:
  - - 计算机语言笔记
tags:
  - Go
abbrlink: 50477
date: 2022-01-22 19:02:57
---
### GO语言基础学习一

#### 规则

1. `Go`语言写程序时，要求必须导入包，以及引用相关库，否则会报错
2. `Go`语言要求所有定义的变量必须使用，否则会报错

#### 相关terminal指令

1. 切换盘符：`d:+ 回车进入d盘`

2. 当前目录下内容: `dir`

3. 进入一个目录: `cd` 

4. 清屏: `cls`

5. **自动补全文件名**: `Tab`

6. **执行命令源码文件**: `go run`

7. **测试编译, 生成可执行文件**: `go build`

8. **解决module报错**: `go env -w GO111MODULE=auto  `

9. **便捷生成+执行**: `go run == go build + go`

10. **指定生成可执行文件名字**:`go build -o hello.exe .\varlearn.go  

11. **将go文件书写格式化起来，并保存修改，便于代码阅读**: `gofmt -w  .\varlearn.go`

12. 对于特别长的字符串，如果想用回车换行方便查看，必须使用字符串连接如

    ```go
    fmt.Println("ooooooooooooooooooooooo",
    "oooooooooooooooooooo",
    "oooooooooooooooooooo",
    "ooooooooooooooooooooooo",
    "oooooooooooooooooooooooo",
    "ooooooooooooooooooooooooo",
    "ooooooooooooooooooooooooo")
    ```
**注意**：同一个包的源码文件要放在不同文件夹，否则 go run 可以使用  go build不可以

#### 变量

所有申明的变量`必须`被使用。

变量声明方法有三种：

1. `var` + 变量名 + `类型`: 默认值是0
2. `var` + 变量名:自动推断类型
3.  `var` +变量名1,变量名2，变量名3 + `类型` : 一次性声明多个变量
4. `变量名` + `:=` + `值` :直接声明变量

**变量类型**

与`C++`类似，但需要注意以下几点:

1. `\r`光标定位到本行开头

2. 字符串中，有特殊字符，使用`~`号

3. 对于一个`string`类型，不可以修改其中一个数组下标的值，如

   ```Go
   s1 := "Heloo"
   s1[1] = 's'       //错，不可以单字符修改
   ```

#### 变量类型转换

1. 强制类型转换(`* => string`)

   * `int[byte] => string` :使用`fmt.Sprintf("%d[%c]",变量名)`

2. 使用`strconv函数`（* => string）

   * 使用`strconv()`函数：`strconv.FormatInt((int64)(变量名),进制)`
   * `string => float` :`strconv.Format((float64)(变量名),'f',保留小数点位数,64)`

3. 强制类型转换( `string= > *` )

   * `func ParseBool(str string) (value bool, err error)`:啊函数有两个返回值，一个是转换后的值，一个是错误报错，使用如下

     ```Go
     var s1 string = "true"
     var b bool
     b , _ = strconv.ParseBool(s1)
     fmt.Printf("b的类型是: %T b=%v \n",b,b)
     ```

   * `func ParseInt(s string, base int, bitSize int) (int64, err error)`:base指定进制（2到36），如果base为0，则会从字符串前置判断，"0x"是16进制，"0"是8进制，否则是10进制,使用如下：

     ```GO
     // string => int64
     var s2 string = "12255"
     var num2 int64
     num2 , _ = strconv.ParseInt(s2,9,64)
     fmt.Printf("num2的类型是: %T,num2=%v\n",num2,num2)
     ```

     

     

     





