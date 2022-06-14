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
  
#### 图索引读数据代码参考
1. 读代码(ssg)   
   数据集格式    
   每个向量取 **4+d×4B** ，其中 **d** 是维数，**B** 是字节，具体如下：  
    | 值      | 类型 | 描述     |  
    | :---        |    :----:   |          ---: |  
    | dim      | int       | 向量维度   |  
    | d*4B   | float      | 向量分量      |

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
    
#### 图嵌入代码分析
1. 对原始数据进行初步处理
    * 对原始数据进行处理，返回如下信息  
       | 数组      | 作用|     
      | :---        |    :----:   |     
      | nodeIndex     | 通过节点id找到其对应索引|   
      | indexNode | 通过索引查出节点id| 
      
      如：  
       |index|id|     
      | :---        |    :----:   |     
      |0|15|   
      |1|78|   
      |2|9| 
     ```java
     def IndexOriginNode(inFilePath:str,outFilePath):
      allNodes=set()
      nodeIndex={}
      indexNode={}    
      with open(inFilePath,"r") as file:
        # 一行一行的读
        lines=file.readlines()
        # 如果某行第一个字符是#就跳过
        for line in lines:
            if line[0]=="#":
                continue
            #  strip() 方法用于移除字符串头尾指定的字符（默认为空格或换行符）或字符序列。
            #  这里是移除字符串头尾的空格和换行符
            line=line.strip()
            # 使用split()函数分割
            result=line.split("\t")
            if(len(result)==2):
                # allNodes = set() 也就是说,allNodes中没有重复元素
                allNodes.add(int(result[0]))
                  allNodes.add(int(result[1]))
      sorted(allNodes)  # 根据节点大小进行排序
      with open(outFilePath,"w") as file:
          index=0
          for node in allNodes:
              # 按照  index \t node \r 格式, 将数据写回文件
              '''
              0   23
              1   45
              2   78
              ... ...
              '''
              # 同时,构建indexNode,nodeIndex：
              # 即通过索引找到数据,亦可通过数据找到索引
              file.write(str(index)+"\t"+str(node)+"\r")
              indexNode[index]=node
              nodeIndex[node]=index
              index+=1
      return nodeIndex,indexNode
    ```
2. 得到有效图信息
     —— 获取每一个节点边数以及其出入度之和的数组  
     datas数组:  每一个元素为一个turple(id1,id2)  
     nodeDegree数组: 记录每一个点的出入度之和
      ```java
        def read_originData(data_file):
          # 通过读取源文件,返回节点的度的数组(度 = 出度 + 入度)
          data = []
          nodeDegree = {}  
          with open(data_file, "r", encoding="utf8") as file:
              # 这种方法能够读取的文件应当小于运行该程序的机器的内存-1g至少
              # 留给python进程
              lines = file.readlines()
              for line in lines:
                  line = line.strip()
                  if line.find("#") != -1:
                      line = line[0:line.find("#")]
                  elements = line.split("\t")
                  if len(elements) == 2:
                      data.append((int(elements[0]), int(elements[1])))
                      if int(elements[0]) not in nodeDegree:
                          nodeDegree[int(elements[0])] = 1
                      else:
                          nodeDegree[int(elements[0])] += 1
                      if int(elements[1]) not in nodeDegree:
                          nodeDegree[int(elements[1])] = 1
                      else:
                          nodeDegree[int(elements[1])] += 1
          return data, nodeDegree
      ```
        
3. Eembedding函数  

  ```python
      def EmbedGraph(originalFile, dimension):
        print("the dimension is: "+str(dimension))
        # 通过读取源文件,返回  边数  节点的度的数组(度 = 出度 + 入度)
        # edges 原图的边,格式为[id1 ,id2]
        # 节点的度的数组
        edges, nodeDegree = read_originData(originalFile)
        # 返回nodeIndex：可以通过索引找到指定边
        # 返回indexNode: 可以通过边找到指定索引
        # 给原图加索引,保存在originalFile+GR_INDEX_SUFIX中，格式为
        '''
        0 12
        1 89
        2 56
        '''
        nodeIndex, indexNode = IndexOriginNode(
            originalFile, originalFile+GR_INDEX_SUFIX)
        # 保存边的两个id的索引
        '''
        edges：   [id1,id2]
         indexEdges  [id1's index ,  id2'index]
        '''
        indexEdges = []
        for head, tail in edges:
            indexEdges.append((nodeIndex[head], nodeIndex[tail]))

        #  networkx 提供画图的函数
        #  DiGraph()  无多重边有向图
        G = nx.DiGraph()
        # 向图中添加边
        G.add_edges_from(indexEdges)
        # 返回图中节点数量
        nodes_num = G.number_of_nodes()
        edges_num = G.number_of_edges()

        # A = np.array(nx.adjacency_matrix(G).todense())

        # 返回nodes_num行 nodes_num列的矩阵
        A = np.zeros((nodes_num, nodes_num))
        # The numpy matrix is interpreted as an adjacency matrix for the graph.
        # 利用A矩阵构造有向邻接矩阵
        F = nx.from_numpy_matrix(A, create_using=nx.DiGraph)

        # |D| = number of nodes
        # 表示 第0维0号元素，第1维取全部元素；
        D = len(A[0, :])

        #  count the number of #v_i and #v_j
        # num_v_i = {i: (A[i, :] != 0).sum(0) + (A[:, i] != 0).sum(0)
        #            for i in range(D)}

        # for i in range(D):
        #     for j in range(D):
        #         if i != j and A[i, j] != 0:
        #             A[i, j] = num_v_i[i] * num_v_i[j]
        # 此时,A用来保存一条边的两个节点的度(出度+入度)的乘积
        for head, tail in indexEdges:
            A[head, tail] =nodeDegree[indexNode[head]]*nodeDegree[indexNode[tail]]
       # 使用NMF获取向量特征矩阵H
        model = NMF(n_components=dimension, init='random', random_state=0)
        U = model.fit_transform(A)
        H = model.components_
        # 将H进行转置,转置后的数据即为向量
        H = H.T
        data = []
        for vector in H:
            data.append((dimension, vector))
        # 将python中生成的数据,包装成C语言字节流，写入到文件中
        WriteVector(data, originalFile+EMBED_SUFIX)
        return data
  ```