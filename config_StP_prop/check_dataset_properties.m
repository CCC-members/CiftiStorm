function valided = check_dataset_properties(selected_dataset)
%% Checking the selected dataset properties

valided = true;
if(isfield(selected_dataset, 'hcp_data_path'))
    if(~isfield(selected_dataset.hcp_data_path, 'base_path')...
            || ~isfield(selected_dataset.hcp_data_path, 'file_location')...
            || ~isfield(selected_dataset.hcp_data_path, 'L_surface_location')...
            || ~isfield(selected_dataset.hcp_data_path, 'R_surface_location')...
            || ~isfield(selected_dataset.hcp_data_path, 'Atlas_seg_location'))
        valided = false; 
        fprintf(2,'\n-->> Error: The hcp_data_path field is not correct \n');
        fprintf(2,'-->> Please, check the app_protocols.json file and fix the error \n');
        return;
    end
%     [status,values] = fileattrib(fullfile(selected_dataset.hcp_data_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name ,' \n');
%     end
end
if(isfield(selected_dataset, 'brain_external_surface_path'))
    if(~isfield(selected_dataset.brain_external_surface_path, 'base_path')...
            || ~isfield(selected_dataset.brain_external_surface_path, 'L_surface_location') ...
            || ~isfield(selected_dataset.brain_external_surface_path, 'R_surface_location'))
        valided = false; 
        fprintf(2,'\n-->> Error: The non_brain_data_path field is not correct \n');
        return;
    end
%     [status,values] = fileattrib(fullfile(selected_dataset.brain_external_surface_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'non_brain_data_path'))
    if(~isfield(selected_dataset.non_brain_data_path, 'base_path')...
            || ~isfield(selected_dataset.non_brain_data_path, 'head_file_location') ...
            || ~isfield(selected_dataset.non_brain_data_path, 'outerfile_file_location') ...
            || ~isfield(selected_dataset.non_brain_data_path, 'innerfile_file_location'))
        valided = false; 
        fprintf(2,'\n-->> Error: The non_brain_data_path field is not correct \n');
        return;
    end
%       [status,values] = fileattrib(fullfile(selected_dataset.non_brain_data_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'eeg_raw_data_path'))
    if(~isfield(selected_dataset.eeg_raw_data_path, 'base_path')...
            || ~isfield(selected_dataset.eeg_raw_data_path, 'file_location')...
            || ~isfield(selected_dataset.eeg_raw_data_path, 'data_format') ...
            || ~isfield(selected_dataset.eeg_raw_data_path, 'isfile'))
        valided = false;
        fprintf(2,'\n-->> Error: The EEG Raw folder don''t exist. \n');
        disp("OR");
        fprintf(2,'-->> Error: The eeg_raw_data_path field is not correct. \n');
        return;
    end 
%      [status,values] = fileattrib(fullfile(selected_dataset.eeg_raw_data_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ',values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'preprocessed_eeg'))
    if(~isfield(selected_dataset.preprocessed_eeg, 'base_path')...
            || ~isfield(selected_dataset.preprocessed_eeg, 'file_location')...
            || ~isfield(selected_dataset.preprocessed_eeg, 'format'))
        valided = false;
        fprintf(2,'\n-->> Error: The Preprocessed EEG folder don''t exist. \n');
        disp("OR");
        fprintf(2,'-->> Error: The preprocessed_eeg field is not correct. \n');
        return;
    end 
%     [status,values] = fileattrib(fullfile(selected_dataset.preprocessed_eeg.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ',values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'anat_data_path'))
    if(~isfolder(selected_dataset.anat_data_path.base_path) && selected_dataset.anat_data_path.base_path ~= "none")
        valided = false;
        fprintf(2,'\n-->> Error: The Anat folder don''t exist. \n');
        return;
    end
%     [status,values] = fileattrib(fullfile(selected_dataset.anat_data_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'report_output_path'))
    if(~isfolder(selected_dataset.report_output_path) && selected_dataset.report_output_path ~= "local")
        valided = false;
        fprintf(2,'\n-->> Error: The report output folder don''t exist\n');
        return;
    end
%     [status,values] = fileattrib(fullfile(selected_dataset.report_output_path));
%     if(~values.UserRead || ~values.UserWrite)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read and Write permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'bcv_config'))
    if(~isfolder(selected_dataset.bcv_config.export_path) && selected_dataset.bcv_config.export_path ~= "local")
        valided = false;
        fprintf(2,'\n-->> Error: The input BC-Vareta folder don''t exist\n');
        return;
    end
%      [status,values] = fileattrib(fullfile(selected_dataset.bcv_config.export_path));
%     if(~values.UserRead || ~values.UserWrite)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read and Write permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'meg_data_path'))
    if(~isfield(selected_dataset.meg_data_path, 'base_path')...
            && (~isequal(selected_dataset.meg_data_path.base_path,"none") && ~isfolder(selected_dataset.meg_data_path.base_path)))
        valided = false;
        fprintf(2,'\n-->> Error: The meg_data_path field is not correct \n');
        return;
    end
%      [status,values] = fileattrib(fullfile(selected_dataset.meg_data_path.base_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end
if(isfield(selected_dataset, 'meg_transformation_path'))
    if(~isfield(selected_dataset.meg_transformation_path, 'base_path')...
            && (~isequal(selected_dataset.meg_transformation_path.base_path,"none") && ~isfolder(selected_dataset.meg_transformation_path.base_path)))
        valided = false;
        fprintf(2,'\n-->> Error: The meg_transformation_path field is not correct \n');
        return;
    end  
%     [status,values] = fileattrib(fullfile(selected_dataset.meg_transformation_path));
%     if(~values.UserRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end

if(isfield(selected_dataset, 'bcv_config'))
    if(~isfield(selected_dataset.bcv_config, 'export')...
            && (isequal(selected_dataset.bcv_config.export,true) && ~isfolder(selected_dataset.bcv_config.export_path))...
            && (~isequal(selected_dataset.meg_data_path.base_path,"local")))
        valided = false;
        fprintf(2,'\n-->> Error: The BC-VARETA Output folder is not correct \n');
        return;
    end  
%     [status,values] = fileattrib(fullfile(selected_dataset.bcv_config.export_path));
%     if(~values.UserRead || ~values.WriteRead)
%         disp('=============================================================================')
%         fprintf(2,'\n-->> Error: The User account do not have Read and Write permission in this path: \n');
%         fprintf(2,'-->> ', values.Name  ,' \n');
%         return;
%     end
end

if(~isempty(selected_dataset.colormap) && ~isequal(selected_dataset.colormap,'none')...
        && ~isfile(selected_dataset.colormap))
    valided = false;
    fprintf(2,'\n-->> Error: Do not exist the colormap file defined in selected dataset configuration file.\n');
    disp(selected_dataset.colormap);
    return;
else
    
end

