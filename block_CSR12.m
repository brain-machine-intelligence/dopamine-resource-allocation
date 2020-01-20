% return first n and last n responses to CS and R in bth block 
%
% acqPE: acqPE from TD_block 
% block = [block length, total block numbers, Rw prob of left arm, Rw prob
% of right arm] 
% bth: bth-th (block)
% n: first n trials, last n trials from each block 


function [CS1, CS2, R1, R2] = block_CSR12 (acqPE, block, bth, n)

fb = (1:block(1)) + block(1)*(bth-1);   % trials of bth-th block 

fblock = acqPE(fb, :); 
fblockR = find(fblock(:,13)>0);  % rewarded trials 
fblockR = fblock(fblockR,:);

fnRw = length(fblockR); 
CS1 = fblock((1:n),:);  % first n responses to CS 
CS2 = fblock((block(1) - n+1):block(1), :);   % last n responses to CS 
R1 = fblockR((1:n),:);   % first n responses to Rw
R2 = fblockR((fnRw - n+1):fnRw, :);   % last n responses to Rw
end 

