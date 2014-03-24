tic;
function mat = comparePDshield(matrix)
% Load all the data
load('idetproject/dshield_list_full.mat');

h = waitbar(0, 'Comparing...');
mat = zeros(length(matrix), 2);
maxLen = length(matrix);

matlabpool(2);
parfor idx = 1:maxLen
    IP = find(dshIP(:,1) == matrix(idx,1), 1);
    if ~isempty(IP)
        value = matrix(idx,:);
        mat(idx) = value;
        waitbar(idx/maxLen, h, sprintf('%d/%d Progress, %d found.', idx, maxLen, length(mat)));
    end;
    if mod(idx, 100) == 0 || idx == maxLen
        waitbar(idx/maxLen, h, sprintf('%d/%d Progress, %d found.', idx, maxLen, length(mat)));
    end;
end;
matlabpool close;
mat = full(mat);
toc;