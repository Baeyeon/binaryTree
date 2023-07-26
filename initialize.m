function []=initialize()%画图函数
global mx row col
cnt=0;     % cnt use for label nodes from 'A' to '...'

%遍历画出实心点
 for i = 1:row    
     for j = 1:col
         hold on;
         if (mx(i,j) == 1)%如果有结点
            plot(j,row-i,'Marker','.','Markersize',30,'MarkerFaceColor','c','MarkerEdgeColor','c'); 
            text(j,row-i-0.05*row,char('A'+cnt)); 
            cnt = cnt + 1;
         end
     end
 end

 ylim([-1,row]);    %确定画图边界
 
 
 %遍历画出点间连线
 d = col + 1;
 for i = 1:row-1  
    d = d / 2;
     for j = 1:col
         if (mx(i,j) == 1)  %如果有结点
             for k = 1:col
                 if ((mx(i+1,k) == 1) && (abs(k - j) <= floor(d/2)))
                     hold on;
                     plot([j,k],[row-i,row-(i+1)],'-c','Linewidth',2.5);   
                 end
             end
         end
     end 
 end
 
 return