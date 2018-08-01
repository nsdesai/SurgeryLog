function addsurgerynotes(fileName)

if ~exist(fileName,'file')
    fid = fopen(fileName,'w');
    fprintf(fid,'.LOG');
    fclose(fid);
end

system(fileName);

