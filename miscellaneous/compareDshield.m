function mat = compareDshield(matrix)
% Load all the data
load('idetproject/dshield_list_full.mat');

h = waitbar(0, 'Comparing...');
mat = [];
maxLen = length(matrix);

%matlabpool(2);
tic
for idx = 1:maxLen
    IP = find(dshIP(:,1) == matrix(idx,1), 1);
    if ~isempty(IP)
        value = matrix(idx,:);
        mat = [mat ; value(1,1) value(1,2)];
        waitbar(idx/maxLen, h, sprintf('%d/%d Progress, %d found.', idx, maxLen, length(mat)));
    end;
    if mod(idx, 100) == 0 || idx == maxLen
        waitbar(idx/maxLen, h, sprintf('%d/%d Progress, %d found.', idx, maxLen, length(mat)));
    end;
end;
mat = full(mat);
toc
disp(toc)