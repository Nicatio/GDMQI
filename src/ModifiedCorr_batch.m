function mCorrResults = ModifiedCorr_batch(nImg,nImgTr,result,resultTr)
[~, b, c] = size(result);

mCorrResults = zeros (nImg,nImgTr);
testImage = zeros (b,c);
trainImage = zeros (b,c);
for i=1:nImg
    i
    for j=1:nImgTr
        testImage(:,:) = result(i,:,:);
        trainImage(:,:) = resultTr(j,:,:);
        mCorrResults (i, j) = mCorr( testImage, trainImage, 2 );
    end
end