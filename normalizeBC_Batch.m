for i = 1:14
    load(sprintf('datasets/bc%d.mat', i));
    
    filename = sprintf('TempData/bc%d.mat', i);
    disp(filename);
    [unsIP, Gp] = oneDayP(i);
    
    normalized = (bc - min(bc))/(max(bc) - min(bc));
    save(filename, 'unsIP', 'bc', 'normalized');
    clear bc;
    clear unsIP;
    clear normalized;
end;