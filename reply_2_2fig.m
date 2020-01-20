function [t, erate, lrate] = reply_2_2fig(emlraw, fdcell, psthT)


startT = psthT(1);
endT = psthT(2);
bin = psthT(3); 
slidewin = psthT(4); 
zeroPt = psthT(5); 


eml={}; cellist = fdcell; 
for c=1:length(cellist)
    i = cellist(c); 
    spmtx = emlraw{i,1}.early.spmtx;
    meanc = emlraw{i,1}.early.meanc;
    [temp] = cellPSTH (spmtx, startT, endT, bin, slidewin, meanc);    
    eml{i,1}.early =  mean(temp);     
    
    spmtx = emlraw{i,1}.late.spmtx;
    meanc = emlraw{i,1}.late.meanc;
    [temp] = cellPSTH (spmtx, startT, endT, bin, slidewin, meanc);    
    eml{i,1}.late =  mean(temp);
end

erate= []; lrate =[];
for c=1:length (cellist)
    i = cellist(c); 
    erate = [erate; eml{i,1}.early]; 
    lrate = [lrate; eml{i,1}.late];
end 
t = startT:slidewin:endT; 
t= t/10 - zeroPt;      