---
title: Rust语言入门-1-Rust与Cargo安装和使用
toc: true
cover: /img/9.jpg
categories:
  - 编程语言
  - Rust
tags:
  - Rust
abbrlink: 24264
date: 2021-07-19 07:43:22
---

### 简介 

  Rust语言是一个系统编程语言，为了实现自制OS，因而学习Rust.<!-- more -->

### Rust安装

使用Linux系统，命令如下

```shell
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

之后一路点击回车极好，最后验证是否安装成功：

```shell
#查看Rust版本号
$ rustc --version
```

### Rust更新与卸载

```shell
#更新
$ rustup update
#卸载
$ rustup self uninstall
```

### 运行第一个Rust程序

首先创建好保存Rust程序的目录

```shell
$ mkdir rust_language
```

接下来，创建Rust文件 main.rs

```rust
fn main(){
    printfln!("Hello World");
}
```

创建完毕后编译运行该main.rs

```shell
$ rustc main.rs
$ ./main
Hello, world!
```

如果发现使用vscode无法修改main.rs,则使用如下命令，修改整个Rust项目目录的读写权限

```shell
$ chmod 777 -R 要改变权限的目录名称
```

### Cargo

  Cargo 是 Rust 的构建系统和包管理器。 大多数 Rustaceans 使用这个工具来管理他们的 Rust 项目，因为 Cargo 为你处理了很多任务，比如构建代码、下载代码依赖的库以及构建这些库。（我们将您的代码需要的库称为依赖项。)  Cargo在Rust安装时自动安装。

### Cargo的使用

  创建Rust语言项目，直接使用Cargo

```shell
$ cargo new hello_cargo
$ cd hello_cargo
```

之后我们打开Cargo创建的项目目录，如下图

![Cargo项目目录](/img/cargo1.jpg)

1. Cargo.toml

   ```toml
   [package]
   name = "guess_game"
   version = "0.1.0"
   edition = "2018"
   
   # See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
   
   [dependencies]
   rand  = "0.5.5"   #添加外部依赖
   ```

   

   这个文件是 TOML（Tom's Obvious, Minimal Language）格式，这是 Cargo 的配置格式。

   第一行 [package] 是一个节标题，表示以下语句正在配置一个包。 随着我们向此文件添加更多信息，我们将添加其他部分。

   接下来的四行设置了 Cargo 编译程序所需的配置信息：名称、版本、编写者以及要使用的 Rust 版本。 Cargo 从您的环境中获取您的姓名和电子邮件信息，因此如果该信息不正确，请立即修复信息，然后保存文件。 

   最后一行 [dependencies] 是一个部分的开始，用于列出项目的任何依赖项。 在 Rust 中，代码包被称为 crate。 我们不需要这个项目的任何其他 crate.

2. Cargo.lock

   这里写有Cargo下载的依赖包

### Cargo项目的创建与运行

Cargo项目创建

```shell
$ cargo build
```

Cargo项目的运行

```shell
$ cargo run
```

修改cargo程序，到cargo项目目录下的src中，修改main.rs即可

  

