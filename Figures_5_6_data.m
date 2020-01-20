% load('emlrawRw.mat');  load('emlrawDelay.mat'); 

% psthT = [startT endT bin slidewin zeroPt]
psthTRw = [-25000; 6000; 1000; 500; 0];
psthTDelay = [13000; 42000; 1000; 500; 2000];

%% first 9 days
fdcell = [];
for i=1:9 % range of dates of interest  # 30cells
    fdcell = [fdcell expDates{i,1}];
end

% Figure 5D 6A
[t1, erate1, lrate1] = reply_2_2fig(emlrawRw, fdcell, psthTRw);
[esem, lsem, star] = reply_2_2_semT(erate1, lrate1, t1, 1);
figure(1); clf; subplot(1,2,2);
shadedErrorBar(t1,mean(erate1),esem, 'lineprops','-b','transparent',1); hold on; 
shadedErrorBar(t1,mean(lrate1),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t1(star), ones(length(star), 1)*1.9, '*r'); xlim([-1000 500]);  
yrange = [-2 3]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); 


[t2, erate2, lrate2] = reply_2_2fig(emlrawDelay, fdcell, psthTDelay);
[esem, lsem, star] = reply_2_2_semT(erate2, lrate2, t2, 1);
figure(1); subplot(1,2,1);
shadedErrorBar(t2,mean(erate2),esem, 'lineprops','-b','transparent',1); hold on; 
shadedErrorBar(t2,mean(lrate2),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t2(star), ones(length(star), 1)*2.6, '*r'); xlim([-500 1000]); 
yrange = [-2 4.5]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); hold off; 


%% last 9 days
fdcell = [];
for i=10:18 % range of dates of interest  # 32cells
    fdcell = [fdcell expDates{i,1}];
end

% Figure 5E 6B
[t1, erate3, lrate3] = reply_2_2fig(emlrawRw, fdcell, psthTRw);
[esem, lsem, star] = reply_2_2_semT(erate3, lrate3, t1, 1);
figure(2); clf; subplot(1,2,2);
shadedErrorBar(t1,mean(erate3),esem, 'lineprops','-b','transparent',1); hold on; 
shadedErrorBar(t1,mean(lrate3),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t1(star), ones(length(star), 1)*1.9, '*r'); xlim([-1000 500]);  
yrange = [-2 2.5]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); 

[t2, erate4, lrate4] = reply_2_2fig(emlrawDelay, fdcell, psthTDelay);
[esem, lsem, star] = reply_2_2_semT(erate4, lrate4, t2, 1);
figure(2); subplot(1,2,1);
shadedErrorBar(t2,mean(erate4),esem, 'lineprops','-b','transparent',1); hold on; 
shadedErrorBar(t2,mean(lrate4),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t2(star), ones(length(star), 1)*2.6, '*r'); xlim([-500 1000]); ylim([-2 3]); 
yrange = [-2 3]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k');  hold off; 

%% compare first 9 days and last 9 days 

% Figure 5F 6C
[esem, lsem, star] = reply_2_2_semT(erate1, erate3, t1, 2);
figure(3);clf; subplot(1,2,2);
shadedErrorBar(t1,mean(erate1),esem, 'lineprops','-r','transparent',1); hold on; 
shadedErrorBar(t1,mean(erate3),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t1(star), ones(length(star), 1)*1.9, '*r'); xlim([-1000 500]);  
yrange = [-2 3]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); hold on;

[esem, lsem, star] = reply_2_2_semT(erate2, erate4, t2, 2);
figure(3);subplot(1,2,1);
shadedErrorBar(t2,mean(erate2),esem, 'lineprops','-r','transparent',1); hold on; 
shadedErrorBar(t2,mean(erate4),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t2(star), ones(length(star), 1)*2.6, '*r'); xlim([-500 1000]); ylim([-2 3]);
yrange = [-1.5 4.5]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); hold off;

% Figure 5G 6D
[esem, lsem, star] = reply_2_2_semT(lrate1, lrate3, t1, 2);
figure(4); clf; subplot(1,2,2);
shadedErrorBar(t1,mean(lrate1),esem, 'lineprops','-r','transparent',1); hold on; 
shadedErrorBar(t1,mean(lrate3),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t1(star), ones(length(star), 1)*1.9, '*r'); xlim([-1000 500]);
yrange = [-2 2.5]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); hold on;

[esem, lsem, star] = reply_2_2_semT(lrate2, lrate4, t2, 2);
figure(4);subplot(1,2,1);
shadedErrorBar(t2,mean(lrate2),esem, 'lineprops','-r','transparent',1); hold on; 
shadedErrorBar(t2,mean(lrate4),lsem, 'lineprops','-k','transparent',1); hold on; 
scatter(t2(star), ones(length(star), 1)*2.6, '*r'); xlim([-500 1000]); ylim([-2 3]);
yrange = [-2 3]; ylim(yrange); y = yrange; x = [0 0]; plot(x,y, 'k'); hold off;


