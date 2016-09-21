function [f nImg nImgTr result resultTr] = GDMQI_batch(DB_LOCATION)

f = dir(DB_LOCATION);
f = regexpi({f.name},'.*pgm.*','match');
f = [f{:}]';

ft = dir([DB_LOCATION '*_P00A+000E+00.pgm']);
ft = regexpi({ft.name},'.*','match');
ft = [ft{:}]';

nImg = size(f,1);
nImgTr = size(ft,1);
im = imread([DB_LOCATION f{1}]);

result = uint8(zeros([nImg size(im)]));
resultTr = uint8(zeros([nImgTr size(im)]));

for i=1:nImg
    i
    im = imread([DB_LOCATION f{i}]);
    deno = Denoise(im);
    gdmqi = GeneralizedDMQI(deno, 1.5, 20, 5, 9);
    result(i,:,:) = EqualizeHist(uint8(gdmqi));
    
end

for i=1:nImgTr
    i
    im = imread([DB_LOCATION ft{i}]);
    deno = Denoise(im);
    gdmqi = GeneralizedDMQI(deno, 1.5, 20, 5, 9);
    resultTr(i,:,:) = EqualizeHist(uint8(gdmqi));
end