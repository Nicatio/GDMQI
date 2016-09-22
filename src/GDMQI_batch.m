function [result] = GDMQI_batch(DB_LOCATION, f, index)

im = imread([DB_LOCATION f{1}]);
result = uint8(zeros([size(index,2) size(im)]));
j=0;

for i=index
    i
    j = j+1;
    im = imread([DB_LOCATION f{i}]);
    deno = Denoise(im);
    gdmqi = GeneralizedDMQI(deno, 1.5, 20, 5, 9);
    result(j,:,:) = EqualizeHist(uint8(gdmqi));
end