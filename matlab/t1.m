 s='kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
 %s='xin chao moi nguoi';
[bin] = str2bin(s);
k=1;

I=imread('lena.bmp');
I2=uint8(I);
[hang,cot]=size(I);
% [FLI]=FLof(I);

Idubao=dubao(I);
[E]=E_I(I,Idubao);

t=1;
[LPP,RPP,LZP,RZP,E1,fl,kha_nang_nhung] = E_T(I,E,t);

% count=0;
% for i=1:size(fl,2)
%     if fl(i)==9
%         count=count+1;
%     end
% end
hang_end=-1;
cot_end=-1;


for hg=1:hang-1
    
    for ct=1:cot-1  
        
        [FL] = FL_Index(I,hg,ct);      
        if (LZP<E(hg,ct))&&(LPP>E(hg,ct))&&(FL>=t) && (FL<t+1)
            I2(hg,ct) = I(hg,ct)-1;
        elseif (RZP>E(hg,ct))&&(RPP<E(hg,ct))&&(FL>=t) && (FL<t+1)
            I2(hg,ct) = I(hg,ct)+1;
        elseif ((RPP==E(hg,ct)) ||(LPP==E(hg,ct)) )&&(FL>=t) && (FL<t+1)&& (bin(k)=='0')
            k=k+1;
            I2(hg,ct) = I(hg,ct);
        elseif (RPP==E(hg,ct)) &&(FL>=t) && (FL<t+1)&& (bin(k)~='0')
            k=k+1;
            I2(hg,ct) = I(hg,ct)+1;
        elseif (LPP==E(hg,ct)) &&(FL>=t) && (FL<t+1)&& (bin(k)~='0')
            k=k+1;
            I2(hg,ct) = I(hg,ct)-1;
        else
            I2(hg,ct) = I(hg,ct);
        end
        if (k>size(bin,2))
            hang_end=hg;
            cot_end=ct;
            break;
        end
    end
    if (k>size(bin,2))
        hang_end=hg;
        cot_end=ct;
        break;
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% trich
I2=double(I2);
[Idubao2]=dubao(I2);
[E2]=E_I(I2,Idubao2);

sss=[];
for ct=cot_end:-1:1
    [FL] = FL_Index(I2,hang_end,ct);
    if ((E_Index(I2,hg,ct)==LPP)||(E_Index(I2,hg,ct)==RPP))&&(FL>=t) && (FL<t+1)
        sss=[sss,'0'];
    elseif ((E_Index(I2,hg,ct)==LPP-1)||(E_Index(I2,hg,ct)==RPP+1))&&(FL>=t) && (FL<t+1)
        sss=[sss,'1'];
    end 
    if (E_Index(I2,hg,ct)<=LPP-1)&&(E_Index(I2,hg,ct)>=LZP)&&(FL>=t) && (FL<t+1)
        I2(hg,ct)=I2(hg,ct)+1;
    elseif (E_Index(I2,hg,ct)<=RZP)&&(E_Index(I2,hg,ct)>=RPP+1)&&(FL>=t) && (FL<t+1)
        I2(hg,ct)=I2(hg,ct)-1;
    
    end
end
for hg=hang_end-1:-1:1
for ct=size(I2,2)-1:-1:1
    [FL] = FL_Index(I2,hg,ct);% fl của gốc
    
    if ((E_Index(I2,hg,ct)==LPP)||(E_Index(I2,hg,ct)==RPP))&&(FL>=t) && (FL<t+1)
        sss=[sss,'0'];
    elseif ((E_Index(I2,hg,ct)==LPP-1)||(E_Index(I2,hg,ct)==RPP+1))&&(FL>=t) && (FL<t+1)
        sss=[sss,'1'];
    end 
    if (E_Index(I2,hg,ct)<=LPP-1)&&(E_Index(I2,hg,ct)>=LZP)&&(FL>=t) && (FL<t+1)
        I2(hg,ct)=I2(hg,ct)+1;
    elseif (E_Index(I2,hg,ct)<=RZP)&&(E_Index(I2,hg,ct)>=RPP+1)&&(FL>=t) && (FL<t+1)
        I2(hg,ct)=I2(hg,ct)-1;
    
    end
end
end



% % bin ->str
bin2=[];
for c=size(sss,2):-1:1
    bin2=[bin2,sss(c)];
end
    

str=[];
for i=1:8:size(bin2,2)
    kp=bin2(1,i:i+7);
    kj=bin2dec(kp);
    kkj=char(kj);
    str=[str,kkj];
end