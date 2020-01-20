%% Figure 1A 
figure(1); clf; 
t=1:31; t = (t-1)/10; 
n1 = ones(31,1)*9; 
n2 = exp(2-t)+1 + rand(1,31); 
n3 = ones(31,1); 

plot(t,n1, 'k', t,n2, 'b', t, n3', 'r'); 
ylim([0 10]);


%% Figure 1E

% para = [el trace, learning rate, discounting factor, numTrial, trleng, USt, saliency of exp stim];
% 0.3 is the threshold for learning termination 

% Figure 1 is model 
para = [0.5; 0.005; 0.9; 500; 15; 13; 2];   % same as for howe 2013
[acqPE] = TD(para, 0);
x = min(find(acqPE(:,3)>0.3));

% early 
ex = round(x*0.1); 
para = [0.5; 0.005; 0.9; ex; 15; 13; 2]; 
[PEe, we] = TD_weight(para);
tDime = length(find(PEe(length(PEe),:) > 0.01))

% late
lx = round(x*0.8); 
para = [0.5; 0.005; 0.9; lx; 15; 13; 2]; 
[PEl, wl] = TD_weight(para);
tDiml = length(find(PEl(length(PEl),:) > 0.01))

% bottom plot
hold off; clf; figure(2); 
subplot(1,2,1); heatmap(we); caxis([0 0.3]); 
subplot(1,2,2); heatmap(wl); caxis([0 0.3]);
 
% top plot
figure(3); subplot(1,2,1); 
yyaxis left  
bar(1:10, sum(we)); ylim([0 2.5]);
yyaxis right 
plot(1:10, PEe(ex,3:12)); 
ts = ['Effective task dimensionality = ' num2str(tDime)]; 
title(ts);

subplot(1,2,2); 
yyaxis left  
bar(1:10, sum(wl)); ylim([0 2.5]);
yyaxis right 
plot(1:10, PEl(lx,3:12)); ylim([0 0.3])
ts = ['Effective task dimensionality = ' num2str(tDiml)]; 
title(ts);

