function mat = refineData(matrix, threshold)

previous = full(max(matrix));
deleted = [];
keepLoop = true;
while(keepLoop)
    current = full(max(matrix));
    if (previous - current) < threshold
        [T, I] = ismember(current, matrix);
        matrix(I,1) = 0;
        deleted = [deleted, current];
        previous = current;
    else
        keepLoop = false;
    end;
end;
fprintf('Deleted %d items. Current max is %d.\n', length(deleted), current);
disp(deleted);
mat = matrix;