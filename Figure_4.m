%% Figure 4

para = [0.5; 0.005; 0.9; 700; 15; 13; 2];
[acqPE0] = TD(para, 0);
x = min(find(acqPE0(:,3)>0.3));
y = x*0.3; % <= trial following which reward doubled 

[acqPE] = TD_2R(para, 2, 0, y); % <= reward doubled following trial y 
k = 1:15; c = [1 1 1]; 
figure(2); clf;
plot(k,acqPE(round(y+x*0.01),:), 'Color', 0.6*c, 'LineWidth', 0.75); xlim([1 15]);hold on; 
plot(k,acqPE(round(y+x*0.05),:), 'Color', 0.4*c, 'LineWidth', 0.75); xlim([1 15]);hold on; 
plot(k,acqPE(round(y+x*0.1),:), 'Color', 0.2*c, 'LineWidth', 0.75); xlim([1 15]);hold on; 
plot(k,acqPE(round(y+x*0.3),:), 'Color', 0*c, 'LineWidth', 0.75); xlim([1 15]);hold off; 
xlim([1 15]); xticks([1 5 10 15]); 

figure(1); 
plot(k, acqPE0(round(y),:), 'k', 'LineWidth', 0.75); xlim([1 15]);hold on; 
plot(k, acqPE(round(y+x*0.1),:), 'b', 'LineWidth', 0.75); 
xlim([1 15]); xticks([1 5 10 15]); 
a=[1 1]; b=[0 0.12]; plot (a*3, b, 'k', a*8, b, 'k'); hold off; 

