function [ImgOut,sizedl,knn]=t2(t,dlnhung,I,n,m)
    %s='Lunar New Year Festival often falls between late January and early February; it is among the most important holidays in Vietnam. Officially, the festival includes the 1st, 2nd, and 3rd day in Lunar Calendar; however, Vietnamese people often spend nearly a month celebrating this special event. Tet Holiday gets its beginning marked with the first day in the Lunar Year; however, its preparation starts long before that.';
    % s='xin chao moi nguoi';    
    [bin] = dlnhung;
    k=1;

    %I=imread(I);
    I2=uint8(I);
    [hang,cot]=size(I);
    % [FLI]=FLof(I);

    Idubao=dubao(I);
    [E]=E_I(I,Idubao);
    %%
    % 
    %  

    sizedl=size(bin,2);
    [LPP,RPP,LZP,RZP,kha_nang_nhung] = E_T(I,E,t);
    [LPP2,RPP2,LZP2,RZP2,kha_nang_nhung2] = E_T(I,E,t+1);
    knn=kha_nang_nhung+kha_nang_nhung2;
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
            if ((LZP<E(hg,ct))&&(LPP>E(hg,ct))&&(FL>=t) && (FL<t+1))||((LZP2<E(hg,ct))&&(LPP2>E(hg,ct))&&(FL>=t+1) && (FL<t+2))
                I2(hg,ct) = I(hg,ct)-1;
            elseif ((RZP>E(hg,ct))&&(RPP<E(hg,ct))&&(FL>=t) && (FL<t+1))||((RZP2>E(hg,ct))&&(RPP2<E(hg,ct))&&(FL>=t+1) && (FL<t+2))
                I2(hg,ct) = I(hg,ct)+1;
            elseif ((((RPP==E(hg,ct)) ||(LPP==E(hg,ct)) )&&(FL>=t) && (FL<t+1))|| (((RPP2==E(hg,ct)) ||(LPP2==E(hg,ct)) )&&(FL>=t+1) && (FL<t+2)))    && (bin(k)=='0')
                k=k+1;
                I2(hg,ct) = I(hg,ct);
            elseif (((RPP==E(hg,ct)) &&(FL>=t) && (FL<t+1))|| ((RPP2==E(hg,ct)) &&(FL>=t+1) && (FL<t+2))   )&& (bin(k)~='0')
                k=k+1;
                I2(hg,ct) = I(hg,ct)+1;
            elseif (((LPP==E(hg,ct)) &&(FL>=t) && (FL<t+1))|| ((LPP2==E(hg,ct)) &&(FL>=t+1) && (FL<t+2))   )&& (bin(k)~='0')
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
    ttPhuWrite(t,LPP,RPP,LZP,RZP,LPP2,RPP2,LZP2,RZP2,cot_end,hang_end,n,m);
    imwrite(I2,'trich.bmp');
    ImgOut=imread('trich.bmp');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% trich
