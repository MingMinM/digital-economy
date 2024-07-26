#用全部数据定权重
import pandas as pd
import numpy as np 
a = 0

data0 = pd.read_excel(r'E:\文件\AAA论文2.0\数据7\数字经济指标各省面板数据.xlsx')
data00 = data0.iloc[a:,2:]

#基期标准化
def jiqibzh(data):
    vmin = data.iloc[:31,:].min()
    vmax = data.iloc[:31,:].max()
    data1_ = (data-vmin)/(vmax-vmin)*10
    return data1_

data = jiqibzh(data00)
data = data.reset_index(drop=True)

def entropyWeight(data):
    n = len(data)
    m = data.shape[1]
    Q = []
    data = data.replace(0, 0.0000000001)
    for j in range(data.shape[1]):
        pij = data.iloc[:,j]/sum(data.iloc[:,j])
        lnpij = np.log(pij)
        a = np.dot(pij.T,lnpij)
        q = -1/(np.log(n))*a
        Q.append(q)
    Q = pd.DataFrame(Q)    
    W = (1-Q)/(m-sum(Q.iloc[:,0]))
    return W

def jiaquan(data,w):
    result = np.dot(data, w)
    result = pd.DataFrame(result)
    result1 = result.iloc[:,0]
    return result1


#%%数字基础1-4
data1_all = abs(data.iloc[:,[1,2,3,4]])
w = entropyWeight(data1_all)
w
defen1 = jiaquan(data1_all,w)


#%%数字创新5-8
data2_all = abs(data.iloc[:,[5,6,7,8]])
w = entropyWeight(data2_all)
w
defen2 = jiaquan(data2_all,w)


#%%数字交易9-11
data3_all = abs(data.iloc[:,[9,10,11]])
w =  entropyWeight(data3_all)
w
defen3 = jiaquan(data3_all,w)


#%%数字治理
data4_all = abs(data.iloc[:,[12,13,14]])
w = entropyWeight(data4_all)
w
defen4 = jiaquan(data4_all,w)


#%%
shuzijingjiguimo = data.iloc[:,0]
defenshuzijingji = shuzijingjiguimo

data0000 =  pd.read_excel(r'E:\文件\AAA论文2.0\数据7\序号和年份.xlsx')
data0000 = data0000.iloc[a:,:].reset_index(drop=True)
xvhao = data0000['序号']
nianfen = data0000['年份']
wshuzijingji = data0000['w*数字经济基期标准化矩阵标准化']
wx1 = data0000['wx1']
wx2 = data0000['wx2']
wx3 = data0000['wx3']
wx4 = data0000['wx4']

defen = pd.concat([xvhao,nianfen,defenshuzijingji,defen1,defen2,defen3,defen4,wshuzijingji,wx1,wx2,wx3,wx4],axis = 1)
defen.columns = ['序号','年份','数字经济规模','数字基础','数字创新','数字交易','数字治理','w数字经济规模','wx1','wx2','wx3','wx4']

defen.to_excel('E:\文件\AAA论文2.0\数据7\各省面板综合评价空间面板半参数.xlsx',index = False)


#%%
#散点图矩阵
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
from sklearn import metrics
import seaborn as sns

data_plot = pd.read_excel(r"E:\文件\AAA论文2.0\数据7\各省面板综合评价空间面板半参数.xlsx")
data_plot1 = data_plot.iloc[:,2:-5]
#散点图矩阵
pd.plotting.scatter_matrix(data_plot1,figsize = (8,8))
plt.show()











