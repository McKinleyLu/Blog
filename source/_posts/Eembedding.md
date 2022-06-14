---
title: Eembedding
author: 瑾年
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
1. 