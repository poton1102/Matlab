function [dlTrich]=t2_trich(I2,ttPhu,typedl)
    %I2=imread(I2);
    [t,LPP,RPP,LZP,RZP,LPP2,RPP2,LZP2,RZP2,cot_end,hang_end,n,m]=ttPhuRead(ttPhu);

    I2=double(I2);
    [Idubao2]=dubao(I2);
    [E2]=E_I(I2,Idubao2);

    sss=[];
    hg=hang_end;


    for ct=cot_end:-1:1
        [FL] = FL_Index(I2,hang_end,ct);
        if (((E_Index(I2,hg,ct)==LPP)||(E_Index(I2,hg,ct)==RPP))&&(FL>=t) && (FL<t+1))||(((E_Index(I2,hg,ct)==LPP2)||(E_Index(I2,hg,ct)==RPP2))&&(FL>=t+1) && (FL<t+2))
            sss=[sss,'0'];
        elseif (((E_Index(I2,hg,ct)==LPP-1)||(E_Index(I2,hg,ct)==RPP+1))&&(FL>=t) && (FL<t+1))||(((E_Index(I2,hg,ct)==LPP2-1)||(E_Index(I2,hg,ct)==RPP2+1))&&(FL>=t+1) && (FL<t+2))
            sss=[sss,'1'];
        end 
        if ((E_Index(I2,hg,ct)<=LPP-1)&&(E_Index(I2,hg,ct)>=LZP)&&(FL>=t) && (FL<t+1))||((E_Index(I2,hg,ct)<=LPP2-1)&&(E_Index(I2,hg,ct)>=LZP2)&&(FL>=t+1) && (FL<t+2))
            I2(hg,ct)=I2(hg,ct)+1;
        elseif ((E_Index(I2,hg,ct)<=RZP)&&(E_Index(I2,hg,ct)>=RPP+1)&&(FL>=t) && (FL<t+1))||((E_Index(I2,hg,ct)<=RZP2)&&(E_Index(I2,hg,ct)>=RPP2+1)&&(FL>=t+1) && (FL<t+2))
            I2(hg,ct)=I2(hg,ct)-1;

        end
    end
    for hg=hang_end-1:-1:1
    for ct=size(I2,2)-1:-1:1
        [FL] = FL_Index(I2,hg,ct);% fl của gốc

        if (((E_Index(I2,hg,ct)==LPP)||(E_Index(I2,hg,ct)==RPP))&&(FL>=t) && (FL<t+1))||(((E_Index(I2,hg,ct)==LPP2)||(E_Index(I2,hg,ct)==RPP2))&&(FL>=t+1) && (FL<t+2))
            sss=[sss,'0'];
        elseif (((E_Index(I2,hg,ct)==LPP-1)||(E_Index(I2,hg,ct)==RPP+1))&&(FL>=t) && (FL<t+1))||(((E_Index(I2,hg,ct)==LPP2-1)||(E_Index(I2,hg,ct)==RPP2+1))&&(FL>=t+1) && (FL<t+2))
            sss=[sss,'1'];
        end 
        if ((E_Index(I2,hg,ct)<=LPP-1)&&(E_Index(I2,hg,ct)>=LZP)&&(FL>=t) && (FL<t+1))||((E_Index(I2,hg,ct)<=LPP2-1)&&(E_Index(I2,hg,ct)>=LZP2)&&(FL>=t+1) && (FL<t+2))
            I2(hg,ct)=I2(hg,ct)+1;
        elseif ((E_Index(I2,hg,ct)<=RZP)&&(E_Index(I2,hg,ct)>=RPP+1)&&(FL>=t) && (FL<t+1))||((E_Index(I2,hg,ct)<=RZP2)&&(E_Index(I2,hg,ct)>=RPP2+1)&&(FL>=t+1) && (FL<t+2))
            I2(hg,ct)=I2(hg,ct)-1;

        end
    end
    end



    % % bin ->str
    bin2=[];
    for c=size(sss,2):-1:1
        bin2=[bin2,sss(c)];
    end
    if(typedl==1)
        bin=[];
        index=1;
        for i=1:n
            for j=1:m
                bin(i,j)=str2num(bin2(index));
                index=index+1;
            end
        end
        bin=logical(bin);
        dlTrich=bin;
    elseif(typedl==0)
        str=[];
        for i=1:8:size(bin2,2)
            kp=bin2(1,i:i+7);
            kj=bin2dec(kp);
            kkj=char(kj);
            str=[str,kkj];
        end
        dlTrich=str;
    end
    
    
end