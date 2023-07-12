 function [LPP,RPP,LZP,RZP,kha_nang_nhung] = thongtinphuE(E)
 % [LPP,RPP,LZP,RZP] = thongtinphuE(E)
 
 
 hE=histogram(E);
 hE.BinWidth = 1;
 hsE=hE.Values;
 gtmin=min(min(hE.Data));

% LPP,RPP,LZP,RZP 

% hsE=[1,1,0,2,1,0,2,1,1];
% gtmin=-5;

hsmax=max(hsE);
lpp=-1;%vị trí max trái trong hsE
rpp=-1;%vị trí max phải trong hsE

%lpp,rpp
for i=1: size(hsE,2)
    if (hsE(1,i)== hsmax)&&(lpp==-1) 
        lpp=i;
        
    elseif (hsE(1,i)== hsmax)&&(lpp~=-1) 
        rpp=i;
        break
    end
end

if rpp==-1
    if max(hsE(1:lpp-1)) >= max(hsE(lpp+1:size(hsE,2)))
        rpp=lpp;
        for i=1:rpp  
            if (hsE(1,i)== max(hsE(1:lpp-1)))
                lpp=i;
                break
            end
            
        end
    elseif max(hsE(1:lpp-1))< max(hsE(lpp+1:size(hsE,2)))
        for i=lpp+1:size(hsE,2)   
            if hsE(1,i)== max(hsE(lpp+1:size(hsE,2)))
                rpp=i;
                break
            end
        end
        
    end
end
gtminl=0;
%lzp,rzp
if lpp~=1
    [gtminl,lzp]=min(hsE(1:lpp-1));
else
    lzp=0;
end

[gtminr,rzp]=min(hsE(rpp+1:size(hsE,2)));
if (gtminl>0)%min >0 chuyển min v�? vị trí-1
    lzp=-1;
end
if (gtminr>0)
    rzp=size(hsE,2)+1;
else
    rzp=rpp+rzp;
end

LPP=gtmin+lpp-1;
RPP=gtmin+rpp-1;
LZP=gtmin+lzp-1;
RZP=gtmin+rzp-1;
kha_nang_nhung=hsE(lpp)+hsE(rpp);
 end

