function [ Amid ] = SepMedfilt( A, len)
[r,c]=size(A);
AmidR=zeros(r,c);
Amid=zeros(r,c);
for i=1:r
    AmidR(i,:)=medfilt1(A(i,:),len);
end

for j=1:c
    Amid(:,j)=medfilt1(AmidR(:,j),len);
end
