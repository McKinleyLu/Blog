<<<<<<< HEAD
---
title: Rust语言入门-8-方法语法
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - Rust
abbrlink: 58702
date: 2021-08-01 10:56:06
---
### **方法语法概念**

用`fn`关键字和名称声明，可以有参数和返回值，并且包含一些在从其他地方调用时运行的代码。然而，方法与函数的不同之处在于它们是在结构的上下文中定义的，并且它们的第一个参数始终是`self`，它表示正在调用该方法的结构的实例。<!-- more -->

以下为使用的具体例子：  

```rust
#[derive(Debug)]
struct  Rectangle{
    weight:u32,
    height:u32,
}
impl  Rectangle {
    fn area(&self)->(u32){
       self.weight * self.height
    }
}
fn main() {
    let rectangle = Rectangle{
        weight:15,
        height:20,
    };
    println!("{:?}",rectangle.area());
}

```

### **derive(Debug)**

引入这个可以在输出时使用`{:?}`，即可以在程序出现问题时返回程序错误原因。

实例运行结果：

参数高位为20，宽为15，最后求出长方形面积为300

![计算结果](/img/cargo2.jpg)
=======
---
title: Rust语言入门-8-方法语法
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - Rust
abbrlink: 58702
date: 2021-08-01 10:56:06
---
### **方法语法概念**

用`fn`关键字和名称声明，可以有参数和返回值，并且包含一些在从其他地方调用时运行的代码。然而，方法与函数的不同之处在于它们是在结构的上下文中定义的，并且它们的第一个参数始终是`self`，它表示正在调用该方法的结构的实例。<!-- more -->

以下为使用的具体例子：  

```rust
#[derive(Debug)]
struct  Rectangle{
    weight:u32,
    height:u32,
}
impl  Rectangle {
    fn area(&self)->(u32){
       self.weight * self.height
    }
}
fn main() {
    let rectangle = Rectangle{
        weight:15,
        height:20,
    };
    println!("{:?}",rectangle.area());
}

```

### **derive(Debug)**

引入这个可以在输出时使用`{:?}`，即可以在程序出现问题时返回程序错误原因。

实例运行结果：

参数高位为20，宽为15，最后求出长方形面积为300

![计算结果](/img/cargo2.jpg)
>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
