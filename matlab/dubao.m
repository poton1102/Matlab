function [I2] = dubao(I)

I=double(I);
[hang,cot]=size(I);
I2=zeros(hang-1,cot-1);

for hg=1:hang-1
    for ct=1:cot-1
        if I(hg+1,ct+1)>=max(I(hg,ct+1),I(hg+1,ct))
            I2(hg,ct)=min(I(hg,ct+1),I(hg+1,ct));
        
        elseif I(hg+1,ct+1)<=min(I(hg,ct+1),I(hg+1,ct))
            I2(hg,ct)=max(I(hg,ct+1),I(hg+1,ct));
        
        else

            I2(hg,ct)=I(hg,ct+1)+I(hg+1,ct)-I(hg+1,ct+1);
        end
    end
end

end

