---
title: Rust语言入门-2-Guess小游戏案例分析
date: 2021-07-20 10:19:59
toc : true
cover : /img/9.jpg
categories: 
  - 编程语言
  - Rust
tags: 
  - Rust
---
### 猜数游戏

#### **StageOne**

  首先，我们只进行数字的输入输出。<!-- more -->

```rust
use std::io;  //从标准库导入io
fn main() {
    println!("Guess the number!");        //打印提示信息

    println!("Please input your guess.");

    let mut guess = String::new();       // let关键字，声明变量，默认不可修改，可修改的话加 mut

    io::stdin()
        .read_line(&mut guess)           //mut == mutable 可变的
                                         //read_line 返回ResultType，OK 或者 ERROR
        .expect("Failed to read line");   //接收上面的ResultTYPE

    println!("You guessed: {}", guess);
```

  分析如下:

1. use std::io ,为使用标准输入输出库。
2. 创建对象是先写类型关键字再使用new
3. println!()函数，每加一个“{}”槽，可以打印一个信息

这里仅仅是生成了一个String对象，并对其进行赋值打印。

#### **StageTwo**

 接下来，我们对上面的猜数游戏进行进一步编写。

```Rust
use std::io;
use rand::Rng;
fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1..101);

    println!("The secret number is: {}", secret_number);

    println!("Please input your guess.");

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read line");

    println!("You guessed: {}", guess);
}
```

分析如下：

1. use rand::Rng                                               是使用了在cargo.xml中添加的rand库。
2.  rand::thread_rng().gen_range(1..101);        则是随机生成一个1-101之间的数字

#### **StageThree**

紧接着引入比较库，对输入以及系统生成的数字进行比对，输出最后猜出数字的结果

```Rust
use std::io;
use rand::Rng;
use std::cmp::Ordering;
fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1..101);

    println!("The secret number is: {}", secret_number);

    println!("Please input your guess.");

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read line");
    
    let guess: u32 = guess.trim().parse().expect("Please type a number!");

    println!("You guessed: {}", guess);

    match guess.cmp(&secret_number) {
        Ordering::Less => println!("Too small!"),
        Ordering::Greater => println!("Too big!"),
        Ordering::Equal => println!("You win!"),
    }
}
```

分析如下：

1.  在guess.trim().parse().expect中
   * trim()     作用是  **把特殊符号去掉，如回车等，只保留正常字符**
   * parse()  作用是  **把字符串转换为数字**，并返回ResulteType(OK  or ERROR)
   * expect()  则根据parse()返回值做出相应的动作
2. use std::cmp::Ordering; 是引入比较库的Order，用于比较,属于enum
3. guess.cmp(&secret_number) ，用于比较guess与secret_number的值，返回Less、Greater、Equal中的一种

#### **StageFour**

不难发现，上面的程序只能才一次，并且没有采用防御式编程的思想(即一次输入格式错误，需要从头再来)，因此做如下调整：

```Rust
use std::io;
use rand::Rng;
use std::cmp::Ordering;
fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1,101);

    println!("The secret number is: {}", secret_number);
   loop{
    println!("Please input your guess.");

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read line");
       
    let guess: u32 = match guess.trim().parse() {
        Ok(num) => num,
        Err(_) => continue,
    };
    println!("You guessed: {}", guess);

    match guess.cmp(&secret_number) {             
        Ordering::Less => println!("Too small!"), 
        Ordering::Greater => println!("Too big!"),
        Ordering::Equal => {
            println!("You win!");
            break;
        }
    }
} 
}
```

分析如下：

1. loop 为循环，可以最后符合条件后，使用break跳出循环
2. match guess.trim().parse()，将guess进行解析，如果是数字，程序顺序执行，否则循环再次输入

#### **StageFive**

  使用carge build 以及 carge run 执行程序即可。效果如下：

![GuessNumber](/img/r1.jpg)





