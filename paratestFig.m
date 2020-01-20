function [] = paratestFig (acqData, fths, figN)

for i=1:3
    fth = fths(i); 
    
    acqPE1 = acqData{i,1}; 
    acqPE2 = acqData{i,2}; 
    acqPE3 = acqData{i,3}; 
    
    x1 = min(find(acqPE1(:,3)>fth));
    x2 = min(find(acqPE2(:,3)>fth));
    x3 = min(find(acqPE3(:,3)>fth));  
    
    figure(figN); load('MyColormapNeg.mat');
    subplot(2,9,1+(i-1)*3); imagesc(acqPE1(1:x1, :));  colormap(mymapNeg);  caxis([-0.02 1]); title([num2str(x1) ' trials'])
    subplot(2,9,2+(i-1)*3); imagesc(acqPE2(1:x2, :));  colormap(mymapNeg); caxis([-0.02 1]); title([num2str(x2) ' trials'])
    subplot(2,9,3+(i-1)*3); imagesc(acqPE3(1:x3, :)); colormap(mymapNeg); caxis([-0.02 1]); title([num2str(x3) ' trials']); colorbar; 
        
    k = 1:15;
    subplot(2,9,1+(2+i)*3);
    plot(k,acqPE1(round(x1*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1); xlim([1 15]);hold on;
    plot(k,acqPE1(round(x1*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1); hold on;
    plot(k,acqPE1(round(x1*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.2); hold off;
    
    subplot(2,9,2+(2+i)*3);
    plot(k,acqPE2(round(x2*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1); xlim([1 15]);hold on;
    plot(k,acqPE2(round(x2*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1); hold on;
    plot(k,acqPE2(round(x2*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.2); hold off;
    xlim([1 15]); legend('Early', 'Middle', 'Late');
    
    subplot(2,9,3+(2+i)*3);
    plot(k,acqPE3(round(x3*0.1),:), 'Color', [0.6,0.6,0.6], 'LineWidth', 1); xlim([1 15]);hold on;
    plot(k,acqPE3(round(x3*0.2),:), 'Color', [0.3,0.3,0.3], 'LineWidth', 1); hold on;
    plot(k,acqPE3(round(x3*0.8),:), 'Color', [0 0 0], 'LineWidth', 1.2); hold off;
    xlim([1 15]);    
    
end

    