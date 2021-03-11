function ENIQA(img_dir)             %需要svm的函式集
    list = imglist(img_dir);        %讀取目標目錄中四種影像型態的影像清單(需要imglist.m)
    img_num = length(list(:,1));    %根據影像清單中內容，將影像數量計算出來
    a= {img_dir, 'ENIQA'};          %要輸入EXECL的頂端類別名稱
    for i = 1:img_num               %依照影像數量依序算出ENIQA結果
        fprintf('%d\n',i);          
        imgpath = list(i, :);       %將單張影像的路徑從影像清單中擷取出來
        if ischar(imgpath)          
            img = imread(imgpath);  
        end
        %---ENIQA運算
        load('model/models');       % Load the models pretrained on LIVE
        scale = 2;
        feature = featureExtract56(img, scale);
        score = predict(feature, svrmodels, svcmodel);
        %---ENIQA運算
        %fprintf('%f\n',score);
        a{i+1,1}=i;
        a{i+1,2}=score;
    end
    print_ENIQA(a,img_dir)
end
%指令:ENIQA('路徑')
%ENIQA('D:\108resercher\====######RESEARCH######====\GAN-research\12.15\No_reference_IQA\BRISQUE\No-Reference-Image-Quality-Assessment-using-BRISQUE-Model-master\Images')
