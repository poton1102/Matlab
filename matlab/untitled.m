I=imread('lena.bmp');
I=double(I);


FLL=FLof(I);
[fl,~,~]=FL_Index(I,26,51)

Idubao=dubao(I);

e=E_Index(I,26,51)



[hang,cot]=size(I);
% [FLI]=FLof(I);


[E]=Eof(I,Idubao);

t=1;


% fl=[];

E1=[];
for hg=1:hang-1
    for ct=1:cot-1
        [FL] = FL_Index(I,hg,ct);
        if (FL>=t) && (FL<t+1)
             E1=[E1,E(hg,ct)];
%              
%              fl=[fl,FL];
        end
    end
end

% h=0;
% c=0;
% 
% for hg=1:hang-1
%     for ct=1:cot-1
%         [FL] = FL_Index(I,hg,ct);
%         if  E(hg,ct)==54
%             FL
%             h=hg;
%             c=ct;
%         end
%     end
% end


count=0;
for i=1: size(E1,2)
    if E1(1,i)==4
        
        count=count+1;
    end
end
count

% bị dãn số khi vào histogram  1->1 2->3
 hE=histogram(E1);
 hE.BinWidth = 1;
 hsE=hE.Values;
 gtmin=min(min(hE.Data));

 
hsmax=max(hsE);


% lpp=-1;%vị trí max trái trong hsE
% rpp=-1;%vị trí max phải trong hsE
% 
% %lpp,rpp
% for i=1: size(hsE,2)
%     if (hsE(1,i)== hsmax)&&(lpp==-1) 
%         lpp=i;
%         
%     elseif (hsE(1,i)== hsmax)&&(lpp~=-1) 
%         rpp=i;
%         break
%     end
% end
% 
% if rpp==-1
%     if max(hsE(1:lpp-1)) >= max(hsE(lpp+1:size(hsE,2)))
%         rpp=lpp;
%         for i=1:rpp  
%             if (hsE(1,i)== max(hsE(1:lpp-1)))
%                 lpp=i;
%                 break
%             end
%             
%         end
%     elseif max(hsE(1:lpp-1))< max(hsE(lpp+1:size(hsE,2)))
%         for i=lpp+1:size(hsE,2)   
%             if hsE(1,i)== max(hsE(lpp+1:size(hsE,2)))
%                 rpp=i;
%                 break
%             end
%         end
%         
%     end
% end
% gtminl=0;
% %lzp,rzp
% if lpp~=1
%     [gtminl,lzp]=min(hsE(1:lpp-1));
% else
%     lzp=0;
% end
% 
% [gtminr,rzp]=min(hsE(rpp+1:size(hsE,2)));
% if (gtminl>0)%min >0 chuyển min về vị trí-1
%     lzp=-1;
% end
% if (gtminr>0)
%     rzp=size(hsE,2)+1;
% else
%     rzp=rpp+rzp;
% end
% 
% LPP=gtmin+lpp-1;
% RPP=gtmin+rpp-1;
% LZP=gtmin+lzp-1;
% RZP=gtmin+rzp-1;
% 
% kha_nang_nhung=hsE(lpp)+hsE(rpp)