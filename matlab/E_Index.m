function [E] = E_Index(I,hg,ct)
% I=imread('lena.bmp');
I=double(I);
% hg=2;ct=2;


dubaoi=0;

if I(hg+1,ct+1)>=max(I(hg,ct+1),I(hg+1,ct))
    dubaoi=min(I(hg,ct+1),I(hg+1,ct));

elseif I(hg+1,ct+1)<=min(I(hg,ct+1),I(hg+1,ct))
    dubaoi=max(I(hg,ct+1),I(hg+1,ct));

else
    dubaoi=I(hg,ct+1)+I(hg+1,ct)-I(hg+1,ct+1);
end
E=I(hg,ct)-dubaoi;


end

