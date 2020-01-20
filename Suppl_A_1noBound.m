% Supplementary Fig.A.1 no Bound for negative PE


% Figure 2ACE

para = [0.1; 0.005; 0.9; 700; 15; 13; 2];
[acqPE1] = TD_noBound (para, 0);
x1 = min(find(acqPE1(:,3)>0.3));

para = [0.5; 0.005; 0.9; 700; 15; 13; 2];
[acqPE2] = TD_noBound (para, 0);
x2 = min(find(acqPE2(:,3)>0.3));

para = [0.9; 0.005; 0.9; 700; 15; 13; 2];
[acqPE3] = TD_noBound (para, 0);
x3 = min(find(acqPE3(:,3)>0.3));

figure(1); clf; load('MyColormap.mat');
subplot(2,3,1); imagesc(acqPE1(1:x1, :));  colormap(mymap); colorbar;
xticks([1 5 10 15]); yticks([0 x1*0.2 x1*0.4 x1*0.6 x1*0.8 x1]);
yticklabels({'0', '20', '40', '60', '80', '100'});

subplot(2,3,2); imagesc(acqPE2(1:x2, :));  colormap(mymap); colorbar;
xticks([1 5 10 15]); yticks([0 x2*0.2 x2*0.4 x2*0.6 x2*0.8 x2]);
yticklabels({'0', '20', '40', '60', '80', '100'});

subplot(2,3,3); imagesc(acqPE3(1:x3, :)); colormap(mymap); colorbar;
xticks([1 5 10 15]); yticks([0 x3*0.2 x3*0.4 x3*0.6 x3*0.8 x3]);
yticklabels({'0', '20', '40', '60', '80', '100'});


k = 1:15;
subplot(2,3,4); 
plot(k,acqPE1(round(x1*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1.5); 
xlim([1 15]); xticks([1 5 10 15]); ylim([0 0.35]); hold on; 
plot(k,acqPE1(round(x1*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1.5); hold on; 
plot(k,acqPE1(round(x1*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.5); hold off;

subplot(2,3,5); 
plot(k,acqPE2(round(x2*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1.5); 
xlim([1 15]); xticks([1 5 10 15]); hold on; 
plot(k,acqPE2(round(x2*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1.5); hold on; 
plot(k,acqPE2(round(x2*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.5); hold off;
legend('Early', 'Middle', 'Late'); 

subplot(2,3,6); 
plot(k,acqPE3(round(x3*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1.5); 
xlim([1 15]); xticks([1 5 10 15]); hold on; 
plot(k,acqPE3(round(x3*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1.5); hold on; 
plot(k,acqPE3(round(x3*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.5); hold off;


%% Figure 2B
para = [0.9; 0.005; 0.9; 500; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0);
x = min(find(acqPE(:,3)>0.3));

% early 
k=1:15;
para = [0.9; 0.005; 0.9; round(x*0.1); 15; 13; 2]; 
[acqPE] = TD_noCS2_noBound (para, round(x*0.1));
acqPEno2 = acqPE;

para = [0.9; 0.005; 0.9; 500; 15; 13; 2];
[acqPE] = TD_noBound(para,0);
acqPE2 = acqPE;

% late
para = [0.9; 0.005; 0.9; round(x*0.8); 15; 13; 2]; 
[acqPE] = TD_noCS2_noBound (para, round(x*0.8));
acqPEno2late = acqPE;

figure(2); clf;
subplot(2,1,1); plot(k, acqPEno2(round(x*0.1),:), '--k', k, acqPE2(round(x*0.1),:), '-k', 'LineWidth', 1.5); 
xlim([1 15]); xticks([1 5 10 15]); ylim([-0.2 0.5]); hold on; 
plot ([1 5 15], [0 0 0], 'k'); 
subplot(2,1,2); plot(k, acqPEno2late(round(x*0.8),:), '--k', k, acqPE2(round(x*0.8),:), '-k', 'LineWidth', 1.5);
xlim([1 15]); xticks([1 5 10 15]); ylim([-0.2 0.5]); hold on; 
plot ([1 5 15], [0 0 0], 'k'); 


%% Figure 2E

para = [0.5; 0.005; 0.9; 500; 15; 13; 2];
[acqPE] = TD_noBound (para,0);
x = min(find(acqPE(:,3)>0.3)); cTrial = round(x*0.1);

figure(3);  clf; load('MyColormap.mat');
subplot(2,1,1); imagesc(acqPE(1:x, :));  colormap(mymap); colorbar;
xticks([1 5 10 15]); yticks([0 x*0.2 x*0.4 x*0.6 x*0.8 x]);
yticklabels({'0', '20', '40', '60', '80', '100'});

aa = []; yy = [];
for i=1:100
    [a] = TD_varRw_noBound(para, 0, cTrial, 0.02); aa = [aa; a]; % noRw
    [y] = TD_varRw_noBound(para, 1, cTrial, 0.02); yy = [yy; y];
end

subplot(2,1,2); k = 1:15; 
shadedErrorBar(k,mean(aa,1), std(aa), 'lineprops', 'r') ; hold  on; 
shadedErrorBar(k,mean(yy,1), std(yy), 'lineprops', 'b') ; 
ylim([-0.92 0.14]); yticks([-0.92 -0.88 0 0.04 0.08 0.12]);
xlim([1 15]); xticks([1 5 10 15]);
redx = [1 1]; redy = [-1 0.3]; 
% plot(redx*3, redy, 'r', redx*8, redy, 'r', redx*13, redy, 'r');
xlim([1 15]); xticks([1 5 10 15]); hold off; 
breakyaxis([-0.84 -0.02]); hold off; 


%% Figure 2F

para = [0.1; 0.005; 0.9; 600; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0); acqPE1 = acqPE; 
x1 = min(find(acqPE(:,3)>0.3));

para = [0.3; 0.005; 0.9; 600; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0); acqPE3 = acqPE; 
x3 = min(find(acqPE(:,3)>0.3));

para = [0.5; 0.005; 0.9; 600; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0); acqPE5 = acqPE;
x5 = min(find(acqPE(:,3)>0.3));

para = [0.7; 0.005; 0.9; 600; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0); acqPE7 = acqPE;
x7 = min(find(acqPE(:,3)>0.3));

para = [0.9; 0.005; 0.9; 600; 15; 13; 2]; 
[acqPE] = TD_noBound(para, 0); acqPE9 = acqPE;
x9 = min(find(acqPE(:,3)>0.3));

pethr = 0.01; s=20;
[etd1] = pe_taskDim (acqPE1, x1, pethr); 
[etd3] = pe_taskDim (acqPE3, x3, pethr); 
[etd5] = pe_taskDim (acqPE5, x5, pethr); 
[etd7] = pe_taskDim (acqPE7, x7, pethr); 
[etd9] = pe_taskDim (acqPE9, x9, pethr); 

figure(4); clf; hold off; 
plot(1:x1, smooth(etd1, s), 'y'); hold all; 
plot(1:x3, smooth(etd3, s), 'g'); hold all; 
plot(1:x5, smooth(etd5, s), 'b'); hold all; 
plot(1:x7, smooth(etd7, s), 'r'); hold all; 
plot(1:x9, smooth(etd9, s),'k'); hold all; 
legend('0.1', '0.3', '0.5', '0.7', '0.9'); 
xlim([0 x1]); ylim([0 12])


%% Figure 2G

para = [0.5; 0.005; 0.9; 1500; 15; 13; 1];
[acqPE] = TD_2CS_noBound (para,0);
acqPE = acqPE;
x = min(find(acqPE(:,3)>0.3));

figure(5);  clf; load('MyColormap.mat');
subplot(2,1,1); imagesc(acqPE(1:x, :));  colormap(mymap); colorbar;
xticks([1 5 10 15]); yticks([0 x*0.2 x*0.4 x*0.6 x*0.8 x]);
yticklabels({'0', '20', '40', '60', '80', '100'});

subplot(2,1,2); k=1:15;
plot(k,acqPE(round(x*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1.5); hold on; 
plot(k,acqPE(round(x*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.5); hold on;
redx = [1 1]; redy = [0 1]*0.3; 
plot(redx*3, redy, 'r', redx*8, redy, 'r', redx*13, redy, 'r');
xlim([1 15]); xticks([1 5 10 15]); hold off; 





