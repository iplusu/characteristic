function [ sizeList ] = getWindowSize( trustList )
%GETWINDOWSIZE Summary of this function goes here
%   Detailed explanation goes here
    a = -1.111111111; % minimum 2, maximum 3
    b = 3.111111111;
    %a = 2.222222222; % minimum 2 maximum 4
    %b = 1.777777778;
    %a = -3.333333333; % minimum 2 maximum 5
    %b = 1.666666667;
    %a = 4.444444444; % minimum 2 maximum 6
    %b = 1.555555556;
    %a = -3.333333333; % minimum 5 maximum 8
    %b = 8.333333333;
    
    sizeList = ceil((trustList .* a) + b);
end

