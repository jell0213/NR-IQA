function print_ENIQA(a,img_dir)
    OutputXlsPath = strcat(img_dir, '\ENIQAµ²ªG.xls');
    xlsFile = OutputXlsPath;
    xlswrite(xlsFile, a);
    dos(['start ' OutputXlsPath]);
    %{
    OutputCSVFolder = strcat(img_dir, '\ENIQA2.csv');
    OutputCSV = fopen(OutputCSVFolder, 'w');
    %fprintf(OutputCSV, ['';'ENIQA']);
    for i=1:length(a)
        %fprintf(OutputCSV, '%d\n',i ,'%f\n',a(i));
        dlmwrite(OutputCSV, a(i), 'precision', '%.4f');
    end
    fclose(OutputCSV);
    disp('Finish generating ENIQA.csv file')
    %}    
end
