<<<<<<< HEAD
<<<<<<< HEAD
---
title: 贝叶斯基础(一)
toc: true
author: 瑾年
mathjax: true
tags:
  - 贝叶斯
categories:
  - 贝叶斯学习笔记
abbrlink: 64002
date: 2022-07-06 15:30:02
---

### 贝叶斯网定义

​      贝叶斯网是一个`DAG`图，图中每一个节点带有代表一个随机变量，每一个节点对应一张`CPT`(Conditional Probability Table). 即贝叶斯网由一个`有向无环图`和`多个CPT表组成`.

### 图结构与概率分解

####  D-Separation

​      **D分离**（D-Separation）是一种用来判断变量是否条件独立的图形化方法。  

​       对于一个DAG图，D-Separation方法可以快速的判断出两个节点之间是否是条件独立。  

首先看看以下三种简单情况下条件独立的情况:

1.  `tail-to-tail`

![1](https://picgo.mckinleylu.com//images/1.jpg)

由图我们可以得到`a,b,c`的联合概率：
$$
P(a,b,c) = P(a|c) * P(b|c) * P(c)         (1)
$$
①首先我们不观察c(不以c为条件)，直接对(1)式以节点c求和，得P(a,b),  

如果 $P(a,b) = P(a) * P(b)$ ， 则a和b是独立分布的。
$$
P(a,b) = \sum_cP(a|c)P(b|c)P(c)\neq P(a)P(b)
$$
因此,a和b并不独立。
②我们将c作为观察点(以c为条件),求c条件下a和b发生的概率`P(a,b|c)`。
$$
P(a,b,c) = \frac{P(a,b,c)}{P(c)} = P(a|c)P(b|c)  (2)
$$
可知a和b在c条件下是独立的。

2. `head-to-tail`

![2](https://picgo.mckinleylu.com//images/2.jpg)

由图可知:
$$
P(a,b,c) = P(a)*P(c|a)*P(b|c)(1)
$$

同样分出两种情况:

①c不作为观察点,对(1)进行求和，得
$$
P(a,b) = P(a)\sum_cP(c|a)*P(b|c) = P(a)P(b|a)
$$
所以,a和b是不独立的。

②以c作为观察点,求c条件下a和b发生的概率`P(a,b|c)`
$$
P(a,b|c) = \frac{P(a,b,c)}{P(c)} = \frac{P(a)P(c|a)P(b|c)}{P(c)}=p(a|c)P(b|c)
$$
可知a和b在c条件下是独立的。

3. `head-to-head`



由上图可知:![3](https://picgo.mckinleylu.com//images/3.jpg)
$$
P(a,b,c) = P(a)*P(b)*P(c|a,b)(1)
$$
同理，分两种情况进行讨论:
①c不作为观察点,对(1)进行求和得
$$
P(a,b)=\sum_cP(a)*P(b)*P(c|a,b)=P(a)P(b)
$$
所以，此时a和b是独立的。

②我们以c作为观察点,求c条件下a和b发生的概率为P(a,b|c)
$$
P(a,b|c)=\frac{P(a,b,c)}{P(C)}=\frac{P(a)P(b)P(c|a,b)}{P(c)}\neq P(a|c)P(b|c)
$$
可知a和b不是c条件下独立的。

#### D-Separation总结

​       对于较为复杂的 DAG 图，我们可以给出一个普遍意义上的结论 ，也就是 D-Seperation。 对于 DAG 图 G，如果 A，B，C 是三个集合（可以是单独的节点或者是节点的集合），为了判断 A 和 B 是否是 C 条件独立的， 我们考虑 E 中所有 `A 和 B 之间`的 **无向路径** 。对于其中的一条路径，如果它满足以下两个条件中的任意一条，则称这条路径是 **阻塞（block，即关于C条件独立）** 的：

* **路径中存在某个节点** **X 是 head-to-tail 或者 tail-to-tail 节点（Example one/two），并且** **X** **是包含在 C 中的。**
* **路径中存在某个节点 X** **是 head-to-head 节点（Example Three），并且 X** **或 X** **的子节点是不包含在 C 中的**。![4](https://picgo.mckinleylu.com//images/4.jpg)

如果 A，B 间所有的路径都是阻塞的，那么 A，B 就是关于 C 条件独立的；否则， A，B 不是关于 C 条件独立的。

#### D-Separation举例

* 判断下图中,a与b是否在c的条件下独立。
* a与b是否在f的条件下独立。

![5](https://picgo.mckinleylu.com//images/5.jpg)

**判断 a** **和 b** **是否是 c下条件独立的**：

1. 此时 A={a}, B={b}, C={c}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中 e 是 head-to-head 类型的，且 e 的子节点就是 c ，而 c∈C，根据 **(b)**，e 不阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∉C ，根据 **(a)**，所以也有 a，b不是 c 条件下独立；

5. 所以 a 和 b 在 c 下不是条件独立的。

**判断 a** **和 b** **是否是 f** **下条件独立的**：

1. 此时 A={a}, B={b}, C={f}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中e 是 head-to-head 类型的，且 e 和 e 的子节点 c 都不属于 C，根据 **(b)**，e 阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∈C ，根据 **(a)**，所以 f 节点阻塞了该路径。

5. 所以 a 和 b 在 f 下是条件独立的。

总结一下，对于head-to-head，我们有a与b独立，对于tail-to-tail，我们有given c，a与b条件独立，对于head-to-tail，我们有given c，a与b条件独立。换一个直观的例子：

![6](https://picgo.mckinleylu.com//images/6.jpg)

我们可以看到，因为c这个“搅屎棍”的存在，我们很可能在数据误以为a与b有因果关系，实际上他们只是有相关性，也可以说c d-separate/blocked a and b。但是对于a与b的关系，**NONE of them are causality。**而我们要做的就是找到这些关系，才能判断出真正的因果。我们定义一下，head-to-head叫做v-structure或者collider，tail-to-tail叫做confounder或者fork，head-to-tail叫做chain。以便于理解后面以及其他paper。

#### 马尔可夫毯（Markov Blanket）

定义:在随机变量的全集U中,对于给定的变量$X \in U$和变量集MB $\subset$ U（X  $\notin$ MB),若有
$$
X \perp \!\!\! \perp\{U - MB - {X}\} | MB
$$
则称能满足上述条件的最小变量集MB为X的马尔可夫毯。

通俗的讲是如下情况：

![1](https://picgo.mckinleylu.com//images/1.png)

即在给定集合MB时，变量X与{U-MB-{X}}独立。

贝叶斯网络是马尔可夫链的推广，马尔可夫链限定了结构只能是一条链，而贝叶斯网络则不再限定结构是一个链，但二者都遵守马尔可夫假设，即一个结点只依赖于它的上一个节点（一阶马尔可夫假设）。

=======
---
title: 贝叶斯基础(一)
toc: true
author: 瑾年
mathjax: true
tags:
  - 贝叶斯
categories:
  - 贝叶斯学习笔记
abbrlink: 64002
date: 2022-07-06 15:30:02
---

### 贝叶斯网定义

​      贝叶斯网是一个`DAG`图，图中每一个节点带有代表一个随机变量，每一个节点对应一张`CPT`(Conditional Probability Table). 即贝叶斯网由一个`有向无环图`和`多个CPT表组成`.

### 图结构与概率分解

####  D-Separation

​      **D分离**（D-Separation）是一种用来判断变量是否条件独立的图形化方法。  

​       对于一个DAG图，D-Separation方法可以快速的判断出两个节点之间是否是条件独立。  

首先看看以下三种简单情况下条件独立的情况:

1.  `tail-to-tail`

![1](https://picgo.mckinleylu.com//images/1.jpg)

由图我们可以得到`a,b,c`的联合概率：
$$
P(a,b,c) = P(a|c) * P(b|c) * P(c)         (1)
$$
①首先我们不观察c(不以c为条件)，直接对(1)式以节点c求和，得P(a,b),  

如果 $P(a,b) = P(a) * P(b)$ ， 则a和b是独立分布的。
$$
P(a,b) = \sum_cP(a|c)P(b|c)P(c)\neq P(a)P(b)
$$
因此,a和b并不独立。
②我们将c作为观察点(以c为条件),求c条件下a和b发生的概率`P(a,b|c)`。
$$
P(a,b,c) = \frac{P(a,b,c)}{P(c)} = P(a|c)P(b|c)  (2)
$$
可知a和b在c条件下是独立的。

2. `head-to-tail`

![2](https://picgo.mckinleylu.com//images/2.jpg)

由图可知:
$$
P(a,b,c) = P(a)*P(c|a)*P(b|c)(1)
$$

同样分出两种情况:

①c不作为观察点,对(1)进行求和，得
$$
P(a,b) = P(a)\sum_cP(c|a)*P(b|c) = P(a)P(b|a)
$$
所以,a和b是不独立的。

②以c作为观察点,求c条件下a和b发生的概率`P(a,b|c)`
$$
P(a,b|c) = \frac{P(a,b,c)}{P(c)} = \frac{P(a)P(c|a)P(b|c)}{P(c)}=p(a|c)P(b|c)
$$
可知a和b在c条件下是独立的。

3. `head-to-head`



由上图可知:![3](https://picgo.mckinleylu.com//images/3.jpg)
$$
P(a,b,c) = P(a)*P(b)*P(c|a,b)(1)
$$
同理，分两种情况进行讨论:
①c不作为观察点,对(1)进行求和得
$$
P(a,b)=\sum_cP(a)*P(b)*P(c|a,b)=P(a)P(b)
$$
所以，此时a和b是独立的。

②我们以c作为观察点,求c条件下a和b发生的概率为P(a,b|c)
$$
P(a,b|c)=\frac{P(a,b,c)}{P(C)}=\frac{P(a)P(b)P(c|a,b)}{P(c)}\neq P(a|c)P(b|c)
$$
可知a和b不是c条件下独立的。

#### D-Separation总结

​       对于较为复杂的 DAG 图，我们可以给出一个普遍意义上的结论 ，也就是 D-Seperation。 对于 DAG 图 G，如果 A，B，C 是三个集合（可以是单独的节点或者是节点的集合），为了判断 A 和 B 是否是 C 条件独立的， 我们考虑 E 中所有 `A 和 B 之间`的 **无向路径** 。对于其中的一条路径，如果它满足以下两个条件中的任意一条，则称这条路径是 **阻塞（block，即关于C条件独立）** 的：

* **路径中存在某个节点** **X 是 head-to-tail 或者 tail-to-tail 节点（Example one/two），并且** **X** **是包含在 C 中的。**
* **路径中存在某个节点 X** **是 head-to-head 节点（Example Three），并且 X** **或 X** **的子节点是不包含在 C 中的**。![4](https://picgo.mckinleylu.com//images/4.jpg)

如果 A，B 间所有的路径都是阻塞的，那么 A，B 就是关于 C 条件独立的；否则， A，B 不是关于 C 条件独立的。

#### D-Separation举例

* 判断下图中,a与b是否在c的条件下独立。
* a与b是否在f的条件下独立。

![5](https://picgo.mckinleylu.com//images/5.jpg)

**判断 a** **和 b** **是否是 c下条件独立的**：

1. 此时 A={a}, B={b}, C={c}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中 e 是 head-to-head 类型的，且 e 的子节点就是 c ，而 c∈C，根据 **(b)**，e 不阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∉C ，根据 **(a)**，所以也有 a，b不是 c 条件下独立；

5. 所以 a 和 b 在 c 下不是条件独立的。

**判断 a** **和 b** **是否是 f** **下条件独立的**：

1. 此时 A={a}, B={b}, C={f}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中e 是 head-to-head 类型的，且 e 和 e 的子节点 c 都不属于 C，根据 **(b)**，e 阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∈C ，根据 **(a)**，所以 f 节点阻塞了该路径。

5. 所以 a 和 b 在 f 下是条件独立的。

总结一下，对于head-to-head，我们有a与b独立，对于tail-to-tail，我们有given c，a与b条件独立，对于head-to-tail，我们有given c，a与b条件独立。换一个直观的例子：

![6](https://picgo.mckinleylu.com//images/6.jpg)

我们可以看到，因为c这个“搅屎棍”的存在，我们很可能在数据误以为a与b有因果关系，实际上他们只是有相关性，也可以说c d-separate/blocked a and b。但是对于a与b的关系，**NONE of them are causality。**而我们要做的就是找到这些关系，才能判断出真正的因果。我们定义一下，head-to-head叫做v-structure或者collider，tail-to-tail叫做confounder或者fork，head-to-tail叫做chain。以便于理解后面以及其他paper。

#### 马尔可夫毯（Markov Blanket）

定义:在随机变量的全集U中,对于给定的变量$X \in U$和变量集MB $\subset$ U（X  $\notin$ MB),若有
$$
X \perp \!\!\! \perp\{U - MB - {X}\} | MB
$$
则称能满足上述条件的最小变量集MB为X的马尔可夫毯。

通俗的讲是如下情况：

![1](https://picgo.mckinleylu.com//images/1.png)

即在给定集合MB时，变量X与{U-MB-{X}}独立。

贝叶斯网络是马尔可夫链的推广，马尔可夫链限定了结构只能是一条链，而贝叶斯网络则不再限定结构是一个链，但二者都遵守马尔可夫假设，即一个结点只依赖于它的上一个节点（一阶马尔可夫假设）。

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
=======
---
title: 贝叶斯基础(一)
toc: true
author: 瑾年
mathjax: true
tags:
  - 贝叶斯
categories:
  - 贝叶斯学习笔记
abbrlink: 64002
date: 2022-07-06 15:30:02
---

### 贝叶斯网定义

​      贝叶斯网是一个`DAG`图，图中每一个节点带有代表一个随机变量，每一个节点对应一张`CPT`(Conditional Probability Table). 即贝叶斯网由一个`有向无环图`和`多个CPT表组成`.

### 图结构与概率分解

####  D-Separation

​      **D分离**（D-Separation）是一种用来判断变量是否条件独立的图形化方法。  

​       对于一个DAG图，D-Separation方法可以快速的判断出两个节点之间是否是条件独立。  

首先看看以下三种简单情况下条件独立的情况:

1.  `tail-to-tail`

![1](https://picgo.mckinleylu.com//images/1.jpg)

由图我们可以得到`a,b,c`的联合概率：
$$
P(a,b,c) = P(a|c) * P(b|c) * P(c)         (1)
$$
①首先我们不观察c(不以c为条件)，直接对(1)式以节点c求和，得P(a,b),  

如果 $P(a,b) = P(a) * P(b)$ ， 则a和b是独立分布的。
$$
P(a,b) = \sum_cP(a|c)P(b|c)P(c)\neq P(a)P(b)
$$
因此,a和b并不独立。
②我们将c作为观察点(以c为条件),求c条件下a和b发生的概率`P(a,b|c)`。
$$
P(a,b,c) = \frac{P(a,b,c)}{P(c)} = P(a|c)P(b|c)  (2)
$$
可知a和b在c条件下是独立的。

2. `head-to-tail`

![2](https://picgo.mckinleylu.com//images/2.jpg)

由图可知:
$$
P(a,b,c) = P(a)*P(c|a)*P(b|c)(1)
$$

同样分出两种情况:

①c不作为观察点,对(1)进行求和，得
$$
P(a,b) = P(a)\sum_cP(c|a)*P(b|c) = P(a)P(b|a)
$$
所以,a和b是不独立的。

②以c作为观察点,求c条件下a和b发生的概率`P(a,b|c)`
$$
P(a,b|c) = \frac{P(a,b,c)}{P(c)} = \frac{P(a)P(c|a)P(b|c)}{P(c)}=p(a|c)P(b|c)
$$
可知a和b在c条件下是独立的。

3. `head-to-head`



由上图可知:![3](https://picgo.mckinleylu.com//images/3.jpg)
$$
P(a,b,c) = P(a)*P(b)*P(c|a,b)(1)
$$
同理，分两种情况进行讨论:
①c不作为观察点,对(1)进行求和得
$$
P(a,b)=\sum_cP(a)*P(b)*P(c|a,b)=P(a)P(b)
$$
所以，此时a和b是独立的。

②我们以c作为观察点,求c条件下a和b发生的概率为P(a,b|c)
$$
P(a,b|c)=\frac{P(a,b,c)}{P(C)}=\frac{P(a)P(b)P(c|a,b)}{P(c)}\neq P(a|c)P(b|c)
$$
可知a和b不是c条件下独立的。

#### D-Separation总结

​       对于较为复杂的 DAG 图，我们可以给出一个普遍意义上的结论 ，也就是 D-Seperation。 对于 DAG 图 G，如果 A，B，C 是三个集合（可以是单独的节点或者是节点的集合），为了判断 A 和 B 是否是 C 条件独立的， 我们考虑 E 中所有 `A 和 B 之间`的 **无向路径** 。对于其中的一条路径，如果它满足以下两个条件中的任意一条，则称这条路径是 **阻塞（block，即关于C条件独立）** 的：

* **路径中存在某个节点** **X 是 head-to-tail 或者 tail-to-tail 节点（Example one/two），并且** **X** **是包含在 C 中的。**
* **路径中存在某个节点 X** **是 head-to-head 节点（Example Three），并且 X** **或 X** **的子节点是不包含在 C 中的**。![4](https://picgo.mckinleylu.com//images/4.jpg)

如果 A，B 间所有的路径都是阻塞的，那么 A，B 就是关于 C 条件独立的；否则， A，B 不是关于 C 条件独立的。

#### D-Separation举例

* 判断下图中,a与b是否在c的条件下独立。
* a与b是否在f的条件下独立。

![5](https://picgo.mckinleylu.com//images/5.jpg)

**判断 a** **和 b** **是否是 c下条件独立的**：

1. 此时 A={a}, B={b}, C={c}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中 e 是 head-to-head 类型的，且 e 的子节点就是 c ，而 c∈C，根据 **(b)**，e 不阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∉C ，根据 **(a)**，所以也有 a，b不是 c 条件下独立；

5. 所以 a 和 b 在 c 下不是条件独立的。

**判断 a** **和 b** **是否是 f** **下条件独立的**：

1. 此时 A={a}, B={b}, C={f}；

2. a 到 b 只有一条无向路径 a-e-f-b ；

3. 考虑路径上的点 e 和 f ：其中e 是 head-to-head 类型的，且 e 和 e 的子节点 c 都不属于 C，根据 **(b)**，e 阻塞该路径；

4. 节点 f 是 tail-to-tail 类型节点，且 f∈C ，根据 **(a)**，所以 f 节点阻塞了该路径。

5. 所以 a 和 b 在 f 下是条件独立的。

总结一下，对于head-to-head，我们有a与b独立，对于tail-to-tail，我们有given c，a与b条件独立，对于head-to-tail，我们有given c，a与b条件独立。换一个直观的例子：

![6](https://picgo.mckinleylu.com//images/6.jpg)

我们可以看到，因为c这个“搅屎棍”的存在，我们很可能在数据误以为a与b有因果关系，实际上他们只是有相关性，也可以说c d-separate/blocked a and b。但是对于a与b的关系，**NONE of them are causality。**而我们要做的就是找到这些关系，才能判断出真正的因果。我们定义一下，head-to-head叫做v-structure或者collider，tail-to-tail叫做confounder或者fork，head-to-tail叫做chain。以便于理解后面以及其他paper。

#### 马尔可夫毯（Markov Blanket）

定义:在随机变量的全集U中,对于给定的变量$X \in U$和变量集MB $\subset$ U（X  $\notin$ MB),若有
$$
X \perp \!\!\! \perp\{U - MB - {X}\} | MB
$$
则称能满足上述条件的最小变量集MB为X的马尔可夫毯。

通俗的讲是如下情况：

![1](https://picgo.mckinleylu.com//images/1.png)

即在给定集合MB时，变量X与{U-MB-{X}}独立。

贝叶斯网络是马尔可夫链的推广，马尔可夫链限定了结构只能是一条链，而贝叶斯网络则不再限定结构是一个链，但二者都遵守马尔可夫假设，即一个结点只依赖于它的上一个节点（一阶马尔可夫假设）。

>>>>>>> 725fcb7a857252b3986fe8e21eadbeb0e3e3ddc6
