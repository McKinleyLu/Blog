---
title: Rust语言入门-变量与数据类型
date: 2021-07-20 10:20:12
toc : true
cover : /img/9.jpg
categories: 
  - 编程语言
  - Rust
tags: 
  - Rust
---
### **变量与可变性**

#### **变量声明规则**

 Rust语言变量声明采用关键字let，如下：<!-- more -->

```rust
let example = 2 ;              // 定义不可修改变量example                                        ✔️
let mut changeable= 3;         // 定义可修改变量changeable     mut == mutable  可修改的           ✔️
let example = 5 ;              // 重新定义example值为5                                           ✔️

let wrong = 12;
wrong     = 44;                                                                                  ❌   
```

另外，在定义时可以不指明类型，也可以指明类型

```rust
let example: u32 = 100_000;                                                                        ✔️
let example: u32 = 100_000;                                                                        ✔️
```

#### 常量声明规则

1. 常量可在程序任何地方声明

2. 常量声明时必须赋值，且值永不可改

   ```rust
   const CONST: u32 = 100_000;     //数字可带下划线，方便阅读 
   ```

### 数据类型

  Rust 是一种静态语言，这意味着它必须在编译时知道所有变量的类型。编译器通常可以根据值以及我们如何使用它来推断我们想要使用的类型。

```
let guess      =  42                                                                                ✔️

let guess: u32 = "42".parse().expect("Not a number!");                                              ✔️
let guess      = "42".parse().expect("Not a number!");   //解析时必须添加类型注释                     ❌ 
```

#### **整型范围**

| 长度   | 带符号  | 不带符号 |
| ------ | ------- | -------- |
| 8 位   | `i8`    | `u8`     |
| 16 位  | `i16`   | `u16`    |
| 32 位  | `i32`   | `u32`    |
| 64 位  | `i64`   | `u64`    |
| 128 位 | `i128`  | `u128`   |
| arch   | `isize` | `usize`  |

#### **浮点类型**

  浮点类型有两种，32位和64位,默认为64位。

 ```rust
 
     let x = 2.0;          // f64
     
     let y: f32 = 3.0;     // f32
 
 ```

#### **布尔类型**

   bool，即有rue和false两种值。 但注意的时，和C语言不同，C语言的条件判断默认正数是true，非正数是false，但是rust中条件判断中只能是true或false。

```rust

    let t = true;
    
    if t  {x = 32;}                                                                                     ✔️         
    
    if 1  {x = 32;}                                                                                     ❌
    

```

#### **进制表示**

| 进制             | 举例                    |
| ---------------- | ----------------------- |
| Decimal          | `98_222`                |
| Hex              | `0xff`                  |
| Octal            | `0o77`                  |
| Binary           | `0b1111_0000`           |
| Byte (`u8` only) | `b'A'`（显示A的二进制） |

### **复合类型**

#### **元组类型**

1. 元组是将具有多种类型的多个值组合成一个复合类型的通用方法。

2. 元组有固定的长度：一旦声明，它们的大小就不能增长或缩小。

3. 元组中不同值的类型不必相同。

   ```rust
   let example: (i32, f64, u8) = (20, 1.2, 8);
   
   let (x, y, z) = example;
   
   println!("The value of y is: {}", y);
   ```

4. 除了通过模式匹配进行解构之外，我们还可以通过使用句点 ( `.`) 后跟我们想要访问的值的索引来直接访问元组元素

   ```rust
   let example: (i32, f64, u8) = (20, 1.2, 8);
   
   let a = example.0;
   
   let b = example.1;
   
   let c = example.2;
   ```

#### **数组类型**

1. 拥有多个值的集合的另一种方法是使用数组。

2. 数组与元组不同，数组的每个元素都必须具有相同的类型。

3. Rust 中的数组与其他一些语言中的数组不同，因为 Rust 中的数组具有固定长度(和C语言一样)。

4. 同变量，可以指明也可以不指明类型和长度

   ```rust
   let example            = [1, 2, 3, 4, 5];
   
   let example: [i32; 5]  = [1, 2, 3, 4, 5];
   ```

5. 如果想创建一个数组，其中每个元素都包含相同的值，您可以指定初始值，后跟一个分号，然后是长度方括号中的数组

   ```rust
   let example[1;9];
   ```

6. 数组类型的访问(同C语言)

   ```rust
   let example = [1, 2, 3, 4, 5];
   
   let a       = example[0];
   
   let b       = example[1];
   ```

   
