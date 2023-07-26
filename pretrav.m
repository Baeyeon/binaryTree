%(y,x) : position of current node
%(sy,sx1): position of left son
%(sy,sx2): position of right son
%(py,px1)/(py,px2): position of father
% pos: position of current node
% sign: current recoring matrix
% tre : postion of next node    待遍历的下一个结点
% sig : new recording matrix    遍历返回后的sign值

function [tre,sig]=pretrav(pos,sign)
global col row mx counter 
sig=sign;
y=pos(1,1); 
x=pos(1,2); 
d=col+1;    
width=d/2^(1+pos(1,1)); %父结点和其子结点横向间距
sy=pos(1,1)+1;  %子结点所在行数
sx1=pos(1,2)-width;
sx2=pos(1,2)+width;

py=pos(1,1)-1;  %父结点所在行数
px1=pos(1,2)+d/2^(pos(1,1)); %父结点可能所在列数
px2=pos(1,2)-d/2^(pos(1,1)); %父结点可能所在列数

if(sign(y,x)==1)   
plot(x,row-y,'Marker','.','Markersize',30,'MarkerFaceColor','k','MarkerEdgeColor','k');%给结点涂色
q=num2str(counter);     
text(x,row-y-0.12*row,q);    
counter = counter + 1;
pause(1.5);
sign(y,x)=0;
sig=sign;
end

% go to the left son
if((sy>=1)&&(sy<=row)&&mx(sy,sx1)==1&&sign(sy,sx1)==1)  %判断边界的限制
    tre=[sy,sx1];   %下一检索的位置
    pretrav(tre,sign);
    return
end


% go to the right son
if((sy>=1)&&(sy<=row)&&mx(sy,sx2)==1&&sign(sy,sx2)==1)
    tre=[sy,sx2];
    pretrav(tre,sign);
    return
end

% back to parent
if((py>=1)&&(px1<=col)&&mx(py,px1)==1)
        tre=[py,px1];
        pretrav(tre,sign);
        return
end
if ((py>=1)&&(px1<=col)&&mx(py,px1)==0)
        tre=[py,px2];
        pretrav(tre,sign);
        return
end
return