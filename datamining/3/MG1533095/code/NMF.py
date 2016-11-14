from __future__ import division
from numpy import *

def loadDataSet(fileName):
    #�������ݼ�
    dataMat = []
    label = []
    fr = open(fileName)
    for line in fr:
        line = line.split(',')
        data = [float(i) for i in line[:-1]]
        dataMat.append(data)
        label.append(int(line[-1]))
    fr.close()
    return array(dataMat), array(label)

def dist(vecA, vecB):
    #��ŷ�Ͼ����ƽ����Ϊ���������ж���
    return sum(power(vecA - vecB, 2))

def init(m, n, k):
    #��ʼ�����������U�����V����
    U = random.rand(m,k)
    VT = random.rand(k,n)
    return U, VT

def update(dataSet, U, VT):
    #����U�����V�����Ԫ�ص�ֵ
    V = transpose(VT)
    UT = transpose(U)
    dataSetT = transpose(dataSet)
    X_V = dot(dataSet, V)
    U_VT_V = dot(dot(U, VT) ,V)
    index = nonzero(U_VT_V == 0)
    U_VT_V[index[0], index[1]] = 1e-10  #��һ����С��ֵ����ʾ0�����ⷢ������Ϊ0�����
    XT_U = dot(dataSetT, U)
    V_UT_U = dot(dot(V, UT), U)
    index = nonzero(V_UT_U == 0)
    V_UT_U[index[0], index[1]] = 1e-10
    U = X_V/U_VT_V*U
    V = XT_U/V_UT_U*V
    VT = transpose(V)
    return U, VT

def NMF(fileName, k):
    #NMF�㷨
    dataSet, label = loadDataSet(fileName)
    dataSet = transpose(dataSet)
    m, n = dataSet.shape
    U, VT = init(m, n, k)
    clusterResult = zeros((n,1))
    changed = True
    while changed:
        changed = False
        U, VT = update(dataSet, U, VT)
        index = argsort(VT, axis=0)
        for i in range(n):
            id = index[:, i][-1]
            if clusterResult[i,0] != id:
                changed = True
                clusterResult[i,0] = id
    SSE = sum(power(dataSet - dot(U, VT), 2))
    return clusterResult, label, SSE

def formConMat(clusterResult, label, k):
    #����ģ������
    conMat = zeros((k,k))
    L = label.copy()
    L = list(set(L))
    for i in range(k):
        for j in range(k):
            dataLabel = label[nonzero(clusterResult[:,0] == j)[0]]
            dataLabel = list(dataLabel)
            conMat[i,j] = dataLabel.count(L[i])
    return conMat

def purityCal(conMat):
    #����purity
    P = amax(conMat, axis=0)
    purity = sum(P)/sum(conMat)
    return purity

def giniCal(conMat):
    #����gini index
    M = sum(conMat,axis=0)
    n = conMat.shape[1]
    G = zeros((1,n))
    for j in range(n):
        G[0,j] = 1-sum(power(conMat[:,j]/M[j],2))
    giniAve = sum(G*M)/sum(M)
    return giniAve

def main():
    #�����򣬵���NMF�㷨
    k = [2,10]
    fileName = ["german.txt","mnist.txt"]
    for i in range(len(k)):
        SSE = inf
        clusterResult = array([])
        label = array([])
        for j in range(10):
            clusterResultTemp, labelTemp, SSEj = NMF(fileName[i], k[i])
            if(SSEj<SSE):
                SSE=SSEj
                clusterResult = clusterResultTemp
                label = labelTemp
        conMat = formConMat(clusterResult, label, k[i])
        purity = purityCal(conMat)
        gini = giniCal(conMat)
        print(fileName[i],":")
        print("SSE:",SSE)
        print("purity:",purity)
        print("gini:",gini)
        print(conMat)

main()













