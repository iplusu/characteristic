function [ ] = drawHeatmapCC( )
%DRAWHEATMAPCC Summary of this function goes here
%   Detailed explanation goes here
    load(['TempData/kmeans3GroupsCC.mat']);
    [s,idx] = sort(classAll);
    figure;
    imagesc(allCC(idx,:));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Clustering Coefficient Heatmap - 3 Groups'], 'FontSize', 20);
    
    load(['TempData/kmeans3Groups.mat']);
    [s,idx] = sort(classAll);
    figure;
    imagesc(log(allDegree(idx,:)));
    xlabel('Day', 'FontSize', 20);
    ylabel('Node', 'FontSize', 20);
    colorbar;
    myFigure = title(['All 14 days Degree Heatmap - 3 Groups'], 'FontSize', 20);
end

