% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;
% carrega a imagem
I = imread('mandrill_gray.bmp');
% reduz a imagem em um quarto do tamanho original
S = imresize(I,0.25);
figure; imshow(S);
imwrite(S,'mandrill_small.bmp');
% amplia a imagem reduzida para o mesmo tamanho da original
B = imresize(S,4);
figure; imshow(B);
imwrite(B,'mandrill_big.bmp');
% rotaciona a imagem em 30º
G = imrotate(I,30);
figure; imshow(G);
imwrite(G,'mandrill_30.bmp');
% rotaciona a imagem em 180º
G = imrotate(I,180);
figure; imshow(G);
imwrite(G,'mandrill_180.bmp');
% rotaciona a imagem quatro vezes em 90º
G = imrotate(I,90);
G = imrotate(G,90);
G = imrotate(G,90);
G = imrotate(G,90);
figure; imshow(G);
imwrite(G,'mandrill_90.bmp');