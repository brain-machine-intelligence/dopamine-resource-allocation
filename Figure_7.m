%% Figure 7

para = [0.5; 0.005; 0.9; 500; 15; 13; 2];
[acqPE1] = TD(para, 0); x1 = min(find(acqPE1(:,3)>0.3));

para = [0.5; 0.005; 0.9; 500; 15; 13; 4];
[acqPE2] = TD(para, 0); x2 = min(find(acqPE2(:,3)>0.3));

para = [0.5; 0.005; 0.9; 500; 15; 13; 8];
[acqPE3] = TD(para, 0); x3 = min(find(acqPE3(:,3)>0.3));

att1=[]; att2=[]; att3=[];
for i=1:400
	a = acqPE1(i,:); a = a(8) - (a(7)+a(9))/2; 
	b = acqPE2(i,:); b = b(8) - (b(7)+b(9))/2; 
	c = acqPE3(i,:); c = c(8) - (c(7)+c(9))/2; 
	att1 = [att1 a]; att2 = [att2 b]; att3 = [att3 c];
end

figure(1); clf;
plot(1:x1, att1(1:x1)); hold on;
k2 = (1:x2)*x1/x2; plot(k2, att2(1:x2)); hold on; 
k3 = (1:x3)*x1/x3; plot(k3, att3(1:x3)); hold off; 
xticks([0 x1*0.2 x1*0.4 x1*0.6 x1*0.8 x1]); xlim([0 x1])
xticklabels({'0', '20', '40', '60', '80', '100'});
legend('Low', 'Middle', 'High');

figure(2); k=1:15; 
plot(k,acqPE1(round(x1*0.1),:), k,acqPE2(round(x2*0.1), :), k, acqPE3(round(x3*0.1), :));

