% same as TD but it changes the value of reward following nlast-th trial
% includes random initial weights 

function [acqPE] = TD_2R (para, r_size, randini, nlast)

lambda = para(1);
alpha = para(2);
gamma = para(3);
numTrial = para(4);
trleng = para(5);
USt = para(6);
ass = para(7); % Distinguished sensory stim -> Associability, Arousal

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

%initialize
clear pe predp pred el wp  
prevwp = randini* rand(1,trleng, length(CSt));

% TD learning
for n=1:numTrial
    if n==1
        wp(n,1,1:trleng, 1:length(CSt)) = prevwp; % only for first time of first trial
    else
        wp(n,1,:,:) = wp(n-1,trleng,:,:);
    end
    predp(n,1)=0;
    pred(n,1)=0;

    % initialize eligibiiity trace vector el(t)
    el = zeros(1, trleng, length(CSt));
    
    for t=2:trleng
        for i = 1: length(CSt)
            predp(n,t,i) = dot(x(t,:,i), squeeze(wp(n,t-1,:,i)));            
        end
        pred(n,t)= sum(predp(n,t,:));

        % prediction error = pe
        reward = r(t);
        if n > nlast
            reward = r(t)*r_size; 
        end
        
        pe(n,t) = reward + gamma * pred(n,t) - pred(n,t-1);
        
        if pe(n,t) < -0.01
            pe(n,t) = -0.01;
        end
        
        oldel = el;
        el = lambda * oldel + x(t,:,:);

        dwp = alpha * pe(n,t) * oldel;         
        dwp(:,:,cue) = dwp(:,:,cue) * ass; 

        for i = 1: length(CSt)
            wp(n,t,:,i) = squeeze(wp(n,t-1,:,i))' + dwp(:,:,i);
        end
            
    end    
end

acqPE = pe;
end


