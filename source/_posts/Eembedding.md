title: Eembedding
top: true
author: 瑾年
password: 038468518ad8122e13112743f890c7ba96ac5665b71de548eceb23e9ef237805
tags:
  - ANNS
categories:
  - dke
abbrlink: 31451
date: 2022-06-13 20:58:00
---
### Embedding 图嵌入方法
#### NMF
非负矩阵分解  
找出两个非负矩阵(W, H)，它们的乘积近似于非负矩阵X。  
这种分解可以用于降维、源分离或主题提取。
X ≈ WH（W为权矩阵   H为特征矩阵）
##### 参数解释
* n_components: 样本的数量，如果没有设置n_components，则保留所有特性
* init：默认为None; random为生成非负随机矩阵，放缩规模为`sqrt(X.mean() / n_components)`
  * X.mean()，指的是X矩阵所有值的求平均值
* random_state 递 int 以获得跨多个函数调用的可重现结果

##### 使用
`model.fit_transform(X)`:学习数据X的NMF模型并返回转换后的数据。
`model.components_`:特征矩阵H
#### python struck 使用
用途: python中的struct主要是用来处理C结构数据的，读入时先转换为Python的`字符串`类型，然后再转换为Python的结构化类型，比如元组(tuple)啥的~。
一般输入的渠道来源于文件或者网络的二进制流。
1. struck.pack(fmt,v1,v2,...)
  * 将v1,v2等参数的值进行一层包装，包装的方法由fmt指定。  
    被包装的参数必须严格符合fmt。最后返回一个包装后的字符串。
  * 将数据包装成C语言可以使用的形式
2. struct.unpack(fmt,string)
  * 返回一个由解包数据(string)得到的一个元组(tuple), 即使仅有一个数据也会被解包成元组
#### 图索引数据读/写 代码参考
1. 读代码   
   数据集格式  
    | Syntax      | Description | Test Text     |  
    | :---        |    :----:   |          ---: |  
    | Header      | Title       | Here's this   |  
    | Paragraph   | Text        | And more      |

  ```java
  #include <iostream>
  #include <fstream>

  void load_data(char* filename, float*& data, unsigned& num, unsigned&   dim) { 
    std::ifstream in(filename, std::ios::binary);	//以二进制的方式打开文件
    if (!in.is_open()) {
      std::cout << "open file error" << std::endl;
      exit(-1);
    }
  in.read((char*)&dim, 4);	//读取向量维度
  in.seekg(0, std::ios::end);	//光标定位到文件末尾
  std::ios::pos_type ss = in.tellg();	//获取文件大小（多少字节）
  size_t fsize = (size_t)ss;
  num = (unsigned)(fsize / (dim + 1) / 4);	//数据的个数
  data = new float[(size_t)num * (size_t)dim];

  in.seekg(0, std::ios::beg);	//光标定位到起始处
  for (size_t i = 0; i < num; i++) {
    in.seekg(4, std::ios::cur);	//光标向右移动4个字节
    in.read((char*)(data + i * dim), dim * 4);	//读取数据到一维数据data中
  }
  for(size_t i = 0; i < num * dim; i++) {	//输出数据
    std::cout << (float)data[i];
    if(!i) {
        std::cout << " ";
        continue;
    }
    if(i % (dim - 1) != 0) {
      std::cout << " ";
    }
    else{
      std::cout << std::endl;
    }
  }
  in.close();
}

  int main(int argc, char** argv) {
        float* data_load = NULL;
        unsigned points_num, dim;
        load_data(argv[1], data_load, points_num, dim);
        std::cout << "points_num："<< points_num << std::endl <<     "datadimension：" << dim << std::endl;
    return 0;
}
  ```
   
