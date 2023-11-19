# hybrid-design-method

:loudspeaker: Introduction
=====
Based on the open-source software OpenSees and Python, a hybrid design method for optimizing the progressive collapse resistance of RC frame structures was proposed. Firstly, random reinforcement information of frame beams connected to the removed columns was generated by Monte Carlo method, and RC frame models corresponding to different reinforcement information were established in OpenSees to calculate the progressive collapse response. Then, the reinforcement feature maps were drawn and the data set was generated in Python. Finally, the predictive model was established based on deep learning, and the optimization design for progressive collapse of the RC frame was implemented by combining the particle swarm optimization algorithm.

:memo: Framework Components
=====
:wrench: `RCF sample data.xlsx`: The sample data of RC frame structures.
  
>表格为中柱拆除工况的样本数据，其中A、B两列分别表示与被拆除中柱相连的X方向框架梁的顶底配筋，C、D两列分别表示与被拆除中柱相连的Y方向框架梁的顶底配筋，E列表示OpenSees模型计算结果。

>计算E列数据的步骤如下：依次将每行前四个数据替换掉OpenSees original model/RCF_4_3.tcl文件中相应位置，对于边柱和角柱工况，替换其他对应位置的配筋数据命令流即可实现，运行OpenSees original model/T_4_3.tcl文件，会生成OpenSees original model/Disp_RCF_4_3.txt文件，Disp_RCF_4_3.txt文件第一列表示加载时间，第二列表示拆除中柱后剩余节点的位移。E列数据取Disp_RCF_4_3.txt文件第二列数据中绝对值最大的数。

:wrench: `draw_middle.py`: Draw the reinforcement feature maps (middle column removal scenario).

>文本文件x_input.txt取表格RCF sample data.xlsx中A-D列数据，draw_middle.py通过读取文本文件x_input.txt中信息，绘制配筋特征图，保存到Python code文件夹下新建的RCF_data文件夹中，文件按0.png至1859.png的顺序命名。

>draw_edge.py和draw_corner.py分别为边柱和角柱拆除工况的绘图命令文件，运行流程参照中柱拆除工况。

:wrench: `train.py`: Draw the reinforcement feature maps (middle column removal scenario).

>y_export.txt取表格RCF sample data.xlsx中E列数据。train.py文件读取draw_middle.py生成的RCF_data文件夹和y_export.txt中的数据，创建训练集和验证集，进行预测模型的训练和验证。程序运行完毕会在Python code文件夹中生成下列文件：（1）train.log：文件中分别记录epoch、n、train_loss和valid_loss四列数据，其中，epoch表示训练轮次，每个训练轮次中，把1860个数据随机分成五份，每次取一份作为验证集，需循环五次，n表示循环次数，train_loss和valid_loss分别表示训练集和验证集的均方误差；（2）best_resnet18.train：训练集损失最小的预测模型，即最优预测模型；（3）predict文件夹和true文件夹：分别记录每次训练中预测模型的预测结果和OpenSees模型计算结果，文件夹内文件按0/1_epoch_n.txt命名，其中，0和1分别表示文件中记录预测模型的预测结果和OpenSees模型计算结果，epoch和n分别表示训练轮次和循环次数；（4）train_cost.txt：其中，第一行记录训练开始时间，第二行记录训练结束时间，时间记录格式为xx（月）.xx（日）.xx（时）.xx（分）。

:wrench: `best_resnet18.train/ best_resnet50.train/ best_resnet101.train`: The model with the minimal train loss is saved after training based on ResNet18, ResNet50 and ResNet101 respectively.

:wrench: `sko_pso.py`: Running file of particle swarm optimization algorithm.

>sko_pso.py是调用粒子群优化算法的文件，输入是随机向量x和优化函数func，其中，x是一个1×4的数组，各元素均以0.9和1.1为上下限，优化函数func调用optimize.py中的函数runos()；输出是函数runos()返回的obj_fun。关于函数runos()的工作流程详见optimize.py下的介绍。

:wrench: `optimize.py`: The optimization function of particle swarm optimization algorithm.

>optimize.py由一个函数runos()组成。函数runos()可以根据sko_pso.py生成的向量x，转化为RC框架梁配筋数据，绘制对应的配筋特征图，用train.py保存的best_resnet18.train预测连续倒塌响应，判断结构是否倒塌，计算目标函数值（obj_fun）—框架中对应配筋总用量。如果结构倒塌（预测响应大于1200mm），按RC框架梁的最大配筋率计算obj_fun；如果结构未倒塌（预测响应小于1200mm），按sko_pso.py生成的配筋量计算obj_fun，最后返回obj_fun。

>最后，将在Python code文件夹中生成文件train_value.txt，记录tA4500，tA4501，tA4600，tA4601，ypred，collapse和obj_fun 7列数据。其中，tA4500和tA4501分别表示与被拆除中柱相连的X方向框架梁的顶底配筋；tA4600和tA4601分别表示与被拆除中柱相连的Y方向框架梁的顶底配筋；ypred表示预测模型预测的结果；collapse表示结构是否倒塌，0代表结构未倒塌，1表示结构倒塌；obj_fun表示目标函数值。

>优化结束后，对train_value.txt中obj_fun列的数据进行排序，取obj_fun最小的10组数据代入OpenSees模型计算进行对比验证。步骤如下：将tA4500，tA4501，tA4600和tA4601四个数据替换掉OpenSees original model/RCF_4_3.tcl文件中相应位置（如图1所示），运行OpenSees original model/T_4_3.tcl文件，会生成OpenSees original model/Disp_RCF_4_3.txt文件，Disp_RCF_4_3.txt文件第一列表示加载时间，第二列表示拆除中柱后剩余节点的位移，取Disp_RCF_4_3.txt文件第二列数据中绝对值最大的数，判断是否大于1200mm。最终，最优配筋设计方案是OpenSees模型计算结果不大于1200mm中obj_fun最小的设计方案。


 
