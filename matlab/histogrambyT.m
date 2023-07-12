function [X] = histogrambyT(I)
    %vào ma trận i ra ma trận x
    I=uint8(I);

    [n,m] = size(I);%lấy size
        
    X=zeros(1,256);%ma trân 1*256 toàn 0  :0->255
    %hàng1
    for j=1:m %j=9 tới m:cột % 8bit thấp lưu peak
        X(I(1,j)+1)=X(I(1,j)+1)+1;% x((i:hang 1 cot j) +1)=x((i:hang 1 cot j) +1)+1
    end   
    for i=2:n %hàng2=>n 
        for j=1:m
            X(I(i,j)+1)=X(I(i,j)+1)+1;
        end 
    end
    

end

