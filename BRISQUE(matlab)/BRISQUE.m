function BRISQUE(img_dir)               %�ݭnsvm���禡��
    list = imglist(img_dir);            %Ū���ؼХؿ����|�ؼv�����A���v���M��(�ݭnimglist.m)
    img_num = length(list(:,1));        %�����v���ƶq
    a= {img_dir, 'BRISQUE'};            %EXECL������O
    for i = 1:img_num                   %�̧Ǻ�XBRISQUE���G
        fprintf('%d / %d\n',i,img_num); %�B�z�i��
        imgpath = list(i, :);           %�^�����|
        if ischar(imgpath)              %�p�G�ɮ׸��|���A���T
            img = imread(imgpath);      %Ū���v��
        end
        %---BRISQUE�B��
        qualityscore = brisquescore(img);
        %---BRISQUE�B��
        a{i+1,1}=i;
        a{i+1,2}=qualityscore;
    end
    print_BRISQUE(a,img_dir)
end
%���O:BRISQUE('���|')
%BRISQUE('D:\108resercher\====######RESEARCH######====\GAN-research\12.15-meeting\�LLM�O�K���G\100%MOD3\_Stego')
