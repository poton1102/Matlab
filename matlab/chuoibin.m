function [bin]=chuoibin(bin)
str='';
for i=1:2
    for j=1:4
        str=strcat(str,int2str(bin(i,j)));
    end
end
bin=str;
end
        
    