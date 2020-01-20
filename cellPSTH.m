% psth per cell  
function [temp] = cellPSTH (spmtx, startT, endT, bin, slidewin, meanc)
 
 n = (endT - startT)/slidewin + 1;  
 temp = zeros(length(spmtx),n); 
  
 for i=1:length(spmtx)
    for j=1:n
        winstart = startT + slidewin*(j-1);
        edges = [winstart winstart+bin];
        temp(i,j) = histcounts(spmtx{i,1}, edges); 
    end
 end
 
 temp = temp * 10000/bin - meanc; 
 
        
     
 
 
 