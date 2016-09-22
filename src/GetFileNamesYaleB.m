function filename = GetFileNamesYaleB ()
tags = [{'_P00A+000E+00.pgm'}; {'_P00A+000E+20.pgm'}; {'_P00A+000E+45.pgm'}; {'_P00A+000E+90.pgm'}; 
        {'_P00A+000E-20.pgm'}; {'_P00A+000E-35.pgm'}; {'_P00A+005E+10.pgm'}; {'_P00A+005E-10.pgm'};
        {'_P00A+010E+00.pgm'}; {'_P00A+010E-20.pgm'}; {'_P00A+015E+20.pgm'}; {'_P00A+020E+10.pgm'};
        {'_P00A+020E-10.pgm'}; {'_P00A+020E-40.pgm'}; {'_P00A+025E+00.pgm'}; {'_P00A+035E+15.pgm'};
        {'_P00A+035E+40.pgm'}; {'_P00A+035E+65.pgm'}; {'_P00A+035E-20.pgm'}; {'_P00A+050E+00.pgm'};
        {'_P00A+050E-40.pgm'}; {'_P00A+060E+20.pgm'}; {'_P00A+060E-20.pgm'}; {'_P00A+070E+00.pgm'};
        {'_P00A+070E+45.pgm'}; {'_P00A+070E-35.pgm'}; {'_P00A+085E+20.pgm'}; {'_P00A+085E-20.pgm'};
        {'_P00A+095E+00.pgm'}; {'_P00A+110E+15.pgm'}; {'_P00A+110E+40.pgm'}; {'_P00A+110E+65.pgm'};
        {'_P00A+110E-20.pgm'}; {'_P00A+120E+00.pgm'}; {'_P00A+130E+20.pgm'}; {'_P00A-005E+10.pgm'};
        {'_P00A-005E-10.pgm'}; {'_P00A-010E+00.pgm'}; {'_P00A-010E-20.pgm'}; {'_P00A-015E+20.pgm'};
        {'_P00A-020E+10.pgm'}; {'_P00A-020E-10.pgm'}; {'_P00A-020E-40.pgm'}; {'_P00A-025E+00.pgm'};
        {'_P00A-035E+15.pgm'}; {'_P00A-035E+40.pgm'}; {'_P00A-035E+65.pgm'}; {'_P00A-035E-20.pgm'};
        {'_P00A-050E+00.pgm'}; {'_P00A-050E-40.pgm'}; {'_P00A-060E+20.pgm'}; {'_P00A-060E-20.pgm'};
        {'_P00A-070E+00.pgm'}; {'_P00A-070E+45.pgm'}; {'_P00A-070E-35.pgm'}; {'_P00A-085E+20.pgm'};
        {'_P00A-085E-20.pgm'}; {'_P00A-095E+00.pgm'}; {'_P00A-110E+15.pgm'}; {'_P00A-110E+40.pgm'};
        {'_P00A-110E+65.pgm'}; {'_P00A-110E-20.pgm'}; {'_P00A-120E+00.pgm'}; {'_P00A-130E+20.pgm'}; ];
    
badFileIndex = [-1;1062;998;934;925;878;827;818;797;789;766;763;754;733;725;699;690;669;661;];
subjectIndex = [1:13 15:39]';

nImage = size(tags,1);
nSub = size(subjectIndex,1);

filename = [];
k=0;

for i=1:nSub
    for j=1:nImage
        k = k+1;
        if (badFileIndex(end)==k)
            isBad = '.bad';
            badFileIndex = badFileIndex(1:end-1);
        else 
            isBad = '';
        end
        temp = sprintf('yaleB%02d%s%s',subjectIndex(i),tags{j},isBad);
        
        filename = [filename; {temp}];
    end
end

end