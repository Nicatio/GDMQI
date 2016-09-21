function result = Denoise(im)

    [h w] = size(im);
    d_im = double(im);
    
    NHOOD = [1 1 1; 1 0 1; 1 1 1];
    se = strel('arbitrary', NHOOD);
        
    d_ = imdilate(d_im,se);
    e_ = imerode (d_im,se);
        
    d__ = (d_<d_im);
    e__ = (e_>d_im);
    f__ = logical(1-(d__+e__));
    
    result = zeros([h w]);
    result(d__) = d_(d__);
    result(e__) = e_(e__);
    result(f__) = d_im(f__);
    
%     result2 = zeros([h w]);
%     for i = 1:h
%         for j = 1:w
%             if (d_(i,j) < d_im(i,j))
%                 result2(i,j) = d_(i,j);
%             elseif (e_(i,j) > d_im(i,j))
%                 result2(i,j) = e_(i,j);
%             else
%                 result2(i,j) = d_im(i,j);
%             end
%         end
%     end
    
end
