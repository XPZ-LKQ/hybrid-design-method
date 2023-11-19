#4*3跨，4层RC框架（计入板重）                                                                         

#units pa N m                                                                                         
set pi 3.141592653                                                                                    

#----------基本参数--------------------------------------------------                                 
#x和y方向跨度(x和y两方向等跨)                                                                         
set lxs 6.0                                                                                           
set lys 6.0                                                                                           

#底层高 ground story height                                                                           
set lgrdh  4.20                                                                                       
#其余层高 other story height
set lothh 3.50

#----------梁截面信息-------------------------------------------------
#梁宽w
set beamw 0.200
#梁高h
set beamh 0.400
#---------柱截面信息（等边）------------------------------------------
#柱宽d
set columnd 0.400

#---------梁和柱混凝土保护层厚度--------------------------------------
set c 0.020


#-------------定义钢筋面积----------------------------
#柱（此处的柱筋为单根面积）                    
set A00  0.20e-3
set A01  0.15e-3
set A02  0.10e-3


#梁    前三位数对应相应的截面号，第四位的0为下部钢筋，1为上部钢筋  
set	tA1100	4.00E-04
set	tA1101	8.00E-04
set	tA1200	5.00E-04
set	tA1201	1.00E-03
set	tA1300	4.00E-04
set	tA1301	7.00E-04
set	tA1400	4.00E-04
set	tA1401	9.00E-04
set	tA1500	8.00E-04
set	tA1501	1.30E-03
set	tA1600	9.00E-04
set	tA1601	1.40E-03
set	tA2100	4.00E-04
set	tA2101	7.00E-04
set	tA2200	4.00E-04
set	tA2201	8.00E-04
set	tA2300	4.00E-04
set	tA2301	7.00E-04
set	tA2400	4.00E-04
set	tA2401	8.00E-04
set	tA2500	8.00E-04
set	tA2501	1.20E-03
set	tA2600	8.00E-04
set	tA2601	1.30E-03
set	tA3100	4.00E-04
set	tA3101	6.00E-04
set	tA3200	4.00E-04
set	tA3201	7.00E-04
set	tA3300	4.00E-04
set	tA3301	6.00E-04
set	tA3400	4.00E-04
set	tA3401	6.00E-04
set	tA3500	8.00E-04
set	tA3501	1.10E-03
set	tA3600	8.00E-04
set	tA3601	1.10E-03
set	tA4100	4.00E-04
set	tA4101	5.00E-04
set	tA4200	4.00E-04
set	tA4201	6.00E-04
set	tA4300	4.00E-04
set	tA4301	5.00E-04
set	tA4400	4.00E-04
set	tA4401	5.00E-04
set	tA4500	8.00E-04
set	tA4501	1.10E-03
set	tA4600	1.00E-03
set	tA4601	1.10E-03


set A1100  [expr $tA1100/4]
set A1101  [expr $tA1101/4]
set A1200  [expr $tA1200/4]
set A1201  [expr $tA1201/4]
set A1300  [expr $tA1300/4]
set A1301  [expr $tA1301/4]
set A1400  [expr $tA1400/4]
set A1401  [expr $tA1401/4]
set A1500  [expr $tA1500/4]
set A1501  [expr $tA1501/4]
set A1600  [expr $tA1600/4]
set A1601  [expr $tA1601/4]
set A2100  [expr $tA2100/4]
set A2101  [expr $tA2101/4]
set A2200  [expr $tA2200/4]
set A2201  [expr $tA2201/4]
set A2300  [expr $tA2300/4]
set A2301  [expr $tA2301/4]
set A2400  [expr $tA2400/4]
set A2401  [expr $tA2401/4]
set A2500  [expr $tA2500/4]
set A2501  [expr $tA2501/4]
set A2600  [expr $tA2600/4]
set A2601  [expr $tA2601/4]    
set A3100  [expr $tA3100/4]
set A3101  [expr $tA3101/4]
set A3200  [expr $tA3200/4]
set A3201  [expr $tA3201/4]
set A3300  [expr $tA3300/4]
set A3301  [expr $tA3301/4]
set A3400  [expr $tA3400/4]
set A3401  [expr $tA3401/4]
set A3500  [expr $tA3500/4]
set A3501  [expr $tA3501/4]
set A3600  [expr $tA3600/4]
set A3601  [expr $tA3601/4]
set A4100  [expr $tA4100/4]
set A4101  [expr $tA4101/4]
set A4200  [expr $tA4200/4]
set A4201  [expr $tA4201/4]
set A4300  [expr $tA4300/4]
set A4301  [expr $tA4301/4]
set A4400  [expr $tA4400/4]
set A4401  [expr $tA4401/4]
set A4500  [expr $tA4500/4]
set A4501  [expr $tA4501/4]
set A4600  [expr $tA4600/4]
set A4601  [expr $tA4601/4]


#---------C30混凝土弹模及泊松比---------------------------------------
set Ec 3.00e10
set mu 0.2
set G  [expr $Ec/(2.0*(1.0+$mu))]
#梁截面扭转刚度
set beamIp   1.333333e-3
uniaxialMaterial Elastic  7  [expr $G*$beamIp]
#柱截面扭转刚度
set columnIp 0.004267
uniaxialMaterial Elastic  8  [expr $G*$columnIp]



#---------材料属性----------------------------------------------------
#梁&柱非核心--  应变为2fcu/Ec
#uniaxialMaterial Concrete01 101 -29.64e6 -0.00198  -14.82e6 -0.02
uniaxialMaterial Concrete01 101 -26.1e6 -0.00174  -13.05e6 -0.02

#柱核心混凝土   乘放大系数——1.204；26.1*1.204=31.43
#uniaxialMaterial Concrete01 111 -35.568e6 -0.00237  -17.784e6 -0.02
uniaxialMaterial Concrete01 111 -31.43e6 -0.002095  -15.72e6 -0.02

#移除柱柱头&柱头对应层及以上所有层因移除柱而产生变形的梁的梁端单元
uniaxialMaterial Elastic 102 3e10


#steel
#直径1钢筋 材性+直径    材料编号
#uniaxialMaterial Hysteretic  1 432e6 2.16e-3 570e6 0.25 0.1e6 0.28 -432e6 -2.16e-3 -570e6 -0.25 -0.1e6 -0.28 1.0 1.0 0.0 0.0 0.5
uniaxialMaterial Hysteretic   1 432e6 0.002   572e6 0.15 20.0e6 0.20 -432e6  -0.002 -572e6 -0.15 -20.0e6 -0.20 1.0 1.0 0.0 0.0 0.5



#--------------------节点信息----------------------------------
#---------y方向第1跨(y方向共3跨)----------------
set y101  0
set y102  [expr $lys/9.0*1.0]
set y103  [expr $lys/9.0*2.0]
set y104  [expr $lys/9.0*3.0]
set y105  [expr $lys/9.0*4.0]
set y106  [expr $lys/9.0*5.0]
set y107  [expr $lys/9.0*6.0]
set y108  [expr $lys/9.0*7.0]
set y109  [expr $lys/9.0*8.0]
set y110  [expr $lys]

#---------y方向第2跨(y方向共3跨)----------------
#set y110 [expr $lys]
set y111  [expr $y110+$lys/9.0*1.0]
set y112  [expr $y110+$lys/9.0*2.0]
set y113  [expr $y110+$lys/9.0*3.0]
set y114  [expr $y110+$lys/9.0*4.0]
set y115  [expr $y110+$lys/9.0*5.0]                                                      
set y116  [expr $y110+$lys/9.0*6.0]
set y117  [expr $y110+$lys/9.0*7.0]
set y118  [expr $y110+$lys/9.0*8.0]
set y119  [expr $y110+$lys]  

#---------y方向第3跨(y方向共3跨)----------------
#set y119 [expr $y110+$lys]
set y120  [expr $y119+$lys/9.0*1.0]
set y121  [expr $y119+$lys/9.0*2.0]
set y122  [expr $y119+$lys/9.0*3.0]
set y123  [expr $y119+$lys/9.0*4.0]
set y124  [expr $y119+$lys/9.0*5.0]                                                      
set y125  [expr $y119+$lys/9.0*6.0]
set y126  [expr $y119+$lys/9.0*7.0]
set y127  [expr $y119+$lys/9.0*8.0]
set y128  [expr $y119+$lys]                                                                                                                                                                                                                                                                                                                                        

#---------x方向第1跨(x方向共4跨)----------------                                    	
set	x101	0	
set	x102	[expr	$lxs/9.0*1.0]
set	x103	[expr	$lxs/9.0*2.0]
set	x104	[expr	$lxs/9.0*3.0]
set	x105	[expr	$lxs/9.0*4.0]
set	x106	[expr	$lxs/9.0*5.0]
set	x107	[expr	$lxs/9.0*6.0]
set	x108	[expr	$lxs/9.0*7.0]
set	x109	[expr	$lxs/9.0*8.0]
set	x110	[expr	$lxs]

#---------x方向第2跨(x方向共4跨)----------------			
#set	x110	[expr	$lxs]
set	x111	[expr	$x110+$lxs/9.0*1.0]
set	x112	[expr	$x110+$lxs/9.0*2.0]
set	x113	[expr	$x110+$lxs/9.0*3.0]
set	x114	[expr	$x110+$lxs/9.0*4.0]
set	x115	[expr	$x110+$lxs/9.0*5.0]
set	x116	[expr	$x110+$lxs/9.0*6.0]
set	x117	[expr	$x110+$lxs/9.0*7.0]
set	x118	[expr	$x110+$lxs/9.0*8.0]
set	x119	[expr	$x110+$lxs]

#---------x方向第3跨(x方向共4跨)----------------			
#set	x119	[expr	$x110+$lxs]
set	x120	[expr	$x119+$lxs/9.0*1.0]
set	x121	[expr	$x119+$lxs/9.0*2.0]
set	x122	[expr	$x119+$lxs/9.0*3.0]
set	x123	[expr	$x119+$lxs/9.0*4.0]
set	x124	[expr	$x119+$lxs/9.0*5.0]
set	x125	[expr	$x119+$lxs/9.0*6.0]
set	x126	[expr	$x119+$lxs/9.0*7.0]
set	x127	[expr	$x119+$lxs/9.0*8.0]
set	x128	[expr	$x119+$lxs]

#---------x方向第4跨(x方向共4跨)----------------			
#set	x128	[expr	$x119+$lxs]
set	x129	[expr	$x128+$lxs/9.0*1.0]
set	x130	[expr	$x128+$lxs/9.0*2.0]
set	x131	[expr	$x128+$lxs/9.0*3.0]
set	x132	[expr	$x128+$lxs/9.0*4.0]
set	x133	[expr	$x128+$lxs/9.0*5.0]
set	x134	[expr	$x128+$lxs/9.0*6.0]
set	x135	[expr	$x128+$lxs/9.0*7.0]
set	x136	[expr	$x128+$lxs/9.0*8.0]
set	x137	[expr	$x128+$lxs]

#------------------第1层（共4层）--------------------------
set z101  0
set z102  [expr $z101+$lgrdh/6.0*1.0]
set z103  [expr $z101+$lgrdh/6.0*2.0]
set z104  [expr $z101+$lgrdh/6.0*3.0]
set z105  [expr $z101+$lgrdh/6.0*4.0]
set z106  [expr $z101+$lgrdh/6.0*5.0]
set z107  [expr $z101+$lgrdh]

#------------------第2层（共4层）----------------------------
#set z107 [expr $z101+$lgrdh]
set z108  [expr $z107+$lothh/6.0*1.0]
set z109  [expr $z107+$lothh/6.0*2.0]
set z110  [expr $z107+$lothh/6.0*3.0]
set z111  [expr $z107+$lothh/6.0*4.0]
set z112  [expr $z107+$lothh/6.0*5.0]
set z113  [expr $z107+$lothh]

#------------------第3层（共4层）----------------------------
#set z113 [expr $z107+$lgrdh]
set z114  [expr $z113+$lothh/6.0*1.0]
set z115  [expr $z113+$lothh/6.0*2.0]
set z116  [expr $z113+$lothh/6.0*3.0]
set z117  [expr $z113+$lothh/6.0*4.0]
set z118  [expr $z113+$lothh/6.0*5.0]
set z119  [expr $z113+$lothh]

#------------------第4层（共4层）----------------------------
#set z119 [expr $z113+$lgrdh]
set z120  [expr $z119+$lothh/6.0*1.0]
set z121  [expr $z119+$lothh/6.0*2.0]
set z122  [expr $z119+$lothh/6.0*3.0]
set z123  [expr $z119+$lothh/6.0*4.0]
set z124  [expr $z119+$lothh/6.0*5.0]
set z125  [expr $z119+$lothh]


#--------------------定义节点-----------------------------------
#--------------------梁柱节点-----------------------------------
#第一层梁柱节点				
node	101	$x101	$y101	$z107
node	102	$x110	$y101	$z107
node	103	$x119	$y101	$z107
node	104	$x128	$y101	$z107
node	105	$x137	$y101	$z107
node	106	$x101	$y110	$z107
node	107	$x110	$y110	$z107
node	108	$x119	$y110	$z107
node	109	$x128	$y110	$z107
node	110	$x137	$y110	$z107
node	111	$x101	$y119	$z107
node	112	$x110	$y119	$z107
node	113	$x119	$y119	$z107
node	114	$x128	$y119	$z107
node	115	$x137	$y119	$z107
node	116	$x101	$y128	$z107
node	117	$x110	$y128	$z107
node	118	$x119	$y128	$z107
node	119	$x128	$y128	$z107
node	120	$x137	$y128	$z107
#第二层梁柱节点				
node	201	$x101	$y101	$z113
node	202	$x110	$y101	$z113
node	203	$x119	$y101	$z113
node	204	$x128	$y101	$z113
node	205	$x137	$y101	$z113
node	206	$x101	$y110	$z113
node	207	$x110	$y110	$z113
node	208	$x119	$y110	$z113
node	209	$x128	$y110	$z113
node	210	$x137	$y110	$z113
node	211	$x101	$y119	$z113
node	212	$x110	$y119	$z113
node	213	$x119	$y119	$z113
node	214	$x128	$y119	$z113
node	215	$x137	$y119	$z113
node	216	$x101	$y128	$z113
node	217	$x110	$y128	$z113
node	218	$x119	$y128	$z113
node	219	$x128	$y128	$z113
node	220	$x137	$y128	$z113
#第三层梁柱节点				
node	301	$x101	$y101	$z119
node	302	$x110	$y101	$z119
node	303	$x119	$y101	$z119
node	304	$x128	$y101	$z119
node	305	$x137	$y101	$z119
node	306	$x101	$y110	$z119
node	307	$x110	$y110	$z119
node	308	$x119	$y110	$z119
node	309	$x128	$y110	$z119
node	310	$x137	$y110	$z119
node	311	$x101	$y119	$z119
node	312	$x110	$y119	$z119
node	313	$x119	$y119	$z119
node	314	$x128	$y119	$z119
node	315	$x137	$y119	$z119
node	316	$x101	$y128	$z119
node	317	$x110	$y128	$z119
node	318	$x119	$y128	$z119
node	319	$x128	$y128	$z119
node	320	$x137	$y128	$z119
#第四层梁柱节点				
node	401	$x101	$y101	$z125
node	402	$x110	$y101	$z125
node	403	$x119	$y101	$z125
node	404	$x128	$y101	$z125
node	405	$x137	$y101	$z125
node	406	$x101	$y110	$z125
node	407	$x110	$y110	$z125
node	408	$x119	$y110	$z125
node	409	$x128	$y110	$z125
node	410	$x137	$y110	$z125
node	411	$x101	$y119	$z125
node	412	$x110	$y119	$z125
node	413	$x119	$y119	$z125
node	414	$x128	$y119	$z125
node	415	$x137	$y119	$z125
node	416	$x101	$y128	$z125
node	417	$x110	$y128	$z125
node	418	$x119	$y128	$z125
node	419	$x128	$y128	$z125
node	420	$x137	$y128	$z125

#-------------------梁节点--------------------------------
#第一层梁节点		
node	1101	$x102	$y101	$z107
node	1102	$x103	$y101	$z107
node	1103	$x104	$y101	$z107
node	1104	$x105	$y101	$z107
node	1105	$x106	$y101	$z107
node	1106	$x107	$y101	$z107
node	1107	$x108	$y101	$z107
node	1108	$x109	$y101	$z107

node	1109	$x111	$y101	$z107
node	1110	$x112	$y101	$z107
node	1111	$x113	$y101	$z107
node	1112	$x114	$y101	$z107
node	1113	$x115	$y101	$z107
node	1114	$x116	$y101	$z107
node	1115	$x117	$y101	$z107
node	1116	$x118	$y101	$z107

node	1117	$x120	$y101	$z107
node	1118	$x121	$y101	$z107
node	1119	$x122	$y101	$z107
node	1120	$x123	$y101	$z107
node	1121	$x124	$y101	$z107
node	1122	$x125	$y101	$z107
node	1123	$x126	$y101	$z107
node	1124	$x127	$y101	$z107

node	1125	$x129	$y101	$z107
node	1126	$x130	$y101	$z107
node	1127	$x131	$y101	$z107
node	1128	$x132	$y101	$z107
node	1129	$x133	$y101	$z107
node	1130	$x134	$y101	$z107
node	1131	$x135	$y101	$z107
node	1132	$x136	$y101	$z107

node	1133	$x102	$y110	$z107
node	1134	$x103	$y110	$z107
node	1135	$x104	$y110	$z107
node	1136	$x105	$y110	$z107
node	1137	$x106	$y110	$z107
node	1138	$x107	$y110	$z107
node	1139	$x108	$y110	$z107
node	1140	$x109	$y110	$z107

node	1141	$x111	$y110	$z107
node	1142	$x112	$y110	$z107
node	1143	$x113	$y110	$z107
node	1144	$x114	$y110	$z107
node	1145	$x115	$y110	$z107
node	1146	$x116	$y110	$z107
node	1147	$x117	$y110	$z107
node	1148	$x118	$y110	$z107

node	1149	$x120	$y110	$z107
node	1150	$x121	$y110	$z107
node	1151	$x122	$y110	$z107
node	1152	$x123	$y110	$z107
node	1153	$x124	$y110	$z107
node	1154	$x125	$y110	$z107
node	1155	$x126	$y110	$z107
node	1156	$x127	$y110	$z107

node	1157	$x129	$y110	$z107
node	1158	$x130	$y110	$z107
node	1159	$x131	$y110	$z107
node	1160	$x132	$y110	$z107
node	1161	$x133	$y110	$z107
node	1162	$x134	$y110	$z107
node	1163	$x135	$y110	$z107
node	1164	$x136	$y110	$z107

node	1165	$x102	$y119	$z107
node	1166	$x103	$y119	$z107
node	1167	$x104	$y119	$z107
node	1168	$x105	$y119	$z107
node	1169	$x106	$y119	$z107
node	1170	$x107	$y119	$z107
node	1171	$x108	$y119	$z107
node	1172	$x109	$y119	$z107

node	1173	$x111	$y119	$z107
node	1174	$x112	$y119	$z107
node	1175	$x113	$y119	$z107
node	1176	$x114	$y119	$z107
node	1177	$x115	$y119	$z107
node	1178	$x116	$y119	$z107
node	1179	$x117	$y119	$z107
node	1180	$x118	$y119	$z107

node	1181	$x120	$y119	$z107
node	1182	$x121	$y119	$z107
node	1183	$x122	$y119	$z107
node	1184	$x123	$y119	$z107
node	1185	$x124	$y119	$z107
node	1186	$x125	$y119	$z107
node	1187	$x126	$y119	$z107
node	1188	$x127	$y119	$z107

node	1189	$x129	$y119	$z107
node	1190	$x130	$y119	$z107
node	1191	$x131	$y119	$z107
node	1192	$x132	$y119	$z107
node	1193	$x133	$y119	$z107
node	1194	$x134	$y119	$z107
node	1195	$x135	$y119	$z107
node	1196	$x136	$y119	$z107

node	1197	$x102	$y128	$z107
node	1198	$x103	$y128	$z107
node	1199	$x104	$y128	$z107
node	11100	$x105	$y128	$z107
node	11101	$x106	$y128	$z107
node	11102	$x107	$y128	$z107
node	11103	$x108	$y128	$z107
node	11104	$x109	$y128	$z107

node	11105	$x111	$y128	$z107
node	11106	$x112	$y128	$z107
node	11107	$x113	$y128	$z107
node	11108	$x114	$y128	$z107
node	11109	$x115	$y128	$z107
node	11110	$x116	$y128	$z107
node	11111	$x117	$y128	$z107
node	11112	$x118	$y128	$z107

node	11113	$x120	$y128	$z107
node	11114	$x121	$y128	$z107
node	11115	$x122	$y128	$z107
node	11116	$x123	$y128	$z107
node	11117	$x124	$y128	$z107
node	11118	$x125	$y128	$z107
node	11119	$x126	$y128	$z107
node	11120	$x127	$y128	$z107

node	11121	$x129	$y128	$z107
node	11122	$x130	$y128	$z107
node	11123	$x131	$y128	$z107
node	11124	$x132	$y128	$z107
node	11125	$x133	$y128	$z107
node	11126	$x134	$y128	$z107
node	11127	$x135	$y128	$z107
node	11128	$x136	$y128	$z107

node	11129	$x101	$y102	$z107
node	11130	$x101	$y103	$z107
node	11131	$x101	$y104	$z107
node	11132	$x101	$y105	$z107
node	11133	$x101	$y106	$z107
node	11134	$x101	$y107	$z107
node	11135	$x101	$y108	$z107
node	11136	$x101	$y109	$z107

node	11137	$x101	$y111	$z107
node	11138	$x101	$y112	$z107
node	11139	$x101	$y113	$z107
node	11140	$x101	$y114	$z107
node	11141	$x101	$y115	$z107
node	11142	$x101	$y116	$z107
node	11143	$x101	$y117	$z107
node	11144	$x101	$y118	$z107

node	11145	$x101	$y120	$z107
node	11146	$x101	$y121	$z107
node	11147	$x101	$y122	$z107
node	11148	$x101	$y123	$z107
node	11149	$x101	$y124	$z107
node	11150	$x101	$y125	$z107
node	11151	$x101	$y126	$z107
node	11152	$x101	$y127	$z107

node	11153	$x110	$y102	$z107
node	11154	$x110	$y103	$z107
node	11155	$x110	$y104	$z107
node	11156	$x110	$y105	$z107
node	11157	$x110	$y106	$z107
node	11158	$x110	$y107	$z107
node	11159	$x110	$y108	$z107
node	11160	$x110	$y109	$z107

node	11161	$x110	$y111	$z107
node	11162	$x110	$y112	$z107
node	11163	$x110	$y113	$z107
node	11164	$x110	$y114	$z107
node	11165	$x110	$y115	$z107
node	11166	$x110	$y116	$z107
node	11167	$x110	$y117	$z107
node	11168	$x110	$y118	$z107

node	11169	$x110	$y120	$z107
node	11170	$x110	$y121	$z107
node	11171	$x110	$y122	$z107
node	11172	$x110	$y123	$z107
node	11173	$x110	$y124	$z107
node	11174	$x110	$y125	$z107
node	11175	$x110	$y126	$z107
node	11176	$x110	$y127	$z107

node	11177	$x119	$y102	$z107
node	11178	$x119	$y103	$z107
node	11179	$x119	$y104	$z107
node	11180	$x119	$y105	$z107
node	11181	$x119	$y106	$z107
node	11182	$x119	$y107	$z107
node	11183	$x119	$y108	$z107
node	11184	$x119	$y109	$z107

node	11185	$x119	$y111	$z107
node	11186	$x119	$y112	$z107
node	11187	$x119	$y113	$z107
node	11188	$x119	$y114	$z107
node	11189	$x119	$y115	$z107
node	11190	$x119	$y116	$z107
node	11191	$x119	$y117	$z107
node	11192	$x119	$y118	$z107

node	11193	$x119	$y120	$z107
node	11194	$x119	$y121	$z107
node	11195	$x119	$y122	$z107
node	11196	$x119	$y123	$z107
node	11197	$x119	$y124	$z107
node	11198	$x119	$y125	$z107
node	11199	$x119	$y126	$z107
node	11200	$x119	$y127	$z107

node	11201	$x128	$y102	$z107
node	11202	$x128	$y103	$z107
node	11203	$x128	$y104	$z107
node	11204	$x128	$y105	$z107
node	11205	$x128	$y106	$z107
node	11206	$x128	$y107	$z107
node	11207	$x128	$y108	$z107
node	11208	$x128	$y109	$z107

node	11209	$x128	$y111	$z107
node	11210	$x128	$y112	$z107
node	11211	$x128	$y113	$z107
node	11212	$x128	$y114	$z107
node	11213	$x128	$y115	$z107
node	11214	$x128	$y116	$z107
node	11215	$x128	$y117	$z107
node	11216	$x128	$y118	$z107

node	11217	$x128	$y120	$z107
node	11218	$x128	$y121	$z107
node	11219	$x128	$y122	$z107
node	11220	$x128	$y123	$z107
node	11221	$x128	$y124	$z107
node	11222	$x128	$y125	$z107
node	11223	$x128	$y126	$z107
node	11224	$x128	$y127	$z107

node	11225	$x137	$y102	$z107
node	11226	$x137	$y103	$z107
node	11227	$x137	$y104	$z107
node	11228	$x137	$y105	$z107
node	11229	$x137	$y106	$z107
node	11230	$x137	$y107	$z107
node	11231	$x137	$y108	$z107
node	11232	$x137	$y109	$z107

node	11233	$x137	$y111	$z107
node	11234	$x137	$y112	$z107
node	11235	$x137	$y113	$z107
node	11236	$x137	$y114	$z107
node	11237	$x137	$y115	$z107
node	11238	$x137	$y116	$z107
node	11239	$x137	$y117	$z107
node	11240	$x137	$y118	$z107

node	11241	$x137	$y120	$z107
node	11242	$x137	$y121	$z107
node	11243	$x137	$y122	$z107
node	11244	$x137	$y123	$z107
node	11245	$x137	$y124	$z107
node	11246	$x137	$y125	$z107
node	11247	$x137	$y126	$z107
node	11248	$x137	$y127	$z107


#第二层梁节点				
node	1201	$x102	$y101	$z113
node	1202	$x103	$y101	$z113
node	1203	$x104	$y101	$z113
node	1204	$x105	$y101	$z113
node	1205	$x106	$y101	$z113
node	1206	$x107	$y101	$z113
node	1207	$x108	$y101	$z113
node	1208	$x109	$y101	$z113

node	1209	$x111	$y101	$z113
node	1210	$x112	$y101	$z113
node	1211	$x113	$y101	$z113
node	1212	$x114	$y101	$z113
node	1213	$x115	$y101	$z113
node	1214	$x116	$y101	$z113
node	1215	$x117	$y101	$z113
node	1216	$x118	$y101	$z113

node	1217	$x120	$y101	$z113
node	1218	$x121	$y101	$z113
node	1219	$x122	$y101	$z113
node	1220	$x123	$y101	$z113
node	1221	$x124	$y101	$z113
node	1222	$x125	$y101	$z113
node	1223	$x126	$y101	$z113
node	1224	$x127	$y101	$z113

node	1225	$x129	$y101	$z113
node	1226	$x130	$y101	$z113
node	1227	$x131	$y101	$z113
node	1228	$x132	$y101	$z113
node	1229	$x133	$y101	$z113
node	1230	$x134	$y101	$z113
node	1231	$x135	$y101	$z113
node	1232	$x136	$y101	$z113

node	1233	$x102	$y110	$z113
node	1234	$x103	$y110	$z113
node	1235	$x104	$y110	$z113
node	1236	$x105	$y110	$z113
node	1237	$x106	$y110	$z113
node	1238	$x107	$y110	$z113
node	1239	$x108	$y110	$z113
node	1240	$x109	$y110	$z113

node	1241	$x111	$y110	$z113
node	1242	$x112	$y110	$z113
node	1243	$x113	$y110	$z113
node	1244	$x114	$y110	$z113
node	1245	$x115	$y110	$z113
node	1246	$x116	$y110	$z113
node	1247	$x117	$y110	$z113
node	1248	$x118	$y110	$z113

node	1249	$x120	$y110	$z113
node	1250	$x121	$y110	$z113
node	1251	$x122	$y110	$z113
node	1252	$x123	$y110	$z113
node	1253	$x124	$y110	$z113
node	1254	$x125	$y110	$z113
node	1255	$x126	$y110	$z113
node	1256	$x127	$y110	$z113

node	1257	$x129	$y110	$z113
node	1258	$x130	$y110	$z113
node	1259	$x131	$y110	$z113
node	1260	$x132	$y110	$z113
node	1261	$x133	$y110	$z113
node	1262	$x134	$y110	$z113
node	1263	$x135	$y110	$z113
node	1264	$x136	$y110	$z113

node	1265	$x102	$y119	$z113
node	1266	$x103	$y119	$z113
node	1267	$x104	$y119	$z113
node	1268	$x105	$y119	$z113
node	1269	$x106	$y119	$z113
node	1270	$x107	$y119	$z113
node	1271	$x108	$y119	$z113
node	1272	$x109	$y119	$z113

node	1273	$x111	$y119	$z113
node	1274	$x112	$y119	$z113
node	1275	$x113	$y119	$z113
node	1276	$x114	$y119	$z113
node	1277	$x115	$y119	$z113
node	1278	$x116	$y119	$z113
node	1279	$x117	$y119	$z113
node	1280	$x118	$y119	$z113

node	1281	$x120	$y119	$z113
node	1282	$x121	$y119	$z113
node	1283	$x122	$y119	$z113
node	1284	$x123	$y119	$z113
node	1285	$x124	$y119	$z113
node	1286	$x125	$y119	$z113
node	1287	$x126	$y119	$z113
node	1288	$x127	$y119	$z113

node	1289	$x129	$y119	$z113
node	1290	$x130	$y119	$z113
node	1291	$x131	$y119	$z113
node	1292	$x132	$y119	$z113
node	1293	$x133	$y119	$z113
node	1294	$x134	$y119	$z113
node	1295	$x135	$y119	$z113
node	1296	$x136	$y119	$z113

node	1297	$x102	$y128	$z113
node	1298	$x103	$y128	$z113
node	1299	$x104	$y128	$z113
node	12100	$x105	$y128	$z113
node	12101	$x106	$y128	$z113
node	12102	$x107	$y128	$z113
node	12103	$x108	$y128	$z113
node	12104	$x109	$y128	$z113

node	12105	$x111	$y128	$z113
node	12106	$x112	$y128	$z113
node	12107	$x113	$y128	$z113
node	12108	$x114	$y128	$z113
node	12109	$x115	$y128	$z113
node	12110	$x116	$y128	$z113
node	12111	$x117	$y128	$z113
node	12112	$x118	$y128	$z113

node	12113	$x120	$y128	$z113
node	12114	$x121	$y128	$z113
node	12115	$x122	$y128	$z113
node	12116	$x123	$y128	$z113
node	12117	$x124	$y128	$z113
node	12118	$x125	$y128	$z113
node	12119	$x126	$y128	$z113
node	12120	$x127	$y128	$z113

node	12121	$x129	$y128	$z113
node	12122	$x130	$y128	$z113
node	12123	$x131	$y128	$z113
node	12124	$x132	$y128	$z113
node	12125	$x133	$y128	$z113
node	12126	$x134	$y128	$z113
node	12127	$x135	$y128	$z113
node	12128	$x136	$y128	$z113

node	12129	$x101	$y102	$z113
node	12130	$x101	$y103	$z113
node	12131	$x101	$y104	$z113
node	12132	$x101	$y105	$z113
node	12133	$x101	$y106	$z113
node	12134	$x101	$y107	$z113
node	12135	$x101	$y108	$z113
node	12136	$x101	$y109	$z113

node	12137	$x101	$y111	$z113
node	12138	$x101	$y112	$z113
node	12139	$x101	$y113	$z113
node	12140	$x101	$y114	$z113
node	12141	$x101	$y115	$z113
node	12142	$x101	$y116	$z113
node	12143	$x101	$y117	$z113
node	12144	$x101	$y118	$z113

node	12145	$x101	$y120	$z113
node	12146	$x101	$y121	$z113
node	12147	$x101	$y122	$z113
node	12148	$x101	$y123	$z113
node	12149	$x101	$y124	$z113
node	12150	$x101	$y125	$z113
node	12151	$x101	$y126	$z113
node	12152	$x101	$y127	$z113

node	12153	$x110	$y102	$z113
node	12154	$x110	$y103	$z113
node	12155	$x110	$y104	$z113
node	12156	$x110	$y105	$z113
node	12157	$x110	$y106	$z113
node	12158	$x110	$y107	$z113
node	12159	$x110	$y108	$z113
node	12160	$x110	$y109	$z113

node	12161	$x110	$y111	$z113
node	12162	$x110	$y112	$z113
node	12163	$x110	$y113	$z113
node	12164	$x110	$y114	$z113
node	12165	$x110	$y115	$z113
node	12166	$x110	$y116	$z113
node	12167	$x110	$y117	$z113
node	12168	$x110	$y118	$z113

node	12169	$x110	$y120	$z113
node	12170	$x110	$y121	$z113
node	12171	$x110	$y122	$z113
node	12172	$x110	$y123	$z113
node	12173	$x110	$y124	$z113
node	12174	$x110	$y125	$z113
node	12175	$x110	$y126	$z113
node	12176	$x110	$y127	$z113

node	12177	$x119	$y102	$z113
node	12178	$x119	$y103	$z113
node	12179	$x119	$y104	$z113
node	12180	$x119	$y105	$z113
node	12181	$x119	$y106	$z113
node	12182	$x119	$y107	$z113
node	12183	$x119	$y108	$z113
node	12184	$x119	$y109	$z113

node	12185	$x119	$y111	$z113
node	12186	$x119	$y112	$z113
node	12187	$x119	$y113	$z113
node	12188	$x119	$y114	$z113
node	12189	$x119	$y115	$z113
node	12190	$x119	$y116	$z113
node	12191	$x119	$y117	$z113
node	12192	$x119	$y118	$z113

node	12193	$x119	$y120	$z113
node	12194	$x119	$y121	$z113
node	12195	$x119	$y122	$z113
node	12196	$x119	$y123	$z113
node	12197	$x119	$y124	$z113
node	12198	$x119	$y125	$z113
node	12199	$x119	$y126	$z113
node	12200	$x119	$y127	$z113

node	12201	$x128	$y102	$z113
node	12202	$x128	$y103	$z113
node	12203	$x128	$y104	$z113
node	12204	$x128	$y105	$z113
node	12205	$x128	$y106	$z113
node	12206	$x128	$y107	$z113
node	12207	$x128	$y108	$z113
node	12208	$x128	$y109	$z113

node	12209	$x128	$y111	$z113
node	12210	$x128	$y112	$z113
node	12211	$x128	$y113	$z113
node	12212	$x128	$y114	$z113
node	12213	$x128	$y115	$z113
node	12214	$x128	$y116	$z113
node	12215	$x128	$y117	$z113
node	12216	$x128	$y118	$z113

node	12217	$x128	$y120	$z113
node	12218	$x128	$y121	$z113
node	12219	$x128	$y122	$z113
node	12220	$x128	$y123	$z113
node	12221	$x128	$y124	$z113
node	12222	$x128	$y125	$z113
node	12223	$x128	$y126	$z113
node	12224	$x128	$y127	$z113

node	12225	$x137	$y102	$z113
node	12226	$x137	$y103	$z113
node	12227	$x137	$y104	$z113
node	12228	$x137	$y105	$z113
node	12229	$x137	$y106	$z113
node	12230	$x137	$y107	$z113
node	12231	$x137	$y108	$z113
node	12232	$x137	$y109	$z113

node	12233	$x137	$y111	$z113
node	12234	$x137	$y112	$z113
node	12235	$x137	$y113	$z113
node	12236	$x137	$y114	$z113
node	12237	$x137	$y115	$z113
node	12238	$x137	$y116	$z113
node	12239	$x137	$y117	$z113
node	12240	$x137	$y118	$z113

node	12241	$x137	$y120	$z113
node	12242	$x137	$y121	$z113
node	12243	$x137	$y122	$z113
node	12244	$x137	$y123	$z113
node	12245	$x137	$y124	$z113
node	12246	$x137	$y125	$z113
node	12247	$x137	$y126	$z113
node	12248	$x137	$y127	$z113

#第三层梁节点				
node	1301	$x102	$y101	$z119
node	1302	$x103	$y101	$z119
node	1303	$x104	$y101	$z119
node	1304	$x105	$y101	$z119
node	1305	$x106	$y101	$z119
node	1306	$x107	$y101	$z119
node	1307	$x108	$y101	$z119
node	1308	$x109	$y101	$z119

node	1309	$x111	$y101	$z119
node	1310	$x112	$y101	$z119
node	1311	$x113	$y101	$z119
node	1312	$x114	$y101	$z119
node	1313	$x115	$y101	$z119
node	1314	$x116	$y101	$z119
node	1315	$x117	$y101	$z119
node	1316	$x118	$y101	$z119

node	1317	$x120	$y101	$z119
node	1318	$x121	$y101	$z119
node	1319	$x122	$y101	$z119
node	1320	$x123	$y101	$z119
node	1321	$x124	$y101	$z119
node	1322	$x125	$y101	$z119
node	1323	$x126	$y101	$z119
node	1324	$x127	$y101	$z119

node	1325	$x129	$y101	$z119
node	1326	$x130	$y101	$z119
node	1327	$x131	$y101	$z119
node	1328	$x132	$y101	$z119
node	1329	$x133	$y101	$z119
node	1330	$x134	$y101	$z119
node	1331	$x135	$y101	$z119
node	1332	$x136	$y101	$z119

node	1333	$x102	$y110	$z119
node	1334	$x103	$y110	$z119
node	1335	$x104	$y110	$z119
node	1336	$x105	$y110	$z119
node	1337	$x106	$y110	$z119
node	1338	$x107	$y110	$z119
node	1339	$x108	$y110	$z119
node	1340	$x109	$y110	$z119

node	1341	$x111	$y110	$z119
node	1342	$x112	$y110	$z119
node	1343	$x113	$y110	$z119
node	1344	$x114	$y110	$z119
node	1345	$x115	$y110	$z119
node	1346	$x116	$y110	$z119
node	1347	$x117	$y110	$z119
node	1348	$x118	$y110	$z119

node	1349	$x120	$y110	$z119
node	1350	$x121	$y110	$z119
node	1351	$x122	$y110	$z119
node	1352	$x123	$y110	$z119
node	1353	$x124	$y110	$z119
node	1354	$x125	$y110	$z119
node	1355	$x126	$y110	$z119
node	1356	$x127	$y110	$z119

node	1357	$x129	$y110	$z119
node	1358	$x130	$y110	$z119
node	1359	$x131	$y110	$z119
node	1360	$x132	$y110	$z119
node	1361	$x133	$y110	$z119
node	1362	$x134	$y110	$z119
node	1363	$x135	$y110	$z119
node	1364	$x136	$y110	$z119

node	1365	$x102	$y119	$z119
node	1366	$x103	$y119	$z119
node	1367	$x104	$y119	$z119
node	1368	$x105	$y119	$z119
node	1369	$x106	$y119	$z119
node	1370	$x107	$y119	$z119
node	1371	$x108	$y119	$z119
node	1372	$x109	$y119	$z119

node	1373	$x111	$y119	$z119
node	1374	$x112	$y119	$z119
node	1375	$x113	$y119	$z119
node	1376	$x114	$y119	$z119
node	1377	$x115	$y119	$z119
node	1378	$x116	$y119	$z119
node	1379	$x117	$y119	$z119
node	1380	$x118	$y119	$z119

node	1381	$x120	$y119	$z119
node	1382	$x121	$y119	$z119
node	1383	$x122	$y119	$z119
node	1384	$x123	$y119	$z119
node	1385	$x124	$y119	$z119
node	1386	$x125	$y119	$z119
node	1387	$x126	$y119	$z119
node	1388	$x127	$y119	$z119

node	1389	$x129	$y119	$z119
node	1390	$x130	$y119	$z119
node	1391	$x131	$y119	$z119
node	1392	$x132	$y119	$z119
node	1393	$x133	$y119	$z119
node	1394	$x134	$y119	$z119
node	1395	$x135	$y119	$z119
node	1396	$x136	$y119	$z119

node	1397	$x102	$y128	$z119
node	1398	$x103	$y128	$z119
node	1399	$x104	$y128	$z119
node	13100	$x105	$y128	$z119
node	13101	$x106	$y128	$z119
node	13102	$x107	$y128	$z119
node	13103	$x108	$y128	$z119
node	13104	$x109	$y128	$z119

node	13105	$x111	$y128	$z119
node	13106	$x112	$y128	$z119
node	13107	$x113	$y128	$z119
node	13108	$x114	$y128	$z119
node	13109	$x115	$y128	$z119
node	13110	$x116	$y128	$z119
node	13111	$x117	$y128	$z119
node	13112	$x118	$y128	$z119

node	13113	$x120	$y128	$z119
node	13114	$x121	$y128	$z119
node	13115	$x122	$y128	$z119
node	13116	$x123	$y128	$z119
node	13117	$x124	$y128	$z119
node	13118	$x125	$y128	$z119
node	13119	$x126	$y128	$z119
node	13120	$x127	$y128	$z119

node	13121	$x129	$y128	$z119
node	13122	$x130	$y128	$z119
node	13123	$x131	$y128	$z119
node	13124	$x132	$y128	$z119
node	13125	$x133	$y128	$z119
node	13126	$x134	$y128	$z119
node	13127	$x135	$y128	$z119
node	13128	$x136	$y128	$z119

node	13129	$x101	$y102	$z119
node	13130	$x101	$y103	$z119
node	13131	$x101	$y104	$z119
node	13132	$x101	$y105	$z119
node	13133	$x101	$y106	$z119
node	13134	$x101	$y107	$z119
node	13135	$x101	$y108	$z119
node	13136	$x101	$y109	$z119

node	13137	$x101	$y111	$z119
node	13138	$x101	$y112	$z119
node	13139	$x101	$y113	$z119
node	13140	$x101	$y114	$z119
node	13141	$x101	$y115	$z119
node	13142	$x101	$y116	$z119
node	13143	$x101	$y117	$z119
node	13144	$x101	$y118	$z119

node	13145	$x101	$y120	$z119
node	13146	$x101	$y121	$z119
node	13147	$x101	$y122	$z119
node	13148	$x101	$y123	$z119
node	13149	$x101	$y124	$z119
node	13150	$x101	$y125	$z119
node	13151	$x101	$y126	$z119
node	13152	$x101	$y127	$z119

node	13153	$x110	$y102	$z119
node	13154	$x110	$y103	$z119
node	13155	$x110	$y104	$z119
node	13156	$x110	$y105	$z119
node	13157	$x110	$y106	$z119
node	13158	$x110	$y107	$z119
node	13159	$x110	$y108	$z119
node	13160	$x110	$y109	$z119

node	13161	$x110	$y111	$z119
node	13162	$x110	$y112	$z119
node	13163	$x110	$y113	$z119
node	13164	$x110	$y114	$z119
node	13165	$x110	$y115	$z119
node	13166	$x110	$y116	$z119
node	13167	$x110	$y117	$z119
node	13168	$x110	$y118	$z119

node	13169	$x110	$y120	$z119
node	13170	$x110	$y121	$z119
node	13171	$x110	$y122	$z119
node	13172	$x110	$y123	$z119
node	13173	$x110	$y124	$z119
node	13174	$x110	$y125	$z119
node	13175	$x110	$y126	$z119
node	13176	$x110	$y127	$z119

node	13177	$x119	$y102	$z119
node	13178	$x119	$y103	$z119
node	13179	$x119	$y104	$z119
node	13180	$x119	$y105	$z119
node	13181	$x119	$y106	$z119
node	13182	$x119	$y107	$z119
node	13183	$x119	$y108	$z119
node	13184	$x119	$y109	$z119

node	13185	$x119	$y111	$z119
node	13186	$x119	$y112	$z119
node	13187	$x119	$y113	$z119
node	13188	$x119	$y114	$z119
node	13189	$x119	$y115	$z119
node	13190	$x119	$y116	$z119
node	13191	$x119	$y117	$z119
node	13192	$x119	$y118	$z119

node	13193	$x119	$y120	$z119
node	13194	$x119	$y121	$z119
node	13195	$x119	$y122	$z119
node	13196	$x119	$y123	$z119
node	13197	$x119	$y124	$z119
node	13198	$x119	$y125	$z119
node	13199	$x119	$y126	$z119
node	13200	$x119	$y127	$z119

node	13201	$x128	$y102	$z119
node	13202	$x128	$y103	$z119
node	13203	$x128	$y104	$z119
node	13204	$x128	$y105	$z119
node	13205	$x128	$y106	$z119
node	13206	$x128	$y107	$z119
node	13207	$x128	$y108	$z119
node	13208	$x128	$y109	$z119

node	13209	$x128	$y111	$z119
node	13210	$x128	$y112	$z119
node	13211	$x128	$y113	$z119
node	13212	$x128	$y114	$z119
node	13213	$x128	$y115	$z119
node	13214	$x128	$y116	$z119
node	13215	$x128	$y117	$z119
node	13216	$x128	$y118	$z119

node	13217	$x128	$y120	$z119
node	13218	$x128	$y121	$z119
node	13219	$x128	$y122	$z119
node	13220	$x128	$y123	$z119
node	13221	$x128	$y124	$z119
node	13222	$x128	$y125	$z119
node	13223	$x128	$y126	$z119
node	13224	$x128	$y127	$z119

node	13225	$x137	$y102	$z119
node	13226	$x137	$y103	$z119
node	13227	$x137	$y104	$z119
node	13228	$x137	$y105	$z119
node	13229	$x137	$y106	$z119
node	13230	$x137	$y107	$z119
node	13231	$x137	$y108	$z119
node	13232	$x137	$y109	$z119

node	13233	$x137	$y111	$z119
node	13234	$x137	$y112	$z119
node	13235	$x137	$y113	$z119
node	13236	$x137	$y114	$z119
node	13237	$x137	$y115	$z119
node	13238	$x137	$y116	$z119
node	13239	$x137	$y117	$z119
node	13240	$x137	$y118	$z119

node	13241	$x137	$y120	$z119
node	13242	$x137	$y121	$z119
node	13243	$x137	$y122	$z119
node	13244	$x137	$y123	$z119
node	13245	$x137	$y124	$z119
node	13246	$x137	$y125	$z119
node	13247	$x137	$y126	$z119
node	13248	$x137	$y127	$z119


#第四层梁节点				
node	1401	$x102	$y101	$z125
node	1402	$x103	$y101	$z125
node	1403	$x104	$y101	$z125
node	1404	$x105	$y101	$z125
node	1405	$x106	$y101	$z125
node	1406	$x107	$y101	$z125
node	1407	$x108	$y101	$z125
node	1408	$x109	$y101	$z125

node	1409	$x111	$y101	$z125
node	1410	$x112	$y101	$z125
node	1411	$x113	$y101	$z125
node	1412	$x114	$y101	$z125
node	1413	$x115	$y101	$z125
node	1414	$x116	$y101	$z125
node	1415	$x117	$y101	$z125
node	1416	$x118	$y101	$z125

node	1417	$x120	$y101	$z125
node	1418	$x121	$y101	$z125
node	1419	$x122	$y101	$z125
node	1420	$x123	$y101	$z125
node	1421	$x124	$y101	$z125
node	1422	$x125	$y101	$z125
node	1423	$x126	$y101	$z125
node	1424	$x127	$y101	$z125

node	1425	$x129	$y101	$z125
node	1426	$x130	$y101	$z125
node	1427	$x131	$y101	$z125
node	1428	$x132	$y101	$z125
node	1429	$x133	$y101	$z125
node	1430	$x134	$y101	$z125
node	1431	$x135	$y101	$z125
node	1432	$x136	$y101	$z125

node	1433	$x102	$y110	$z125
node	1434	$x103	$y110	$z125
node	1435	$x104	$y110	$z125
node	1436	$x105	$y110	$z125
node	1437	$x106	$y110	$z125
node	1438	$x107	$y110	$z125
node	1439	$x108	$y110	$z125
node	1440	$x109	$y110	$z125

node	1441	$x111	$y110	$z125
node	1442	$x112	$y110	$z125
node	1443	$x113	$y110	$z125
node	1444	$x114	$y110	$z125
node	1445	$x115	$y110	$z125
node	1446	$x116	$y110	$z125
node	1447	$x117	$y110	$z125
node	1448	$x118	$y110	$z125

node	1449	$x120	$y110	$z125
node	1450	$x121	$y110	$z125
node	1451	$x122	$y110	$z125
node	1452	$x123	$y110	$z125
node	1453	$x124	$y110	$z125
node	1454	$x125	$y110	$z125
node	1455	$x126	$y110	$z125
node	1456	$x127	$y110	$z125

node	1457	$x129	$y110	$z125
node	1458	$x130	$y110	$z125
node	1459	$x131	$y110	$z125
node	1460	$x132	$y110	$z125
node	1461	$x133	$y110	$z125
node	1462	$x134	$y110	$z125
node	1463	$x135	$y110	$z125
node	1464	$x136	$y110	$z125

node	1465	$x102	$y119	$z125
node	1466	$x103	$y119	$z125
node	1467	$x104	$y119	$z125
node	1468	$x105	$y119	$z125
node	1469	$x106	$y119	$z125
node	1470	$x107	$y119	$z125
node	1471	$x108	$y119	$z125
node	1472	$x109	$y119	$z125

node	1473	$x111	$y119	$z125
node	1474	$x112	$y119	$z125
node	1475	$x113	$y119	$z125
node	1476	$x114	$y119	$z125
node	1477	$x115	$y119	$z125
node	1478	$x116	$y119	$z125
node	1479	$x117	$y119	$z125
node	1480	$x118	$y119	$z125

node	1481	$x120	$y119	$z125
node	1482	$x121	$y119	$z125
node	1483	$x122	$y119	$z125
node	1484	$x123	$y119	$z125
node	1485	$x124	$y119	$z125
node	1486	$x125	$y119	$z125
node	1487	$x126	$y119	$z125
node	1488	$x127	$y119	$z125

node	1489	$x129	$y119	$z125
node	1490	$x130	$y119	$z125
node	1491	$x131	$y119	$z125
node	1492	$x132	$y119	$z125
node	1493	$x133	$y119	$z125
node	1494	$x134	$y119	$z125
node	1495	$x135	$y119	$z125
node	1496	$x136	$y119	$z125

node	1497	$x102	$y128	$z125
node	1498	$x103	$y128	$z125
node	1499	$x104	$y128	$z125
node	14100	$x105	$y128	$z125
node	14101	$x106	$y128	$z125
node	14102	$x107	$y128	$z125
node	14103	$x108	$y128	$z125
node	14104	$x109	$y128	$z125

node	14105	$x111	$y128	$z125
node	14106	$x112	$y128	$z125
node	14107	$x113	$y128	$z125
node	14108	$x114	$y128	$z125
node	14109	$x115	$y128	$z125
node	14110	$x116	$y128	$z125
node	14111	$x117	$y128	$z125
node	14112	$x118	$y128	$z125

node	14113	$x120	$y128	$z125
node	14114	$x121	$y128	$z125
node	14115	$x122	$y128	$z125
node	14116	$x123	$y128	$z125
node	14117	$x124	$y128	$z125
node	14118	$x125	$y128	$z125
node	14119	$x126	$y128	$z125
node	14120	$x127	$y128	$z125

node	14121	$x129	$y128	$z125
node	14122	$x130	$y128	$z125
node	14123	$x131	$y128	$z125
node	14124	$x132	$y128	$z125
node	14125	$x133	$y128	$z125
node	14126	$x134	$y128	$z125
node	14127	$x135	$y128	$z125
node	14128	$x136	$y128	$z125

node	14129	$x101	$y102	$z125
node	14130	$x101	$y103	$z125
node	14131	$x101	$y104	$z125
node	14132	$x101	$y105	$z125
node	14133	$x101	$y106	$z125
node	14134	$x101	$y107	$z125
node	14135	$x101	$y108	$z125
node	14136	$x101	$y109	$z125

node	14137	$x101	$y111	$z125
node	14138	$x101	$y112	$z125
node	14139	$x101	$y113	$z125
node	14140	$x101	$y114	$z125
node	14141	$x101	$y115	$z125
node	14142	$x101	$y116	$z125
node	14143	$x101	$y117	$z125
node	14144	$x101	$y118	$z125

node	14145	$x101	$y120	$z125
node	14146	$x101	$y121	$z125
node	14147	$x101	$y122	$z125
node	14148	$x101	$y123	$z125
node	14149	$x101	$y124	$z125
node	14150	$x101	$y125	$z125
node	14151	$x101	$y126	$z125
node	14152	$x101	$y127	$z125

node	14153	$x110	$y102	$z125
node	14154	$x110	$y103	$z125
node	14155	$x110	$y104	$z125
node	14156	$x110	$y105	$z125
node	14157	$x110	$y106	$z125
node	14158	$x110	$y107	$z125
node	14159	$x110	$y108	$z125
node	14160	$x110	$y109	$z125

node	14161	$x110	$y111	$z125
node	14162	$x110	$y112	$z125
node	14163	$x110	$y113	$z125
node	14164	$x110	$y114	$z125
node	14165	$x110	$y115	$z125
node	14166	$x110	$y116	$z125
node	14167	$x110	$y117	$z125
node	14168	$x110	$y118	$z125

node	14169	$x110	$y120	$z125
node	14170	$x110	$y121	$z125
node	14171	$x110	$y122	$z125
node	14172	$x110	$y123	$z125
node	14173	$x110	$y124	$z125
node	14174	$x110	$y125	$z125
node	14175	$x110	$y126	$z125
node	14176	$x110	$y127	$z125

node	14177	$x119	$y102	$z125
node	14178	$x119	$y103	$z125
node	14179	$x119	$y104	$z125
node	14180	$x119	$y105	$z125
node	14181	$x119	$y106	$z125
node	14182	$x119	$y107	$z125
node	14183	$x119	$y108	$z125
node	14184	$x119	$y109	$z125

node	14185	$x119	$y111	$z125
node	14186	$x119	$y112	$z125
node	14187	$x119	$y113	$z125
node	14188	$x119	$y114	$z125
node	14189	$x119	$y115	$z125
node	14190	$x119	$y116	$z125
node	14191	$x119	$y117	$z125
node	14192	$x119	$y118	$z125

node	14193	$x119	$y120	$z125
node	14194	$x119	$y121	$z125
node	14195	$x119	$y122	$z125
node	14196	$x119	$y123	$z125
node	14197	$x119	$y124	$z125
node	14198	$x119	$y125	$z125
node	14199	$x119	$y126	$z125
node	14200	$x119	$y127	$z125

node	14201	$x128	$y102	$z125
node	14202	$x128	$y103	$z125
node	14203	$x128	$y104	$z125
node	14204	$x128	$y105	$z125
node	14205	$x128	$y106	$z125
node	14206	$x128	$y107	$z125
node	14207	$x128	$y108	$z125
node	14208	$x128	$y109	$z125

node	14209	$x128	$y111	$z125
node	14210	$x128	$y112	$z125
node	14211	$x128	$y113	$z125
node	14212	$x128	$y114	$z125
node	14213	$x128	$y115	$z125
node	14214	$x128	$y116	$z125
node	14215	$x128	$y117	$z125
node	14216	$x128	$y118	$z125

node	14217	$x128	$y120	$z125
node	14218	$x128	$y121	$z125
node	14219	$x128	$y122	$z125
node	14220	$x128	$y123	$z125
node	14221	$x128	$y124	$z125
node	14222	$x128	$y125	$z125
node	14223	$x128	$y126	$z125
node	14224	$x128	$y127	$z125

node	14225	$x137	$y102	$z125
node	14226	$x137	$y103	$z125
node	14227	$x137	$y104	$z125
node	14228	$x137	$y105	$z125
node	14229	$x137	$y106	$z125
node	14230	$x137	$y107	$z125
node	14231	$x137	$y108	$z125
node	14232	$x137	$y109	$z125

node	14233	$x137	$y111	$z125
node	14234	$x137	$y112	$z125
node	14235	$x137	$y113	$z125
node	14236	$x137	$y114	$z125
node	14237	$x137	$y115	$z125
node	14238	$x137	$y116	$z125
node	14239	$x137	$y117	$z125
node	14240	$x137	$y118	$z125

node	14241	$x137	$y120	$z125
node	14242	$x137	$y121	$z125
node	14243	$x137	$y122	$z125
node	14244	$x137	$y123	$z125
node	14245	$x137	$y124	$z125
node	14246	$x137	$y125	$z125
node	14247	$x137	$y126	$z125
node	14248	$x137	$y127	$z125



#-----------------柱节点----------------------
#x101-y101柱				
node	2101	$x101	$y101	$z101
node	2102	$x101	$y101	$z102
node	2103	$x101	$y101	$z103
node	2104	$x101	$y101	$z104
node	2105	$x101	$y101	$z105
node	2106	$x101	$y101	$z106

node	2107	$x101	$y101	$z108
node	2108	$x101	$y101	$z109
node	2109	$x101	$y101	$z110
node	2110	$x101	$y101	$z111
node	2111	$x101	$y101	$z112

node	2112	$x101	$y101	$z114
node	2113	$x101	$y101	$z115
node	2114	$x101	$y101	$z116
node	2115	$x101	$y101	$z117
node	2116	$x101	$y101	$z118

node	2117	$x101	$y101	$z120
node	2118	$x101	$y101	$z121
node	2119	$x101	$y101	$z122
node	2120	$x101	$y101	$z123
node	2121	$x101	$y101	$z124
#x110-y101柱				
node	2122	$x110	$y101	$z101
node	2123	$x110	$y101	$z102
node	2124	$x110	$y101	$z103
node	2125	$x110	$y101	$z104
node	2126	$x110	$y101	$z105
node	2127	$x110	$y101	$z106

node	2128	$x110	$y101	$z108
node	2129	$x110	$y101	$z109
node	2130	$x110	$y101	$z110
node	2131	$x110	$y101	$z111
node	2132	$x110	$y101	$z112

node	2133	$x110	$y101	$z114
node	2134	$x110	$y101	$z115
node	2135	$x110	$y101	$z116
node	2136	$x110	$y101	$z117
node	2137	$x110	$y101	$z118

node	2138	$x110	$y101	$z120
node	2139	$x110	$y101	$z121
node	2140	$x110	$y101	$z122
node	2141	$x110	$y101	$z123
node	2142	$x110	$y101	$z124

#x119-y101柱				
node	2143	$x119	$y101	$z101
node	2144	$x119	$y101	$z102
node	2145	$x119	$y101	$z103
node	2146	$x119	$y101	$z104
node	2147	$x119	$y101	$z105
node	2148	$x119	$y101	$z106

node	2149	$x119	$y101	$z108
node	2150	$x119	$y101	$z109
node	2151	$x119	$y101	$z110
node	2152	$x119	$y101	$z111
node	2153	$x119	$y101	$z112

node	2154	$x119	$y101	$z114
node	2155	$x119	$y101	$z115
node	2156	$x119	$y101	$z116
node	2157	$x119	$y101	$z117
node	2158	$x119	$y101	$z118

node	2159	$x119	$y101	$z120
node	2160	$x119	$y101	$z121
node	2161	$x119	$y101	$z122
node	2162	$x119	$y101	$z123
node	2163	$x119	$y101	$z124
#x128-y101柱				
node	2164	$x128	$y101	$z101
node	2165	$x128	$y101	$z102
node	2166	$x128	$y101	$z103
node	2167	$x128	$y101	$z104
node	2168	$x128	$y101	$z105
node	2169	$x128	$y101	$z106

node	2170	$x128	$y101	$z108
node	2171	$x128	$y101	$z109
node	2172	$x128	$y101	$z110
node	2173	$x128	$y101	$z111
node	2174	$x128	$y101	$z112

node	2175	$x128	$y101	$z114
node	2176	$x128	$y101	$z115
node	2177	$x128	$y101	$z116
node	2178	$x128	$y101	$z117
node	2179	$x128	$y101	$z118

node	2180	$x128	$y101	$z120
node	2181	$x128	$y101	$z121
node	2182	$x128	$y101	$z122
node	2183	$x128	$y101	$z123
node	2184	$x128	$y101	$z124
#x137-y101柱				
node	2185	$x137	$y101	$z101
node	2186	$x137	$y101	$z102
node	2187	$x137	$y101	$z103
node	2188	$x137	$y101	$z104
node	2189	$x137	$y101	$z105
node	2190	$x137	$y101	$z106

node	2191	$x137	$y101	$z108
node	2192	$x137	$y101	$z109
node	2193	$x137	$y101	$z110
node	2194	$x137	$y101	$z111
node	2195	$x137	$y101	$z112

node	2196	$x137	$y101	$z114
node	2197	$x137	$y101	$z115
node	2198	$x137	$y101	$z116
node	2199	$x137	$y101	$z117
node	21100	$x137	$y101	$z118

node	21101	$x137	$y101	$z120
node	21102	$x137	$y101	$z121
node	21103	$x137	$y101	$z122
node	21104	$x137	$y101	$z123
node	21105	$x137	$y101	$z124
#x101-y110柱				
node	21106	$x101	$y110	$z101
node	21107	$x101	$y110	$z102
node	21108	$x101	$y110	$z103
node	21109	$x101	$y110	$z104
node	21110	$x101	$y110	$z105
node	21111	$x101	$y110	$z106

node	21112	$x101	$y110	$z108
node	21113	$x101	$y110	$z109
node	21114	$x101	$y110	$z110
node	21115	$x101	$y110	$z111
node	21116	$x101	$y110	$z112

node	21117	$x101	$y110	$z114
node	21118	$x101	$y110	$z115
node	21119	$x101	$y110	$z116
node	21120	$x101	$y110	$z117
node	21121	$x101	$y110	$z118

node	21122	$x101	$y110	$z120
node	21123	$x101	$y110	$z121
node	21124	$x101	$y110	$z122
node	21125	$x101	$y110	$z123
node	21126	$x101	$y110	$z124
#x110-y110柱				
node	21127	$x110	$y110	$z101
node	21128	$x110	$y110	$z102
node	21129	$x110	$y110	$z103
node	21130	$x110	$y110	$z104
node	21131	$x110	$y110	$z105
node	21132	$x110	$y110	$z106

node	21133	$x110	$y110	$z108
node	21134	$x110	$y110	$z109
node	21135	$x110	$y110	$z110
node	21136	$x110	$y110	$z111
node	21137	$x110	$y110	$z112

node	21138	$x110	$y110	$z114
node	21139	$x110	$y110	$z115
node	21140	$x110	$y110	$z116
node	21141	$x110	$y110	$z117
node	21142	$x110	$y110	$z118

node	21143	$x110	$y110	$z120
node	21144	$x110	$y110	$z121
node	21145	$x110	$y110	$z122
node	21146	$x110	$y110	$z123
node	21147	$x110	$y110	$z124
#x119-y110柱				
node	21148	$x119	$y110	$z101
node	21149	$x119	$y110	$z102
node	21150	$x119	$y110	$z103
node	21151	$x119	$y110	$z104
node	21152	$x119	$y110	$z105
node	21153	$x119	$y110	$z106

node	21154	$x119	$y110	$z108
node	21155	$x119	$y110	$z109
node	21156	$x119	$y110	$z110
node	21157	$x119	$y110	$z111
node	21158	$x119	$y110	$z112

node	21159	$x119	$y110	$z114
node	21160	$x119	$y110	$z115
node	21161	$x119	$y110	$z116
node	21162	$x119	$y110	$z117
node	21163	$x119	$y110	$z118

#node	21164	$x119	$y110	$z120
#node	21165	$x119	$y110	$z121
#node	21166	$x119	$y110	$z122
#node	21167	$x119	$y110	$z123
#node	21168	$x119	$y110	$z124
#x128-y110柱				
node	21169	$x128	$y110	$z101
node	21170	$x128	$y110	$z102
node	21171	$x128	$y110	$z103
node	21172	$x128	$y110	$z104
node	21173	$x128	$y110	$z105
node	21174	$x128	$y110	$z106

node	21175	$x128	$y110	$z108
node	21176	$x128	$y110	$z109
node	21177	$x128	$y110	$z110
node	21178	$x128	$y110	$z111
node	21179	$x128	$y110	$z112

node	21180	$x128	$y110	$z114
node	21181	$x128	$y110	$z115
node	21182	$x128	$y110	$z116
node	21183	$x128	$y110	$z117
node	21184	$x128	$y110	$z118

node	21185	$x128	$y110	$z120
node	21186	$x128	$y110	$z121
node	21187	$x128	$y110	$z122
node	21188	$x128	$y110	$z123
node	21189	$x128	$y110	$z124
#x137-y110柱				
node	21190	$x137	$y110	$z101
node	21191	$x137	$y110	$z102
node	21192	$x137	$y110	$z103
node	21193	$x137	$y110	$z104
node	21194	$x137	$y110	$z105
node	21195	$x137	$y110	$z106

node	21196	$x137	$y110	$z108
node	21197	$x137	$y110	$z109
node	21198	$x137	$y110	$z110
node	21199	$x137	$y110	$z111
node	21200	$x137	$y110	$z112

node	21201	$x137	$y110	$z114
node	21202	$x137	$y110	$z115
node	21203	$x137	$y110	$z116
node	21204	$x137	$y110	$z117
node	21205	$x137	$y110	$z118

node	21206	$x137	$y110	$z120
node	21207	$x137	$y110	$z121
node	21208	$x137	$y110	$z122
node	21209	$x137	$y110	$z123
node	21210	$x137	$y110	$z124
#x101-y119柱				
node	21211	$x101	$y119	$z101
node	21212	$x101	$y119	$z102
node	21213	$x101	$y119	$z103
node	21214	$x101	$y119	$z104
node	21215	$x101	$y119	$z105
node	21216	$x101	$y119	$z106

node	21217	$x101	$y119	$z108
node	21218	$x101	$y119	$z109
node	21219	$x101	$y119	$z110
node	21220	$x101	$y119	$z111
node	21221	$x101	$y119	$z112

node	21222	$x101	$y119	$z114
node	21223	$x101	$y119	$z115
node	21224	$x101	$y119	$z116
node	21225	$x101	$y119	$z117
node	21226	$x101	$y119	$z118

node	21227	$x101	$y119	$z120
node	21228	$x101	$y119	$z121
node	21229	$x101	$y119	$z122
node	21230	$x101	$y119	$z123
node	21231	$x101	$y119	$z124
#x110-y119柱				
node	21232	$x110	$y119	$z101
node	21233	$x110	$y119	$z102
node	21234	$x110	$y119	$z103
node	21235	$x110	$y119	$z104
node	21236	$x110	$y119	$z105
node	21237	$x110	$y119	$z106

node	21238	$x110	$y119	$z108
node	21239	$x110	$y119	$z109
node	21240	$x110	$y119	$z110
node	21241	$x110	$y119	$z111
node	21242	$x110	$y119	$z112

node	21243	$x110	$y119	$z114
node	21244	$x110	$y119	$z115
node	21245	$x110	$y119	$z116
node	21246	$x110	$y119	$z117
node	21247	$x110	$y119	$z118

node	21248	$x110	$y119	$z120
node	21249	$x110	$y119	$z121
node	21250	$x110	$y119	$z122
node	21251	$x110	$y119	$z123
node	21252	$x110	$y119	$z124
#x119-y119柱				
node	21253	$x119	$y119	$z101
node	21254	$x119	$y119	$z102
node	21255	$x119	$y119	$z103
node	21256	$x119	$y119	$z104
node	21257	$x119	$y119	$z105
node	21258	$x119	$y119	$z106

node	21259	$x119	$y119	$z108
node	21260	$x119	$y119	$z109
node	21261	$x119	$y119	$z110
node	21262	$x119	$y119	$z111
node	21263	$x119	$y119	$z112

node	21264	$x119	$y119	$z114
node	21265	$x119	$y119	$z115
node	21266	$x119	$y119	$z116
node	21267	$x119	$y119	$z117
node	21268	$x119	$y119	$z118

node	21269	$x119	$y119	$z120
node	21270	$x119	$y119	$z121
node	21271	$x119	$y119	$z122
node	21272	$x119	$y119	$z123
node	21273	$x119	$y119	$z124
#x128-y119柱				
node	21274	$x128	$y119	$z101
node	21275	$x128	$y119	$z102
node	21276	$x128	$y119	$z103
node	21277	$x128	$y119	$z104
node	21278	$x128	$y119	$z105
node	21279	$x128	$y119	$z106

node	21280	$x128	$y119	$z108
node	21281	$x128	$y119	$z109
node	21282	$x128	$y119	$z110
node	21283	$x128	$y119	$z111
node	21284	$x128	$y119	$z112

node	21285	$x128	$y119	$z114
node	21286	$x128	$y119	$z115
node	21287	$x128	$y119	$z116
node	21288	$x128	$y119	$z117
node	21289	$x128	$y119	$z118

node	21290	$x128	$y119	$z120
node	21291	$x128	$y119	$z121
node	21292	$x128	$y119	$z122
node	21293	$x128	$y119	$z123
node	21294	$x128	$y119	$z124
#x137-y119柱				
node	21295	$x137	$y119	$z101
node	21296	$x137	$y119	$z102
node	21297	$x137	$y119	$z103
node	21298	$x137	$y119	$z104
node	21299	$x137	$y119	$z105
node	21300	$x137	$y119	$z106

node	21301	$x137	$y119	$z108
node	21302	$x137	$y119	$z109
node	21303	$x137	$y119	$z110
node	21304	$x137	$y119	$z111
node	21305	$x137	$y119	$z112

node	21306	$x137	$y119	$z114
node	21307	$x137	$y119	$z115
node	21308	$x137	$y119	$z116
node	21309	$x137	$y119	$z117
node	21310	$x137	$y119	$z118

node	21311	$x137	$y119	$z120
node	21312	$x137	$y119	$z121
node	21313	$x137	$y119	$z122
node	21314	$x137	$y119	$z123
node	21315	$x137	$y119	$z124
#x101-y128柱				
node	21316	$x101	$y128	$z101
node	21317	$x101	$y128	$z102
node	21318	$x101	$y128	$z103
node	21319	$x101	$y128	$z104
node	21320	$x101	$y128	$z105
node	21321	$x101	$y128	$z106

node	21322	$x101	$y128	$z108
node	21323	$x101	$y128	$z109
node	21324	$x101	$y128	$z110
node	21325	$x101	$y128	$z111
node	21326	$x101	$y128	$z112

node	21327	$x101	$y128	$z114
node	21328	$x101	$y128	$z115
node	21329	$x101	$y128	$z116
node	21330	$x101	$y128	$z117
node	21331	$x101	$y128	$z118

node	21332	$x101	$y128	$z120
node	21333	$x101	$y128	$z121
node	21334	$x101	$y128	$z122
node	21335	$x101	$y128	$z123
node	21336	$x101	$y128	$z124
#x110-y128柱				
node	21337	$x110	$y128	$z101
node	21338	$x110	$y128	$z102
node	21339	$x110	$y128	$z103
node	21340	$x110	$y128	$z104
node	21341	$x110	$y128	$z105
node	21342	$x110	$y128	$z106

node	21343	$x110	$y128	$z108
node	21344	$x110	$y128	$z109
node	21345	$x110	$y128	$z110
node	21346	$x110	$y128	$z111
node	21347	$x110	$y128	$z112

node	21348	$x110	$y128	$z114
node	21349	$x110	$y128	$z115
node	21350	$x110	$y128	$z116
node	21351	$x110	$y128	$z117
node	21352	$x110	$y128	$z118

node	21353	$x110	$y128	$z120
node	21354	$x110	$y128	$z121
node	21355	$x110	$y128	$z122
node	21356	$x110	$y128	$z123
node	21357	$x110	$y128	$z124
#x119-y128柱				
node	21358	$x119	$y128	$z101
node	21359	$x119	$y128	$z102
node	21360	$x119	$y128	$z103
node	21361	$x119	$y128	$z104
node	21362	$x119	$y128	$z105
node	21363	$x119	$y128	$z106

node	21364	$x119	$y128	$z108
node	21365	$x119	$y128	$z109
node	21366	$x119	$y128	$z110
node	21367	$x119	$y128	$z111
node	21368	$x119	$y128	$z112

node	21369	$x119	$y128	$z114
node	21370	$x119	$y128	$z115
node	21371	$x119	$y128	$z116
node	21372	$x119	$y128	$z117
node	21373	$x119	$y128	$z118

node	21374	$x119	$y128	$z120
node	21375	$x119	$y128	$z121
node	21376	$x119	$y128	$z122
node	21377	$x119	$y128	$z123
node	21378	$x119	$y128	$z124
#x128-y128柱				
node	21379	$x128	$y128	$z101
node	21380	$x128	$y128	$z102
node	21381	$x128	$y128	$z103
node	21382	$x128	$y128	$z104
node	21383	$x128	$y128	$z105
node	21384	$x128	$y128	$z106

node	21385	$x128	$y128	$z108
node	21386	$x128	$y128	$z109
node	21387	$x128	$y128	$z110
node	21388	$x128	$y128	$z111
node	21389	$x128	$y128	$z112

node	21390	$x128	$y128	$z114
node	21391	$x128	$y128	$z115
node	21392	$x128	$y128	$z116
node	21393	$x128	$y128	$z117
node	21394	$x128	$y128	$z118

node	21395	$x128	$y128	$z120
node	21396	$x128	$y128	$z121
node	21397	$x128	$y128	$z122
node	21398	$x128	$y128	$z123
node	21399	$x128	$y128	$z124
#x137-y128柱				
node	21400	$x137	$y128	$z101
node	21401	$x137	$y128	$z102
node	21402	$x137	$y128	$z103
node	21403	$x137	$y128	$z104
node	21404	$x137	$y128	$z105
node	21405	$x137	$y128	$z106

node	21406	$x137	$y128	$z108
node	21407	$x137	$y128	$z109
node	21408	$x137	$y128	$z110
node	21409	$x137	$y128	$z111
node	21410	$x137	$y128	$z112

node	21411	$x137	$y128	$z114
node	21412	$x137	$y128	$z115
node	21413	$x137	$y128	$z116
node	21414	$x137	$y128	$z117
node	21415	$x137	$y128	$z118

node	21416	$x137	$y128	$z120
node	21417	$x137	$y128	$z121
node	21418	$x137	$y128	$z122
node	21419	$x137	$y128	$z123
node	21420	$x137	$y128	$z124




#----定义边界条件----
fix 2101      1 1 1 1 1 1
#fix 2106      1 1 1 1 1 1
fix 2122      1 1 1 1 1 1
fix 2143      1 1 1 1 1 1
fix 2164      1 1 1 1 1 1 
fix 2185      1 1 1 1 1 1
fix 21106     1 1 1 1 1 1 
fix 21127     1 1 1 1 1 1
fix 21148     1 1 1 1 1 1
fix 21169     1 1 1 1 1 1 
fix 21190     1 1 1 1 1 1  
fix	21211   	1 1 1 1 1 1
fix	21232	    1 1 1 1 1 1
fix	21253   	1 1 1 1 1 1
fix	21274	    1 1 1 1 1 1
fix	21295	    1 1 1 1 1 1
fix	21316	    1 1 1 1 1 1
fix	21337	    1 1 1 1 1 1
fix	21358	    1 1 1 1 1 1
fix	21379	    1 1 1 1 1 1
fix	21400	    1 1 1 1 1 1

#---------钢筋半径,beamr为梁的箍筋直径+纵筋半径，columnr为柱的箍筋直径+纵筋半径-------------------------
set beamr   0.015
#set beamr   0.010
set columnr 0.017

#---------------------------定义截面------------------------------
#---梁截面关键点---
set ByI  [expr -$beamh/2]
set BzI  [expr -$beamw/2]
set ByJ  [expr  $beamh/2]
set BzJ  [expr  $beamw/2]
#---梁筋关键点---
set sByI [expr -$beamh/2+$c+$beamr]
set sBzI [expr -$beamw/2+$c+$beamr]
set sByJ [expr  $beamh/2-$c-$beamr]
set sBzJ [expr  $beamw/2-$c-$beamr]








#-----------------------------------------------------梁截面--------------------------------------------------------------------------------

#第一层X方向外围角梁跨中
section Fiber 110 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1100 $sByI $sBzI $sByI $sBzJ         

}  

#第一层X方向外围角梁梁端
section Fiber 111 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1100 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向外围角梁跨中
section Fiber 120 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1200 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向外围角梁梁端
section Fiber 121 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1200 $sByI $sBzI $sByI $sBzJ         

}

#第一层X方向外围中梁跨中
section Fiber 130 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1300 $sByI $sBzI $sByI $sBzJ         

}  

#第一层X方向外围中梁梁端
section Fiber 131 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1300 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向外围中梁跨中
section Fiber 140 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1400 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向外围中梁梁端
section Fiber 141 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1400 $sByI $sBzI $sByI $sBzJ         

}

#第一层X方向内梁跨中
section Fiber 150 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1500 $sByI $sBzI $sByI $sBzJ         

}  

#第一层X方向内梁梁端
section Fiber 151 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1500 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向内梁跨中
section Fiber 160 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1600 $sByI $sBzI $sByI $sBzJ         

}  

#第一层y方向内梁梁端
section Fiber 161 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A1601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A1600 $sByI $sBzI $sByI $sBzJ         

}

#第二层X方向外围角梁跨中
section Fiber 210 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2100 $sByI $sBzI $sByI $sBzJ         

}  

#第二层X方向外围角梁梁端
section Fiber 211 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2100 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向外围角梁跨中
section Fiber 220 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2200 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向外围角梁梁端
section Fiber 221 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2200 $sByI $sBzI $sByI $sBzJ         

}

#第二层X方向外围中梁跨中
section Fiber 230 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2300 $sByI $sBzI $sByI $sBzJ         

}  

#第二层X方向外围中梁梁端
section Fiber 231 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2300 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向外围中梁跨中
section Fiber 240 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2400 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向外围中梁梁端
section Fiber 241 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2400 $sByI $sBzI $sByI $sBzJ         

}

#第二层X方向内梁跨中
section Fiber 250 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2500 $sByI $sBzI $sByI $sBzJ         

}  

#第二层X方向内梁梁端
section Fiber 251 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2500 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向内梁跨中
section Fiber 260 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2600 $sByI $sBzI $sByI $sBzJ         

}  

#第二层y方向内梁梁端
section Fiber 261 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A2601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A2600 $sByI $sBzI $sByI $sBzJ         

}

#第三层X方向外围角梁跨中
section Fiber 310 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3100 $sByI $sBzI $sByI $sBzJ         

}  

#第三层X方向外围角梁梁端
section Fiber 311 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3100 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向外围角梁跨中
section Fiber 320 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3200 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向外围角梁梁端
section Fiber 321 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3200 $sByI $sBzI $sByI $sBzJ         

}

#第三层X方向外围中梁跨中
section Fiber 330 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3300 $sByI $sBzI $sByI $sBzJ         

}  

#第三层X方向外围中梁梁端
section Fiber 331 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3300 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向外围中梁跨中
section Fiber 340 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3400 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向外围中梁梁端
section Fiber 341 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3400 $sByI $sBzI $sByI $sBzJ         

}

#第三层X方向内梁跨中
section Fiber 350 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3500 $sByI $sBzI $sByI $sBzJ         

}  

#第三层X方向内梁梁端
section Fiber 351 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3500 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向内梁跨中
section Fiber 360 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3600 $sByI $sBzI $sByI $sBzJ         

}  

#第三层y方向内梁梁端
section Fiber 361 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A3601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A3600 $sByI $sBzI $sByI $sBzJ         

}

#第四层X方向外围角梁跨中
section Fiber 410 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4100 $sByI $sBzI $sByI $sBzJ         

}  

#第四层X方向外围角梁梁端
section Fiber 411 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4101 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4100 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向外围角梁跨中
section Fiber 420 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4200 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向外围角梁梁端
section Fiber 421 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4201 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4200 $sByI $sBzI $sByI $sBzJ         

}

#第四层X方向外围中梁跨中
section Fiber 430 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4300 $sByI $sBzI $sByI $sBzJ         

}  

#第四层X方向外围中梁梁端
section Fiber 431 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4301 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4300 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向外围中梁跨中
section Fiber 440 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4400 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向外围中梁梁端
section Fiber 441 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4401 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4400 $sByI $sBzI $sByI $sBzJ         

}

#第四层X方向内梁跨中
section Fiber 450 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4500 $sByI $sBzI $sByI $sBzJ         

}  

#第四层X方向内梁梁端
section Fiber 451 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4501 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4500 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向内梁跨中
section Fiber 460 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4600 $sByI $sBzI $sByI $sBzJ         

}  

#第四层y方向内梁梁端
section Fiber 461 -torsion 7 {
# ---------划分纤维单元--------------------------------------------        
#---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          101              10              5              $ByI            $BzI            $ByJ            $BzJ        
#钢筋          
#上部钢筋 
layer straight 1 4 $A4601 $sByJ $sBzI $sByJ $sBzJ        

#下部钢筋
layer straight 1 4 $A4600 $sByI $sBzI $sByI $sBzJ         

}

#---柱截面关键点---
set CyI  [expr -$columnd/2] 
set CzI  [expr -$columnd/2] 
set CyJ  [expr  $columnd/2] 
set CzJ  [expr  $columnd/2] 
#---柱核心区关键点(sCy4-1为y方向从下到上)---
set sCy4 [expr -$columnd/2+$c+$columnr]
set sCy3 [expr -$columnd/2+$c+$columnr+($columnd-2*$c-2*$columnr)/3.0]
set sCy2 [expr -$columnd/2+$c+$columnr+2*($columnd-2*$c-2*$columnr)/3.0]
set sCy1 [expr  $columnd/2-$c-$columnr]
set sCyI [expr -$columnd/2+$c+$columnr]
set sCzI [expr -$columnd/2+$c+$columnr]
set sCyJ [expr  $columnd/2-$c-$columnr]
set sCzJ [expr  $columnd/2-$c-$columnr]


#-----------------------------------------------------柱截面--------------------------------------------------------------------------------

#普通柱
section Fiber 1 -torsion 8 {
#---柱矩形单元 截面所用材料     Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          111              5             5              $sCyI           $sCzI           $sCyJ           $sCzJ   
patch rect          101              6             1               $CyI            $CzI            $CyJ            $sCzI  
patch rect          101              6             1               $CyI            $sCzJ           $CyJ            $CzJ
patch rect          101              1              5              $CyI            $sCzI           $sCyI            $sCzJ 
patch rect          101              1              5              $sCyJ            $sCzI           $CyJ            $sCzJ     
#钢筋          
#上部中部钢筋 
layer straight 1 2 $A02 $sCy1 $sCy2 $sCy1 $sCy3  

#上部角筋 
layer straight 1 2 $A01 $sCy1 $sCzI $sCy1 $sCzJ     

#第二层钢筋
layer straight 1 2 $A02 $sCy2 $sCzI $sCy2 $sCzJ  

#第三层钢筋
layer straight 1 2 $A02 $sCy3 $sCzI $sCy3 $sCzJ       

#下部中部钢筋
layer straight 1 2 $A02 $sCy4 $sCy2 $sCy4 $sCy3 

#下部角筋
layer straight 1 2 $A01 $sCy4 $sCzI $sCy4 $sCzJ         

}  

#角柱
section Fiber 2 -torsion 8 {
#---柱矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          111              5             5               $sCyI           $sCzI           $sCyJ           $sCzJ   
patch rect          101              6             1               $CyI            $CzI            $CyJ            $sCzI  
patch rect          101              6             1               $CyI            $sCzJ           $CyJ            $CzJ
patch rect          101              1              5              $CyI            $sCzI           $sCyI            $sCzJ 
patch rect          101              1              5              $sCyJ            $sCzI           $CyJ            $sCzJ        
#钢筋          
#上部中部钢筋 
layer straight 1 2 $A02 $sCy1 $sCy2 $sCy1 $sCy3  

#上部角筋 
layer straight 1 2 $A00 $sCy1 $sCzI $sCy1 $sCzJ     

#第二层钢筋
layer straight 1 2 $A02 $sCy2 $sCzI $sCy2 $sCzJ  

#第三层钢筋
layer straight 1 2 $A02 $sCy3 $sCzI $sCy3 $sCzJ       

#下部中部钢筋
layer straight 1 2 $A02 $sCy4 $sCy2 $sCy4 $sCy3 

#下部角筋
layer straight 1 2 $A00 $sCy4 $sCzI $sCy4 $sCzJ        

}  

#-----------------------------------------------------弹性截面--------------------------------------------------------------------------------

##-----------------------------------------------------梁截面--------------------------------------------------------------------------------
#
##第一层X方向外围角梁跨中
#section Fiber 1100 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层X方向外围角梁梁端
#section Fiber 1110 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向外围角梁跨中
#section Fiber 1200 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1200 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向外围角梁梁端
#section Fiber 1210 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1200 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第一层X方向外围中梁跨中
#section Fiber 1300 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层X方向外围中梁梁端
#section Fiber 1310 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向外围中梁跨中
#section Fiber 1400 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1400 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向外围中梁梁端
#section Fiber 1410 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1400 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第一层X方向内梁跨中
#section Fiber 1500 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层X方向内梁梁端
#section Fiber 1510 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向内梁跨中
#section Fiber 1600 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1600 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第一层y方向内梁梁端
#section Fiber 1610 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A1601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A1600 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第二层X方向外围角梁跨中
#section Fiber 2100 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层X方向外围角梁梁端
#section Fiber 2110 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向外围角梁跨中
#section Fiber 2200 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2200 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向外围角梁梁端
#section Fiber 2210 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2200 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第二层X方向外围中梁跨中
#section Fiber 2300 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层X方向外围中梁梁端
#section Fiber 2310 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向外围中梁跨中
#section Fiber 2400 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2400 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向外围中梁梁端
#section Fiber 2410 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2400 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第二层X方向内梁跨中
#section Fiber 2500 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层X方向内梁梁端
#section Fiber 2510 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向内梁跨中
#section Fiber 2600 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2600 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第二层y方向内梁梁端
#section Fiber 2610 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A2601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A2600 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第三层X方向外围角梁跨中
#section Fiber 3100 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层X方向外围角梁梁端
#section Fiber 3110 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向外围角梁跨中
#section Fiber 3200 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3200 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向外围角梁梁端
#section Fiber 3210 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3200 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第三层X方向外围中梁跨中
#section Fiber 3300 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层X方向外围中梁梁端
#section Fiber 3310 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向外围中梁跨中
#section Fiber 3400 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3400 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向外围中梁梁端
#section Fiber 3410 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3400 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第三层X方向内梁跨中
#section Fiber 3500 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层X方向内梁梁端
#section Fiber 3510 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向内梁跨中
#section Fiber 3600 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3600 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第三层y方向内梁梁端
#section Fiber 3610 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A3601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A3600 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第四层X方向外围角梁跨中
#section Fiber 4100 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层X方向外围角梁梁端
#section Fiber 4110 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4101 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4100 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向外围角梁跨中
#section Fiber 4200 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4200 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向外围角梁梁端
#section Fiber 4210 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4201 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4200 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第四层X方向外围中梁跨中
#section Fiber 4300 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层X方向外围中梁梁端
#section Fiber 4310 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4301 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4300 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向外围中梁跨中
#section Fiber 4400 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4400 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向外围中梁梁端
#section Fiber 4410 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4401 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4400 $sByI $sBzI $sByI $sBzJ         
#
#}
#
##第四层X方向内梁跨中
#section Fiber 4500 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层X方向内梁梁端
#section Fiber 4510 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4501 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4500 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向内梁跨中
#section Fiber 4600 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4600 $sByI $sBzI $sByI $sBzJ         
#
#}  
#
##第四层y方向内梁梁端
#section Fiber 4610 -torsion 7 {
## ---------划分纤维单元--------------------------------------------        
##---梁矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
#patch rect          102              10              5              $ByI            $BzI            $ByJ            $BzJ        
##钢筋          
##上部钢筋 
#layer straight 1 4 $A4601 $sByJ $sBzI $sByJ $sBzJ        
#
##下部钢筋
#layer straight 1 4 $A4600 $sByI $sBzI $sByI $sBzJ         
#
#}

#-----------------------------------------------------柱截面--------------------------------------------------------------------------------

#普通柱
section Fiber 10 -torsion 8 {
#---柱矩形单元 截面所用材料     Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          102              5             5               $sCyI           $sCzI           $sCyJ           $sCzJ   
patch rect          102              6             1               $CyI            $CzI            $CyJ            $sCzI  
patch rect          102              6             1               $CyI            $sCzJ           $CyJ            $CzJ
patch rect          102              1              5              $CyI            $sCzI           $sCyI            $sCzJ 
patch rect          102              1              5              $sCyJ            $sCzI           $CyJ            $sCzJ     
#钢筋          
#上部中部钢筋 
layer straight 1 2 $A02 $sCy1 $sCy2 $sCy1 $sCy3  

#上部角筋 
layer straight 1 2 $A01 $sCy1 $sCzI $sCy1 $sCzJ     

#第二层钢筋
layer straight 1 2 $A02 $sCy2 $sCzI $sCy2 $sCzJ  

#第三层钢筋
layer straight 1 2 $A02 $sCy3 $sCzI $sCy3 $sCzJ       

#下部中部钢筋
layer straight 1 2 $A02 $sCy4 $sCy2 $sCy4 $sCy3 

#下部角筋
layer straight 1 2 $A01 $sCy4 $sCzI $sCy4 $sCzJ         

}  

#角柱
section Fiber 20 -torsion 8 {
#---柱矩形单元 划分单元截面号 Y方向划分个数  Z方向划分个数    1点Y方向坐标    1点Z方向坐标   2点Y方向坐标  2点Z方向坐标 
patch rect          102              5             5               $sCyI           $sCzI           $sCyJ           $sCzJ   
patch rect          102              6             1               $CyI            $CzI            $CyJ            $sCzI  
patch rect          102              6             1               $CyI            $sCzJ           $CyJ            $CzJ
patch rect          102              1              5              $CyI            $sCzI           $sCyI            $sCzJ 
patch rect          102              1              5              $sCyJ            $sCzI           $CyJ            $sCzJ        
#钢筋          
#上部中部钢筋 
layer straight 1 2 $A02 $sCy1 $sCy2 $sCy1 $sCy3  

#上部角筋 
layer straight 1 2 $A00 $sCy1 $sCzI $sCy1 $sCzJ     

#第二层钢筋
layer straight 1 2 $A02 $sCy2 $sCzI $sCy2 $sCzJ  

#第三层钢筋
layer straight 1 2 $A02 $sCy3 $sCzI $sCy3 $sCzJ       

#下部中部钢筋
layer straight 1 2 $A02 $sCy4 $sCy2 $sCy4 $sCy3 

#下部角筋
layer straight 1 2 $A00 $sCy4 $sCzI $sCy4 $sCzJ        

}




#----几何变换----
#z方向柱子
geomTransf PDelta 1  1  0  0
#y方向的梁
geomTransf Corotational 2  1  0  0
#x方向的梁
geomTransf Corotational 3  0 -1  0

#----定义单元----                                                                                                                                                         
set np 5


#-------------------单元编号 节点1 节点2  高斯点  截面编号   变化号
element	dispBeamColumn	2101	2101	2102	$np	2	1
element	dispBeamColumn	2102	2102	2103	$np	2	1
element	dispBeamColumn	2103	2103	2104	$np	2	1
element	dispBeamColumn	2104	2104	2105	$np	2	1
element	dispBeamColumn	2105	2105	2106	$np	2	1
element	dispBeamColumn	2106	2106	101	  $np	2	1
element	dispBeamColumn	101	  101	  2107	$np	2	1
element	dispBeamColumn	2107	2107	2108	$np	2	1
element	dispBeamColumn	2108	2108	2109	$np	2	1
element	dispBeamColumn	2109	2109	2110	$np	2	1
element	dispBeamColumn	2110	2110	2111	$np	2	1
element	dispBeamColumn	2111	2111	201	  $np	2	1
element	dispBeamColumn	201	  201	  2112  $np	2	1
element	dispBeamColumn	2112	2112	2113	$np	2	1
element	dispBeamColumn	2113	2113	2114	$np	2	1
element	dispBeamColumn	2114	2114	2115	$np	2	1
element	dispBeamColumn	2115	2115	2116	$np	2	1
element	dispBeamColumn	2116	2116	301 	$np	2	1
element	dispBeamColumn	301	  301	  2117	$np	2	1
element	dispBeamColumn	2117	2117	2118	$np	2	1
element	dispBeamColumn	2118	2118	2119	$np	2	1
element	dispBeamColumn	2119	2119	2120	$np	2	1
element	dispBeamColumn	2120	2120	2121	$np	2	1
element	dispBeamColumn	2121	2121	401	  $np	2	1

element	dispBeamColumn	2122	2122	2123	$np	1	1
element	dispBeamColumn	2123	2123	2124	$np	1	1
element	dispBeamColumn	2124	2124	2125	$np	1	1
element	dispBeamColumn	2125	2125	2126	$np	1	1
element	dispBeamColumn	2126	2126	2127	$np	1	1
element	dispBeamColumn	2127	2127	102	  $np	1	1
element	dispBeamColumn	102	  102	  2128	$np	1	1
element	dispBeamColumn	2128	2128	2129	$np	1	1
element	dispBeamColumn	2129	2129	2130	$np	1	1
element	dispBeamColumn	2130	2130	2131	$np	1	1
element	dispBeamColumn	2131	2131	2132	$np	1	1
element	dispBeamColumn	2132	2132	202	  $np	1	1
element	dispBeamColumn	202	  202	  2133	$np	1	1
element	dispBeamColumn	2133	2133	2134	$np	1	1
element	dispBeamColumn	2134	2134	2135	$np	1	1
element	dispBeamColumn	2135	2135	2136	$np	1	1
element	dispBeamColumn	2136	2136	2137	$np	1	1
element	dispBeamColumn	2137	2137	302	  $np	1	1
element	dispBeamColumn	302	  302	  2138  $np	1	1
element	dispBeamColumn	2138	2138	2139	$np	1	1
element	dispBeamColumn	2139	2139	2140	$np	1	1
element	dispBeamColumn	2140	2140	2141	$np	1	1
element	dispBeamColumn	2141	2141	2142	$np	1	1
element	dispBeamColumn	2142	2142	402	  $np	1	1

element	dispBeamColumn	2143	2143	2144	$np	1	1
element	dispBeamColumn	2144	2144	2145	$np	1	1
element	dispBeamColumn	2145	2145	2146	$np	1	1
element	dispBeamColumn	2146	2146	2147	$np	1	1
element	dispBeamColumn	2147	2147	2148	$np	1	1
element	dispBeamColumn	2148	2148	103	  $np	1	1
element	dispBeamColumn	103	  103	  2149	$np	1	1
element	dispBeamColumn	2149	2149	2150	$np	1	1
element	dispBeamColumn	2150	2150	2151	$np	1	1
element	dispBeamColumn	2151	2151	2152	$np	1	1
element	dispBeamColumn	2152	2152	2153	$np	1	1
element	dispBeamColumn	2153	2153	203	  $np	1	1
element	dispBeamColumn	203	  203	  2154	$np	1	1
element	dispBeamColumn	2154	2154	2155	$np	1	1
element	dispBeamColumn	2155	2155	2156	$np	1	1
element	dispBeamColumn	2156	2156	2157	$np	1	1
element	dispBeamColumn	2157	2157	2158	$np	1	1
element	dispBeamColumn	2158	2158	303	  $np	1	1
element	dispBeamColumn	303	  303	  2159	$np	1	1
element	dispBeamColumn	2159	2159	2160	$np	1	1
element	dispBeamColumn	2160	2160	2161	$np	1	1
element	dispBeamColumn	2161	2161	2162	$np	1	1
element	dispBeamColumn	2162	2162	2163	$np	1	1
element	dispBeamColumn	2163	2163	403	  $np	1	1

element	dispBeamColumn	2164	2164	2165	$np	1	1
element	dispBeamColumn	2165	2165	2166	$np	1	1
element	dispBeamColumn	2166	2166	2167	$np	1	1
element	dispBeamColumn	2167	2167	2168	$np	1	1
element	dispBeamColumn	2168	2168	2169	$np	1	1
element	dispBeamColumn	2169	2169	104	  $np	1	1
element	dispBeamColumn	104	  104	  2170	$np	1	1
element	dispBeamColumn	2170	2170	2171	$np	1	1
element	dispBeamColumn	2171	2171	2172	$np	1	1
element	dispBeamColumn	2172	2172	2173	$np	1	1
element	dispBeamColumn	2173	2173	2174	$np	1	1
element	dispBeamColumn	2174	2174	204	  $np	1	1
element	dispBeamColumn	204	  204	  2175	$np	1	1
element	dispBeamColumn	2175	2175	2176	$np	1	1
element	dispBeamColumn	2176	2176	2177	$np	1	1
element	dispBeamColumn	2177	2177	2178	$np	1	1
element	dispBeamColumn	2178	2178	2179	$np	1	1
element	dispBeamColumn	2179	2179	304	  $np	1	1
element	dispBeamColumn	304	  304	  2180	$np	1	1
element	dispBeamColumn	2180	2180	2181	$np	1	1
element	dispBeamColumn	2181	2181	2182	$np	1	1
element	dispBeamColumn	2182	2182	2183	$np	1	1
element	dispBeamColumn	2183	2183	2184	$np	1	1
element	dispBeamColumn	2184	2184	404 	$np	1	1

element	dispBeamColumn	2185	2185	2186	$np	2	1
element	dispBeamColumn	2186	2186	2187	$np	2	1
element	dispBeamColumn	2187	2187	2188	$np	2	1
element	dispBeamColumn	2188	2188	2189	$np	2	1
element	dispBeamColumn	2189	2189	2190	$np	2	1
element	dispBeamColumn	2190	2190	105	  $np	2	1
element	dispBeamColumn	105	  105	  2191	$np	2	1
element	dispBeamColumn	2191	2191	2192	$np	2	1
element	dispBeamColumn	2192	2192	2193	$np	2	1
element	dispBeamColumn	2193	2193	2194	$np	2	1
element	dispBeamColumn	2194	2194	2195	$np	2	1
element	dispBeamColumn	2195	2195	205	  $np	2	1
element	dispBeamColumn	205	  205	  2196	$np	2	1
element	dispBeamColumn	2196	2196	2197	$np	2	1
element	dispBeamColumn	2197	2197	2198	$np	2	1
element	dispBeamColumn	2198	2198	2199	$np	2	1
element	dispBeamColumn	2199	2199	21100	$np	2	1
element	dispBeamColumn	21100	21100	305	  $np	2	1
element	dispBeamColumn	305	  305	  21101	$np	2	1
element	dispBeamColumn	21101	21101	21102	$np	2	1
element	dispBeamColumn	21102	21102	21103	$np	2	1
element	dispBeamColumn	21103	21103	21104	$np	2	1
element	dispBeamColumn	21104	21104	21105	$np	2	1
element	dispBeamColumn	21105	21105	405 	$np	2	1

element	dispBeamColumn	21106	21106	21107	$np	1	1
element	dispBeamColumn	21107	21107	21108	$np	1	1
element	dispBeamColumn	21108	21108	21109	$np	1	1
element	dispBeamColumn	21109	21109	21110	$np	1	1
element	dispBeamColumn	21110	21110	21111	$np	1	1
element	dispBeamColumn	21111	21111	106	  $np	1	1
element	dispBeamColumn	106	  106 	21112	$np	1	1
element	dispBeamColumn	21112	21112	21113	$np	1	1
element	dispBeamColumn	21113	21113	21114	$np	1	1
element	dispBeamColumn	21114	21114	21115	$np	1	1
element	dispBeamColumn	21115	21115	21116	$np	1	1
element	dispBeamColumn	21116	21116	206	  $np	1	1
element	dispBeamColumn	206	  206	  21117	$np	1	1
element	dispBeamColumn	21117	21117	21118	$np	1	1
element	dispBeamColumn	21118	21118	21119	$np	1	1
element	dispBeamColumn	21119	21119	21120	$np	1	1
element	dispBeamColumn	21120	21120	21121	$np	1	1
element	dispBeamColumn	21121	21121	306	  $np	1	1
element	dispBeamColumn	306	  306	  21122	$np	1	1
element	dispBeamColumn	21122	21122	21123	$np	1	1
element	dispBeamColumn	21123	21123	21124	$np	1	1
element	dispBeamColumn	21124	21124	21125	$np	1	1
element	dispBeamColumn	21125	21125	21126	$np	1	1
element	dispBeamColumn	21126	21126	406	  $np	1	1

element	dispBeamColumn	21127	21127	21128	$np	1	1
element	dispBeamColumn	21128	21128	21129	$np	1	1
element	dispBeamColumn	21129	21129	21130	$np	1	1
element	dispBeamColumn	21130	21130	21131	$np	1	1
element	dispBeamColumn	21131	21131	21132	$np	1	1
element	dispBeamColumn	21132	21132	107	  $np	1	1
element	dispBeamColumn	107	  107	  21133	$np	1	1
element	dispBeamColumn	21133	21133	21134	$np	1	1
element	dispBeamColumn	21134	21134	21135	$np	1	1
element	dispBeamColumn	21135	21135	21136	$np	1	1
element	dispBeamColumn	21136	21136	21137	$np	1	1
element	dispBeamColumn	21137	21137	207	  $np	1	1
element	dispBeamColumn	207	  207	  21138	$np	1	1
element	dispBeamColumn	21138	21138	21139	$np	1	1
element	dispBeamColumn	21139	21139	21140	$np	1	1
element	dispBeamColumn	21140	21140	21141	$np	1	1
element	dispBeamColumn	21141	21141	21142	$np	1	1
element	dispBeamColumn	21142	21142	307	  $np	1	1
element	dispBeamColumn	307	  307	  21143	$np	1	1
element	dispBeamColumn	21143	21143	21144	$np	1	1
element	dispBeamColumn	21144	21144	21145	$np	1	1
element	dispBeamColumn	21145	21145	21146	$np	1	1
element	dispBeamColumn	21146	21146	21147	$np	1	1
element	dispBeamColumn	21147	21147	407	  $np	1	1

element	dispBeamColumn	21148	21148	21149	$np	1	1
element	dispBeamColumn	21149	21149	21150	$np	1	1
element	dispBeamColumn	21150	21150	21151	$np	1	1
element	dispBeamColumn	21151	21151	21152	$np	1	1
element	dispBeamColumn	21152	21152	21153	$np	1	1
element	dispBeamColumn	21153	21153	108	  $np	1	1
element	dispBeamColumn	108	  108	  21154	$np	1	1
element	dispBeamColumn	21154	21154	21155	$np	1	1
element	dispBeamColumn	21155	21155	21156	$np	1	1
element	dispBeamColumn	21156	21156	21157	$np	1	1
element	dispBeamColumn	21157	21157	21158	$np	1	1
element	dispBeamColumn	21158	21158	208	  $np	1	1
element	dispBeamColumn	208	  208	  21159	$np	1	1
element	dispBeamColumn	21159	21159	21160	$np	1	1
element	dispBeamColumn	21160	21160	21161	$np	1	1
element	dispBeamColumn	21161	21161	21162	$np	1	1
element	dispBeamColumn	21162	21162	21163	$np	1	1
element	dispBeamColumn	21163	21163	308	  $np	1	1          
#弹性单元308
element	dispBeamColumn	308	  308	  408	$np	10	1
#element	dispBeamColumn	21164	21164	21165	$np	1	1
#element	dispBeamColumn	21165	21165	21166	$np	1	1
#element	dispBeamColumn	21166	21166	21167	$np	1	1
#element	dispBeamColumn	21167	21167	21168	$np	1	1
#element	dispBeamColumn	21168	21168	408	  $np	1	1

element	dispBeamColumn	21169	21169	21170	$np	1	1
element	dispBeamColumn	21170	21170	21171	$np	1	1
element	dispBeamColumn	21171	21171	21172	$np	1	1
element	dispBeamColumn	21172	21172	21173	$np	1	1
element	dispBeamColumn	21173	21173	21174	$np	1	1
element	dispBeamColumn	21174	21174	109	  $np	1	1
element	dispBeamColumn	109	  109	  21175	$np	1	1
element	dispBeamColumn	21175	21175	21176	$np	1	1
element	dispBeamColumn	21176	21176	21177	$np	1	1
element	dispBeamColumn	21177	21177	21178	$np	1	1
element	dispBeamColumn	21178	21178	21179	$np	1	1
element	dispBeamColumn	21179	21179	209	  $np	1	1
element	dispBeamColumn	209	  209	  21180	$np	1	1
element	dispBeamColumn	21180	21180	21181	$np	1	1
element	dispBeamColumn	21181	21181	21182	$np	1	1
element	dispBeamColumn	21182	21182	21183	$np	1	1
element	dispBeamColumn	21183	21183	21184	$np	1	1
element	dispBeamColumn	21184	21184	309	  $np	1	1
element	dispBeamColumn	309	  309	  21185	$np	1	1
element	dispBeamColumn	21185	21185	21186	$np	1	1
element	dispBeamColumn	21186	21186	21187	$np	1	1
element	dispBeamColumn	21187	21187	21188	$np	1	1
element	dispBeamColumn	21188	21188	21189	$np	1	1
element	dispBeamColumn	21189	21189	409	  $np	1	1

element	dispBeamColumn	21190	21190	21191	$np	1	1
element	dispBeamColumn	21191	21191	21192	$np	1	1
element	dispBeamColumn	21192	21192	21193	$np	1	1
element	dispBeamColumn	21193	21193	21194	$np	1	1
element	dispBeamColumn	21194	21194	21195	$np	1	1
element	dispBeamColumn	21195	21195	110	  $np	1	1
element	dispBeamColumn	110 	110	  21196	$np	1	1
element	dispBeamColumn	21196	21196	21197	$np	1	1
element	dispBeamColumn	21197	21197	21198	$np	1	1
element	dispBeamColumn	21198	21198	21199	$np	1	1
element	dispBeamColumn	21199	21199	21200	$np	1	1
element	dispBeamColumn	21200	21200	210	  $np	1	1
element	dispBeamColumn	210	  210	  21201	$np	1	1
element	dispBeamColumn	21201	21201	21202	$np	1	1
element	dispBeamColumn	21202	21202	21203	$np	1	1
element	dispBeamColumn	21203	21203	21204	$np	1	1
element	dispBeamColumn	21204	21204	21205	$np	1	1
element	dispBeamColumn	21205	21205	310	  $np	1	1
element	dispBeamColumn	310	  310	  21206	$np	1	1
element	dispBeamColumn	21206	21206	21207	$np	1	1
element	dispBeamColumn	21207	21207	21208	$np	1	1
element	dispBeamColumn	21208	21208	21209	$np	1	1
element	dispBeamColumn	21209	21209	21210	$np	1	1
element	dispBeamColumn	21210	21210	410 	$np	1	1

element	dispBeamColumn	21211	21211	21212	$np	1	1
element	dispBeamColumn	21212	21212	21213	$np	1	1
element	dispBeamColumn	21213	21213	21214	$np	1	1
element	dispBeamColumn	21214	21214	21215	$np	1	1
element	dispBeamColumn	21215	21215	21216	$np	1	1
element	dispBeamColumn	21216	21216	111 	$np	1	1
element	dispBeamColumn	111	  111	  21217	$np	1	1
element	dispBeamColumn	21217	21217	21218	$np	1	1
element	dispBeamColumn	21218	21218	21219	$np	1	1
element	dispBeamColumn	21219	21219	21220	$np	1	1
element	dispBeamColumn	21220	21220	21221	$np	1	1
element	dispBeamColumn	21221	21221	211	  $np	1	1
element	dispBeamColumn	211	  211	  21222	$np	1	1
element	dispBeamColumn	21222	21222	21223	$np	1	1
element	dispBeamColumn	21223	21223	21224	$np	1	1
element	dispBeamColumn	21224	21224	21225	$np	1	1
element	dispBeamColumn	21225	21225	21226	$np	1	1
element	dispBeamColumn	21226	21226	311	  $np	1	1
element	dispBeamColumn	311	  311	  21227	$np	1	1
element	dispBeamColumn	21227	21227	21228	$np	1	1
element	dispBeamColumn	21228	21228	21229	$np	1	1
element	dispBeamColumn	21229	21229	21230	$np	1	1
element	dispBeamColumn	21230	21230	21231	$np	1	1
element	dispBeamColumn	21231	21231	411	  $np	1	1

element	dispBeamColumn	21232	21232	21233	$np	1	1
element	dispBeamColumn	21233	21233	21234	$np	1	1
element	dispBeamColumn	21234	21234	21235	$np	1	1
element	dispBeamColumn	21235	21235	21236	$np	1	1
element	dispBeamColumn	21236	21236	21237	$np	1	1
element	dispBeamColumn	21237	21237	112	  $np	1	1
element	dispBeamColumn	112	  112	  21238 $np	1	1
element	dispBeamColumn	21238	21238	21239	$np	1	1
element	dispBeamColumn	21239	21239	21240	$np	1	1
element	dispBeamColumn	21240	21240	21241	$np	1	1
element	dispBeamColumn	21241	21241	21242	$np	1	1
element	dispBeamColumn	21242	21242	212 	$np	1	1
element	dispBeamColumn	212	  212	  21243	$np	1	1
element	dispBeamColumn	21243	21243	21244	$np	1	1
element	dispBeamColumn	21244	21244	21245	$np	1	1
element	dispBeamColumn	21245	21245	21246	$np	1	1
element	dispBeamColumn	21246	21246	21247	$np	1	1
element	dispBeamColumn	21247	21247	312	  $np	1	1
element	dispBeamColumn	312	  312	  21248	$np	1	1
element	dispBeamColumn	21248	21248	21249	$np	1	1
element	dispBeamColumn	21249	21249	21250	$np	1	1
element	dispBeamColumn	21250	21250	21251	$np	1	1
element	dispBeamColumn	21251	21251	21252	$np	1	1
element	dispBeamColumn	21252	21252	412	  $np	1	1

element	dispBeamColumn	21253	21253	21254	$np	1	1
element	dispBeamColumn	21254	21254	21255	$np	1	1
element	dispBeamColumn	21255	21255	21256	$np	1	1
element	dispBeamColumn	21256	21256	21257	$np	1	1
element	dispBeamColumn	21257	21257	21258	$np	1	1
element	dispBeamColumn	21258	21258	113	  $np	1	1
element	dispBeamColumn	113	  113	  21259	$np	1	1
element	dispBeamColumn	21259	21259	21260	$np	1	1
element	dispBeamColumn	21260	21260	21261	$np	1	1
element	dispBeamColumn	21261	21261	21262	$np	1	1
element	dispBeamColumn	21262	21262	21263	$np	1	1
element	dispBeamColumn	21263	21263	213	  $np	1	1
element	dispBeamColumn	213	  213	  21264	$np	1	1
element	dispBeamColumn	21264	21264	21265	$np	1	1
element	dispBeamColumn	21265	21265	21266	$np	1	1
element	dispBeamColumn	21266	21266	21267	$np	1	1
element	dispBeamColumn	21267	21267	21268	$np	1	1
element	dispBeamColumn	21268	21268	313	  $np	1	1
element	dispBeamColumn	313	  313	  21269	$np	1	1
element	dispBeamColumn	21269	21269	21270	$np	1	1
element	dispBeamColumn	21270	21270	21271	$np	1	1
element	dispBeamColumn	21271	21271	21272	$np	1	1
element	dispBeamColumn	21272	21272	21273	$np	1	1
element	dispBeamColumn	21273	21273	413	  $np	1	1

element	dispBeamColumn	21274	21274	21275	$np	1	1
element	dispBeamColumn	21275	21275	21276	$np	1	1
element	dispBeamColumn	21276	21276	21277	$np	1	1
element	dispBeamColumn	21277	21277	21278	$np	1	1
element	dispBeamColumn	21278	21278	21279	$np	1	1
element	dispBeamColumn	21279	21279	114	  $np	1	1
element	dispBeamColumn	114	  114	  21280	$np	1	1
element	dispBeamColumn	21280	21280	21281	$np	1	1
element	dispBeamColumn	21281	21281	21282	$np	1	1
element	dispBeamColumn	21282	21282	21283	$np	1	1
element	dispBeamColumn	21283	21283	21284	$np	1	1
element	dispBeamColumn	21284	21284	214	  $np	1	1
element	dispBeamColumn	214	  214	  21285	$np	1	1
element	dispBeamColumn	21285	21285	21286	$np	1	1
element	dispBeamColumn	21286	21286	21287	$np	1	1
element	dispBeamColumn	21287	21287	21288	$np	1	1
element	dispBeamColumn	21288	21288	21289	$np	1	1
element	dispBeamColumn	21289	21289	314	  $np	1	1
element	dispBeamColumn	314	  314	21290	  $np	1	1
element	dispBeamColumn	21290	21290	21291	$np	1	1
element	dispBeamColumn	21291	21291	21292	$np	1	1
element	dispBeamColumn	21292	21292	21293	$np	1	1
element	dispBeamColumn	21293	21293	21294	$np	1	1
element	dispBeamColumn	21294	21294	414	  $np	1	1

element	dispBeamColumn	21295	21295	21296	$np	1	1
element	dispBeamColumn	21296	21296	21297	$np	1	1
element	dispBeamColumn	21297	21297	21298	$np	1	1
element	dispBeamColumn	21298	21298	21299	$np	1	1
element	dispBeamColumn	21299	21299	21300	$np	1	1
element	dispBeamColumn	21300	21300	115  	$np	1	1
element	dispBeamColumn	115	  115	  21301 $np	1	1
element	dispBeamColumn	21301	21301	21302	$np	1	1
element	dispBeamColumn	21302	21302	21303	$np	1	1
element	dispBeamColumn	21303	21303	21304	$np	1	1
element	dispBeamColumn	21304	21304	21305	$np	1	1
element	dispBeamColumn	21305	21305	215	  $np	1	1
element	dispBeamColumn	215	  215	  21306	$np	1	1
element	dispBeamColumn	21306	21306	21307	$np	1	1
element	dispBeamColumn	21307	21307	21308	$np	1	1
element	dispBeamColumn	21308	21308	21309	$np	1	1
element	dispBeamColumn	21309	21309	21310	$np	1	1
element	dispBeamColumn	21310	21310	315	  $np	1	1
element	dispBeamColumn	315	  315	  21311	$np	1	1
element	dispBeamColumn	21311	21311	21312	$np	1	1
element	dispBeamColumn	21312	21312	21313	$np	1	1
element	dispBeamColumn	21313	21313	21314	$np	1	1
element	dispBeamColumn	21314	21314	21315	$np	1	1
element	dispBeamColumn	21315	21315	415	  $np	1	1

element	dispBeamColumn	21316	21316	21317	$np	2	1
element	dispBeamColumn	21317	21317	21318	$np	2	1
element	dispBeamColumn	21318	21318	21319	$np	2	1
element	dispBeamColumn	21319	21319	21320	$np	2	1
element	dispBeamColumn	21320	21320	21321	$np	2	1
element	dispBeamColumn	21321	21321	116	  $np	2	1
element	dispBeamColumn	116  	116	  21322	$np	2	1
element	dispBeamColumn	21322	21322	21323	$np	2	1
element	dispBeamColumn	21323	21323	21324	$np	2	1
element	dispBeamColumn	21324	21324	21325	$np	2	1
element	dispBeamColumn	21325	21325	21326	$np	2	1
element	dispBeamColumn	21326	21326	216	  $np	2	1
element	dispBeamColumn	216	  216	  21327	$np	2	1
element	dispBeamColumn	21327	21327	21328	$np	2	1
element	dispBeamColumn	21328	21328	21329	$np	2	1
element	dispBeamColumn	21329	21329	21330	$np	2	1
element	dispBeamColumn	21330	21330	21331	$np	2	1
element	dispBeamColumn	21331	21331	316	  $np	2	1
element	dispBeamColumn	316	  316	  21332	$np	2	1
element	dispBeamColumn	21332	21332	21333	$np	2	1
element	dispBeamColumn	21333	21333	21334	$np	2	1
element	dispBeamColumn	21334	21334	21335	$np	2	1
element	dispBeamColumn	21335	21335	21336	$np	2	1
element	dispBeamColumn	21336	21336	416	  $np	2	1

element	dispBeamColumn	21337	21337	21338	$np	1	1
element	dispBeamColumn	21338	21338	21339	$np	1	1
element	dispBeamColumn	21339	21339	21340	$np	1	1
element	dispBeamColumn	21340	21340	21341	$np	1	1
element	dispBeamColumn	21341	21341	21342	$np	1	1
element	dispBeamColumn	21342	21342	117	  $np	1	1
element	dispBeamColumn	117	  117	  21343	$np	1	1
element	dispBeamColumn	21343	21343	21344	$np	1	1
element	dispBeamColumn	21344	21344	21345	$np	1	1
element	dispBeamColumn	21345	21345	21346	$np	1	1
element	dispBeamColumn	21346	21346	21347	$np	1	1
element	dispBeamColumn	21347	21347	217	  $np	1	1
element	dispBeamColumn	217	  217	  21348	$np	1	1
element	dispBeamColumn	21348	21348	21349	$np	1	1
element	dispBeamColumn	21349	21349	21350	$np	1	1
element	dispBeamColumn	21350	21350	21351	$np	1	1
element	dispBeamColumn	21351	21351	21352	$np	1	1
element	dispBeamColumn	21352	21352	317  	$np	1	1
element	dispBeamColumn	317	  317	  21353	$np	1	1
element	dispBeamColumn	21353	21353	21354	$np	1	1
element	dispBeamColumn	21354	21354	21355	$np	1	1
element	dispBeamColumn	21355	21355	21356	$np	1	1
element	dispBeamColumn	21356	21356	21357	$np	1	1
element	dispBeamColumn	21357	21357	417	  $np	1	1

element	dispBeamColumn	21358	21358	21359	$np	1	1
element	dispBeamColumn	21359	21359	21360	$np	1	1
element	dispBeamColumn	21360	21360	21361	$np	1	1
element	dispBeamColumn	21361	21361	21362	$np	1	1
element	dispBeamColumn	21362	21362	21363	$np	1	1
element	dispBeamColumn	21363	21363	118  	$np	1	1
element	dispBeamColumn	118	  118	  21364	$np	1	1
element	dispBeamColumn	21364	21364	21365	$np	1	1
element	dispBeamColumn	21365	21365	21366	$np	1	1
element	dispBeamColumn	21366	21366	21367	$np	1	1
element	dispBeamColumn	21367	21367	21368	$np	1	1
element	dispBeamColumn	21368	21368	218  	$np	1	1
element	dispBeamColumn	218	  218  	21369	$np	1	1
element	dispBeamColumn	21369	21369	21370	$np	1	1
element	dispBeamColumn	21370	21370	21371	$np	1	1
element	dispBeamColumn	21371	21371	21372	$np	1	1
element	dispBeamColumn	21372	21372	21373	$np	1	1
element	dispBeamColumn	21373	21373	318	  $np	1	1
element	dispBeamColumn	318	  318  	21374	$np	1	1
element	dispBeamColumn	21374	21374	21375	$np	1	1
element	dispBeamColumn	21375	21375	21376	$np	1	1
element	dispBeamColumn	21376	21376	21377	$np	1	1
element	dispBeamColumn	21377	21377	21378	$np	1	1
element	dispBeamColumn	21378	21378	418	  $np	1	1

element	dispBeamColumn	21379	21379	21380	$np	1	1
element	dispBeamColumn	21380	21380	21381	$np	1	1
element	dispBeamColumn	21381	21381	21382	$np	1	1
element	dispBeamColumn	21382	21382	21383	$np	1	1
element	dispBeamColumn	21383	21383	21384	$np	1	1
element	dispBeamColumn	21384	21384	119	  $np	1	1
element	dispBeamColumn	119  	119	  21385	$np	1	1
element	dispBeamColumn	21385	21385	21386	$np	1	1
element	dispBeamColumn	21386	21386	21387	$np	1	1
element	dispBeamColumn	21387	21387	21388	$np	1	1
element	dispBeamColumn	21388	21388	21389	$np	1	1
element	dispBeamColumn	21389	21389	219  	$np	1	1
element	dispBeamColumn	219	  219	  21390	$np	1	1
element	dispBeamColumn	21390	21390	21391	$np	1	1
element	dispBeamColumn	21391	21391	21392	$np	1	1
element	dispBeamColumn	21392	21392	21393	$np	1	1
element	dispBeamColumn	21393	21393	21394	$np	1	1
element	dispBeamColumn	21394	21394	319	  $np	1	1
element	dispBeamColumn	319	  319	  21395	$np	1	1
element	dispBeamColumn	21395	21395	21396	$np	1	1
element	dispBeamColumn	21396	21396	21397	$np	1	1
element	dispBeamColumn	21397	21397	21398	$np	1	1
element	dispBeamColumn	21398	21398	21399	$np	1	1
element	dispBeamColumn	21399	21399	419	  $np	1	1

element	dispBeamColumn	21400	21400	21401	$np	2	1
element	dispBeamColumn	21401	21401	21402	$np	2	1
element	dispBeamColumn	21402	21402	21403	$np	2	1
element	dispBeamColumn	21403	21403	21404	$np	2	1
element	dispBeamColumn	21404	21404	21405	$np	2	1
element	dispBeamColumn	21405	21405	120	  $np	2	1
element	dispBeamColumn	120	  120	  21406	$np	2	1
element	dispBeamColumn	21406	21406	21407	$np	2	1
element	dispBeamColumn	21407	21407	21408	$np	2	1
element	dispBeamColumn	21408	21408	21409	$np	2	1
element	dispBeamColumn	21409	21409	21410	$np	2	1
element	dispBeamColumn	21410	21410	220	  $np	2	1
element	dispBeamColumn	220	  220	  21411	$np	2	1
element	dispBeamColumn	21411	21411	21412	$np	2	1
element	dispBeamColumn	21412	21412	21413	$np	2	1
element	dispBeamColumn	21413	21413	21414	$np	2	1
element	dispBeamColumn	21414	21414	21415	$np	2	1
element	dispBeamColumn	21415	21415	320	  $np	2	1
element	dispBeamColumn	320	  320	  21416	$np	2	1
element	dispBeamColumn	21416	21416	21417	$np	2	1
element	dispBeamColumn	21417	21417	21418	$np	2	1
element	dispBeamColumn	21418	21418	21419	$np	2	1
element	dispBeamColumn	21419	21419	21420	$np	2	1
element	dispBeamColumn	21420	21420	420	  $np	2	1
#-------------------梁单元---------------------
#弹性110101
element	dispBeamColumn	110101	101	1101	$np	111 3
element	dispBeamColumn	1101	1101	1102	$np	111 3
element	dispBeamColumn	1102	1102	1103	$np	111 3
element	dispBeamColumn	1103	1103	1104	$np	110 3
element	dispBeamColumn	1104	1104	1105	$np	110 3
element	dispBeamColumn	1105	1105	1106	$np	110 3
element	dispBeamColumn	1106	1106	1107	$np	111 3
element	dispBeamColumn	1107	1107	1108	$np	111 3
#弹性1108    
element	dispBeamColumn	1108	1108	102  	$np	111 3
element	dispBeamColumn	110102	102	1109	$np	131 3
element	dispBeamColumn	1109	1109	1110	$np	131 3
element	dispBeamColumn	1110	1110	1111	$np	131 3
element	dispBeamColumn	1111	1111	1112	$np	130 3
element	dispBeamColumn	1112	1112	1113	$np	130 3
element	dispBeamColumn	1113	1113	1114	$np	130 3
element	dispBeamColumn	1114	1114	1115	$np	131 3
element	dispBeamColumn	1115	1115	1116	$np	131 3
element	dispBeamColumn	1116	1116	103	  $np	131 3
element	dispBeamColumn	110103	103	1117	$np	131 3
element	dispBeamColumn	1117	1117	1118	$np	131 3
element	dispBeamColumn	1118	1118	1119	$np	131 3
element	dispBeamColumn	1119	1119	1120	$np	130 3
element	dispBeamColumn	1120	1120	1121	$np	130 3
element	dispBeamColumn	1121	1121	1122	$np	130 3
element	dispBeamColumn	1122	1122	1123	$np	131 3
element	dispBeamColumn	1123	1123	1124	$np	131 3
element	dispBeamColumn	1124	1124	104	  $np	131 3
element	dispBeamColumn	110104	104	1125	$np	111 3
element	dispBeamColumn	1125	1125	1126	$np	111 3
element	dispBeamColumn	1126	1126	1127	$np	111 3
element	dispBeamColumn	1127	1127	1128	$np	110 3
element	dispBeamColumn	1128	1128	1129	$np	110 3
element	dispBeamColumn	1129	1129	1130	$np	110 3
element	dispBeamColumn	1130	1130	1131	$np	111 3
element	dispBeamColumn	1131	1131	1132	$np	111 3
element	dispBeamColumn	1132	1132	105	  $np	111 3
    
    
    
element	dispBeamColumn	110106	106	1133	$np	151 3
element	dispBeamColumn	1133	1133	1134	$np	151 3
element	dispBeamColumn	1134	1134	1135	$np	151 3
element	dispBeamColumn	1135	1135	1136	$np	150 3
element	dispBeamColumn	1136	1136	1137	$np	150 3
element	dispBeamColumn	1137	1137	1138	$np	150 3
element	dispBeamColumn	1138	1138	1139	$np	151 3
element	dispBeamColumn	1139	1139	1140	$np	151 3
element	dispBeamColumn	1140	1140	107	  $np	151 3
element	dispBeamColumn	110107	107	1141	$np	151 3
element	dispBeamColumn	1141	1141	1142	$np	151 3
element	dispBeamColumn	1142	1142	1143	$np	151 3
element	dispBeamColumn	1143	1143	1144	$np	150 3
element	dispBeamColumn	1144	1144	1145	$np	150 3
element	dispBeamColumn	1145	1145	1146	$np	150 3
element	dispBeamColumn	1146	1146	1147	$np	151 3
element	dispBeamColumn	1147	1147	1148	$np	151 3
element	dispBeamColumn	1148	1148	108	  $np	151 3
element	dispBeamColumn	110108	108	1149	$np	151 3
element	dispBeamColumn	1149	1149	1150	$np	151 3
element	dispBeamColumn	1150	1150	1151	$np	151 3
element	dispBeamColumn	1151	1151	1152	$np	150 3
element	dispBeamColumn	1152	1152	1153	$np	150 3
element	dispBeamColumn	1153	1153	1154	$np	150 3
element	dispBeamColumn	1154	1154	1155	$np	151 3
element	dispBeamColumn	1155	1155	1156	$np	151 3
element	dispBeamColumn	1156	1156	109	  $np	151 3
element	dispBeamColumn	110109	109	1157	$np	151 3
element	dispBeamColumn	1157	1157	1158	$np	151 3
element	dispBeamColumn	1158	1158	1159	$np	151 3
element	dispBeamColumn	1159	1159	1160	$np	150 3
element	dispBeamColumn	1160	1160	1161	$np	150 3
element	dispBeamColumn	1161	1161	1162	$np	150 3
element	dispBeamColumn	1162	1162	1163	$np	151 3
element	dispBeamColumn	1163	1163	1164	$np	151 3
element	dispBeamColumn	1164	1164	110	  $np	151 3
    
    
    
element	dispBeamColumn	110111	111	1165	$np	151 3
element	dispBeamColumn	1165	1165	1166	$np	151 3
element	dispBeamColumn	1166	1166	1167	$np	151 3
element	dispBeamColumn	1167	1167	1168	$np	150 3
element	dispBeamColumn	1168	1168	1169	$np	150 3
element	dispBeamColumn	1169	1169	1170	$np	150 3
element	dispBeamColumn	1170	1170	1171	$np	151 3
element	dispBeamColumn	1171	1171	1172	$np	151 3
element	dispBeamColumn	1172	1172	112	  $np	151 3
element	dispBeamColumn	110112	112	1173	$np	151 3
element	dispBeamColumn	1173	1173	1174	$np	151 3
element	dispBeamColumn	1174	1174	1175	$np	151 3
element	dispBeamColumn	1175	1175	1176	$np	150 3
element	dispBeamColumn	1176	1176	1177	$np	150 3
element	dispBeamColumn	1177	1177	1178	$np	150 3
element	dispBeamColumn	1178	1178	1179	$np	151 3
element	dispBeamColumn	1179	1179	1180	$np	151 3
element	dispBeamColumn	1180	1180	113	  $np	151 3
element	dispBeamColumn	110113	113	1181	$np	151 3
element	dispBeamColumn	1181	1181	1182	$np	151 3
element	dispBeamColumn	1182	1182	1183	$np	151 3
element	dispBeamColumn	1183	1183	1184	$np	150 3
element	dispBeamColumn	1184	1184	1185	$np	150 3
element	dispBeamColumn	1185	1185	1186	$np	150 3
element	dispBeamColumn	1186	1186	1187	$np	151 3
element	dispBeamColumn	1187	1187	1188	$np	151 3
element	dispBeamColumn	1188	1188	114	  $np	151 3
element	dispBeamColumn	110114	114	1189	$np	151 3
element	dispBeamColumn	1189	1189	1190	$np	151 3
element	dispBeamColumn	1190	1190	1191	$np	151 3
element	dispBeamColumn	1191	1191	1192	$np	150 3
element	dispBeamColumn	1192	1192	1193	$np	150 3
element	dispBeamColumn	1193	1193	1194	$np	150 3
element	dispBeamColumn	1194	1194	1195	$np	151 3
element	dispBeamColumn	1195	1195	1196	$np	151 3
element	dispBeamColumn	1196	1196	115	  $np	151 3
    
    
    
element	dispBeamColumn	110116	116	1197	$np	111 3
element	dispBeamColumn	1197	1197	1198	$np	111 3
element	dispBeamColumn	1198	1198	1199	$np	111 3
element	dispBeamColumn	1199	1199	11100	$np	110 3
element	dispBeamColumn	11100	11100	11101	$np	110 3
element	dispBeamColumn	11101	11101	11102	$np	110 3
element	dispBeamColumn	11102	11102	11103	$np	111 3
element	dispBeamColumn	11103	11103	11104	$np	111 3
element	dispBeamColumn	11104	11104	117	  $np	111 3
element	dispBeamColumn	110117	117	11105	$np	131 3
element	dispBeamColumn	11105	11105	11106	$np	131 3
element	dispBeamColumn	11106	11106	11107	$np	131 3
element	dispBeamColumn	11107	11107	11108	$np	130 3
element	dispBeamColumn	11108	11108	11109	$np	130 3
element	dispBeamColumn	11109	11109	11110	$np	130 3
element	dispBeamColumn	11110	11110	11111	$np	131 3
element	dispBeamColumn	11111	11111	11112	$np	131 3
element	dispBeamColumn	11112	11112	118	  $np	131 3
element	dispBeamColumn	110118	118	11113	$np	131 3
element	dispBeamColumn	11113	11113	11114	$np	131 3
element	dispBeamColumn	11114	11114	11115	$np	131 3
element	dispBeamColumn	11115	11115	11116	$np	130 3
element	dispBeamColumn	11116	11116	11117	$np	130 3
element	dispBeamColumn	11117	11117	11118	$np	130 3
element	dispBeamColumn	11118	11118	11119	$np	131 3
element	dispBeamColumn	11119	11119	11120	$np	131 3
element	dispBeamColumn	11120	11120	119	  $np	131 3
element	dispBeamColumn	110119	119	11121	$np	111 3
element	dispBeamColumn	11121	11121	11122	$np	111 3
element	dispBeamColumn	11122	11122	11123	$np	111 3
element	dispBeamColumn	11123	11123	11124	$np	110 3
element	dispBeamColumn	11124	11124	11125	$np	110 3
element	dispBeamColumn	11125	11125	11126	$np	110 3
element	dispBeamColumn	11126	11126	11127	$np	111 3
element	dispBeamColumn	11127	11127	11128	$np	111 3
element	dispBeamColumn	11128	11128	120	  $np	111 3


#弹性110201
element	dispBeamColumn	110201	201	1201	$np	211 3
element	dispBeamColumn	1201	1201	1202	$np	211 3
element	dispBeamColumn	1202	1202	1203	$np	211 3
element	dispBeamColumn	1203	1203	1204	$np	210 3
element	dispBeamColumn	1204	1204	1205	$np	210 3
element	dispBeamColumn	1205	1205	1206	$np	210 3
element	dispBeamColumn	1206	1206	1207	$np	211 3
element	dispBeamColumn	1207	1207	1208	$np	211 3
#弹性1208                                         
element	dispBeamColumn	1208	1208	202	  $np	211 3
element	dispBeamColumn	110202	202	1209	$np	231 3
element	dispBeamColumn	1209	1209	1210	$np	231 3
element	dispBeamColumn	1210	1210	1211	$np	231 3
element	dispBeamColumn	1211	1211	1212	$np	230 3
element	dispBeamColumn	1212	1212	1213	$np	230 3
element	dispBeamColumn	1213	1213	1214	$np	230 3
element	dispBeamColumn	1214	1214	1215	$np	231 3
element	dispBeamColumn	1215	1215	1216	$np	231 3
element	dispBeamColumn	1216	1216	203  	$np	231 3
element	dispBeamColumn	110203	203	1217	$np	231 3
element	dispBeamColumn	1217	1217	1218	$np	231 3
element	dispBeamColumn	1218	1218	1219	$np	231 3
element	dispBeamColumn	1219	1219	1220	$np	230 3
element	dispBeamColumn	1220	1220	1221	$np	230 3
element	dispBeamColumn	1221	1221	1222	$np	230 3
element	dispBeamColumn	1222	1222	1223	$np	231 3
element	dispBeamColumn	1223	1223	1224	$np	231 3
element	dispBeamColumn	1224	1224	204	  $np	231 3
element	dispBeamColumn	110204	204	1225	$np	211 3
element	dispBeamColumn	1225	1225	1226	$np	211 3
element	dispBeamColumn	1226	1226	1227	$np	211 3
element	dispBeamColumn	1227	1227	1228	$np	210 3
element	dispBeamColumn	1228	1228	1229	$np	210 3
element	dispBeamColumn	1229	1229	1230	$np	210 3
element	dispBeamColumn	1230	1230	1231	$np	211 3
element	dispBeamColumn	1231	1231	1232	$np	211 3
element	dispBeamColumn	1232	1232	205  	$np	211 3
                                                  
                                                  
                                                  
element	dispBeamColumn	110206	206	1233	$np	251 3
element	dispBeamColumn	1233	1233	1234	$np	251 3
element	dispBeamColumn	1234	1234	1235	$np	251 3
element	dispBeamColumn	1235	1235	1236	$np	250 3
element	dispBeamColumn	1236	1236	1237	$np	250 3
element	dispBeamColumn	1237	1237	1238	$np	250 3
element	dispBeamColumn	1238	1238	1239	$np	251 3
element	dispBeamColumn	1239	1239	1240	$np	251 3
element	dispBeamColumn	1240	1240	207	  $np	251 3
element	dispBeamColumn	110207	207	1241	$np	251 3
element	dispBeamColumn	1241	1241	1242	$np	251 3
element	dispBeamColumn	1242	1242	1243	$np	251 3
element	dispBeamColumn	1243	1243	1244	$np	250 3
element	dispBeamColumn	1244	1244	1245	$np	250 3
element	dispBeamColumn	1245	1245	1246	$np	250 3
element	dispBeamColumn	1246	1246	1247	$np	251 3
element	dispBeamColumn	1247	1247	1248	$np	251 3
element	dispBeamColumn	1248	1248	208	  $np	251 3
element	dispBeamColumn	110208	208	1249	$np	251 3
element	dispBeamColumn	1249	1249	1250	$np	251 3
element	dispBeamColumn	1250	1250	1251	$np	251 3
element	dispBeamColumn	1251	1251	1252	$np	250 3
element	dispBeamColumn	1252	1252	1253	$np	250 3
element	dispBeamColumn	1253	1253	1254	$np	250 3
element	dispBeamColumn	1254	1254	1255	$np	251 3
element	dispBeamColumn	1255	1255	1256	$np	251 3
element	dispBeamColumn	1256	1256	209	  $np	251 3
element	dispBeamColumn	110209	209	1257	$np	251 3
element	dispBeamColumn	1257	1257	1258	$np	251 3
element	dispBeamColumn	1258	1258	1259	$np	251 3
element	dispBeamColumn	1259	1259	1260	$np	250 3
element	dispBeamColumn	1260	1260	1261	$np	250 3
element	dispBeamColumn	1261	1261	1262	$np	250 3
element	dispBeamColumn	1262	1262	1263	$np	251 3
element	dispBeamColumn	1263	1263	1264	$np	251 3
element	dispBeamColumn	1264	1264	210	  $np	251 3
                                                  
                                                  
                                                  
element	dispBeamColumn	110211	211	1265	$np	251 3
element	dispBeamColumn	1265	1265	1266	$np	251 3
element	dispBeamColumn	1266	1266	1267	$np	251 3
element	dispBeamColumn	1267	1267	1268	$np	250 3
element	dispBeamColumn	1268	1268	1269	$np	250 3
element	dispBeamColumn	1269	1269	1270	$np	250 3
element	dispBeamColumn	1270	1270	1271	$np	251 3
element	dispBeamColumn	1271	1271	1272	$np	251 3
element	dispBeamColumn	1272	1272	212	  $np	251 3
element	dispBeamColumn	110212	212	1273	$np	251 3
element	dispBeamColumn	1273	1273	1274	$np	251 3
element	dispBeamColumn	1274	1274	1275	$np	251 3
element	dispBeamColumn	1275	1275	1276	$np	250 3
element	dispBeamColumn	1276	1276	1277	$np	250 3
element	dispBeamColumn	1277	1277	1278	$np	250 3
element	dispBeamColumn	1278	1278	1279	$np	251 3
element	dispBeamColumn	1279	1279	1280	$np	251 3
element	dispBeamColumn	1280	1280	213	  $np	251 3
element	dispBeamColumn	110213	213	1281	$np	251 3
element	dispBeamColumn	1281	1281	1282	$np	251 3
element	dispBeamColumn	1282	1282	1283	$np	251 3
element	dispBeamColumn	1283	1283	1284	$np	250 3
element	dispBeamColumn	1284	1284	1285	$np	250 3
element	dispBeamColumn	1285	1285	1286	$np	250 3
element	dispBeamColumn	1286	1286	1287	$np	251 3
element	dispBeamColumn	1287	1287	1288	$np	251 3
element	dispBeamColumn	1288	1288	214	  $np	251 3
element	dispBeamColumn	110214	214	1289	$np	251 3
element	dispBeamColumn	1289	1289	1290	$np	251 3
element	dispBeamColumn	1290	1290	1291	$np	251 3
element	dispBeamColumn	1291	1291	1292	$np	250 3
element	dispBeamColumn	1292	1292	1293	$np	250 3
element	dispBeamColumn	1293	1293	1294	$np	250 3
element	dispBeamColumn	1294	1294	1295	$np	251 3
element	dispBeamColumn	1295	1295	1296	$np	251 3
element	dispBeamColumn	1296	1296	215	  $np	251 3
                                                  
                                                  
                                                  
element	dispBeamColumn	110216	216	1297	$np	211 3
element	dispBeamColumn	1297	1297	1298	$np	211 3
element	dispBeamColumn	1298	1298	1299	$np	211 3
element	dispBeamColumn	1299	1299	12100	$np	210 3
element	dispBeamColumn	12100	12100	12101	$np	210 3
element	dispBeamColumn	12101	12101	12102	$np	210 3
element	dispBeamColumn	12102	12102	12103	$np	211 3
element	dispBeamColumn	12103	12103	12104	$np	211 3
element	dispBeamColumn	12104	12104	217	  $np	211 3
element	dispBeamColumn	110217	217	12105	$np	231 3
element	dispBeamColumn	12105	12105	12106	$np	231 3
element	dispBeamColumn	12106	12106	12107	$np	231 3
element	dispBeamColumn	12107	12107	12108	$np	230 3
element	dispBeamColumn	12108	12108	12109	$np	230 3
element	dispBeamColumn	12109	12109	12110	$np	230 3
element	dispBeamColumn	12110	12110	12111	$np	231 3
element	dispBeamColumn	12111	12111	12112	$np	231 3
element	dispBeamColumn	12112	12112	218	  $np	231 3
element	dispBeamColumn	110218	218	12113	$np	231 3
element	dispBeamColumn	12113	12113	12114	$np	231 3
element	dispBeamColumn	12114	12114	12115	$np	231 3
element	dispBeamColumn	12115	12115	12116	$np	230 3
element	dispBeamColumn	12116	12116	12117	$np	230 3
element	dispBeamColumn	12117	12117	12118	$np	230 3
element	dispBeamColumn	12118	12118	12119	$np	231 3
element	dispBeamColumn	12119	12119	12120	$np	231 3
element	dispBeamColumn	12120	12120	219	  $np	231 3
element	dispBeamColumn	110219	219	12121	$np	211 3
element	dispBeamColumn	12121	12121	12122	$np	211 3
element	dispBeamColumn	12122	12122	12123	$np	211 3
element	dispBeamColumn	12123	12123	12124	$np	210 3
element	dispBeamColumn	12124	12124	12125	$np	210 3
element	dispBeamColumn	12125	12125	12126	$np	210 3
element	dispBeamColumn	12126	12126	12127	$np	211 3
element	dispBeamColumn	12127	12127	12128	$np	211 3
element	dispBeamColumn	12128	12128	220	  $np	211 3


#弹性110301
element	dispBeamColumn	110301	301	1301	$np	311 3
element	dispBeamColumn	1301	1301	1302	$np	311 3
element	dispBeamColumn	1302	1302	1303	$np	311 3
element	dispBeamColumn	1303	1303	1304	$np	310 3
element	dispBeamColumn	1304	1304	1305	$np	310 3
element	dispBeamColumn	1305	1305	1306	$np	310 3
element	dispBeamColumn	1306	1306	1307	$np	311 3
element	dispBeamColumn	1307	1307	1308	$np	311 3
#弹性1308    
element	dispBeamColumn	1308	1308	302	  $np	311 3
element	dispBeamColumn	110302	302	1309	$np	331 3
element	dispBeamColumn	1309	1309	1310	$np	331 3
element	dispBeamColumn	1310	1310	1311	$np	331 3
element	dispBeamColumn	1311	1311	1312	$np	330 3
element	dispBeamColumn	1312	1312	1313	$np	330 3
element	dispBeamColumn	1313	1313	1314	$np	330 3
element	dispBeamColumn	1314	1314	1315	$np	331 3
element	dispBeamColumn	1315	1315	1316	$np	331 3
element	dispBeamColumn	1316	1316	303	  $np	331 3
element	dispBeamColumn	110303	303	1317	$np	331 3
element	dispBeamColumn	1317	1317	1318	$np	331 3
element	dispBeamColumn	1318	1318	1319	$np	331 3
element	dispBeamColumn	1319	1319	1320	$np	330 3
element	dispBeamColumn	1320	1320	1321	$np	330 3
element	dispBeamColumn	1321	1321	1322	$np	330 3
element	dispBeamColumn	1322	1322	1323	$np	331 3
element	dispBeamColumn	1323	1323	1324	$np	331 3
element	dispBeamColumn	1324	1324	304	  $np	331 3
element	dispBeamColumn	110304	304	1325	$np	311 3
element	dispBeamColumn	1325	1325	1326	$np	311 3
element	dispBeamColumn	1326	1326	1327	$np	311 3
element	dispBeamColumn	1327	1327	1328	$np	310 3
element	dispBeamColumn	1328	1328	1329	$np	310 3
element	dispBeamColumn	1329	1329	1330	$np	310 3
element	dispBeamColumn	1330	1330	1331	$np	311 3
element	dispBeamColumn	1331	1331	1332	$np	311 3
element	dispBeamColumn	1332	1332	305	  $np	311 3
    
    
    
element	dispBeamColumn	110306	306	1333	$np	351 3
element	dispBeamColumn	1333	1333	1334	$np	351 3
element	dispBeamColumn	1334	1334	1335	$np	351 3
element	dispBeamColumn	1335	1335	1336	$np	350 3
element	dispBeamColumn	1336	1336	1337	$np	350 3
element	dispBeamColumn	1337	1337	1338	$np	350 3
element	dispBeamColumn	1338	1338	1339	$np	351 3
element	dispBeamColumn	1339	1339	1340	$np	351 3
element	dispBeamColumn	1340	1340	307	  $np	351 3
element	dispBeamColumn	110307	307	1341	$np	351 3
element	dispBeamColumn	1341	1341	1342	$np	351 3
element	dispBeamColumn	1342	1342	1343	$np	351 3
element	dispBeamColumn	1343	1343	1344	$np	350 3
element	dispBeamColumn	1344	1344	1345	$np	350 3
element	dispBeamColumn	1345	1345	1346	$np	350 3
element	dispBeamColumn	1346	1346	1347	$np	351 3
element	dispBeamColumn	1347	1347	1348	$np	351 3
element	dispBeamColumn	1348	1348	308	  $np	351 3
element	dispBeamColumn	110308	308	1349	$np	351 3
element	dispBeamColumn	1349	1349	1350	$np	351 3
element	dispBeamColumn	1350	1350	1351	$np	351 3
element	dispBeamColumn	1351	1351	1352	$np	350 3
element	dispBeamColumn	1352	1352	1353	$np	350 3
element	dispBeamColumn	1353	1353	1354	$np	350 3
element	dispBeamColumn	1354	1354	1355	$np	351 3
element	dispBeamColumn	1355	1355	1356	$np	351 3
element	dispBeamColumn	1356	1356	309	  $np	351 3
element	dispBeamColumn	110309	309	1357	$np	351 3
element	dispBeamColumn	1357	1357	1358	$np	351 3
element	dispBeamColumn	1358	1358	1359	$np	351 3
element	dispBeamColumn	1359	1359	1360	$np	350 3
element	dispBeamColumn	1360	1360	1361	$np	350 3
element	dispBeamColumn	1361	1361	1362	$np	350 3
element	dispBeamColumn	1362	1362	1363	$np	351 3
element	dispBeamColumn	1363	1363	1364	$np	351 3
element	dispBeamColumn	1364	1364	310	  $np	351 3
    
    
    
element	dispBeamColumn	110311	311	1365	$np	351 3
element	dispBeamColumn	1365	1365	1366	$np	351 3
element	dispBeamColumn	1366	1366	1367	$np	351 3
element	dispBeamColumn	1367	1367	1368	$np	350 3
element	dispBeamColumn	1368	1368	1369	$np	350 3
element	dispBeamColumn	1369	1369	1370	$np	350 3
element	dispBeamColumn	1370	1370	1371	$np	351 3
element	dispBeamColumn	1371	1371	1372	$np	351 3
element	dispBeamColumn	1372	1372	312	  $np	351 3
element	dispBeamColumn	110312	312	1373	$np	351 3
element	dispBeamColumn	1373	1373	1374	$np	351 3
element	dispBeamColumn	1374	1374	1375	$np	351 3
element	dispBeamColumn	1375	1375	1376	$np	350 3
element	dispBeamColumn	1376	1376	1377	$np	350 3
element	dispBeamColumn	1377	1377	1378	$np	350 3
element	dispBeamColumn	1378	1378	1379	$np	351 3
element	dispBeamColumn	1379	1379	1380	$np	351 3
element	dispBeamColumn	1380	1380	313	  $np	351 3
element	dispBeamColumn	110313	313	1381	$np	351 3
element	dispBeamColumn	1381	1381	1382	$np	351 3
element	dispBeamColumn	1382	1382	1383	$np	351 3
element	dispBeamColumn	1383	1383	1384	$np	350 3
element	dispBeamColumn	1384	1384	1385	$np	350 3
element	dispBeamColumn	1385	1385	1386	$np	350 3
element	dispBeamColumn	1386	1386	1387	$np	351 3
element	dispBeamColumn	1387	1387	1388	$np	351 3
element	dispBeamColumn	1388	1388	314	  $np	351 3
element	dispBeamColumn	110314	314	1389	$np	351 3
element	dispBeamColumn	1389	1389	1390	$np	351 3
element	dispBeamColumn	1390	1390	1391	$np	351 3
element	dispBeamColumn	1391	1391	1392	$np	350 3
element	dispBeamColumn	1392	1392	1393	$np	350 3
element	dispBeamColumn	1393	1393	1394	$np	350 3
element	dispBeamColumn	1394	1394	1395	$np	351 3
element	dispBeamColumn	1395	1395	1396	$np	351 3
element	dispBeamColumn	1396	1396	315	  $np	351 3
    
    
    
element	dispBeamColumn	110316	316	1397	$np	311 3
element	dispBeamColumn	1397	1397	1398	$np	311 3
element	dispBeamColumn	1398	1398	1399	$np	311 3
element	dispBeamColumn	1399	1399	13100	$np	310 3
element	dispBeamColumn	13100	13100	13101	$np	310 3
element	dispBeamColumn	13101	13101	13102	$np	310 3
element	dispBeamColumn	13102	13102	13103	$np	311 3
element	dispBeamColumn	13103	13103	13104	$np	311 3
element	dispBeamColumn	13104	13104	317	  $np	311 3
element	dispBeamColumn	110317	317	13105	$np	331 3
element	dispBeamColumn	13105	13105	13106	$np	331 3
element	dispBeamColumn	13106	13106	13107	$np	331 3
element	dispBeamColumn	13107	13107	13108	$np	330 3
element	dispBeamColumn	13108	13108	13109	$np	330 3
element	dispBeamColumn	13109	13109	13110	$np	330 3
element	dispBeamColumn	13110	13110	13111	$np	331 3
element	dispBeamColumn	13111	13111	13112	$np	331 3
element	dispBeamColumn	13112	13112	318	  $np	331 3
element	dispBeamColumn	110318	318	13113	$np	331 3
element	dispBeamColumn	13113	13113	13114	$np	331 3
element	dispBeamColumn	13114	13114	13115	$np	331 3
element	dispBeamColumn	13115	13115	13116	$np	330 3
element	dispBeamColumn	13116	13116	13117	$np	330 3
element	dispBeamColumn	13117	13117	13118	$np	330 3
element	dispBeamColumn	13118	13118	13119	$np	331 3
element	dispBeamColumn	13119	13119	13120	$np	331 3
element	dispBeamColumn	13120	13120	319  	$np	331 3
element	dispBeamColumn	110319	319	13121	$np	311 3
element	dispBeamColumn	13121	13121	13122	$np	311 3
element	dispBeamColumn	13122	13122	13123	$np	311 3
element	dispBeamColumn	13123	13123	13124	$np	310 3
element	dispBeamColumn	13124	13124	13125	$np	310 3
element	dispBeamColumn	13125	13125	13126	$np	310 3
element	dispBeamColumn	13126	13126	13127	$np	311 3
element	dispBeamColumn	13127	13127	13128	$np	311 3
element	dispBeamColumn	13128	13128	320	  $np	311 3


#弹性110401
element	dispBeamColumn	110401	401	1401	$np	411 3
element	dispBeamColumn	1401	1401	1402	$np	411 3
element	dispBeamColumn	1402	1402	1403	$np	411 3
element	dispBeamColumn	1403	1403	1404	$np	410 3
element	dispBeamColumn	1404	1404	1405	$np	410 3
element	dispBeamColumn	1405	1405	1406	$np	410 3
element	dispBeamColumn	1406	1406	1407	$np	411 3
element	dispBeamColumn	1407	1407	1408	$np	411 3
#弹性1408    
element	dispBeamColumn	1408	1408	402	  $np	411 3
element	dispBeamColumn	110402	402	1409	$np	431 3
element	dispBeamColumn	1409	1409	1410	$np	431 3
element	dispBeamColumn	1410	1410	1411	$np	431 3
element	dispBeamColumn	1411	1411	1412	$np	430 3
element	dispBeamColumn	1412	1412	1413	$np	430 3
element	dispBeamColumn	1413	1413	1414	$np	430 3
element	dispBeamColumn	1414	1414	1415	$np	431 3
element	dispBeamColumn	1415	1415	1416	$np	431 3
element	dispBeamColumn	1416	1416	403  	$np	431 3
element	dispBeamColumn	110403	403	1417	$np	431 3
element	dispBeamColumn	1417	1417	1418	$np	431 3
element	dispBeamColumn	1418	1418	1419	$np	431 3
element	dispBeamColumn	1419	1419	1420	$np	430 3
element	dispBeamColumn	1420	1420	1421	$np	430 3
element	dispBeamColumn	1421	1421	1422	$np	430 3
element	dispBeamColumn	1422	1422	1423	$np	431 3
element	dispBeamColumn	1423	1423	1424	$np	431 3
element	dispBeamColumn	1424	1424	404	  $np	431 3
element	dispBeamColumn	110404	404	1425	$np	411 3
element	dispBeamColumn	1425	1425	1426	$np	411 3
element	dispBeamColumn	1426	1426	1427	$np	411 3
element	dispBeamColumn	1427	1427	1428	$np	410 3
element	dispBeamColumn	1428	1428	1429	$np	410 3
element	dispBeamColumn	1429	1429	1430	$np	410 3
element	dispBeamColumn	1430	1430	1431	$np	411 3
element	dispBeamColumn	1431	1431	1432	$np	411 3
element	dispBeamColumn	1432	1432	405	  $np	411 3
    
    
    
element	dispBeamColumn	110406	406	1433	$np	451 3
element	dispBeamColumn	1433	1433	1434	$np	451 3
element	dispBeamColumn	1434	1434	1435	$np	451 3
element	dispBeamColumn	1435	1435	1436	$np	450 3
element	dispBeamColumn	1436	1436	1437	$np	450 3
element	dispBeamColumn	1437	1437	1438	$np	450 3
element	dispBeamColumn	1438	1438	1439	$np	451 3
element	dispBeamColumn	1439	1439	1440	$np	451 3
element	dispBeamColumn	1440	1440	407	  $np	451 3
element	dispBeamColumn	110407	407	1441	$np	451 3
element	dispBeamColumn	1441	1441	1442	$np	451 3
element	dispBeamColumn	1442	1442	1443	$np	451 3
element	dispBeamColumn	1443	1443	1444	$np	450 3
element	dispBeamColumn	1444	1444	1445	$np	450 3
element	dispBeamColumn	1445	1445	1446	$np	450 3
element	dispBeamColumn	1446	1446	1447	$np	451 3
element	dispBeamColumn	1447	1447	1448	$np	451 3
element	dispBeamColumn	1448	1448	408	  $np	451 3
element	dispBeamColumn	110408	408	1449	$np	451 3
element	dispBeamColumn	1449	1449	1450	$np	451 3
element	dispBeamColumn	1450	1450	1451	$np	451 3
element	dispBeamColumn	1451	1451	1452	$np	450 3
element	dispBeamColumn	1452	1452	1453	$np	450 3
element	dispBeamColumn	1453	1453	1454	$np	450 3
element	dispBeamColumn	1454	1454	1455	$np	451 3
element	dispBeamColumn	1455	1455	1456	$np	451 3
element	dispBeamColumn	1456	1456	409	  $np	451 3
element	dispBeamColumn	110409	409	1457	$np	451 3
element	dispBeamColumn	1457	1457	1458	$np	451 3
element	dispBeamColumn	1458	1458	1459	$np	451 3
element	dispBeamColumn	1459	1459	1460	$np	450 3
element	dispBeamColumn	1460	1460	1461	$np	450 3
element	dispBeamColumn	1461	1461	1462	$np	450 3
element	dispBeamColumn	1462	1462	1463	$np	451 3
element	dispBeamColumn	1463	1463	1464	$np	451 3
element	dispBeamColumn	1464	1464	410	  $np	451 3
    
    
    
element	dispBeamColumn	110411	411	1465	$np	451 3
element	dispBeamColumn	1465	1465	1466	$np	451 3
element	dispBeamColumn	1466	1466	1467	$np	451 3
element	dispBeamColumn	1467	1467	1468	$np	450 3
element	dispBeamColumn	1468	1468	1469	$np	450 3
element	dispBeamColumn	1469	1469	1470	$np	450 3
element	dispBeamColumn	1470	1470	1471	$np	451 3
element	dispBeamColumn	1471	1471	1472	$np	451 3
element	dispBeamColumn	1472	1472	412	  $np	451 3
element	dispBeamColumn	110412	412	1473	$np	451 3
element	dispBeamColumn	1473	1473	1474	$np	451 3
element	dispBeamColumn	1474	1474	1475	$np	451 3
element	dispBeamColumn	1475	1475	1476	$np	450 3
element	dispBeamColumn	1476	1476	1477	$np	450 3
element	dispBeamColumn	1477	1477	1478	$np	450 3
element	dispBeamColumn	1478	1478	1479	$np	451 3
element	dispBeamColumn	1479	1479	1480	$np	451 3
element	dispBeamColumn	1480	1480	413	  $np	451 3
element	dispBeamColumn	110413	413	1481	$np	451 3
element	dispBeamColumn	1481	1481	1482	$np	451 3
element	dispBeamColumn	1482	1482	1483	$np	451 3
element	dispBeamColumn	1483	1483	1484	$np	450 3
element	dispBeamColumn	1484	1484	1485	$np	450 3
element	dispBeamColumn	1485	1485	1486	$np	450 3
element	dispBeamColumn	1486	1486	1487	$np	451 3
element	dispBeamColumn	1487	1487	1488	$np	451 3
element	dispBeamColumn	1488	1488	414	  $np	451 3
element	dispBeamColumn	110414	414	1489	$np	451 3
element	dispBeamColumn	1489	1489	1490	$np	451 3
element	dispBeamColumn	1490	1490	1491	$np	451 3
element	dispBeamColumn	1491	1491	1492	$np	450 3
element	dispBeamColumn	1492	1492	1493	$np	450 3
element	dispBeamColumn	1493	1493	1494	$np	450 3
element	dispBeamColumn	1494	1494	1495	$np	451 3
element	dispBeamColumn	1495	1495	1496	$np	451 3
element	dispBeamColumn	1496	1496	415	  $np	451 3
    
    
    
element	dispBeamColumn	110416	416	1497	$np	411 3
element	dispBeamColumn	1497	1497	1498	$np	411 3
element	dispBeamColumn	1498	1498	1499	$np	411 3
element	dispBeamColumn	1499	1499	14100	$np	410 3
element	dispBeamColumn	14100	14100	14101	$np	410 3
element	dispBeamColumn	14101	14101	14102	$np	410 3
element	dispBeamColumn	14102	14102	14103	$np	411 3
element	dispBeamColumn	14103	14103	14104	$np	411 3
element	dispBeamColumn	14104	14104	417	  $np	411 3
element	dispBeamColumn	110417	417	14105	$np	431 3
element	dispBeamColumn	14105	14105	14106	$np	431 3
element	dispBeamColumn	14106	14106	14107	$np	431 3
element	dispBeamColumn	14107	14107	14108	$np	430 3
element	dispBeamColumn	14108	14108	14109	$np	430 3
element	dispBeamColumn	14109	14109	14110	$np	430 3
element	dispBeamColumn	14110	14110	14111	$np	431 3
element	dispBeamColumn	14111	14111	14112	$np	431 3
element	dispBeamColumn	14112	14112	418	  $np	431 3
element	dispBeamColumn	110418	418	14113	$np	431 3
element	dispBeamColumn	14113	14113	14114	$np	431 3
element	dispBeamColumn	14114	14114	14115	$np	431 3
element	dispBeamColumn	14115	14115	14116	$np	430 3
element	dispBeamColumn	14116	14116	14117	$np	430 3
element	dispBeamColumn	14117	14117	14118	$np	430 3
element	dispBeamColumn	14118	14118	14119	$np	431 3
element	dispBeamColumn	14119	14119	14120	$np	431 3
element	dispBeamColumn	14120	14120	419	  $np	431 3
element	dispBeamColumn	110419	419	14121	$np	411 3
element	dispBeamColumn	14121	14121	14122	$np	411 3
element	dispBeamColumn	14122	14122	14123	$np	411 3
element	dispBeamColumn	14123	14123	14124	$np	410 3
element	dispBeamColumn	14124	14124	14125	$np	410 3
element	dispBeamColumn	14125	14125	14126	$np	410 3
element	dispBeamColumn	14126	14126	14127	$np	411 3
element	dispBeamColumn	14127	14127	14128	$np	411 3
element	dispBeamColumn	14128	14128	420	  $np	411 3





#弹性111101
element	dispBeamColumn	111101	101	11129	$np	121 2
element	dispBeamColumn	11129	11129	11130	$np	121 2
element	dispBeamColumn	11130	11130	11131	$np	121 2
element	dispBeamColumn	11131	11131	11132	$np	120 2
element	dispBeamColumn	11132	11132	11133	$np	120 2
element	dispBeamColumn	11133	11133	11134	$np	120 2
element	dispBeamColumn	11134	11134	11135	$np	121 2
element	dispBeamColumn	11135	11135	11136	$np	121 2
#弹性11136    
element	dispBeamColumn	11136	11136	106	  $np	121 2
element	dispBeamColumn	111106	106	11137	$np	141 2
element	dispBeamColumn	11137	11137	11138	$np	141 2
element	dispBeamColumn	11138	11138	11139	$np	141 2
element	dispBeamColumn	11139	11139	11140	$np	140 2
element	dispBeamColumn	11140	11140	11141	$np	140 2
element	dispBeamColumn	11141	11141	11142	$np	140 2
element	dispBeamColumn	11142	11142	11143	$np	141 2
element	dispBeamColumn	11143	11143	11144	$np	141 2
element	dispBeamColumn	11144	11144	111	  $np	141 2
element	dispBeamColumn	111111	111	11145	$np	121 2
element	dispBeamColumn	11145	11145	11146	$np	121 2
element	dispBeamColumn	11146	11146	11147	$np	121 2
element	dispBeamColumn	11147	11147	11148	$np	120 2
element	dispBeamColumn	11148	11148	11149	$np	120 2
element	dispBeamColumn	11149	11149	11150	$np	120 2
element	dispBeamColumn	11150	11150	11151	$np	121 2
element	dispBeamColumn	11151	11151	11152	$np	121 2
element	dispBeamColumn	11152	11152	116	  $np	121 2
    
    
element	dispBeamColumn	111102	102	11153	$np	161 2
element	dispBeamColumn	11153	11153	11154	$np	161 2
element	dispBeamColumn	11154	11154	11155	$np	161 2
element	dispBeamColumn	11155	11155	11156	$np	160 2
element	dispBeamColumn	11156	11156	11157	$np	160 2
element	dispBeamColumn	11157	11157	11158	$np	160 2
element	dispBeamColumn	11158	11158	11159	$np	161 2
element	dispBeamColumn	11159	11159	11160	$np	161 2
element	dispBeamColumn	11160	11160	107	  $np	161 2
element	dispBeamColumn	111107	107	11161	$np	161 2
element	dispBeamColumn	11161	11161	11162	$np	161 2
element	dispBeamColumn	11162	11162	11163	$np	161 2
element	dispBeamColumn	11163	11163	11164	$np	160 2
element	dispBeamColumn	11164	11164	11165	$np	160 2
element	dispBeamColumn	11165	11165	11166	$np	160 2
element	dispBeamColumn	11166	11166	11167	$np	161 2
element	dispBeamColumn	11167	11167	11168	$np	161 2
element	dispBeamColumn	11168	11168	112	  $np	161 2
element	dispBeamColumn	111112	112	11169	$np	161 2
element	dispBeamColumn	11169	11169	11170	$np	161 2
element	dispBeamColumn	11170	11170	11171	$np	161 2
element	dispBeamColumn	11171	11171	11172	$np	160 2
element	dispBeamColumn	11172	11172	11173	$np	160 2
element	dispBeamColumn	11173	11173	11174	$np	160 2
element	dispBeamColumn	11174	11174	11175	$np	161 2
element	dispBeamColumn	11175	11175	11176	$np	161 2
element	dispBeamColumn	11176	11176	117	  $np	161 2
    
    
element	dispBeamColumn	111103	103	11177	$np	161 2
element	dispBeamColumn	11177	11177	11178	$np	161 2
element	dispBeamColumn	11178	11178	11179	$np	161 2
element	dispBeamColumn	11179	11179	11180	$np	160 2
element	dispBeamColumn	11180	11180	11181	$np	160 2
element	dispBeamColumn	11181	11181	11182	$np	160 2
element	dispBeamColumn	11182	11182	11183	$np	161 2
element	dispBeamColumn	11183	11183	11184	$np	161 2
element	dispBeamColumn	11184	11184	108	  $np	161 2
element	dispBeamColumn	111108	108	11185	$np	161 2
element	dispBeamColumn	11185	11185	11186	$np	161 2
element	dispBeamColumn	11186	11186	11187	$np	161 2
element	dispBeamColumn	11187	11187	11188	$np	160 2
element	dispBeamColumn	11188	11188	11189	$np	160 2
element	dispBeamColumn	11189	11189	11190	$np	160 2
element	dispBeamColumn	11190	11190	11191	$np	161 2
element	dispBeamColumn	11191	11191	11192	$np	161 2
element	dispBeamColumn	11192	11192	113	  $np	161 2
element	dispBeamColumn	111113	113	11193	$np	161 2
element	dispBeamColumn	11193	11193	11194	$np	161 2
element	dispBeamColumn	11194	11194	11195	$np	161 2
element	dispBeamColumn	11195	11195	11196	$np	160 2
element	dispBeamColumn	11196	11196	11197	$np	160 2
element	dispBeamColumn	11197	11197	11198	$np	160 2
element	dispBeamColumn	11198	11198	11199	$np	161 2
element	dispBeamColumn	11199	11199	11200	$np	161 2
element	dispBeamColumn	11200	11200	118	  $np	161 2
    
    
element	dispBeamColumn	111104	104	11201	$np	161 2
element	dispBeamColumn	11201	11201	11202	$np	161 2
element	dispBeamColumn	11202	11202	11203	$np	161 2
element	dispBeamColumn	11203	11203	11204	$np	160 2
element	dispBeamColumn	11204	11204	11205	$np	160 2
element	dispBeamColumn	11205	11205	11206	$np	160 2
element	dispBeamColumn	11206	11206	11207	$np	161 2
element	dispBeamColumn	11207	11207	11208	$np	161 2
element	dispBeamColumn	11208	11208	109	  $np	161 2
element	dispBeamColumn	111109	109	11209	$np	161 2
element	dispBeamColumn	11209	11209	11210	$np	161 2
element	dispBeamColumn	11210	11210	11211	$np	161 2
element	dispBeamColumn	11211	11211	11212	$np	160 2
element	dispBeamColumn	11212	11212	11213	$np	160 2
element	dispBeamColumn	11213	11213	11214	$np	160 2
element	dispBeamColumn	11214	11214	11215	$np	161 2
element	dispBeamColumn	11215	11215	11216	$np	161 2
element	dispBeamColumn	11216	11216	114	  $np	161 2
element	dispBeamColumn	111114	114	11217	$np	161 2
element	dispBeamColumn	11217	11217	11218	$np	161 2
element	dispBeamColumn	11218	11218	11219	$np	161 2
element	dispBeamColumn	11219	11219	11220	$np	160 2
element	dispBeamColumn	11220	11220	11221	$np	160 2
element	dispBeamColumn	11221	11221	11222	$np	160 2
element	dispBeamColumn	11222	11222	11223	$np	161 2
element	dispBeamColumn	11223	11223	11224	$np	161 2
element	dispBeamColumn	11224	11224	119	  $np	161 2
    
    
element	dispBeamColumn	111105	105	11225	$np	121 2
element	dispBeamColumn	11225	11225	11226	$np	121 2
element	dispBeamColumn	11226	11226	11227	$np	121 2
element	dispBeamColumn	11227	11227	11228	$np	120 2
element	dispBeamColumn	11228	11228	11229	$np	120 2
element	dispBeamColumn	11229	11229	11230	$np	120 2
element	dispBeamColumn	11230	11230	11231	$np	121 2
element	dispBeamColumn	11231	11231	11232	$np	121 2
element	dispBeamColumn	11232	11232	110	  $np	121 2
element	dispBeamColumn	111110	110	11233	$np	141 2
element	dispBeamColumn	11233	11233	11234	$np	141 2
element	dispBeamColumn	11234	11234	11235	$np	141 2
element	dispBeamColumn	11235	11235	11236	$np	140 2
element	dispBeamColumn	11236	11236	11237	$np	140 2
element	dispBeamColumn	11237	11237	11238	$np	140 2
element	dispBeamColumn	11238	11238	11239	$np	141 2
element	dispBeamColumn	11239	11239	11240	$np	141 2
element	dispBeamColumn	11240	11240	115	  $np	141 2
element	dispBeamColumn	111115	115	11241	$np	121 2
element	dispBeamColumn	11241	11241	11242	$np	121 2
element	dispBeamColumn	11242	11242	11243	$np	121 2
element	dispBeamColumn	11243	11243	11244	$np	120 2
element	dispBeamColumn	11244	11244	11245	$np	120 2
element	dispBeamColumn	11245	11245	11246	$np	120 2
element	dispBeamColumn	11246	11246	11247	$np	121 2
element	dispBeamColumn	11247	11247	11248	$np	121 2
element	dispBeamColumn	11248	11248	120	  $np	121 2

#弹性111201
element	dispBeamColumn	111201	201	12129	$np	221 2
element	dispBeamColumn	12129	12129	12130	$np	221 2
element	dispBeamColumn	12130	12130	12131	$np	221 2
element	dispBeamColumn	12131	12131	12132	$np	220 2
element	dispBeamColumn	12132	12132	12133	$np	220 2
element	dispBeamColumn	12133	12133	12134	$np	220 2
element	dispBeamColumn	12134	12134	12135	$np	221 2
element	dispBeamColumn	12135	12135	12136	$np	221 2
#弹性12136    
element	dispBeamColumn	12136	12136	206	  $np	221 2
element	dispBeamColumn	111206	206	12137	$np	241 2
element	dispBeamColumn	12137	12137	12138	$np	241 2
element	dispBeamColumn	12138	12138	12139	$np	241 2
element	dispBeamColumn	12139	12139	12140	$np	240 2
element	dispBeamColumn	12140	12140	12141	$np	240 2
element	dispBeamColumn	12141	12141	12142	$np	240 2
element	dispBeamColumn	12142	12142	12143	$np	241 2
element	dispBeamColumn	12143	12143	12144	$np	241 2
element	dispBeamColumn	12144	12144	211	  $np	241 2
element	dispBeamColumn	111211	211	12145	$np	221 2
element	dispBeamColumn	12145	12145	12146	$np	221 2
element	dispBeamColumn	12146	12146	12147	$np	221 2
element	dispBeamColumn	12147	12147	12148	$np	220 2
element	dispBeamColumn	12148	12148	12149	$np	220 2
element	dispBeamColumn	12149	12149	12150	$np	220 2
element	dispBeamColumn	12150	12150	12151	$np	221 2
element	dispBeamColumn	12151	12151	12152	$np	221 2
element	dispBeamColumn	12152	12152	216	  $np	221 2
    
    
element	dispBeamColumn	111202	202	12153	$np	261 2
element	dispBeamColumn	12153	12153	12154	$np	261 2
element	dispBeamColumn	12154	12154	12155	$np	261 2
element	dispBeamColumn	12155	12155	12156	$np	260 2
element	dispBeamColumn	12156	12156	12157	$np	260 2
element	dispBeamColumn	12157	12157	12158	$np	260 2
element	dispBeamColumn	12158	12158	12159	$np	261 2
element	dispBeamColumn	12159	12159	12160	$np	261 2
element	dispBeamColumn	12160	12160	207	  $np	261 2
element	dispBeamColumn	111207	207	12161	$np	261 2
element	dispBeamColumn	12161	12161	12162	$np	261 2
element	dispBeamColumn	12162	12162	12163	$np	261 2
element	dispBeamColumn	12163	12163	12164	$np	260 2
element	dispBeamColumn	12164	12164	12165	$np	260 2
element	dispBeamColumn	12165	12165	12166	$np	260 2
element	dispBeamColumn	12166	12166	12167	$np	261 2
element	dispBeamColumn	12167	12167	12168	$np	261 2
element	dispBeamColumn	12168	12168	212	  $np	261 2
element	dispBeamColumn	111212	212	12169	$np	261 2
element	dispBeamColumn	12169	12169	12170	$np	261 2
element	dispBeamColumn	12170	12170	12171	$np	261 2
element	dispBeamColumn	12171	12171	12172	$np	260 2
element	dispBeamColumn	12172	12172	12173	$np	260 2
element	dispBeamColumn	12173	12173	12174	$np	260 2
element	dispBeamColumn	12174	12174	12175	$np	261 2
element	dispBeamColumn	12175	12175	12176	$np	261 2
element	dispBeamColumn	12176	12176	217	  $np	261 2
    
    
element	dispBeamColumn	111203	203	12177	$np	261 2
element	dispBeamColumn	12177	12177	12178	$np	261 2
element	dispBeamColumn	12178	12178	12179	$np	261 2
element	dispBeamColumn	12179	12179	12180	$np	260 2
element	dispBeamColumn	12180	12180	12181	$np	260 2
element	dispBeamColumn	12181	12181	12182	$np	260 2
element	dispBeamColumn	12182	12182	12183	$np	261 2
element	dispBeamColumn	12183	12183	12184	$np	261 2
element	dispBeamColumn	12184	12184	208	  $np	261 2
element	dispBeamColumn	111208	208	12185	$np	261 2
element	dispBeamColumn	12185	12185	12186	$np	261 2
element	dispBeamColumn	12186	12186	12187	$np	261 2
element	dispBeamColumn	12187	12187	12188	$np	260 2
element	dispBeamColumn	12188	12188	12189	$np	260 2
element	dispBeamColumn	12189	12189	12190	$np	260 2
element	dispBeamColumn	12190	12190	12191	$np	261 2
element	dispBeamColumn	12191	12191	12192	$np	261 2
element	dispBeamColumn	12192	12192	213	  $np	261 2
element	dispBeamColumn	111213	213	12193	$np	261 2
element	dispBeamColumn	12193	12193	12194	$np	261 2
element	dispBeamColumn	12194	12194	12195	$np	261 2
element	dispBeamColumn	12195	12195	12196	$np	260 2
element	dispBeamColumn	12196	12196	12197	$np	260 2
element	dispBeamColumn	12197	12197	12198	$np	260 2
element	dispBeamColumn	12198	12198	12199	$np	261 2
element	dispBeamColumn	12199	12199	12200	$np	261 2
element	dispBeamColumn	12200	12200	218	  $np	161 2
    
    
element	dispBeamColumn	111204	204	12201	$np	261 2
element	dispBeamColumn	12201	12201	12202	$np	261 2
element	dispBeamColumn	12202	12202	12203	$np	261 2
element	dispBeamColumn	12203	12203	12204	$np	260 2
element	dispBeamColumn	12204	12204	12205	$np	260 2
element	dispBeamColumn	12205	12205	12206	$np	260 2
element	dispBeamColumn	12206	12206	12207	$np	261 2
element	dispBeamColumn	12207	12207	12208	$np	261 2
element	dispBeamColumn	12208	12208	209	  $np	261 2
element	dispBeamColumn	111209	209	12209	$np	261 2
element	dispBeamColumn	12209	12209	12210	$np	261 2
element	dispBeamColumn	12210	12210	12211	$np	261 2
element	dispBeamColumn	12211	12211	12212	$np	260 2
element	dispBeamColumn	12212	12212	12213	$np	260 2
element	dispBeamColumn	12213	12213	12214	$np	260 2
element	dispBeamColumn	12214	12214	12215	$np	261 2
element	dispBeamColumn	12215	12215	12216	$np	261 2
element	dispBeamColumn	12216	12216	214	  $np	261 2
element	dispBeamColumn	111214	214	12217	$np	261 2
element	dispBeamColumn	12217	12217	12218	$np	261 2
element	dispBeamColumn	12218	12218	12219	$np	261 2
element	dispBeamColumn	12219	12219	12220	$np	260 2
element	dispBeamColumn	12220	12220	12221	$np	260 2
element	dispBeamColumn	12221	12221	12222	$np	260 2
element	dispBeamColumn	12222	12222	12223	$np	261 2
element	dispBeamColumn	12223	12223	12224	$np	261 2
element	dispBeamColumn	12224	12224	219	  $np	261 2
    
    
element	dispBeamColumn	111205	205	12225	$np	221 2
element	dispBeamColumn	12225	12225	12226	$np	221 2
element	dispBeamColumn	12226	12226	12227	$np	221 2
element	dispBeamColumn	12227	12227	12228	$np	220 2
element	dispBeamColumn	12228	12228	12229	$np	220 2
element	dispBeamColumn	12229	12229	12230	$np	220 2
element	dispBeamColumn	12230	12230	12231	$np	221 2
element	dispBeamColumn	12231	12231	12232	$np	221 2
element	dispBeamColumn	12232	12232	210	  $np	221 2
element	dispBeamColumn	111210	210	12233	$np	241 2
element	dispBeamColumn	12233	12233	12234	$np	241 2
element	dispBeamColumn	12234	12234	12235	$np	241 2
element	dispBeamColumn	12235	12235	12236	$np	240 2
element	dispBeamColumn	12236	12236	12237	$np	240 2
element	dispBeamColumn	12237	12237	12238	$np	240 2
element	dispBeamColumn	12238	12238	12239	$np	241 2
element	dispBeamColumn	12239	12239	12240	$np	241 2
element	dispBeamColumn	12240	12240	215	  $np	241 2
element	dispBeamColumn	111215	215	12241	$np	221 2
element	dispBeamColumn	12241	12241	12242	$np	221 2
element	dispBeamColumn	12242	12242	12243	$np	221 2
element	dispBeamColumn	12243	12243	12244	$np	220 2
element	dispBeamColumn	12244	12244	12245	$np	220 2
element	dispBeamColumn	12245	12245	12246	$np	220 2
element	dispBeamColumn	12246	12246	12247	$np	221 2
element	dispBeamColumn	12247	12247	12248	$np	221 2
element	dispBeamColumn	12248	12248	220	  $np	221 2

#弹性111301
element	dispBeamColumn	111301	301	13129	$np	321 2
element	dispBeamColumn	13129	13129	13130	$np	321 2
element	dispBeamColumn	13130	13130	13131	$np	321 2
element	dispBeamColumn	13131	13131	13132	$np	320 2
element	dispBeamColumn	13132	13132	13133	$np	320 2
element	dispBeamColumn	13133	13133	13134	$np	320 2
element	dispBeamColumn	13134	13134	13135	$np	321 2
element	dispBeamColumn	13135	13135	13136	$np	321 2
#弹性13136    
element	dispBeamColumn	13136	13136	306	  $np	321 2
element	dispBeamColumn	111306	306	13137	$np	341 2
element	dispBeamColumn	13137	13137	13138	$np	341 2
element	dispBeamColumn	13138	13138	13139	$np	341 2
element	dispBeamColumn	13139	13139	13140	$np	340 2
element	dispBeamColumn	13140	13140	13141	$np	340 2
element	dispBeamColumn	13141	13141	13142	$np	340 2
element	dispBeamColumn	13142	13142	13143	$np	341 2
element	dispBeamColumn	13143	13143	13144	$np	341 2
element	dispBeamColumn	13144	13144	311	  $np	341 2
element	dispBeamColumn	111311	311	13145	$np	321 2
element	dispBeamColumn	13145	13145	13146	$np	321 2
element	dispBeamColumn	13146	13146	13147	$np	321 2
element	dispBeamColumn	13147	13147	13148	$np	320 2
element	dispBeamColumn	13148	13148	13149	$np	320 2
element	dispBeamColumn	13149	13149	13150	$np	320 2
element	dispBeamColumn	13150	13150	13151	$np	321 2
element	dispBeamColumn	13151	13151	13152	$np	321 2
element	dispBeamColumn	13152	13152	316	  $np	321 2
    
    
element	dispBeamColumn	111302	302	13153	$np	361 2
element	dispBeamColumn	13153	13153	13154	$np	361 2
element	dispBeamColumn	13154	13154	13155	$np	361 2
element	dispBeamColumn	13155	13155	13156	$np	360 2
element	dispBeamColumn	13156	13156	13157	$np	360 2
element	dispBeamColumn	13157	13157	13158	$np	360 2
element	dispBeamColumn	13158	13158	13159	$np	361 2
element	dispBeamColumn	13159	13159	13160	$np	361 2
element	dispBeamColumn	13160	13160	307	  $np	361 2
element	dispBeamColumn	111307	307	13161	$np	361 2
element	dispBeamColumn	13161	13161	13162	$np	361 2
element	dispBeamColumn	13162	13162	13163	$np	361 2
element	dispBeamColumn	13163	13163	13164	$np	360 2
element	dispBeamColumn	13164	13164	13165	$np	360 2
element	dispBeamColumn	13165	13165	13166	$np	360 2
element	dispBeamColumn	13166	13166	13167	$np	361 2
element	dispBeamColumn	13167	13167	13168	$np	361 2
element	dispBeamColumn	13168	13168	312	  $np	361 2
element	dispBeamColumn	111312	312	13169	$np	361 2
element	dispBeamColumn	13169	13169	13170	$np	361 2
element	dispBeamColumn	13170	13170	13171	$np	361 2
element	dispBeamColumn	13171	13171	13172	$np	360 2
element	dispBeamColumn	13172	13172	13173	$np	360 2
element	dispBeamColumn	13173	13173	13174	$np	360 2
element	dispBeamColumn	13174	13174	13175	$np	361 2
element	dispBeamColumn	13175	13175	13176	$np	361 2
element	dispBeamColumn	13176	13176	317	  $np	361 2
    
    
element	dispBeamColumn	111303	303	13177	$np	361 2
element	dispBeamColumn	13177	13177	13178	$np	361 2
element	dispBeamColumn	13178	13178	13179	$np	361 2
element	dispBeamColumn	13179	13179	13180	$np	360 2
element	dispBeamColumn	13180	13180	13181	$np	360 2
element	dispBeamColumn	13181	13181	13182	$np	360 2
element	dispBeamColumn	13182	13182	13183	$np	361 2
element	dispBeamColumn	13183	13183	13184	$np	361 2
element	dispBeamColumn	13184	13184	308	  $np	361 2
element	dispBeamColumn	111308	308	13185	$np	361 2
element	dispBeamColumn	13185	13185	13186	$np	361 2
element	dispBeamColumn	13186	13186	13187	$np	361 2
element	dispBeamColumn	13187	13187	13188	$np	360 2
element	dispBeamColumn	13188	13188	13189	$np	360 2
element	dispBeamColumn	13189	13189	13190	$np	360 2
element	dispBeamColumn	13190	13190	13191	$np	361 2
element	dispBeamColumn	13191	13191	13192	$np	361 2
element	dispBeamColumn	13192	13192	313	  $np	361 2
element	dispBeamColumn	111313	313	13193	$np	361 2
element	dispBeamColumn	13193	13193	13194	$np	361 2
element	dispBeamColumn	13194	13194	13195	$np	361 2
element	dispBeamColumn	13195	13195	13196	$np	360 2
element	dispBeamColumn	13196	13196	13197	$np	360 2
element	dispBeamColumn	13197	13197	13198	$np	360 2
element	dispBeamColumn	13198	13198	13199	$np	361 2
element	dispBeamColumn	13199	13199	13200	$np	361 2
element	dispBeamColumn	13200	13200	318	  $np	361 2
    
    
element	dispBeamColumn	111304	304	13201	$np	361 2
element	dispBeamColumn	13201	13201	13202	$np	361 2
element	dispBeamColumn	13202	13202	13203	$np	361 2
element	dispBeamColumn	13203	13203	13204	$np	360 2
element	dispBeamColumn	13204	13204	13205	$np	360 2
element	dispBeamColumn	13205	13205	13206	$np	360 2
element	dispBeamColumn	13206	13206	13207	$np	361 2
element	dispBeamColumn	13207	13207	13208	$np	361 2
element	dispBeamColumn	13208	13208	309	  $np	361 2
element	dispBeamColumn	111309	309	13209	$np	361 2
element	dispBeamColumn	13209	13209	13210	$np	361 2
element	dispBeamColumn	13210	13210	13211	$np	361 2
element	dispBeamColumn	13211	13211	13212	$np	360 2
element	dispBeamColumn	13212	13212	13213	$np	360 2
element	dispBeamColumn	13213	13213	13214	$np	360 2
element	dispBeamColumn	13214	13214	13215	$np	361 2
element	dispBeamColumn	13215	13215	13216	$np	361 2
element	dispBeamColumn	13216	13216	314	  $np	361 2
element	dispBeamColumn	111314	314	13217	$np	361 2
element	dispBeamColumn	13217	13217	13218	$np	361 2
element	dispBeamColumn	13218	13218	13219	$np	361 2
element	dispBeamColumn	13219	13219	13220	$np	360 2
element	dispBeamColumn	13220	13220	13221	$np	360 2
element	dispBeamColumn	13221	13221	13222	$np	360 2
element	dispBeamColumn	13222	13222	13223	$np	361 2
element	dispBeamColumn	13223	13223	13224	$np	361 2
element	dispBeamColumn	13224	13224	319	  $np	161 2
    
    
element	dispBeamColumn	111305	305	13225	$np	321 2
element	dispBeamColumn	13225	13225	13226	$np	321 2
element	dispBeamColumn	13226	13226	13227	$np	321 2
element	dispBeamColumn	13227	13227	13228	$np	320 2
element	dispBeamColumn	13228	13228	13229	$np	320 2
element	dispBeamColumn	13229	13229	13230	$np	320 2
element	dispBeamColumn	13230	13230	13231	$np	321 2
element	dispBeamColumn	13231	13231	13232	$np	321 2
element	dispBeamColumn	13232	13232	310	  $np	321 2
element	dispBeamColumn	111310	310	13233	$np	341 2
element	dispBeamColumn	13233	13233	13234	$np	341 2
element	dispBeamColumn	13234	13234	13235	$np	341 2
element	dispBeamColumn	13235	13235	13236	$np	340 2
element	dispBeamColumn	13236	13236	13237	$np	340 2
element	dispBeamColumn	13237	13237	13238	$np	340 2
element	dispBeamColumn	13238	13238	13239	$np	341 2
element	dispBeamColumn	13239	13239	13240	$np	341 2
element	dispBeamColumn	13240	13240	315	  $np	341 2
element	dispBeamColumn	111315	315	13241	$np	321 2
element	dispBeamColumn	13241	13241	13242	$np	321 2
element	dispBeamColumn	13242	13242	13243	$np	321 2
element	dispBeamColumn	13243	13243	13244	$np	320 2
element	dispBeamColumn	13244	13244	13245	$np	320 2
element	dispBeamColumn	13245	13245	13246	$np	320 2
element	dispBeamColumn	13246	13246	13247	$np	321 2
element	dispBeamColumn	13247	13247	13248	$np	321 2
element	dispBeamColumn	13248	13248	320	  $np	321 2

#弹性111401
element	dispBeamColumn	111401	401	14129	$np	421 2
element	dispBeamColumn	14129	14129	14130	$np	421 2
element	dispBeamColumn	14130	14130	14131	$np	421 2
element	dispBeamColumn	14131	14131	14132	$np	420 2
element	dispBeamColumn	14132	14132	14133	$np	420 2
element	dispBeamColumn	14133	14133	14134	$np	420 2
element	dispBeamColumn	14134	14134	14135	$np	421 2
element	dispBeamColumn	14135	14135	14136	$np	421 2
#弹性14136    
element	dispBeamColumn	14136	14136	406	  $np	421 2
element	dispBeamColumn	111406	406	14137	$np	441 2
element	dispBeamColumn	14137	14137	14138	$np	441 2
element	dispBeamColumn	14138	14138	14139	$np	441 2
element	dispBeamColumn	14139	14139	14140	$np	440 2
element	dispBeamColumn	14140	14140	14141	$np	440 2
element	dispBeamColumn	14141	14141	14142	$np	440 2
element	dispBeamColumn	14142	14142	14143	$np	441 2
element	dispBeamColumn	14143	14143	14144	$np	441 2
element	dispBeamColumn	14144	14144	411	  $np	441 2
element	dispBeamColumn	111411	411	14145	$np	421 2
element	dispBeamColumn	14145	14145	14146	$np	421 2
element	dispBeamColumn	14146	14146	14147	$np	421 2
element	dispBeamColumn	14147	14147	14148	$np	420 2
element	dispBeamColumn	14148	14148	14149	$np	420 2
element	dispBeamColumn	14149	14149	14150	$np	420 2
element	dispBeamColumn	14150	14150	14151	$np	421 2
element	dispBeamColumn	14151	14151	14152	$np	421 2
element	dispBeamColumn	14152	14152	416	  $np	421 2
    
    
element	dispBeamColumn	111402	402	14153	$np	461 2
element	dispBeamColumn	14153	14153	14154	$np	461 2
element	dispBeamColumn	14154	14154	14155	$np	461 2
element	dispBeamColumn	14155	14155	14156	$np	460 2
element	dispBeamColumn	14156	14156	14157	$np	460 2
element	dispBeamColumn	14157	14157	14158	$np	460 2
element	dispBeamColumn	14158	14158	14159	$np	461 2
element	dispBeamColumn	14159	14159	14160	$np	461 2
element	dispBeamColumn	14160	14160	407	  $np	461 2
element	dispBeamColumn	111407	407	14161	$np	461 2
element	dispBeamColumn	14161	14161	14162	$np	461 2
element	dispBeamColumn	14162	14162	14163	$np	461 2
element	dispBeamColumn	14163	14163	14164	$np	460 2
element	dispBeamColumn	14164	14164	14165	$np	460 2
element	dispBeamColumn	14165	14165	14166	$np	460 2
element	dispBeamColumn	14166	14166	14167	$np	461 2
element	dispBeamColumn	14167	14167	14168	$np	461 2
element	dispBeamColumn	14168	14168	412	  $np	461 2
element	dispBeamColumn	111412	412	14169	$np	461 2
element	dispBeamColumn	14169	14169	14170	$np	461 2
element	dispBeamColumn	14170	14170	14171	$np	461 2
element	dispBeamColumn	14171	14171	14172	$np	460 2
element	dispBeamColumn	14172	14172	14173	$np	460 2
element	dispBeamColumn	14173	14173	14174	$np	460 2
element	dispBeamColumn	14174	14174	14175	$np	461 2
element	dispBeamColumn	14175	14175	14176	$np	461 2
element	dispBeamColumn	14176	14176	417	  $np	461 2
    
    
element	dispBeamColumn	111403	403	14177	$np	461 2
element	dispBeamColumn	14177	14177	14178	$np	461 2
element	dispBeamColumn	14178	14178	14179	$np	461 2
element	dispBeamColumn	14179	14179	14180	$np	460 2
element	dispBeamColumn	14180	14180	14181	$np	460 2
element	dispBeamColumn	14181	14181	14182	$np	460 2
element	dispBeamColumn	14182	14182	14183	$np	461 2
element	dispBeamColumn	14183	14183	14184	$np	461 2
element	dispBeamColumn	14184	14184	408	  $np	461 2
element	dispBeamColumn	111408	408	14185	$np	461 2
element	dispBeamColumn	14185	14185	14186	$np	461 2
element	dispBeamColumn	14186	14186	14187	$np	461 2
element	dispBeamColumn	14187	14187	14188	$np	460 2
element	dispBeamColumn	14188	14188	14189	$np	460 2
element	dispBeamColumn	14189	14189	14190	$np	460 2
element	dispBeamColumn	14190	14190	14191	$np	461 2
element	dispBeamColumn	14191	14191	14192	$np	461 2
element	dispBeamColumn	14192	14192	413	  $np	461 2
element	dispBeamColumn	111413	413	14193	$np	461 2
element	dispBeamColumn	14193	14193	14194	$np	461 2
element	dispBeamColumn	14194	14194	14195	$np	461 2
element	dispBeamColumn	14195	14195	14196	$np	460 2
element	dispBeamColumn	14196	14196	14197	$np	460 2
element	dispBeamColumn	14197	14197	14198	$np	460 2
element	dispBeamColumn	14198	14198	14199	$np	461 2
element	dispBeamColumn	14199	14199	14200	$np	461 2
element	dispBeamColumn	14200	14200	418	  $np	461 2
    
    
element	dispBeamColumn	111404	404	14201	$np	461 2
element	dispBeamColumn	14201	14201	14202	$np	461 2
element	dispBeamColumn	14202	14202	14203	$np	461 2
element	dispBeamColumn	14203	14203	14204	$np	460 2
element	dispBeamColumn	14204	14204	14205	$np	460 2
element	dispBeamColumn	14205	14205	14206	$np	460 2
element	dispBeamColumn	14206	14206	14207	$np	461 2
element	dispBeamColumn	14207	14207	14208	$np	461 2
element	dispBeamColumn	14208	14208	409	  $np	461 2
element	dispBeamColumn	111409	409	14209	$np	461 2
element	dispBeamColumn	14209	14209	14210	$np	461 2
element	dispBeamColumn	14210	14210	14211	$np	461 2
element	dispBeamColumn	14211	14211	14212	$np	460 2
element	dispBeamColumn	14212	14212	14213	$np	460 2
element	dispBeamColumn	14213	14213	14214	$np	460 2
element	dispBeamColumn	14214	14214	14215	$np	461 2
element	dispBeamColumn	14215	14215	14216	$np	461 2
element	dispBeamColumn	14216	14216	414	  $np	461 2
element	dispBeamColumn	111414	414	14217	$np	461 2
element	dispBeamColumn	14217	14217	14218	$np	461 2
element	dispBeamColumn	14218	14218	14219	$np	461 2
element	dispBeamColumn	14219	14219	14220	$np	460 2
element	dispBeamColumn	14220	14220	14221	$np	460 2
element	dispBeamColumn	14221	14221	14222	$np	460 2
element	dispBeamColumn	14222	14222	14223	$np	461 2
element	dispBeamColumn	14223	14223	14224	$np	461 2
element	dispBeamColumn	14224	14224	419	  $np	461 2
    
    
element	dispBeamColumn	111405	405	14225	$np	421 2
element	dispBeamColumn	14225	14225	14226	$np	421 2
element	dispBeamColumn	14226	14226	14227	$np	421 2
element	dispBeamColumn	14227	14227	14228	$np	420 2
element	dispBeamColumn	14228	14228	14229	$np	420 2
element	dispBeamColumn	14229	14229	14230	$np	420 2
element	dispBeamColumn	14230	14230	14231	$np	421 2
element	dispBeamColumn	14231	14231	14232	$np	421 2
element	dispBeamColumn	14232	14232	410	  $np	421 2
element	dispBeamColumn	111410	410	14233	$np	441 2
element	dispBeamColumn	14233	14233	14234	$np	441 2
element	dispBeamColumn	14234	14234	14235	$np	441 2
element	dispBeamColumn	14235	14235	14236	$np	440 2
element	dispBeamColumn	14236	14236	14237	$np	440 2
element	dispBeamColumn	14237	14237	14238	$np	440 2
element	dispBeamColumn	14238	14238	14239	$np	441 2
element	dispBeamColumn	14239	14239	14240	$np	441 2
element	dispBeamColumn	14240	14240	415	  $np	441 2
element	dispBeamColumn	111415	415	14241	$np	421 2
element	dispBeamColumn	14241	14241	14242	$np	421 2
element	dispBeamColumn	14242	14242	14243	$np	421 2
element	dispBeamColumn	14243	14243	14244	$np	420 2
element	dispBeamColumn	14244	14244	14245	$np	420 2
element	dispBeamColumn	14245	14245	14246	$np	420 2
element	dispBeamColumn	14246	14246	14247	$np	421 2
element	dispBeamColumn	14247	14247	14248	$np	421 2
element	dispBeamColumn	14248	14248	420	  $np	421 2

##1层																																																																																																																																																																																																																																																																																																												
#rigidDiaphragm	3	108 	101 	102 	103 	104 	105 	106 	107 		109 	110 	111 	112 	113 	114 	115 	116 	117 	118 	119 	120 	1101 	1102 	1103 	1104 	1105 	1106 	1107 	1108 		1109 	1110 	1111 	1112 	1113 	1114 	1115 	1116 		1117 	1118 	1119 	1120 	1121 	1122 	1123 	1124 		1125 	1126 	1127 	1128 	1129 	1130 	1131 	1132 		1133 	1134 	1135 	1136 	1137 	1138 	1139 	1140 		1141 	1142 	1143 	1144 	1145 	1146 	1147 	1148 		1149 	1150 	1151 	1152 	1153 	1154 	1155 	1156 		1157 	1158 	1159 	1160 	1161 	1162 	1163 	1164 		1165 	1166 	1167 	1168 	1169 	1170 	1171 	1172 		1173 	1174 	1175 	1176 	1177 	1178 	1179 	1180 		1181 	1182 	1183 	1184 	1185 	1186 	1187 	1188 		1189 	1190 	1191 	1192 	1193 	1194 	1195 	1196 		1197 	1198 	1199 	11100 	11101 	11102 	11103 	11104 		11105 	11106 	11107 	11108 	11109 	11110 	11111 	11112 		11113 	11114 	11115 	11116 	11117 	11118 	11119 	11120 		11121 	11122 	11123 	11124 	11125 	11126 	11127 	11128 		11129 	11130 	11131 	11132 	11133 	11134 	11135 	11136 		11137 	11138 	11139 	11140 	11141 	11142 	11143 	11144 		11145 	11146 	11147 	11148 	11149 	11150 	11151 	11152 		11153 	11154 	11155 	11156 	11157 	11158 	11159 	11160 		11161 	11162 	11163 	11164 	11165 	11166 	11167 	11168 		11169 	11170 	11171 	11172 	11173 	11174 	11175 	11176 		11177 	11178 	11179 	11180 	11181 	11182 	11183 	11184 		11185 	11186 	11187 	11188	11189 	11190 	11191 	11192 		11193 	11194 	11195 	11196 	11197 	11198 	11199 	11200 		11201 	11202 	11203 	11204 	11205 	11206 	11207 	11208 		11209 	11210 	11211 	11212 	11213 	11214 	11215 	11216 		11217 	11218 	11219 	11220 	11221 	11222 	11223 	11224 		11225 	11226 	11227 	11228 	11229 	11230 	11231 	11232 		11233 	11234 	11235 	11236 	11237 	11238 	11239 	11240 		11241 	11242 	11243 	11244 	11245 	11246 	11247 	11248 
##2层																																																																																																																																																																																																																																																																																																												
#rigidDiaphragm	3	208 	201 	202 	203 	204 	205 	206 	207 		209 	210 	211 	212 	213 	214 	215 	216 	217 	218 	219 	220 	1201 	1202 	1203 	1204 	1205 	1206 	1207 	1208 		1209 	1210 	1211 	1212 	1213 	1214 	1215 	1216 		1217 	1218 	1219 	1220 	1221 	1222 	1223 	1224 		1225 	1226 	1227 	1228 	1229 	1230 	1231 	1232 		1233 	1234 	1235 	1236 	1237 	1238 	1239 	1240 		1241 	1242 	1243 	1244 	1245 	1246 	1247 	1248 		1249 	1250 	1251 	1252 	1253 	1254 	1255 	1256 		1257 	1258 	1259 	1260 	1261 	1262 	1263 	1264 		1265 	1266 	1267 	1268 	1269 	1270 	1271 	1272 		1273 	1274 	1275 	1276 	1277 	1278 	1279 	1280 		1281 	1282 	1283 	1284 	1285 	1286 	1287 	1288 		1289 	1290 	1291 	1292 	1293 	1294 	1295 	1296 		1297 	1298 	1299 	12100 	12101 	12102 	12103 	12104 		12105 	12106 	12107 	12108 	12109 	12110 	12111 	12112 		12113 	12114 	12115 	12116 	12117 	12118 	12119 	12120 		12121 	12122 	12123 	12124 	12125 	12126 	12127 	12128 		12129 	12130 	12131 	12132 	12133 	12134 	12135 	12136 		12137 	12138 	12139 	12140 	12141 	12142 	12143 	12144 		12145 	12146 	12147 	12148 	12149 	12150 	12151 	12152 		12153 	12154 	12155 	12156 	12157 	12158 	12159 	12160 		12161 	12162 	12163 	12164 	12165 	12166 	12167 	12168 		12169 	12170 	12171 	12172 	12173 	12174 	12175 	12176 		12177 	12178 	12179 	12180 	12181 	12182 	12183 	12184 		12185 	12186 	12187 	12188	12189 	12190 	12191 	12192 		12193 	12194 	12195 	12196 	12197 	12198 	12199 	12200 		12201 	12202 	12203 	12204 	12205 	12206 	12207 	12208 		12209 	12210 	12211 	12212 	12213 	12214 	12215 	12216 		12217 	12218 	12219 	12220 	12221 	12222 	12223 	12224 		12225 	12226 	12227 	12228 	12229 	12230 	12231 	12232 		12233 	12234 	12235 	12236 	12237 	12238 	12239 	12240 		12241 	12242 	12243 	12244 	12245 	12246 	12247 	12248 
##3层																																																																																																																																																																																																																																																																																																												
#rigidDiaphragm	3	308 	301 	302 	303 	304 	305 	306 	307 		309 	310 	311 	312 	313 	314 	315 	316 	317 	318 	319 	320 	1301 	1302 	1303 	1304 	1305 	1306 	1307 	1308 		1309 	1310 	1311 	1312 	1313 	1314 	1315 	1316 		1317 	1318 	1319 	1320 	1321 	1322 	1323 	1324 		1325 	1326 	1327 	1328 	1329 	1330 	1331 	1332 		1333 	1334 	1335 	1336 	1337 	1338 	1339 	1340 		1341 	1342 	1343 	1344 	1345 	1346 	1347 	1348 		1349 	1350 	1351 	1352 	1353 	1354 	1355 	1356 		1357 	1358 	1359 	1360 	1361 	1362 	1363 	1364 		1365 	1366 	1367 	1368 	1369 	1370 	1371 	1372 		1373 	1374 	1375 	1376 	1377 	1378 	1379 	1380 		1381 	1382 	1383 	1384 	1385 	1386 	1387 	1388 		1389 	1390 	1391 	1392 	1393 	1394 	1395 	1396 		1397 	1398 	1399 	13100 	13101 	13102 	13103 	13104 		13105 	13106 	13107 	13108 	13109 	13110 	13111 	13112 		13113 	13114 	13115 	13116 	13117 	13118 	13119 	13120 		13121 	13122 	13123 	13124 	13125 	13126 	13127 	13128 		13129 	13130 	13131 	13132 	13133 	13134 	13135 	13136 		13137 	13138 	13139 	13140 	13141 	13142 	13143 	13144 		13145 	13146 	13147 	13148 	13149 	13150 	13151 	13152 		13153 	13154 	13155 	13156 	13157 	13158 	13159 	13160 		13161 	13162 	13163 	13164 	13165 	13166 	13167 	13168 		13169 	13170 	13171 	13172 	13173 	13174 	13175 	13176 		13177 	13178 	13179 	13180 	13181 	13182 	13183 	13184 		13185 	13186 	13187 	13188	13189 	13190 	13191 	13192 		13193 	13194 	13195 	13196 	13197 	13198 	13199 	13200 		13201 	13202 	13203 	13204 	13205 	13206 	13207 	13208 		13209 	13210 	13211 	13212 	13213 	13214 	13215 	13216 		13217 	13218 	13219 	13220 	13221 	13222 	13223 	13224 		13225 	13226 	13227 	13228 	13229 	13230 	13231 	13232 		13233 	13234 	13235 	13236 	13237 	13238 	13239 	13240 		13241 	13242 	13243 	13244 	13245 	13246 	13247 	13248 
##4层																																																																																																																																																																																																																																																																																																												
#rigidDiaphragm	3	408 	401 	402 	403 	404 	405 	406 	407 		409 	410 	411 	412 	413 	414 	415 	416 	417 	418 	419 	420 	1401 	1402 	1403 	1404 	1405 	1406 	1407 	1408 		1409 	1410 	1411 	1412 	1413 	1414 	1415 	1416 		1417 	1418 	1419 	1420 	1421 	1422 	1423 	1424 		1425 	1426 	1427 	1428 	1429 	1430 	1431 	1432 		1433 	1434 	1435 	1436 	1437 	1438 	1439 	1440 		1441 	1442 	1443 	1444 	1445 	1446 	1447 	1448 		1449 	1450 	1451 	1452 	1453 	1454 	1455 	1456 		1457 	1458 	1459 	1460 	1461 	1462 	1463 	1464 		1465 	1466 	1467 	1468 	1469 	1470 	1471 	1472 		1473 	1474 	1475 	1476 	1477 	1478 	1479 	1480 		1481 	1482 	1483 	1484 	1485 	1486 	1487 	1488 		1489 	1490 	1491 	1492 	1493 	1494 	1495 	1496 		1497 	1498 	1499 	14100 	14101 	14102 	14103 	14104 		14105 	14106 	14107 	14108 	14109 	14110 	14111 	14112 		14113 	14114 	14115 	14116 	14117 	14118 	14119 	14120 		14121 	14122 	14123 	14124 	14125 	14126 	14127 	14128 		14129 	14130 	14131 	14132 	14133 	14134 	14135 	14136 		14137 	14138 	14139 	14140 	14141 	14142 	14143 	14144 		14145 	14146 	14147 	14148 	14149 	14150 	14151 	14152 		14153 	14154 	14155 	14156 	14157 	14158 	14159 	14160 		14161 	14162 	14163 	14164 	14165 	14166 	14167 	14168 		14169 	14170 	14171 	14172 	14173 	14174 	14175 	14176 		14177 	14178 	14179 	14180 	14181 	14182 	14183 	14184 		14185 	14186 	14187 	14188	14189 	14190 	14191 	14192 		14193 	14194 	14195 	14196 	14197 	14198 	14199 	14200 		14201 	14202 	14203 	14204 	14205 	14206 	14207 	14208 		14209 	14210 	14211 	14212 	14213 	14214 	14215 	14216 		14217 	14218 	14219 	14220 	14221 	14222 	14223 	14224 		14225 	14226 	14227 	14228 	14229 	14230 	14231 	14232 		14233 	14234 	14235 	14236 	14237 	14238 	14239 	14240 		14241 	14242 	14243 	14244 	14245 	14246 	14247 	14248 


