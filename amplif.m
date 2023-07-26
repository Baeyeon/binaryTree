%signal amplifier+
%每个圆圈里面的值表示最大损耗量；从下往上算；超过的话加个Amplifier；

function [tre,sig]=amplif(pos,sign) %amplif函数：放大器里面的后序遍历
global col mx row
global degradeToLeaf degradefromParent %degradeToLeaf记录这个点的最大损失值; degradefromParent记录其父结点到当前结点的损失值
global threshold
global amplifier

%定义子结点的位置
sig=sign;
y=pos(1,1);
x=pos(1,2);
d=col+1;
width=d/2^(1+pos(1,1));
sy=pos(1,1)+1;
sx1=pos(1,2)-width;
sx2=pos(1,2)+width;
%定义父结点的位置
py=pos(1,1)-1;
px1=pos(1,2)+d/2^(pos(1,1));
px2=pos(1,2)-d/2^(pos(1,1));

%后序遍历计算最大衰减量
%左节点
if((sy>=1)&&(sy<=row)&&mx(sy,sx1)==1&&sign(sy,sx1)==1)
    tre=[sy,sx1];
    amplif(tre,sign);
    return
end

%右节点
if((sy>=1)&&(sy<=row)&&mx(sy,sx2)==1&&sign(sy,sx2)==1)
    tre=[sy,sx2];
    amplif(tre,sign);
    return
end

%根结点
if(sign(y,x)==1)    %未被遍历
sign(y,x)=0;
sig=sign;
  if(y==row)    %叶结点 degradeToLeaf=0
    degradeToLeaf(y,x)=0;   
  end
  if(y<row)     %非叶结点
      %左儿子
    if ((degradeToLeaf(sy,sx1)+degradefromParent(sy,sx1))>threshold) %若大于阈值，当前结点最大衰减量=子结点最大衰减量
    v1=degradefromParent(sy,sx1);   
    amplifier(sy,sx1)=1;        %放置放大器
    else
    v1=(degradeToLeaf(sy,sx1)+degradefromParent(sy,sx1)); %若符合阈值范围，当前结点最大衰减量=子结点最大衰减量+当前结点到子结点衰减量
    end
      %右儿子
    if ((degradeToLeaf(sy,sx2)+degradefromParent(sy,sx2))>threshold)
    v2=degradefromParent(sy,sx2);
    amplifier(sy,sx2)=1;
    else
    v2=(degradeToLeaf(sy,sx2)+degradefromParent(sy,sx2));
    end
    if((mx(sy,sx1)==1)&&(mx(sy,sx2)==1))    %同时存在左右儿子，比较后取较大值作为最大衰减量
    degradeToLeaf(y,x)=max(v1,v2);  
    end
    if((mx(sy,sx1)==1)&&(mx(sy,sx2)==0))
    degradeToLeaf(y,x)=v1;
    end
    if((mx(sy,sx1)==0)&&(mx(sy,sx2)==1))
    degradeToLeaf(y,x)=v2;
    end
  end
end

%最少：从底层开始算，超过阈值加一个，没有多加任何东西；画图计算机变成矩阵——>直接变成矩阵
%？？？？？
if((py>=1)&&(px1<=31)&&mx(py,px1)==1)
        tre=[py,px1];
        amplif(tre,sign);
        return
end
if ((py>=1)&&(px2<=31)&&mx(py,px2)==1)
        tre=[py,px2];
        amplif(tre,sign);
        return
end
