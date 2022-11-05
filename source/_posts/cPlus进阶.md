---
title: cPlus进阶
abbrlink: 36764
tags: 
- C++
categories: 
- 计算机语言笔记
date: 2022-04-19 10:22:00
---
### C++进阶

章节无次序

#### 创建类初始化对象

```java
#include <iostream>

class Person{
    public:
       int a,b,c ;
       Person(int aa , int bb ,int cc):a(aa),b(bb),c(cc){};
       int getA(){
           return a ;
       }
};

int main(int argc, char const *argv[])
{
    Person p(1,2,3);
    std::cout << p.getA() << std::endl;
    return 0;
}
```

#### 创建一个类的默认操作

创建一个类，c++编译器会给每一类至少添加三个函数

* 默认构造函数
* 默认析构函数
* 拷贝函数

如果自己写了拷贝函数，编译器不在提供其他的构造函数

如果自己写了默认构造函数，编译器不再提供默认构造函数，但是还提供拷贝构造函数

也就是说，如果自己写了拷贝函数，其他两个函数必须自己添加

```java
#include <iostream>
class Person{
    public:
       Person(){}
       ~Person(){}
    /*拷贝函数*
      Person(const Person &p){
         age = p.age;   
      }
    */
    int a ;
};

int main(){
    Person p ;
    p.a = 15;
    std::cout<<p1.a<<std::endl;
    return 0 ;
}
```

#### 多态早绑定

多态的早绑定在编译阶段，这就意味着，当子类指针给主类时，只能输出主类函数内容

在这里主要学习多态书写代码规则

```java
#include <iostream>

//静态多态
//地址早绑定  在编译阶段确定函数地址
class Animal{
public:
    void speak(){
        std::cout << "animal is speaking" <<std::endl;
    }    
    
};


class Cat:public Animal{
    void speak(){
       std::cout << "cat is speaking" <<std::endl;
    }
};

class Dog:public Animal{
    void speak(){
        std::cout << "dog is speaking" << std::endl;
    }
};

void doSpeak(Animal &animals){
     animals.speak();
}

int main(){
    Cat cats;
    doSpeak(cats);  // 父类引用接收子类对象
                    // C++允许父类指向子类对象
    return 0 ;
}

// 输出
/*
animal is speaking
animal is speaking
*/
```

#### 动态晚绑定

如果想执行，让猫说话，那么这个函数地址就不能提前绑定，需要在运行阶段进绑定,即地址晚绑定，动态多态

动态多态条件

* 有继承关系
* 重写父类虚函数(重写指函数返回值、参数列表、名称全部相同)

动态多态使用: 父类的指针或引用 执行子类对象

```java
class Animal{
    public:
        //虚函数
        virtual void speak(){
            std::cout << "animal is speaking" << std::endl;
        }
};

class Cat:public Animal{
    void speak(){
        std::cout << "Cat is speaking" << std::endl;
    }

};
int main(int argc, char const *argv[])
{
    Animal * p = new Cat();
    p->speak();
    return 0;
}
//输出
// Cat is speaking
```

#### 多态纯虚函数以及抽象函数

1. 纯虚函数
   * 无需写实现 比虚函数更好用
   * 纯虚函数语法   virtual + 返回值类型 + 函数名 + (参数列表) = 0 即可
   * 当类中有纯虚函数时，这个类也称为抽象类
2. 抽象类特点
   * 无法实例化对象
   * 子类必须重写抽象类中的纯虚函数，否则也属于抽象类

```java
#include<iostream>

class Base{
    public:
     virtual void func() = 0 ;
};

class Son:public Base{
    void func(){
        std::cout<<"Son func"<<std::endl;
    }
};
int main(int argc, char const *argv[])
{
    Base * p = new Son();
    p->func();
    return 0;
}

```

#### 多态案例

##### 多态计算器

```java
#include <iostream>
class Calculator{
    public:
     virtual int getResult(int a ,int b ) = 0;

    int a ,  b ; 
};

class add:public Calculator{
    public:
       int getResult(int a ,int b ){
           return a + b;
       }
    int a,b;
};
int main(int argc, char const *argv[])
{
    Calculator * p = new add();
    std::cout<<p->getResult(10,20)<<std::endl;

    return 0;
}

```

##### 多态案例制作饮品

注意，父类所有虚函数都必须在子类中实现。

```java
#include <iostream>
class Drink{
    public:
     virtual void water() = 0;
     virtual void material() = 0 ;
     virtual void cup() = 0 ;
};

class Coffee:public Drink{
    public:
       void water(){
           std::cout << "brown" << std::endl;
       }
       void material(){
           std::cout << "oxygen" << std::endl;
       }
        void cup(){
            std::cout << "coffee" << std::endl;
        }
};

class Tea:public Drink{
    public:
       void water(){
           std::cout << "red" << std::endl;
       }
       void material(){
           std::cout << "tea" << std::endl;
       }
       void cup(){
            std::cout << "cup" << std::endl;
        }
};

int main(int argc, char const *argv[])
{
    Drink * coffee = new Coffee();
    coffee->material();
    Drink * tea = new Tea();
    tea->water();
    return 0;
}
```

#### 关系运算符重载

基本格式:`bool operator 符号 (变量参数)`{}

```java
#include <iostream>
class Person{
public:
  std::string name ;
  int age ;
  Person(){};
  Person(std::string name ,int age){
     this->name , this->age = age ;    
  }  
  bool operator == (Person p){
      if(this-> name == p.name && this->age == p.age) return true;
      else                                            return false;
  }

};

int main(int argc, char const *argv[])
{
    Person p1("zhangsan",12);
    Person p2("zhangsan",12);
    if(p1 == p2)  std::cout << "Yes" ;
    else          std::cout << "No";
    return 0;
}
```

#### 函数调用运算符重载

仿函数

```java
#include <iostream>
class Myprint{
  public:
     void operator()(std::string str){
         std::cout << str << std::endl;
     }
};

// 仿函数非常灵活，没有固定写法
//加法类
class Myadd{
public:
     int operator()(int a ,int b){
         return a + b ;
     } 
};

int main(int argc, char const *argv[])
{
    Myprint my ;
    //由于使用起来非常像一个函数，所以又称仿函数
    my("Hello World");

    Myadd add ;
    std::cout << add(12,12) << std::endl;

     //匿名函数对象=>Myadd()=>当前行被执行后，对象立即释放
     std::cout<<Myadd()(100,100)<<std::endl;

    return 0;
}
```

#### 函数占位参数

* 函数占位符参数
* 占位参数也可以有默认值
* 如果占位无默认值，则必须向它传值

```java
#include <iostream>
int func(int a , int = 10){
}
int main(int argc, char const *argv[])
{
    func(10);  // 如果占位参数没有默认值，则必须向他传值
    return 0;
}
```

#### 文件操作

##### 文件类型

* 文本文件:以ASCII码形式存储在计算机中
* 二进制文件:文本以二进制方法存储在计算机中
* `ofstream` 写操作
* `ifstream` 读操作
* `fstream` 读写操作

##### `ios::`文件控制

* in  读文件打开文件
* out 写文件打开文件
* ate 初始位置，文件尾
* app 追加方式写文件
* trunc 如果文件存在先删除，再创建
* binary 二进制文件

可以使用或运算符 联合使用

```java
#include<iostream>
#include<fstream>
int main(){
    fstream fp ;
    fs.open("test.txt",ios::out);
    fs << "写入数据" << endl;
    fs.close();
    
    fstream of ;
    of = open("test.txt")
    if(!of.isopen())  {std::cout << "open fail" << std::endl;}
    string buf ;
    while(getline(of,buf)) {std::cout << buf << std::endl;}
    of.close();
}
```

#### 友元

即外部可以访问私有变量

```jave
#include<iostream>

//=======全局函数做友元======
class Building{
   public:
      friend void good(Building *building){ // 添加friend变成友元函数  
        Building(string a , string b ){
        this->a = a , this->b =  b ;
      }
      ·
      string a ;
      private:
        class Building{

    public :
    friend void good(Building *building); // 添加friend变成友元函数
    Building(string a , string b ){
        this->a = a , this->b =  b ;
    }
      string a ;
   private:
      string b ;
};


// 全局函数
void good(Building *building){
    cout<<building->a <<"  " <<building->b<<endl;
}
string b ;
};

//=====类做友元====
// ======  类做友元 =======
class Person{

   public:
        void visit();
        Person();
        Cuba  *cuba;

};


class PersonAdmian{
   public :
       PersonAdmian();
       void visit();     // 成员友元函数
       void visits();    //非成员友元函数

       Cuba *cuba;
   
};

class Cuba{
    friend class Person;                      // Person是本类好朋友，可以访问本类的私有属性
    friend void  PersonAdmian::visit();       // PersonAdmian下的函数visit是好朋友，可以访问私有成员
    public:
       Cuba();
       int a;
    private:
       int b;
};



```



