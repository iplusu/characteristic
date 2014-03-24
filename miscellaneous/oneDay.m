function [unsIP, d_Gb] = oneDay(idx)
% Load all the data
load(['idetproject/data_may0' int2str(idx) '.mat']);

unsIP = unique(sIP);
undIP = unique(dIP);
  
[t, nsIP] = ismember(sIP, unsIP);
[t, ndIP] = ismember(dIP, undIP);
tmpA = sparse(nsIP, ndIP, 1);
%Gp = 1 * (tmpA * tmpA') > 0;
%Sp = speye(length(unsIP));
%Gp = Gp - Sp; 
%Bp = 1*(tmpA>0);
d_Gb = sum(tmpA > 0, 2);
%Bp = [unsIP Bp];
