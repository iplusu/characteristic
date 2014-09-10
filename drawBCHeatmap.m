function [ myFigure, res ] = drawBCHeatmap( day )
%DRAWBTHEATMAP Summary of this function goes here
%   Detailed explanation goes here
    load(sprintf('TempData/bc%s.mat', day));
    load(sprintf('TempData/degreeDay%s.mat', day));
    
    [nonCIP, nonCDshield, inCIP, inCDshield] = separateDshieldFull(unsIP, normalized);
    [nonDIP, nonDDshield, inDIP, inDDshield] = separateDshieldFull(unsIP, d_Gb);
    
    d_GbLog = log(inDDshield);
    pairs = [inCDshield(:) d_GbLog(:)];
    res = zeros(10,10);
    
    for idx = 1:length(pairs)
        try
            [xZone, yZone] = findZone(pairs(idx, 1), pairs(idx,2));
            xZone = int64(xZone);
            yZone = int64(yZone);
%             if pairs(idx, 1) == 0 && pairs(idx, 2) == 0
%                 fprintf('x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
%             end;
            res(yZone, xZone) = res(yZone, xZone) + 1;
        catch
            fprintf('err - x: %f   y: %f   xZone:%d   yZone:%d\n', pairs(idx, 1), pairs(idx,2), xZone, yZone);
            break;
        end;
    end;
    res = flipud(res);
    imagesc(res);
    xlabel('Clustering Coefficient', 'FontSize', 20, 'FontWeight', 'bold');
    ylabel('Degree', 'FontSize', 20, 'FontWeight', 'bold');
    set(gca, 'FontSize', 20);
    colorbar;
    set(gca,'YDir','normal')
    myFigure = title('URI Heatmap', 'FontSize', 20, 'FontWeight', 'bold');
    %set(myFigure,'YDir','normal')
end
