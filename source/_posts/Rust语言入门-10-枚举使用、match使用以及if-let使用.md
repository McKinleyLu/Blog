---
title: Rust语言入门-10-枚举使用、match使用以及if-let-else使用
date: 2021-08-01 11:36:31
toc : true
cover : /img/9.jpg
categories: 
  - 编程语言
  - Rust
tags: 
  - Rust
---
### **枚举使用**

在定义变量使用枚举时，格式为`let` + 变量名 + `=` + 枚举名+`::` + 枚举值<!-- more -->，以下为举例：

```rust
enum  COLOR {
    YELLOW,
    GREEN,
    BLACK,
    PINK,
}

let yellow = COLOR :: YELLOW;
let green  = COLOR :: GREEN;
```

### **match的使用**

match的使用类似于C++中的switch语句，但要注意的是，每一个分支是 `类型名` + `::` + value.

和C++不同的是，match使用`_`代替C++中的`default`,并且match中每一种情况后不必加`break;`语句。

以下为示例

```rust
#[derive(Debug)]
enum COIN{
   Penny,
   Nickel,
   Dime,
   Quarter,
}

fn Value(coin: COIN) ->(i8){
    match coin {
        COIN :: Penny =>{
            println!("Good Luck!\n");
            1
        }
        COIN :: Nickel => 2,
        COIN :: Dime => 5,
        _ => -1,
    }
}

fn main() {
    let coin1 = COIN :: Penny ;
    let coin2 = COIN :: Quarter ;
    let coin3 = COIN :: Dime ;
    Value(coin1);
    Value(coin2);
    Value(coin3);
}

```

运行结果

![运行结果](/img/cargo5.jpg)

### **IF-LET-ELSE使用**

if-let-else和match作用差不多，主要是双分支结构，这里不再赘述，使用方法如下：

```rust
#[derive(Debug)]
enum  COLOR {
    YELLOW,
    GREEN,
    BLACK,
    PINK,
}
fn Select(color : COLOR)->(i32){
   if let COLOR::YELLOW  = color{
       1
   }
   else {
       0
   }
}
fn main(){
    let yellow = COLOR :: YELLOW;
    let green  = COLOR :: GREEN;
    println!("{:?}",Select(yellow));
    println!("{:?}",Select(green)); 
}
```

运行结果

![运行结果](/img/cargo6.jpg)
