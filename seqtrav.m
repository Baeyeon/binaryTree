function []=seqtrav()
global row col counter
global mx
for i = 1:row
     for j = 1:col
         if (mx(i,j) == 1)
            plot(j,row-i,'Marker','.','Markersize',30,'MarkerFaceColor','k','MarkerEdgeColor','k');
            q=num2str(counter);
            text(j,row-i-0.15*row,q);
            pause(1.5);
            counter = counter + 1;
         end
     end
 end