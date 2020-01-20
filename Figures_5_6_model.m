para = [0.5; 0.005; 0.9; 500; 15; 13; 2];  
tau = 3; 
s = 0.9;
block = [100 20 1 0]; 
[acqPE, behav, prewtest, lr] = TD_block(para, tau, block, s, 0);
% The simulation results used to make Fig 5 were obtained from the above 
% code and is saved in Fig5model.mat.


n=3; % first 3 trials, last 3 trials from each block 
fth =  1; 
lbth = 6;  
fCS1 = []; fCS2 = []; fR1 = []; fR2=[]; 
lCS1 = []; lCS2 = []; lR1 = []; lR2=[]; 
for i=1:5
    % first 5 blocks; 
    % 1 for first 3 trials, 2 for last 3 trials 
    [CS1, CS2, R1, R2] = block_CSR12(acqPE, block, fth+i, n);
    fCS1 = [fCS1; CS1]; 
    fCS2 = [fCS2; CS2]; 
    fR1 = [fR1; R1]; 
    fR2 = [fR2; R2]; 
    
    % last 5 blocks
    [CS1, CS2, R1, R2] = block_CSR12(acqPE, block, lbth+i, n);
    lCS1 = [lCS1; CS1]; 
    lCS2 = [lCS2; CS2]; 
    lR1 = [lR1; R1]; 
    lR2 = [lR2; R2]; 
end 

tcs = (1:8)-3; 
tr = (8:15)-13; 

% left: Fig 5, right: Fig 6
figure(5); 
subplot(4,2,1); plot(tcs, mean(fCS1(:,1:8)), 'b', tcs, mean(fCS2(:,1:8)), 'k'); xlim([-2 5]); ylim([-0.02 0.15]); 
subplot(4,2,2); plot(tr, mean(fR1(:,8:15)), 'b', tr, mean(fR2(:,8:15)), 'k'); xlim([-5 2]); ylim([-0.02 0.24]); 
subplot(4,2,3); plot(tcs, mean(lCS1(:,1:8)), 'r', tcs, mean(lCS2(:,1:8)), 'k'); xlim([-2 5]); ylim([-0.02 0.34]); 
subplot(4,2,4); plot(tr, mean(lR1(:,8:15)), 'r', tr, mean(lR2(:,8:15)), 'k'); xlim([-5 2]); ylim([-0.02 0.15]);

subplot(4,2,5); plot(tcs, mean(fCS1(:,1:8)), 'b', tcs, mean(lCS1(:,1:8)), 'k'); xlim([-2 5]); ylim([-0.02 0.34]);
subplot(4,2,6); plot(tr, mean(fR1(:,8:15)), 'b', tr, mean(lR1(:,8:15)), 'k'); xlim([-5 2]);  ylim([-0.02 0.24]);
subplot(4,2,7); plot(tcs, mean(fCS2(:,1:8)), 'r', tcs, mean(lCS2(:,1:8)), 'k'); xlim([-2 5]); ylim([-0.02 0.34]);
subplot(4,2,8); plot(tr, mean(fR2(:,8:15)), 'r', tr, mean(lR2(:,8:15)), 'k'); xlim([-5 2]); ylim([-0.02 0.12]);

