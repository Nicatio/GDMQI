function [errka tot errkaArr totArr] = EvaluateYaleB(filename,ka)

subsetIndicator=[0, 1, 2, 4, 1, 2, 0, 0, ...
			0, 1, 1, 1, 1, 2, 1, 2, ...
			2, 3, 2, 2, 3, 3, 3, 3, ...
			3, 3, 4, 4, 4, 4, 4, 4, ...
			4, 4, 4, 0, 0, 0, 1, 1, ...
			1, 1, 2, 1, 2, 2, 3, 2, ...
			2, 3, 3, 3, 3, 3, 3, 4, ...
			4, 4, 4, 4, 4, 4, 4, 4]+1;

errkaArr=zeros(1,5);
totArr=zeros(1,5);
errkaArr2=zeros(2432,5);
for i=1:2432
    [maxval maxidx]=max(ka(i,:));
    if isempty(strfind(filename{i,1},'bad'))
        idx = mod(i-1,64)+1;
        totArr(subsetIndicator(idx)) = totArr(subsetIndicator(idx))+1;
        if (maxidx ~= floor((i-1)/64)+1)
            errkaArr2(i,subsetIndicator(idx)) = 1;
            errkaArr(subsetIndicator(idx)) = errkaArr(subsetIndicator(idx))+1;
        end
        
    end
end

errka=sum(errkaArr);
tot=sum(totArr);
end