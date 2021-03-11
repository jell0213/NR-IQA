function BRISQUE(img_dir)               %需要svm的函式集
    list = imglist(img_dir);            %讀取目標目錄中四種影像型態的影像清單(需要imglist.m)
    img_num = length(list(:,1));        %紀錄影像數量
    a= {img_dir, 'BRISQUE'};            %EXECL資料類別
    for i = 1:img_num                   %依序算出BRISQUE結果
        fprintf('%d / %d\n',i,img_num); %處理進度
        imgpath = list(i, :);           %擷取路徑
        if ischar(imgpath)              %如果檔案路徑型態正確
            img = imread(imgpath);      %讀取影像
        end
        %---BRISQUE運算
        qualityscore = brisquescore(img);
        %---BRISQUE運算
        a{i+1,1}=i;
        a{i+1,2}=qualityscore;
    end
    print_BRISQUE(a,img_dir)
end
%指令:BRISQUE('路徑')
%BRISQUE('D:\108resercher\====######RESEARCH######====\GAN-research\12.15-meeting\無LM嵌密結果\100%MOD3\_Stego')
