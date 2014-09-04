for i = 1:14
    filename = sprintf('TempData/bc%d.mat', i);
    disp(filename);
    [unsIP, Gp] = oneDayP(i);
    tic;
    bc = betweenness_centrality(Gp);
    toc;
    save(filename, 'bc');
    clear bc;
end;