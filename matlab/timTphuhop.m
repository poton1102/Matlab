function [c]=timTphuhop(I,t)
    Idubao=dubao(I);
    [E]=E_I(I,Idubao);
    [~,~,~,~,knn1] = E_T(I,E,t);
    [~,~,~,~,knn2] = E_T(I,E,t+1);
    c=knn1+knn2;
end


% end

