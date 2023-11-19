# hybrid-design-method

:loudspeaker: Introduction
=====
Based on the open-source software OpenSees and Python, a hybrid design method for optimizing the progressive collapse resistance of RC frame structures was proposed. Firstly, random reinforcement information of frame beams connected to the removed columns was generated by Monte Carlo method, and RC frame models corresponding to different reinforcement information were established in OpenSees to calculate the progressive collapse response. Then, the reinforcement feature maps were drawn and the data set was generated in Python. Finally, the predictive model was established based on deep learning, and the optimization design for progressive collapse of the RC frame was implemented by combining the particle swarm optimization algorithm.

:memo: Framework Components
=====
:wrench: `RCF sample data.xlsx`: The sample data of RC frame structures.

...  
表格为中柱拆除工况的样本数据，其中A、B两列分别表示与被拆除中柱相连的X方向框架梁的顶底配筋，C、D两列分别表示与被拆除中柱相连的Y方向框架梁的顶底配筋，E列表示OpenSees模型计算结果。计算E列数据的步骤如下：依次将每行前四个数据替换掉OpenSees original model/RCF_4_3.tcl文件中相应位置，对于边柱和角柱工况，替换其他对应位置的配筋数据命令流即可实现，运行OpenSees original model/T_4_3.tcl文件，会生成OpenSees original model/Disp_RCF_4_3.txt文件，Disp_RCF_4_3.txt文件第一列表示加载时间，第二列表示拆除中柱后剩余节点的位移。E列数据取Disp_RCF_4_3.txt文件第二列数据中绝对值最大的数。
...   
