for i = 1:14
    load(sprintf('datasets/bc%d.mat', i));
    
    filename = sprintf('TempData/bc%d.mat', i);
    disp(filename);
    [unsIP, Gp] = oneDayP(i);
    
    norm = (bc - min(bc))/(max(bc) - min(bc));
    save(filename, 'unsIP', 'bc', 'norm');
    clear bc;
    clear unsIP;
    clear norm;
end;