function result = GeneralizedDMQI(im, gamma, k, s, l)

    if (s>l) 
        error('s cannot be larger than l');
    end

    [h w] = size(im);
    d_im = double(im);
    
    se_l = strel('rectangle', [l l]);
    se_s = strel('rectangle', [s s]);
    
    c_im_l=imclose(d_im, se_l);
    c_im_s=imclose(d_im, se_s);
    c_im_s_IsZero = (c_im_s==0);
    
    div_ = c_im_l./c_im_s;
%     div_(c_im_s_IsZero) = 1;
    
    hev_ = 1./(1+exp(-k*(div_-gamma)));
    
    
%     result = uint8(floor((div_-1)*255));
    result = uint8(round((c_im_s.*(1-hev_) + c_im_l.*(hev_))));
    result = uint8(round(256*double(d_im)./double(result)));
%     result = c_im_l;
    % floor round 17 15
    % floor floor 22
    % round floor 19
    % round round 14

end