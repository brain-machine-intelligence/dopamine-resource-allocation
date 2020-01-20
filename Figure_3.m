%% Figure 3A

para = [0.5; 0.005; 0.9; 500; 15; 13; 2];
[acqPE] = TD (para,0);
x = min(find(acqPE(:,3)>0.3)); 
cTrial1 = round(x*0.1)+1;
cTrial2 = round(x*0.8)+1;

aa = []; bb = [];
for i=1:100    
    [a] = TD_varRw(para, 2, cTrial1, 0.02); aa = [aa; a(13)];
    [b] = TD_varRw(para, 2, cTrial2, 0.02); bb = [bb; b(13)];
end

y = [mean(aa) mean(bb)];
yerr = [std(aa) std(aa)]/2;
figure(1); clf; bar(y, 0.6); ylim([0.8 1.2]); hold on; 
errorbar(y, yerr, '.');
[v,p]= ttest(aa, bb)


%% Figure 3C
para = [0.5; 0.005; 0.9; 500; 15; 13; 2]; 
[acqPE] = TD(para,0);
x = min(find(acqPE(:,3)>0.3));
figure(2); k = 1:15; c = [1 1 1];
plot(k,acqPE(round(x*0.01),:), 'Color', c*0.7, 'LineWidth', 1.5); xlim([1 15]); hold on; 
plot(k,acqPE(round(x*0.05),:), 'Color', c*0.6, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.1),:), 'Color', c*0.5, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.2),:), 'Color', c*0.4, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.3),:), 'Color', c*0.3, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.4),:), 'Color', c*0.2, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.6),:), 'Color', c*0.1, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.8),:), 'Color', c*0, 'LineWidth', 1.5); hold on; 
xlim([1 15]); xticks([1 5 10 15]); 


%% Figure 3D
para = [0.5; 0.005; 0.9; 500; 15; 13; 2]; 
[acqPE] = TD(para,0);
x = min(find(acqPE(:,3)>0.3));
figure(3);  
surf(acqPE(1:x,:));
yticks([0 x*0.2 x*0.4 x*0.6 x*0.8 x]); ylim([0 x]);
yticklabels({'0', '20', '40', '60', '80', '100'});

%% Figure 3E
figure(4); k = (1:15)-3; c = [1 1 1]; 
stairs(k,acqPE(round(x*0.01),:), 'Color', c*0.7, 'LineWidth', 1.5); xlim([1 5.999]-3); ylim([-0.02 0.12]); hold on; 
stairs(k,acqPE(round(x*0.1),:), 'Color', c*0.6, 'LineWidth', 1.5); xlim([1 5.999]-3); hold on; 
stairs(k,acqPE(round(x*0.3),:), 'Color', c*0.3, 'LineWidth', 1.5); xlim([1 5.999]-3); hold on; 
stairs(k,acqPE(round(x*0.4),:), 'Color', c*0, 'LineWidth', 1.5); xlim([1 5.999]-3); hold on; 
a=[0 0]; b=[-0.05 0.28]; plot (a,b, 'k'); hold off; 
