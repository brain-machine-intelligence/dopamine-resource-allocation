function [action_idx] = actionSelectQ(Q1, Q2, tau)

p1 = exp(tau * Q1); 
p2 = exp(tau * Q2); 

choose = rand(1,1); 
if choose < p1/(p1+p2)
    action_idx = 1;
else 
    action_idx = 2; 
end
