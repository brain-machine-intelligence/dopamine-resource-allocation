para = [0.5; 0.005; 0.9; 500; 15; 13; 2];  
tau = 3; 
s = 0.9;
block = [100 20 1 0]; 
[acqPE, behav, prewtest, lr] = TD_block(para, tau, block, s, 0);


load('MyColormap.mat');
pos = find(acqPE(:,13)>0);
per = acqPE(pos,:); 
k=1:length(pos); 
figure (1); imagesc(per(1:400, :));  colormap(mymap); colorbar;
xticks([1 5 10 15]); 
