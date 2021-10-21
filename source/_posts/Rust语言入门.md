---
title: Rust语言入门-4-函数与注释
toc: true
cover: /img/9.jpg
categories:
  - 编程语言
  - Rust
tags:
  - Rust
abbrlink: 1326
date: 2021-07-20 15:35:40
---
### **函数**

#### 基本

 和C语言一样，rust语言也有函数。基本函数定义如下：<!-- more -->

```rust
fn auto_func(x: u32){
   println!("function argu is {}",x);
}
```

  注意如下几点：

1. 函数参数，必须带参数类型
2. rust函数名一般采用蛇形命名法

#### 语句与表达式

语句没有返回值，表达式有返回值，如下所示：

```rust
let mut a = 12 ;                             //语句

let mut b = {
    let x = 12 ;
    x + 1              //最终b的值位13        // {}里的是表达式
}；
```

注意：

1. 表达式最后不带分号
2. 语句块最后带分号

#### 函数返回值

 和Java、C不同，Rust函数定义无需指明返回值类型，不命名返回值，但确实需要在箭头 ( `->`)后声明它们的类型，使用函数内最后一个表达式返回一个值：

```rust
fn main(){
    
    let x = func(20);
    
    println!("The result is {}",x);

}

fn func(x: u32) -> i32 {                //返回值类型为->后面指定的类型
    x+80
}
```

最后，程序输出值为100

### 注释

  和C一样，单行用 \  ，多行用 \\\