im=imread('C:\Users\shekh\Documents\Projects\Image Compressor\input_img.jpg');
im = double(im)/255;
im = rgb2gray(im);
subplot(2, 1, 1)
imshow (im)
title("Original Image");
img_dct=dct2(im);
img_pow=(img_dct).^2;
img_pow=img_pow(:);
[B,index]=sort(img_pow);
B=flipud(B);
index=flipud (index);
compressed_dct=zeros(size(im));
coeff = 20000;
% maybe change the value
for k=1:coeff
compressed_dct(index(k))=img_dct(index(k));
end
im_dct=idct2(compressed_dct);
subplot(2, 1, 2)
imshow(im_dct)
title("Compressed Image");
% for saving this image use "imwrite" command
imwrite(im_dct,'compressed_imageDCT.jpg');