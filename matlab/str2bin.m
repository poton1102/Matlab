function [bin] = str2bin(s)
% chuỗi s chuyển thành vector nhị phân bin
d=dec2bin(s,8);
bin=[];
for i=1:size(d,1)
    bin=[bin,d(i,1:8)];
end
end

