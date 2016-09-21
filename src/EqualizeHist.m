function result = EqualizeHist(im)
    [h w] = size(im);
    stretchedIm = reshape(im,h*w,1);
    hi = hist(stretchedIm, [0:1:255]);
    
    i=1;
    while(~hi(i))
        i = i + 1;
    end
    
    if (hi(i) == h*w)
        result = i-1;
        return;
    end
    
    scale = 255. / (h*w - hi(i));
    
    sum = 0;
    lut = uint8(zeros(256,1));
    for j=(i+1):256
        sum = sum + hi(j);
        lut(j) = uint8(round(sum * scale));
    end
    
    result = zeros (h,w);
    
    for i=0:255
        result (im==i) = lut(i+1);
    end
end