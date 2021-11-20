---
title: Rust语言入门-7-结构体定义与使用
toc: true
cover: /img/9.jpg
categories:
  - 编程语言
  - Rust
tags:
  - Rust
abbrlink: 761
date: 2021-08-01 10:43:02
---
和`C++`，`JAVA`语言一样，Rust语言也有结构体。<!-- more -->
### **结构体**定义


基本定义为： `struct` + 结构体名字 + {   成员名：类型 ， 成员名： 类型， ...   }  

```rust
struct User{
    usename : String,
    active : bool,
    look   : String,
    face   : bool
}
```

### **结构体使用方法**

基本使用方法为： `let` + 变量名 +  =  + 结构体名 + {   .....  }  + ;

```rust
    let a1 = User{
        usename : String::from("kangkang"),
        active : false,
        look    : String::from("Beautiful"),
        face    : true,
    };
```

###  **结构体类型快速赋值**

如果先前已经定义了一个结构体变量，此时有需要定义一个结构体，新的结构体中一部分成员值和前面的结构体成员值是一样的，可以使用 ... + 原来结构体变量名 来进行快速赋值。 如下所示：

```rust
fn USE(name:String) -> (User){
    let x = User{
        usename : String::from(name),
        active  : true,
        look    : String::from("Just SOSO"),
        face    : false,

    };
    x
}

 let user1 =  USE(String::from("Lina"));
    
 let use2  = User{
      usename : String ::from("LiHua"),
      face    : false,
      ..user1     //  use2.active == use1.active    ......

    };
```

### **无名元组结构体**

定义结构为： `struct` + 元组名+ (类型一，类型二，...)

```rust
struct COLORS(u8,u8,u8);

let colors = COLORS(0,0,0);
```

