function ttPhuWrite(t,LPP,RPP,LZP,RZP,LPP2,RPP2,LZP2,RZP2,cot_end,hang_end,n,m)   
    fileID = fopen('ttPhu.txt','w');
    fprintf(fileID,'%d\n',LPP);
    fprintf(fileID,'%d\n',RPP);
    fprintf(fileID,'%d\n',LZP);
    fprintf(fileID,'%d\n',RZP);
    fprintf(fileID,'%d\n',LPP2);
    fprintf(fileID,'%d\n',RPP2);
    fprintf(fileID,'%d\n',LZP2);
    fprintf(fileID,'%d\n',RZP2);
    fprintf(fileID,'%d\n',cot_end);
    fprintf(fileID,'%d\n',hang_end);
    fprintf(fileID,'%d\n',n);
    fprintf(fileID,'%d\n',m);
    fprintf(fileID,'%d\n',t);
    fclose(fileID);
end