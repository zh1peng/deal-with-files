%% copy image MID data
datadir='/Volumes/Data store 2/PPI data/8condtions ROI extraction and PPI'
output='/Volumes/All backups/Imagen MID';
mkdir(output)

% get subid

for n=1:length(subid)
    disp['start copying No. ',num2str(n)];
    fileout=fullfile(output,subid{n});
    mkdir(subout);
    subpath=fullfile(datadir,subid{n});
    a=dir([subpath,filesep,'swea*.nii']);
    [swea{1:length(a)}]=deal(a.name);
    filein=fullfile(subpath,swea);
    cellfun(@copyfile,filein,fileout,'Unif',0)
    disp['No. ',num2str(n),' is done']
end

