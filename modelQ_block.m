% return reward given choice, n-th trial, and block
%
% block = [block length, total block numbers, Rw prob of left arm, Rw prob
% of right arm]

function [r] = modelQ_block(choice,n,block)

p = [];

if mod(ceil(n/block(1)), 2)==1 % left Rw P high block 
    p = [block(3) block(4)]; 
elseif mod(ceil(n/block(1)), 2)==0 % right Rw P high block 
    p = [block(4) block(3)]; 
end 

rw = rand(1,1); 
r = 0; 

if rw < p(choice)
    r = 1; 
end