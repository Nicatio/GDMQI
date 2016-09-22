function [err total errArr totalArr] = EvaluateYaleB(filename,ka)

subsetIndicator=[0, 1, 2, 4, 1, 2, 0, 0, ...
			0, 1, 1, 1, 1, 2, 1, 2, ...
			2, 3, 2, 2, 3, 3, 3, 3, ...
			3, 3, 4, 4, 4, 4, 4, 4, ...
			4, 4, 4, 0, 0, 0, 1, 1, ...
			1, 1, 2, 1, 2, 2, 3, 2, ...
			2, 3, 3, 3, 3, 3, 3, 4, ...
			4, 4, 4, 4, 4, 4, 4, 4]+1;

errArr=zeros(1,5);
totalArr=zeros(1,5);
errkaArr2=zeros(2432,5);
for i=1:2432
    [maxval maxidx]=max(ka(i,:));
    idx = mod(i-1,64)+1;
    if (idx==1) 
        continue; 
    end
    if isempty(strfind(filename{i,1},'bad'))
        totalArr(subsetIndicator(idx)) = totalArr(subsetIndicator(idx))+1;
        if (maxidx ~= floor((i-1)/64)+1)
            errkaArr2(i,subsetIndicator(idx)) = 1;
            errArr(subsetIndicator(idx)) = errArr(subsetIndicator(idx))+1;
        end
    end
end

err=sum(errArr);
total=sum(totalArr);

fprintf('\n   Total Error: %3d / %4d  (%.2f%%)\n', err, total, err/total*100);
for i=1:5
    fprintf('Subset %d Error: %3d / %4d  (%.2f%%)\n', i, errArr(i), totalArr(i), errArr(i)/(totalArr(i))*100);
end
fprintf('\n');


end