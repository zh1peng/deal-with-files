%% just copy gunzip file
data_path='C:\Users\RobWhelan\Desktop\spmpreproc'
% all_ids=my_ls(data_path);
task_label='EPI_global';

[path,name]=filesearch_substring(data_path,'.gz');%find all gz files

task=cellfun(@(x) strfind(x,task_label),path,'Unif',0); %find all task_label gz files
new_path=path(~cellfun('isempty',task));
new_file=name(~cellfun('isempty',task));

subid=cellfun(@(x) x(39:end-20),new_path,'Unif',0); % !!!!!!change the num when you have different data_path!!!!!!!!!!!!!!!!!!
source=cellfun(@fullfile,new_path,new_file,'Unif',0);


output='H:\global raw';


if ~exist(output)
    mkdir(output);
end
save([output,filesep,'MRI_subid.mat'],'subid')

output_path=fullfile(output,subid);
cellfun(@mkdir,output_path,'Unif',0);

% parpool(2)
parfor n=1:length(source)    
copyfile(source{n},output_path{n});
end
