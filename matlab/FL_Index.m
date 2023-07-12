function [FL,max_i,min_i] = FL_Index(I,hg,ct)
% FL vị trí (hg,ct) của ma trận I 
a=[I(hg,ct+1),I(hg+1,ct+1),I(hg+1,ct)];
max_i=max(a);
min_i=min(a);
FL=max(a)-min(a);
end

