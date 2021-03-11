function ENIQA(img_dir)             %�ݭnsvm���禡��
    list = imglist(img_dir);        %Ū���ؼХؿ����|�ؼv�����A���v���M��(�ݭnimglist.m)
    img_num = length(list(:,1));    %�ھڼv���M�椤���e�A�N�v���ƶq�p��X��
    a= {img_dir, 'ENIQA'};          %�n��JEXECL���������O�W��
    for i = 1:img_num               %�̷Ӽv���ƶq�̧Ǻ�XENIQA���G
        fprintf('%d\n',i);          
        imgpath = list(i, :);       %�N��i�v�������|�q�v���M�椤�^���X��
        if ischar(imgpath)          
            img = imread(imgpath);  
        end
        %---ENIQA�B��
        load('model/models');       % Load the models pretrained on LIVE
        scale = 2;
        feature = featureExtract56(img, scale);
        score = predict(feature, svrmodels, svcmodel);
        %---ENIQA�B��
        %fprintf('%f\n',score);
        a{i+1,1}=i;
        a{i+1,2}=score;
    end
    print_ENIQA(a,img_dir)
end
%���O:ENIQA('���|')
%ENIQA('D:\108resercher\====######RESEARCH######====\GAN-research\12.15\No_reference_IQA\BRISQUE\No-Reference-Image-Quality-Assessment-using-BRISQUE-Model-master\Images')
