% Clean the workspace
clear all;
clc;

% Load all the data
unsIP = [];
undIP = [];
    
for i = 1:14
    load(['idetproject/data_may0' int2str(i) '.mat']);
    tmpusIP = unique(sIP);
    tmpudIP = unique(dIP);

    %Matrix Consistency
    if i ~= 1
        if(length(unsIP) < length(tmpusIP))
            tmp = length(tmpusIP) - length(unsIP);
            tmpArray = zeros(tmp, i-1);
            unsIP = [unsIP;tmpArray];
        else
            tmp = length(unsIP) - length(tmpusIP);
            tmpArray = zeros(tmp, 1);
            tmpusIP = [tmpusIP;tmpArray];
        end;
        
        if(length(undIP) < length(tmpudIP))
            tmp = length(tmpudIP) - length(undIP);
            tmpArray = zeros(tmp, i-1);
            undIP = [undIP;tmpArray];
        else
            tmp = length(undIP) - length(tmpudIP);
            tmpArray = zeros(tmp, 1);
            tmpudIP = [tmpudIP;tmpArray];
        end;
    end;
    unsIP = [unsIP tmpusIP];
    undIP = [undIP tmpudIP];
    
    %[t, nsIP] = ismember(sIP, tmpusIP);
    %[t, ndIP] = ismember(dIP, tmpudIP);
    %tmpA = sparse(nsIP, ndIP, 1);
    %Gp = 1 * (tmpA * tmpA') > 0;
    %Sp = speye(length(tmpusIP));
    %Gp = Gp - Sp;
end;    