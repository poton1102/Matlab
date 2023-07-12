function [LPP,RPP,LZP,RZP,kha_nang_nhung] = E_T(I,E,t)

% E của chuỗi T

I=double(I);
[hang,cot]=size(I);

fl=[];

E1=[];
% t=9;
for hg=1:hang-1
    for ct=1:cot-1
        [FL] = FL_Index(I,hg,ct);
        if (FL>=t) && (FL<t+1)
             E1=[E1,E(hg,ct)];
%              
             fl=[fl,FL];
        end
%       
%         if (FL(hg,ct)>=t) && (FL(hg,ct)<t+4)
%             E1=[E1;E(hg,ct)];
%         end
    end
end
% [X]=histogrambyT(E1);

[LPP,RPP,LZP,RZP,kha_nang_nhung] = thongtinphuE(E1);
end
