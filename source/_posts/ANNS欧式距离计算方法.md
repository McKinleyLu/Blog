title: ANNS欧式距离计算方法
author: 瑾年
top: true
password: 038468518ad8122e13112743f890c7ba96ac5665b71de548eceb23e9ef237805
tags:
  - ANNS
categories:
  - dke
abbrlink: 28594
date: 2022-06-14 20:27:00
---
### ANNS 欧式距离计算方法
1. 输入参数
    | 参数      | 作用|     
    | :---        |    :----:   |     
    | a     | 点a在data中的起始地址|   
    | b | 点b在data中的起始地址|
    | length | data的维度大小|
    
2. 计算思路分析
    *  首先得到a在data中数据的终止地址`last`
    *  其次使得`unroll_group` = 终止地址前三个地址(`last-3`)
    *  接下来，每次取出4个a的`float`数字和b的4个`float`数字做乘法，然后将结果累加到`reslut`变量中，直到a的地址值**等于**`unroll_group`
    *  最后处理最后三个数据，方法和上面计算方法一致
    *  函数返回欧式距离的平方
3. 参考代码
  ```java
  T compare(const T *a, const T *b, unsigned length) const {
    T result = 0;
    /*

        float dist = index->getDist()->compare(index->getBaseData() + i * index->getBaseDim(),
                                            index->getBaseData() + id * index->getBaseDim(),
                                            (unsigned) index->getBaseDim());
    */
           /**
            * @param a 该点在data中的起始地址
            * @param b 该点邻居在data中的起始地址
            * @param length 每一个点的维度(邻居数量)
            * 
           */
            float diff0, diff1, diff2, diff3;
            const T *last = a + length;
            const T *unroll_group = last - 3;    // unroll展开 ????

            // assume
            //     (=== last - 3 ====)
            // a:   5 6 7 8 9 22 33 44 (55 66 77 88)
            // b:   1 2 3 5 7 11 22 33 44 55 66 33

            /* Process 4 items with each loop for efficiency. */
            while (a < unroll_group) {
                diff0 = a[0] - b[0];
                diff1 = a[1] - b[1];
                diff2 = a[2] - b[2];
                diff3 = a[3] - b[3];
                result += diff0 * diff0 + diff1 * diff1 + diff2 * diff2 + diff3 * diff3;
                a += 4;
                b += 4;
            }
            // pixels 像素
            // 不需要标准向量长度？
            /* Process last 0-3 pixels.  Not needed for standard vector lengths. */
            // 这里原因可能是b少一维度
            while (a < last) {
                diff0 = *a++ - *b++;
                result += diff0 * diff0;
            }

        return result;   // 返回维度相减所有平方和
    }
  ```
