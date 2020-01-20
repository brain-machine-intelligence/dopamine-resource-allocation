%% Fig. A. 3-5

% para = [el trace, learning rate, discounting factor, numTrial, trleng, USt, saliency of exp stim];
% para = [0.5; 0.005; 0.9; 700; 15; 13; 2];


%% el = 0.9
% learning rate change when discounting factor = 1
parael{1} = [0.9; 0.0005; 1; 3000; 15; 13; 2]'; 
parael{1} = [parael{1}; [0.9; 0.005; 1; 400; 15; 13; 2]'];
parael{1} = [parael{1}; [0.9; 0.05; 1; 100; 15; 13; 2]'];

% learning rate change when discounting factor = 0.9
parael{2} = [0.9; 0.0005; 0.9; 5000; 15; 13; 2]';
parael{2} = [parael{2}; [0.9; 0.005; 0.9; 500; 15; 13; 2]'];
parael{2} = [parael{2}; [0.9; 0.05; 0.9; 100; 15; 13; 2]'];

% learning rate change when discounting factor = 0.8
parael{3} = [0.9; 0.0005; 0.8; 8000; 15; 13; 2]';
parael{3} = [parael{3}; [0.9; 0.005; 0.8; 1000; 15; 13; 2]'];
parael{3} = [parael{3}; [0.9; 0.05; 0.8; 200; 15; 13; 2]'];

acqData = paratest(parael);
save acqData_el9 acqData


%% el = 0.5
%
% learning rate change when discounting factor = 1
parael{1} = [0.5; 0.0005; 1; 5000; 15; 13; 2]'; 
parael{1} = [parael{1}; [0.5; 0.005; 1; 500; 15; 13; 2]'];
parael{1} = [parael{1}; [0.5; 0.05; 1; 100; 15; 13; 2]'];

% learning rate change when discounting factor = 0.9
parael{2} = [0.5; 0.0005; 0.9; 8000; 15; 13; 2]';
parael{2} = [parael{2}; [0.5; 0.005; 0.9; 800; 15; 13; 2]'];
parael{2} = [parael{2}; [0.5; 0.05; 0.9; 100; 15; 13; 2]'];

% learning rate change when discounting factor = 0.8
parael{3} = [0.5; 0.0005; 0.8; 12000; 15; 13; 2]';
parael{3} = [parael{3}; [0.5; 0.005; 0.8; 1200; 15; 13; 2]'];
parael{3} = [parael{3}; [0.5; 0.05; 0.8; 200; 15; 13; 2]'];

acqData = paratest(parael);
save acqData_el5 acqData

%% el = 0.1
% learning rate change when discounting factor = 1
parael{1} = [0.1; 0.0005; 1; 9000; 15; 13; 2]'; 
parael{1} = [parael{1}; [0.1; 0.005; 1; 900; 15; 13; 2]'];
parael{1} = [parael{1}; [0.1; 0.05; 1; 200; 15; 13; 2]'];

% learning rate change when discounting factor = 0.9
parael{2} = [0.1; 0.0005; 0.9; 12000; 15; 13; 2]';
parael{2} = [parael{2}; [0.1; 0.005; 0.9; 1200; 15; 13; 2]'];
parael{2} = [parael{2}; [0.1; 0.05; 0.9; 200; 15; 13; 2]'];

% learning rate change when discounting factor = 0.8
parael{3} = [0.1; 0.0005; 0.8; 16000; 15; 13; 2]';
parael{3} = [parael{3}; [0.1; 0.005; 0.8; 1600; 15; 13; 2]'];
parael{3} = [parael{3}; [0.1; 0.05; 0.8; 200; 15; 13; 2]'];

acqData = paratest(parael);
save acqData_el1 acqData


%% draw figures

% el = 0.9
clear acqData; load('acqData_el9.mat'); 
fths = [0.8 0.3 0.08]; 
figN = 1; paratestFig (acqData, fths, figN)

figure(2); 
subplot(2,3,1); plot(acqData{1,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{1,1}(:,3))); 
subplot(2,3,2); plot(acqData{1,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{1,2}(:,3))); 
subplot(2,3,3); plot(acqData{1,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{1,3}(:,3))); 

figure(3); 
subplot(2,3,1); plot(acqData{2,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{2,1}(:,3))); 
subplot(2,3,2); plot(acqData{2,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{2,2}(:,3))); 
subplot(2,3,3); plot(acqData{2,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{2,3}(:,3))); 

figure(4); 
subplot(2,3,1); plot(acqData{3,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{3,1}(:,3))); 
subplot(2,3,2); plot(acqData{3,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{3,2}(:,3))); 
subplot(2,3,3); plot(acqData{3,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{3,3}(:,3))); 



% el = 0.5
clear acqData; load('acqData_el5.mat'); 
fths = [0.8 0.3 0.08];
figN = 5; paratestFig (acqData, fths, figN)

figure(6); 
subplot(2,3,1); plot(acqData{1,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{1,1}(:,3))); 
subplot(2,3,2); plot(acqData{1,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{1,2}(:,3))); 
subplot(2,3,3); plot(acqData{1,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{1,3}(:,3))); 

figure(7); 
subplot(2,3,1); plot(acqData{2,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{2,1}(:,3))); 
subplot(2,3,2); plot(acqData{2,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{2,2}(:,3))); 
subplot(2,3,3); plot(acqData{2,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{2,3}(:,3))); 

figure(8); 
subplot(2,3,1); plot(acqData{3,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{3,1}(:,3))); 
subplot(2,3,2); plot(acqData{3,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{3,2}(:,3))); 
subplot(2,3,3); plot(acqData{3,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{3,3}(:,3))); 



% el = 0.1
clear acqData; load('acqData_el1.mat'); 
fths = [0.8 0.3 0.08];
figN = 9; paratestFig (acqData, fths, figN)

figure(10); 
subplot(2,3,1); plot(acqData{1,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{1,1}(:,3))); 
subplot(2,3,2); plot(acqData{1,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{1,2}(:,3))); 
subplot(2,3,3); plot(acqData{1,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{1,3}(:,3))); 

figure(11); 
subplot(2,3,1); plot(acqData{2,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{2,1}(:,3))); 
subplot(2,3,2); plot(acqData{2,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{2,2}(:,3))); 
subplot(2,3,3); plot(acqData{2,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{2,3}(:,3))); 

figure(12); 
subplot(2,3,1); plot(acqData{3,1}(:,3)); 
subplot(2,3,4); plot(diff(acqData{3,1}(:,3))); 
subplot(2,3,2); plot(acqData{3,2}(:,3)); 
subplot(2,3,5); plot(diff(acqData{3,2}(:,3))); 
subplot(2,3,3); plot(acqData{3,3}(:,3)); 
subplot(2,3,6); plot(diff(acqData{3,3}(:,3))); 
