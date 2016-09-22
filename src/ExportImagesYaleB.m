function ExportImagesYaleB (EXPORT_LOCATION, f, result)

[nImg, b, c] = size(result);

for i=1:nImg
    i
    rr  = uint8(reshape (result(i,:,:), b, c));
    str = [EXPORT_LOCATION f{i}];
    str2 = str(1:end-4);
    str3 = str(end-2:end);
    if strcmp(str3,'bad') 
        imwrite(rr, [str2 '.pgm'], 'pgm');
        movefile([str2 '.pgm'], [str2 '.bad']);
    else
        imwrite(rr, str, 'pgm');
    end
end

end