%%
%  mx: considering ploting,use matrix form of binary tree 
%  counter: use for label orders of each node
%  degradefromParent: the same as degradetoleaf defined in textbook
%  degradeToLeaf: the same as degradefromparent defined in textbook
%  amplifier: '1' stand for setting amplifier at this node
%  threshold: tolerencen degradeToLeaf
%  pos: position of current node 
%  sign: matrix for recording whether the node has been traversed  
%  sign: 1 stands for 'haven't been traversed',  0 stands for yes


global mx %创建的树
global row col
global counter
global degradefromParent
global degradeToLeaf
global amplifier
global threshold 

%创建的树，1含该结点，0不含；因为要满足对称性，列数根据行数的多少确定；列数=2^5（行数）-1
%存储为矩阵画图方便
%16+-8；8+-4、24+-4；
mx  = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0];
[row,col] = size(mx);   %求矩阵行列


%% four ways of traversal
%%% preoder
 figure %打开画图窗口
 initialize; %画图函数：利用plot函数画出点和线
 sign=mx;   %遍历过后变成0，没遍历时为1
 pos=[1,(col+1)/2]; 
 counter=1;
 pretrav(pos,sign); %pos表示从哪个点开始遍历
%%% midorder
 figure
 initialize;
 sign=mx;   
 pos=[1,(col+1)/2];
 counter=1;
 midtrav(pos,sign);
%%% postorder
 figure
 initialize;
 sign=mx; 
 pos=[1,(col+1)/2];
 counter=1;
 postrav(pos,sign);
%%% sequential order
 figure
 initialize;
 sign=mx; 
 pos=[1,(col+1)/2];
 counter=1;
 seqtrav;%直接从上到下从左到右遍历，无需（pos，sign）

 
%% amplifer problem

 amplifier=zeros(row,col);  %创建一个全0矩阵
 degradeToLeaf=zeros(row,col);%
 threshold=4;
 degradefromParent  = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 1 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 2 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0];
    
 amplif(pos,sign);