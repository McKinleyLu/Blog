---
title: Rust语言入门-9-枚举初步
date: 2021-08-01 11:14:59
toc : true
cover : /img/9.jpg
categories: 
  - 编程语言
  - Rust
tags: 
  - Rust
---
### **枚举概念与定义**

枚举类似结构体，能够列出某些有穷序列集的所有成员。<!-- more -->

在Rust语言中，枚举的使用方法比再C++中更为灵活

### **枚举举例一**

在C++中，枚举最后一个成员不用加`,`,并且要在最后的`}`后加`;` 同时，在C++中，V4(第一个元素)默认值为0，V6值为1。

```c++
enum IPADDKIND{
    v4,
    v6
};
```

而在Rust语言中，注意最后一个成员需要加`,`，且`enum`定义最后无需加`;`

```rust
enum IPADDKIND{
   V4,
   V6,
}
```

### **枚举举例二**

在Rust语言中，成员可以指定类型

```rust
 enum IPADDKIND{
     V4(u8,u8,u8,u8),   
     V6(String),
 }
```

### Option枚举及其优于空值

`Option<T>`类似与C++的模板，T可以是任意的数据类型，并且`Option`可以设置空值成员`NONE`.

使用方法如下：

```rust
enum Option<T>{
    Some(T),
    None,
}

let y  = Some(10);
let z  = Option::<i32>::None;
```

注意的是，如果定义空值变量，必须注明类型，即z的类型为`Option::<i32>`

### **整体程序与打印效果**

#### **程序测试代码**

```rust
#[derive(Debug)]
enum IPADDKID{
    V4(u8,u8,u8,u8),
    V6(String),
}

enum Option<T>{
    Some(T),
    None,
}

fn main() {
    let Six = IPADDKID :: V4(192,168,3,1);
    let Four = IPADDKID :: V6(String :: from("::1"));


    let x  = 5 ;
    let y  = Some(10);
    let z  = Option::<i32>::None;
    println!("{:?}",y);
} 

```

#### **测试效果**

![运行结果](/img/cargo3.jpg)
