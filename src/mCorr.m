function [maxCorr dx dy] = mCorr( im1, im2, searchRadius )

% 	upper = floor(searchRadius/2);
%     if mod(searchRadius,2)==1
% 	    lower = (-upper);
%     else
%         lower = (-upper+1);
%     end

    lower = -searchRadius;
    upper = searchRadius;
    
    [h w] = size(im1);
    
    maxCorr=-1;
    dx = 0;
    dy = 0;
    for i=lower:upper
        for j=lower:upper
            if (i<0) 
                startAy= -i;
                startBy = 0;
                widthAB = w+i;
            else
                startAy= 0;		
                startBy = i;		
                widthAB = w-i; 
            end
            if (j<0)
                startAx = -j;
                startBx = 0;
                heightAB = h+j;
            else
                startAx = 0;
                startBx = j;
                heightAB = h-j;
            end
            
            k=im1((startAx+1):(startAx+heightAB),(startAy+1):(startAy+widthAB));
            l=im2((startBx+1):(startBx+heightAB),(startBy+1):(startBy+widthAB));
            tempCorr = corrcoef(double(k),double(l));
            
%             sz = 1.0/widthAB/heightAB;
%             
%                 sk = sum(sum(k))*sz;
%                 sqk = sum(sum(double(k).*double(k)))*sz;
%                 sigk = sqrt(sqk-sk*sk);
%                 k_ = (double(k)-sk)/sigk;
%                 sl = sum(sum(l))*sz;
%                 sql = sum(sum(double(l).*double(l)))*sz;
%                 sigl = sqrt(sql-sl*sl);
%                 l_ = (double(l)-sl)/sigl;
                
%             tempCorr2 = sum(sum(k_.*l_))*sz;
%             tempCorr2 = sum(sum(k_.*l_.*(k_.*l_>=0)))*sz;
%             tempCorr2 = sum(sum(k_.*(k_>=0).*l_.*(l_>=0)))*sz;
%             tempCorr(1,2);
            if (tempCorr(1,2)>maxCorr) 
%             if (tempCorr2>maxCorr) 
                maxCorr = tempCorr(1,2);
%                 maxCorr = tempCorr2;
                dx=j;
                dy=i;
            end
        end
    end

end

