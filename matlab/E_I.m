function [E] = E_I(I,I2)
% E của cả hình :[E] = Eof(I)

% I=imread('lena.bmp');
I=double(I);
I2=double(I2);

[hang,cot]=size(I);



E=zeros(hang-1,cot-1);




for hg=1:hang-1
    for ct=1:cot-1
        E(hg,ct)=I(hg,ct)-I2(hg,ct);
    end
end

end

