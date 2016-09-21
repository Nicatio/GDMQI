DB_LOCATION = 'E:\Documents\Nicatio\Database\Face\yalebDB\';

[fileList nImg nImgTr result resultTr] = GDMQI_batch(DB_LOCATION);
mCorrResults = ModifiedCorr_batch(nImg,nImgTr,result,resultTr);
[err total errArr totalArr] = EvaluateYaleB(fileList, mCorrResults)

%% for exporting result images
% EXPORT_LOCATION = 'E:\Documents\Nicatio\Database\Face\yalebDB\test\';
% ExportImagesYaleB (fileList, nImg, result, EXPORT_LOCATION);
