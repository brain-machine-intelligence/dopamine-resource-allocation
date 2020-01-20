%% Suppl Fig. A. 2

para = [0.9; 0.005; 0.5; 100; 15; 13; 2];
[acqPE] = TD_noBound (para, 0);
c = [1 1 1]; 

k=1:15; figure(6); clf; 
plot(k,acqPE(30,:), 'Color', c*0.6, 'LineWidth', 1.5); xlim([1 15]);hold on; 
plot(k,acqPE(60,:), 'Color', c*0.3, 'LineWidth', 1.5); hold on; 
plot(k,acqPE(90,:), 'Color', c*0, 'LineWidth', 1.5); hold off;

