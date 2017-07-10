% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;
% load color image and display it
I = imread('mandrill.tif');
figure; imshow(I); %display de image
% convert it to an intensity image (gray scale)
G = rgb2gray(I);
% salvar a imagem monocromática
imwrite(G, 'mandrill_gray.bmp');
% mostrar os canais de cor
r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);
figure;
subplot(4, 1, 1); imshow(I); title('Imagem Original'); axis image tight on;
subplot(4, 1, 2); imshow(r); title('Red'); axis tight;
subplot(4, 1, 3); imshow(g); title('Green'); axis tight;
subplot(4, 1, 4); imshow(b); title('Blue'); axis tight;