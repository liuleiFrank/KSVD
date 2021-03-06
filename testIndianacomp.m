clear;
close all;
clc;
% load Dic_indiana_reduceMeans.mat;    %data-compression rate: Dic_8L-8,Dic_4L-16,Dict_2L-32 
load trainDicPan16_16;
addpath('d:\m_sou_file\comprassive_imag_for_KSVD\ksvdbox10\');
blokSize = 16;
blokSizes=[blokSize,blokSize];
K=size(Dksvd,2);

% [PicName,PathName,~] = uigetfile('d:\m_sou_file\杨老师的遥感数据\*.*','Selcet a file');
% if(PicName == 0)
%     return;
% end
% PicStr = [PathName,PicName];
% [~, fname, ext] = fileparts(PicStr);
% Pic = imread(PicStr);
load indianarep.mat;
Pic = indianarep;
band = 188;
fname = 'indiana';

imgSize = size(Pic);
dim = length(imgSize);

tic;
if(dim==3)
    j = 1;
    numblokClo = ceil(imgSize(1)/blokSize)*ceil(imgSize(2)/blokSize);
    blocks = zeros(prod(blokSizes),numblokClo*imgSize(3));
    for i = 1:imgSize(3)
        blocks(:,j:j + numblokClo - 1) = im2col(Pic(:,:,i),blokSizes,'distinct'); 
        j = j + numblokClo;
    end
else
    blocks = im2col(Pic,blokSizes,'distinct');                                     %divide the pic into blocks for KSVD
end
blocks = double(blocks);
CloumnMeans = mean(blocks);
blocks = blocks - repmat(mean(blocks),prod(blokSizes),1);
t = toc;
disp([' turn to block: ',num2str(t)]);


%% KSVD reconstruct

params.data = blocks;
params.memusage = 'high';
params.initdict = Dksvd;
Dksvd = normc(Dksvd);

% L = 32;
% params.Tdata = L;
% 
% tic;
% % coeffice=OMP(Dksvd,blocks,L);                                                    %sparse coding
% coeffice = SparseCode(params);  
% 
% t = toc;
% disp([' Sparse Code: ',num2str(t)]);
% 
% 
% tic;
% [row,cloumn,coe] = find(coeffice);
% 
% coe1 =round(coe);
% index = find(coe1~=0);
% coe2 = coe1(index);
% 
% Min = min(coe2(:));
% Max = max(coe2(:));
% coe21 = linerGary(coe2,0,255)+1;
% 
% [zippedCoeLarge, infoCoeLarge] = huffencode(coe21);
% 
% row1 = row(index);
% [zippedRow, infoRow] = huffencode(row1);
% 
% cloumn1 = cloumn(index);
% % [zippedClo, infoClo] = huffencode(cloumn1);
% t = toc;
% disp([' encode: ',num2str(t)]);
% 
% coe3 = huffdecode(zippedCoeLarge, infoCoeLarge);
% coe3 = double(coe3);
% coe3 = linerGary(coe3-1,Min,Max);
% coe3 = round(coe3);
% 
% row2 = huffdecode(zippedRow, infoRow);
% 
% % cloumn2 = huffdecode(zippedClo, infoClo);
% cloumn2 = cloumn1;
% 
% disp(isequal(coe2(:),coe3(:)));
% 
% 
% [mm,nn]=size(coeffice);
% coeffice1 = sparse(row2,cloumn2,coe3,mm,nn);
% 
% reBlock = Dksvd*coeffice1;
% reBlock = reBlock + repmat(CloumnMeans,prod(blokSizes),1);
% if(exist('numblokClo','var'))
%     j = 1;
%     reconstKSVD = zeros(imgSize);
%     for i = 1:imgSize(3)
%         reconstKSVD(:,:,i) = col2im(reBlock(:,j:j + numblokClo-1),blokSizes,size(Pic),'distinct');
%         j = j + numblokClo;
%     end
% else
%     reconstKSVD = col2im(reBlock,blokSizes,size(Pic),'distinct');                  %combine blocks into pic
% end
% reconstKSVD = uint8(reconstKSVD);
% [PSNROutKsvd,~] = psnr(reconstKSVD,Pic);
% 
% 
% Ratio = blokSize*blokSize/L;
% fileName = [fname,'_',num2str(Ratio),'.jp2'];
% jp2write(Pic,fileName,'rate',1/Ratio,'bitdepth',8);
% 
% figure(1);
% imshow(Pic,[]);
% title('the pervious image');
% 
% figure(2);
% JEPG2000Pic = jp2read(fileName);
% imshow(JEPG2000Pic,[]);
% 
% [PSNROutJEPG2000,~] = psnr(JEPG2000Pic,Pic);
% title([' JEPG2000 (compression ratio: 8) ',num2str(PSNROutJEPG2000),'db ']);
% 
% figure(3);
% imshow(reconstKSVD,[]);
% % title(['the recovery image by K-SVD ',num2str(PSNROutKsvd),'db ',num2str(bpp),'bpp']);
% title([' K-SVD (compression ratio: 8) ',num2str(PSNROutKsvd),'db ']);

% L = 16;
L = 107;
params.Tdata = L;

tic;
% coeffice=OMP(Dksvd,blocks,L);                                                    %sparse coding
coeffice = SparseCode(params);  

t = toc;
disp([' Sparse Code: ',num2str(t)]);


tic;
[row,cloumn,coe] = find(coeffice);

coe1 =round(coe);
index = find(coe1~=0);
coe2 = coe1(index);

Min = min(coe2(:));
Max = max(coe2(:));
coe21 = linerGary(coe2,0,255)+1;

[zippedCoeLarge, infoCoeLarge] = huffencode(coe21);

row1 = row(index);
[zippedRow, infoRow] = huffencode(row1);

cloumn1 = cloumn(index);
% [zippedClo, infoClo] = huffencode(cloumn1);
t = toc;
disp([' encode: ',num2str(t)]);

coe3 = huffdecode(zippedCoeLarge, infoCoeLarge);
coe3 = double(coe3);
coe3 = linerGary(coe3-1,Min,Max);
coe3 = round(coe3);

row2 = huffdecode(zippedRow, infoRow);

% cloumn2 = huffdecode(zippedClo, infoClo);
cloumn2 = cloumn1;

disp(isequal(coe2(:),coe3(:)));


[mm,nn]=size(coeffice);
coeffice1 = sparse(row2,cloumn2,coe3,mm,nn);

reBlock = Dksvd*coeffice1;
reBlock = reBlock + repmat(CloumnMeans,prod(blokSizes),1);

if(exist('numblokClo','var'))
    j = 1;
    reconstKSVD = zeros(imgSize);
    for i = 1:imgSize(3)
        reconstKSVD(:,:,i) = col2im(reBlock(:,j:j + numblokClo-1),blokSizes,size(Pic),'distinct');
        j = j + numblokClo;
    end
else
    reconstKSVD = col2im(reBlock,blokSizes,size(Pic),'distinct');                  %combine blocks into pic
end
reconstKSVD = reshape(reconstKSVD,145*145,length(sInd))*C(sInd,:);
reconstKSVD = reshape(reconstKSVD,145,145,200);
reconstKSVD = uint8(reconstKSVD);
% [PSNROutKsvd,~] = psnr(reconstKSVD,Pic);
[PSNROutKsvd,~] = psnr(reconstKSVD,indiana);


Ratio = blokSize*blokSize/L;
fileName = [fname,'_',num2str(Ratio),'.jp2'];
JEPG2000Pic = uint8(zeros(145,145,length(sInd)));
for i = 1:length(sInd)
    jp2write(Pic(:,:,i),fileName,'rate',1/Ratio,'bitdepth',8);
    JEPG2000Pic(:,:,i) = jp2read(fileName);
end
JEPG2000Pic = double(JEPG2000Pic);
JEPG2000Pic = reshape(JEPG2000Pic,145*145,length(sInd))*C(sInd,:);
JEPG2000Pic = reshape(JEPG2000Pic,145,145,200);
JEPG2000Pic = uint8(JEPG2000Pic);

figure(4);
imshow(JEPG2000Pic(:,:,band),[]);
[PSNROutJEPG2000,~] = psnr(JEPG2000Pic,indiana);
title([' JEPG2000 (compression ratio: 16) ',num2str(PSNROutJEPG2000),'db ']);

figure(5);
% imshow(reconstKSVD,[]);
imshow(reconstKSVD(:,:,band),[]);
% title(['the recovery image by K-SVD ',num2str(PSNROutKsvd),'db ',num2str(bpp),'bpp']);
title([' K-SVD (compression ratio: 16) ',num2str(PSNROutKsvd),'db ']);


% L = 8;
L = 53;
params.Tdata = L;

tic;
% coeffice=OMP(Dksvd,blocks,L);                                                    %sparse coding
coeffice = SparseCode(params);  

t = toc;
disp([' Sparse Code: ',num2str(t)]);


tic;
[row,cloumn,coe] = find(coeffice);

coe1 =round(coe);
index = find(coe1~=0);
coe2 = coe1(index);

Min = min(coe2(:));
Max = max(coe2(:));
coe21 = linerGary(coe2,0,255)+1;

[zippedCoeLarge, infoCoeLarge] = huffencode(coe21);

row1 = row(index);
[zippedRow, infoRow] = huffencode(row1);

cloumn1 = cloumn(index);
% [zippedClo, infoClo] = huffencode(cloumn1);
t = toc;
disp([' encode: ',num2str(t)]);

coe3 = huffdecode(zippedCoeLarge, infoCoeLarge);
coe3 = double(coe3);
coe3 = linerGary(coe3-1,Min,Max);
coe3 = round(coe3);

row2 = huffdecode(zippedRow, infoRow);

% cloumn2 = huffdecode(zippedClo, infoClo);
cloumn2 = cloumn1;

disp(isequal(coe2(:),coe3(:)));


[mm,nn]=size(coeffice);
coeffice1 = sparse(row2,cloumn2,coe3,mm,nn);

reBlock = Dksvd*coeffice1;
reBlock = reBlock + repmat(CloumnMeans,prod(blokSizes),1);

if(exist('numblokClo','var'))
    j = 1;
    reconstKSVD = zeros(imgSize);
    for i = 1:imgSize(3)
        reconstKSVD(:,:,i) = col2im(reBlock(:,j:j + numblokClo-1),blokSizes,size(Pic),'distinct');
        j = j + numblokClo;
    end
else
    reconstKSVD = col2im(reBlock,blokSizes,size(Pic),'distinct');                  %combine blocks into pic
end
reconstKSVD = reshape(reconstKSVD,145*145,length(sInd))*C(sInd,:);
reconstKSVD = reshape(reconstKSVD,145,145,200);
reconstKSVD = uint8(reconstKSVD);
% [PSNROutKsvd,~] = psnr(reconstKSVD,Pic);
[PSNROutKsvd,~] = psnr(reconstKSVD,indiana);

Ratio = blokSize*blokSize/L;
fileName = [fname,'_',num2str(Ratio),'.jp2'];
JEPG2000Pic = uint8(zeros(145,145,length(sInd)));
for i = 1:length(sInd)
    jp2write(Pic(:,:,i),fileName,'rate',1/Ratio,'bitdepth',8);
    JEPG2000Pic(:,:,i) = jp2read(fileName);
end
JEPG2000Pic = double(JEPG2000Pic);
JEPG2000Pic = reshape(JEPG2000Pic,145*145,length(sInd))*C(sInd,:);
JEPG2000Pic = reshape(JEPG2000Pic,145,145,200);
JEPG2000Pic = uint8(JEPG2000Pic);

figure(6);
imshow(JEPG2000Pic(:,:,band),[]);
[PSNROutJEPG2000,~] = psnr(JEPG2000Pic,indiana);
title([' JEPG2000 (compression ratio: 32) ',num2str(PSNROutJEPG2000),'db ']);

figure(7);
% imshow(reconstKSVD,[]);
imshow(reconstKSVD(:,:,band),[]);
% title(['the recovery image by K-SVD ',num2str(PSNROutKsvd),'db ',num2str(bpp),'bpp']);
title([' K-SVD (compression ratio: 32) ',num2str(PSNROutKsvd),'db ']);


% L = 4;
L = 27;
params.Tdata = L;

tic;
% coeffice=OMP(Dksvd,blocks,L);                                                    %sparse coding
coeffice = SparseCode(params);  

t = toc;
disp([' Sparse Code: ',num2str(t)]);


tic;
[row,cloumn,coe] = find(coeffice);

coe1 =round(coe);
index = find(coe1~=0);
coe2 = coe1(index);

Min = min(coe2(:));
Max = max(coe2(:));
coe21 = linerGary(coe2,0,255)+1;

[zippedCoeLarge, infoCoeLarge] = huffencode(coe21);

row1 = row(index);
[zippedRow, infoRow] = huffencode(row1);

cloumn1 = cloumn(index);
% [zippedClo, infoClo] = huffencode(cloumn1);
t = toc;
disp([' encode: ',num2str(t)]);

coe3 = huffdecode(zippedCoeLarge, infoCoeLarge);
coe3 = double(coe3);
coe3 = linerGary(coe3-1,Min,Max);
coe3 = round(coe3);

row2 = huffdecode(zippedRow, infoRow);

% cloumn2 = huffdecode(zippedClo, infoClo);
cloumn2 = cloumn1;

disp(isequal(coe2(:),coe3(:)));


[mm,nn]=size(coeffice);
coeffice1 = sparse(row2,cloumn2,coe3,mm,nn);

reBlock = Dksvd*coeffice1;
reBlock = reBlock + repmat(CloumnMeans,prod(blokSizes),1);

if(exist('numblokClo','var'))
    j = 1;
    reconstKSVD = zeros(imgSize);
    for i = 1:imgSize(3)
        reconstKSVD(:,:,i) = col2im(reBlock(:,j:j + numblokClo-1),blokSizes,size(Pic),'distinct');
        j = j + numblokClo;
    end
else
    reconstKSVD = col2im(reBlock,blokSizes,size(Pic),'distinct');                  %combine blocks into pic
end
reconstKSVD = reshape(reconstKSVD,145*145,length(sInd))*C(sInd,:);
reconstKSVD = reshape(reconstKSVD,145,145,200);
reconstKSVD = uint8(reconstKSVD);
% [PSNROutKsvd,~] = psnr(reconstKSVD,Pic);
[PSNROutKsvd,~] = psnr(reconstKSVD,indiana);

Ratio = blokSize*blokSize/L;
fileName = [fname,'_',num2str(Ratio),'.jp2'];
JEPG2000Pic = uint8(zeros(145,145,length(sInd)));
for i = 1:length(sInd)
    jp2write(Pic(:,:,i),fileName,'rate',1/Ratio,'bitdepth',8);
    JEPG2000Pic(:,:,i) = jp2read(fileName);
end
JEPG2000Pic = double(JEPG2000Pic);
JEPG2000Pic = reshape(JEPG2000Pic,145*145,length(sInd))*C(sInd,:);
JEPG2000Pic = reshape(JEPG2000Pic,145,145,200);
JEPG2000Pic = uint8(JEPG2000Pic);

figure(8);
imshow(JEPG2000Pic(:,:,band),[]);
[PSNROutJEPG2000,~] = psnr(JEPG2000Pic,indiana);
title([' JEPG2000 (compression ratio: 64) ',num2str(PSNROutJEPG2000),'db ']);

figure(9);
% imshow(reconstKSVD,[]);
imshow(reconstKSVD(:,:,band),[]);
title([' K-SVD (compression ratio: 64) ',num2str(PSNROutKsvd),'db ']);