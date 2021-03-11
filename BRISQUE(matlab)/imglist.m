function list = imglist(directory)
    extension=["bmp", "jpg", "jpeg", "png"];
    
    filelist = dir(directory);
    list = strings(length(filelist), 1);

    cnt = 1;
    for i = 1:length(filelist)
        if endsWith(filelist(i).name, extension, 'IgnoreCase', true)
            list(cnt) = fullfile(directory, filelist(i).name);
            cnt = cnt + 1;
        end
    end
    list = list(list ~= "");
    list = char(list); 
end