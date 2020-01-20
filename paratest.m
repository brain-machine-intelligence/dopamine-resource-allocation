function [acqData] = paratest(parael) % no bound 

acqData ={};

for i=1:3    
    paras = parael{i}; 
    
    para = paras(1,:);
    [acqPE1] = TD(para, 0); acqData{i,1} = acqPE1;
    
    para = paras(2,:);
    [acqPE2] = TD(para, 0); acqData{i,2} = acqPE2;
    
    para = paras(3,:);
    [acqPE3] = TD(para, 0); acqData{i,3} = acqPE3;           
end
