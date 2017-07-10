% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;
% carrega a imagem
I = imread('clown.tif');
% definição de 8 níveis de cinza e multiplizações para obtenção da imagem
quant = 2^3-1;
Q = double(I) / (2^8);
Q = uint8(Q * quant);
Q = double(Q) / quant;
figure; imshow(Q);
imwrite(Q,'clown_8niveis.bmp'); title('8 níveis de cinza');
% mesmo processo para 4 níveis de cinza
quant = 2^2-1;
Q = double(I) / (2^8);
Q = uint8(Q * quant);
Q = double(Q) / quant;
figure; imshow(Q);
imwrite(Q,'clown_4niveis.bmp'); title('4 níveis de cinza');