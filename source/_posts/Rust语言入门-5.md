<<<<<<< HEAD
---
title: Rust语言入门-5-控制流
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - Rust
abbrlink: 11728
date: 2021-07-21 06:58:51
---
### **条件控制IF**

  Rust的if表达式功能和C++一样，但是判断条件的部分不加括号<!-- more -->  

  ```rust
  let x = 9 ;
  if x > 3 {
     y = 12 ;
  }
  else if  1 < x < 3{
     y =  19 ; 
  }
  else{
      y = 1;
  }
  ```

let 语句和if连用

```rust
let mut x = (if m > 7 {5} else {10});
```

### **循环控制**

#### **LOOP使用**

1. 如果loop语句没有break控制，则需要使用ctrl+c结束循环
2. loop语句可以有返回值,注意break和最后表达式的位置

```rust
loop{
    x = x + 10 ;
    break; x
}
```

#### **while使用**

使用方法和C++一样，如下所示

```rust
while x < 7{
    x = x + 1 ;
}
```

#### For使用

for的使用和python差不多，如下所示

```rust
    let a = [10, 20, 30, 40, 50];
    for element in a.iter() {
        println!("the value is: {}", element);
    }
```

for的反转输出方法

```rust
for element in (1..4).rev(){
     println!("The number is {}",element)
}
```

输出效果

![输出效果](/img/r2.jpg)



=======
---
title: Rust语言入门-5-控制流
toc: true
cover: /img/9.jpg
categories:
  - 计算机语言笔记
tags:
  - Rust
abbrlink: 11728
date: 2021-07-21 06:58:51
---
### **条件控制IF**

  Rust的if表达式功能和C++一样，但是判断条件的部分不加括号<!-- more -->  

  ```rust
  let x = 9 ;
  if x > 3 {
     y = 12 ;
  }
  else if  1 < x < 3{
     y =  19 ; 
  }
  else{
      y = 1;
  }
  ```

let 语句和if连用

```rust
let mut x = (if m > 7 {5} else {10});
```

### **循环控制**

#### **LOOP使用**

1. 如果loop语句没有break控制，则需要使用ctrl+c结束循环
2. loop语句可以有返回值,注意break和最后表达式的位置

```rust
loop{
    x = x + 10 ;
    break; x
}
```

#### **while使用**

使用方法和C++一样，如下所示

```rust
while x < 7{
    x = x + 1 ;
}
```

#### For使用

for的使用和python差不多，如下所示

```rust
    let a = [10, 20, 30, 40, 50];
    for element in a.iter() {
        println!("the value is: {}", element);
    }
```

for的反转输出方法

```rust
for element in (1..4).rev(){
     println!("The number is {}",element)
}
```

输出效果

![输出效果](/img/r2.jpg)



>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
