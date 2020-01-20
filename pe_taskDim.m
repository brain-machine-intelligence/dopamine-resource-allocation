function [etd] = pe_taskDim (acqPE, x, pethr); 

etd=[];
for i=1:x
    etd(i) = length(find(acqPE(i,:) > pethr));
end 

