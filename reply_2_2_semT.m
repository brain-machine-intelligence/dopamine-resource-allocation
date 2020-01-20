function [esem, lsem, star] = reply_2_2_semT(erate, lrate, t, ttype);

esem = std(erate)/(2*length(erate)^0.5);
lsem = std(lrate)/(2*length(lrate)^0.5);

tpval=[];
for i=1:length(t)
    if ttype==1
        [v, tpval(1,i)] = ttest(erate(:,i),lrate(:,i)); 
    elseif ttype==2
        [v, tpval(1,i)] = ttest2(erate(:,i),lrate(:,i)); 
    end    
end 
star = find(tpval(1,:)<0.05); 