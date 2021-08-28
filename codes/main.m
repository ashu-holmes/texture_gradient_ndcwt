I=imread('tiger.tif');
[r,c]=size(I);
low=[(1-4i)/76,(19-11i)/76,36/76,(19+11i)/76,(1+4i)/76];
high=[(-4+1i)/60,(9-14i)/60,26i/60,(-9-14i)/60,(4+1i)/60];
low1=[low,zeros(1)];
high1=[high,zeros(1)];
% low1=[(1-1i)/10,(4-1i)/10,(4+1i)/10,(1+1i)/10];
% high1=[(-1-2i)/14,(5+2i)/14,(-5+2i)/14,(1-2i)/14];
[A,H,V,D]=swt2(I,3,low1,high1);
RealH=real(H);
ImagH=imag(H);
RealV=real(V);
ImagV=imag(V);
RealD=real(D);
ImagD=imag(D);
RealA=real(A);
ImagA=imag(A);

H1=abs(H(:,:,1));
H2=abs(H(:,:,2));
H3=abs(H(:,:,3));
% Hi1=abs(IH(:,:,1));
% Hi2=abs(ImagH(:,:,2));
% Hi3=abs(ImagH(:,:,3));
V1=abs(V(:,:,1));
V2=abs(V(:,:,2));
V3=abs(V(:,:,3));
% Vi1=abs(ImagV(:,:,1));
% Vi2=abs(ImagV(:,:,2));
% Vi3=abs(ImagV(:,:,3));
D1=abs(D(:,:,1));
D2=abs(D(:,:,2));
D3=abs(D(:,:,3));
A3=abs(A(:,:,3));



st= strel('square',2);

% H1mod=Conversion(H1);
% H2mod=Conversion(H2);
% H3mod=Conversion(H3);
% % Hi1mod=Conversion(Hi1);
% % Hi2mod=Conversion(Hi2);
% % Hi3mod=Conversion(Hi3);
% V1mod=Conversion(V1);
% V2mod=Conversion(V2);
% V3mod=Conversion(V3);
% % Vi1mod=Conversion(Vi1);
% % Vi2mod=Conversion(Vi2);
% % Vi3mod=Conversion(Vi3);
% D1mod=Conversion(D1);
% D2mod=Conversion(D2);
% D3mod=Conversion(D3);
% A3mod=Conversion(A3);

% figure,imshow(uint8(H1mod));
% B1=SepMedfilt(H1mod,2^(1+2));
B1=SepMedfilt(double(H1),2^(1+2));
% figure, imshow(uint8(B1));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
% figure, imshow(uint8(S1));
%P1= fspecial('sobel');
%Q1= imfilter(S1,P1,'same');
% figure, imshow(uint8(Q1));
n1 = norm(B1,2);
T1=abs(Q1);
% figure, imshow(T1,[]);


%B1=SepMedfilt(H2mod,2^(2+1));
B1=SepMedfilt(double(H2),2^(2+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%G1d=imdilate(S1,st);
%G1e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G1d-G1e;
%Q1= imfilter(S1,P1,'same');
n2 = norm(B1);
T2=abs(Q1);


% B1=SepMedfilt(H3mod,2^(3+2));
B1=SepMedfilt(double(H3),2^(3+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%G1d=imdilate(S1,st);
%G1e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G1d-G1e;
%Q1= imfilter(S1,P1,'same');
n3 = norm(B1);
T3=abs(Q1);


% B1=medfilt2(Hi1mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n4 = norm(B1);
% T4=abs(Q1);
% 
% 
% B1=medfilt2(Hi2mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n5 = norm(B1);
% T5=abs(Q1);
% 
% 
% B1=medfilt2(Hi3mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n6 = norm(B1);
% T6=abs(Q1);

% 
% B1=SepMedfilt(V1mod,2^(1+2));
B1=medfilt2(V1,[2^(1+2) 2^(1+2)]);
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%Q1= imfilter(S1,P1,'same');
%G2d=imdilate(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%G2e=imerode(S1,st);
%Q1=G2d-G2e;
n7 = norm(B1);
T7=abs(Q1);


% B1=SepMedfilt(V2mod,2^(2+2));
B1=SepMedfilt(double(V2),2^(2+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%Q1= imfilter(S1,P1,'same');
%G3d=imdilate(S1,st);
%G3e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G3d-G3e;
n8 = norm(B1);
T8=abs(Q1);

% B1=SepMedfilt(V3mod,2^(3+2));
B1=SepMedfilt(double(V3),2^(3+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%Q1= imfilter(S1,P1,'same');
%G4d=imdilate(S1,st);
%G4e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G4d-G4e;
n9 = norm(B1);
T9=abs(Q1);


% B1=medfilt2(Vi1mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n10 = norm(B1);
% T10=abs(Q1);
% 
% B1=medfilt2(Vi2mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n11 = norm(B1);
% T11=abs(Q1);
% 
% 
% B1=medfilt2(Vi3mod);
% G1= fspecial('gaussian',[7 7],5);
% S1= imfilter(B1,G1,'same');
% P1= fspecial('sobel');
% Q1= imfilter(S1,P1,'same');
% n12 = norm(B1);
% T12=abs(Q1);

% B1=SepMedfilt(D1mod,2^(1+2));
B1=medfilt2(D1,[2^(1+2) 2^(1+2)]);
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%G5d=imdilate(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%G5e=imerode(S1,st);
%Q1=G5d-G5e;
%Q1= imfilter(S1,P1,'same');
n13 = norm(B1);
T13=abs(Q1);


% B1=SepMedfilt(D2mod,2^(2+2));
B1=SepMedfilt(double(D2),2^(2+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%G6d=imdilate(S1,st);
%G6e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G6d-G6e;
%Q1= imfilter(S1,P1,'same');
n14 = norm(B1);
T14=abs(Q1);
% 
% B1=SepMedfilt(D3mod, 2^(3+2));
B1=SepMedfilt(double(D3),2^(3+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%G7d=imdilate(S1,st);
%G7e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G7d-G7e;
%P1= fspecial('sobel');
%Q1= imfilter(S1,P1,'same');
n15 = norm(B1);
T15=abs(Q1);


% B1=SepMedfilt(A3mod,2^(3+2));
B1=SepMedfilt(double(A3),2^(3+2));
G1= fspecial('gaussian',[7 7],5);
S1= imfilter(B1,G1,'same');
%P1= fspecial('sobel');
%G8d=imdilate(S1,st);
%G8e=imerode(S1,st);
[Gx, Gy] = imgradientxy(S1);
[Q1, Gdir] = imgradient(Gx, Gy);
%Q1=G8d-G8e;
%Q1= imfilter(S1,P1,'same');
n16 = norm(B1);
T16=abs(Q1);

W=abs(T1/n1)+abs(T2/n2)+abs(T3/n3)+abs(T7/n7)+abs(T8/n8)+abs(T9/n9)+abs(T13/n13)+abs(T14/n14)+abs(T15/n15)+abs(T16/n16);
figure,imshow(W,[]);

my_image = W;
for R=1:size(my_image,1)
    for C=1:size(my_image,2)
        pixel=my_image(R,C);
        if pixel<0.02 , pixel=0.000000000; 
    end
        my_image(R,C)=pixel;
    end
end
figure,imshow(my_image,[]);