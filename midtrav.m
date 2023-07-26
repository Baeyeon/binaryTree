%(y,x) : position of current node
%(sy,sx1): position of left son
%(sy,sx2): position of right son
%(py,px1)/(py,px2): position of father
% pos: position of current node
% sign: current recoring matrix
% tre : postion of next node
% sig : new recording matrix

function [tre,sig]=midtrav(pos,sign)
global col row counter mx
sig=sign;
y=pos(1,1);
x=pos(1,2);
d=col+1;
width=d/2^(1+pos(1,1));
sy=pos(1,1)+1;
sx1=pos(1,2)-width;
sx2=pos(1,2)+width;

py=pos(1,1)-1;
px1=pos(1,2)+d/2^(pos(1,1));
px2=pos(1,2)-d/2^(pos(1,1));

% go to the left son
if((sy>=1)&&(sy<=row)&&mx(sy,sx1)==1&&sign(sy,sx1)==1)
    tre=[sy,sx1];
    midtrav(tre,sign);
    return
end

if(sign(y,x)==1)
plot(x,row-y,'Marker','.','Markersize',30,'MarkerFaceColor','k','MarkerEdgeColor','k');
q=num2str(counter);
text(x,row-y-0.15*row,q);
counter = counter + 1;
pause(1.5);
sign(y,x)=0;
sig=sign;
end

% go to the right son
if((sy>=1)&&(sy<=row)&&mx(sy,sx2)==1&&sign(sy,sx2)==1)
    tre=[sy,sx2];
    midtrav(tre,sign);
    return
end

% back to parent
if((py>=1)&&(px1<=col)&&mx(py,px1)==1)
        tre=[py,px1];
        midtrav(tre,sign);
        return
end
if ((py>=1)&&(px1<=col)&&mx(py,px1)==0)
        tre=[py,px2];
        midtrav(tre,sign);
        return
end
return