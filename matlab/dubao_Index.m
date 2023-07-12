function [dubaoi] = dubao_Index(I,hg,ct)

I=double(I);



        if I(hg+1,ct+1)>=max(I(hg,ct+1),I(hg+1,ct))
            dubaoi(hg,ct)=min(I(hg,ct+1),I(hg+1,ct));
        
        elseif I(hg+1,ct+1)<=min(I(hg,ct+1),I(hg+1,ct))
            dubaoi(hg,ct)=max(I(hg,ct+1),I(hg+1,ct));
        
        else

            dubaoi(hg,ct)=I(hg,ct+1)+I(hg+1,ct)-I(hg+1,ct+1);
        end


end

