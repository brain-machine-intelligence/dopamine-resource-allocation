% para = [0.5; 0.005; 0.9; 500; 15; 13; 2];  <= same as TD.m
% tau = softmax temperature; 
% block = [block length, total block numbers, Rw prob of left arm, Rw prob
% of right arm] 
% s = eta in eq 9
%

function [acqPE, behav, prewtest, lr] = TD_block (para, tau, block, s, display_mod);

lambda = para(1);
alpha = para(2);
gamma = para(3);
numTrial = block(1)*block(2);
trleng = para(5);
USt = para(6);
ass = para(7); % Distinguished sensory stim -> Associability, Saliency

CSt = 3:12;
cue = [1 6]; % 1st and 6th CS are experimental cues, at time 3 and 8

% x(t) is a state vector, not CS timing vector 
x = zeros(trleng, trleng, length(CSt)); 
for i=1:length(CSt)
    temp = zeros(trleng, trleng);
    temp(CSt(i):trleng,CSt(i):trleng) = diag(ones(1,trleng-CSt(i)+1)); % CS at CSt
    x(:,:,i) = temp;
end

% r(t) is a scalar,
r = zeros(1, trleng);
r(USt) = 1; % US at USt
Rw=[]; behav=[]; v=[]; Qall=[];

%initialize
clear pe vp v el w  
% prevw = zeros(1,trleng, length(CSt)); w=[];
prewc = zeros(15, 6); % weight center
prewr = zeros(15, 4); prewl = zeros(15,4); % weight right left 
prew=[]; %w(t-1)
choice = 0; QL=0; QR=0; 
% tau = 10; % softmax action selection, large tau means greedy actions, small(<1) tau indicates exploration   
% leftP = 0.9; rightP =0.1; 
prewtest=[]; lr=[];
surp = 1;

% TD learning
for n=1:numTrial
    choice = actionSelectQ(QL, QR, tau); % left 1 right 2
    behav(n,1) = choice; 
    if choice==1
        prew = [prewc prewl];
    elseif choice==2
        prew = [prewc prewr];
    end
    prewtest(n,1,:,:) = prew; 
        
    vp(n,1)=0;
    v(n,1)=0;
    % initialize eligibiiity trace vector el(t)
    el = zeros(1, trleng, length(CSt));
    
    lr(n,1) = surp;
    
    for t=2:trleng
        for i = 1: length(CSt)
            vp(n,t,i) = dot(x(t,:,i), prew(:,i));         
        end
        prewtest(n,t,:,:) = prew; 
        v(n,t)= sum(vp(n,t,:));

        % prediction error = pe
        reward = r(t);
        if t==13
            [reward] = modelQ_block(choice,n,block); 
            Rw(n) = reward;
        end 
        
        pe(n,t) = reward + gamma * v(n,t) - v(n,t-1);      
        
        if t==13
            peRw = pe(n,t); 
        end
        
        if pe(n,t) < -0.1
            pe(n,t) = -0.1;
        end     
                
        oldel = el;
        el = lambda * oldel + x(t,:,:);

        dw = alpha * pe(n,t) * oldel * surp;         
        dw(:,:,cue) = dw(:,:,cue) * ass; 

        for i = 1: length(CSt)
            w(:,i) = prew(:,i)' + dw(:,:,i);
        end        
        prew = w;
    end    
    
      
    prewc = w(:,1:6);
    if choice==1
        prewl = w(:,7:10); QL = v(n,12); 
    elseif choice==2
        prewr = w(:,7:10); QR = v(n,12); 
    end
    Qall(n,:) = [QL QR];   
  
    surp = s * abs(peRw) + (1-s)*surp;      
end


behav = [Rw' behav Qall];
% w_pre = w(numTrial,trleng,:,:); 
acqPE = pe;

if (display_mod==1)    
    figure(1); subplot(1,2,1); plot(1:block(1)*block(2), smooth(behav(:,1), 5)); 
    subplot(1,2,2); plot(1:block(1)*block(2), smooth(behav(:,2), 5)); 
    
    figure(2); clf; plot(1:block(1)*block(2), behav(:,3), 'r'); hold on; 
    plot(1:block(1)*block(2), behav(:,4), 'k'); hold off; 
%     
    figure(3);clf; 
    surf(acqPE); 
    
    figure(4); clf; 
    surf(acqPE(1:block(1)*2, :,:))
    
    figure(5); clf; 
    plot(1:block(1)*block(2), acqPE(:,3))
end

end


