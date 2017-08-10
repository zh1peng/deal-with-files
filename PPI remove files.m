data_path='C:\Users\RobWhelan\Desktop\MID norm'
[path,name]=filesearch_substring(data_path,'Outcome_Peak')
files2remove=fullfile(path,name);
cellfun(@delete,files2remove)
load('C:\Users\RobWhelan\Google Drive\MID paper zhipeng\QCed\FINAL COVS\subid1510.mat')
dirs={'PPI_Outcome_Peak_VS_L_outcome','PPI_Outcome_Peak_VS_L_test','PPI_Outcome_Peak_VS_R_outcome','PPI_Outcome_Peak_VS_R_test'}
for n=1:1510
    subfiles(:,n)=fullfile(data_path,subid{n},dirs);
end

tmp=subfiles(:);
cellfun(@(x) rmdir(x,'s'),tmp,'Unif',0);