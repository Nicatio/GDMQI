DB_LOCATION = 'E:\Documents\Nicatio\Database\Face\yalebDB\';
M_CORR_PHI = 2;

%% Test for Extended Yale-B Database

N_SUBJECT = 38;
N_IMAGES_PER_SUBJECT = 64;

fileList = GetFileNamesYaleB();
trainIndex = 1:N_IMAGES_PER_SUBJECT:((N_IMAGES_PER_SUBJECT*N_SUBJECT-1)+1);
testIndex = 1:N_IMAGES_PER_SUBJECT*N_SUBJECT;

result_tra   = GDMQI_batch(DB_LOCATION, fileList, trainIndex);
result_tes   = GDMQI_batch(DB_LOCATION, fileList, testIndex);
mCorrResults = ModifiedCorr_batch(result_tes, result_tra, M_CORR_PHI);

[err total errArr totalArr] = EvaluateYaleB(fileList, mCorrResults);

%% for exporting result images
% EXPORT_LOCATION = 'E:\Documents\Nicatio\Database\Face\yalebDB\test\';
% ExportImagesYaleB (EXPORT_LOCATION, fileList, result);
