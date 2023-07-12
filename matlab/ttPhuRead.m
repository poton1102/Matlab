function [t,LPP,RPP,LZP,RZP,LPP2,RPP2,LZP2,RZP2,cot_end,hang_end,n,m]=ttPhuRead(filename)
    fileID = fopen(filename,'r');
    A=fscanf(fileID,'%d');
    LPP=A(1);
    RPP=A(2);
    LZP=A(3);
    RZP=A(4);
    LPP2=A(5);
    RPP2=A(6);
    LZP2=A(7);
    RZP2=A(8);
    cot_end=A(9);
    hang_end=A(10);
    n=A(11);
    m=A(12);
    t=A(13);
end