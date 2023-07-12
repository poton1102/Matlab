function [FL] = FL(I)
% FL của cả hình [FL] = FL(I)
I=double(I);
[hang,cot]=size(I);

FL=zeros(hang-1,cot-1);

for hg=1:hang-1
    for ct=1:cot-1
        a=[I(hg,ct+1),I(hg+1,ct+1),I(hg+1,ct)];
        FL(hg,ct)=max(a)-min(a);
    end
end
end

