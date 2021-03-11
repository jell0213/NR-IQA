function print_BRISQUE(a,img_dir)
    OutputXlsPath = strcat(img_dir, '\BRISQUEµ²ªG.xls');
    xlsFile = OutputXlsPath;
    xlswrite(xlsFile, a);
    dos(['start ' OutputXlsPath]);
end