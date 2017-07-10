% Laboratório 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc;
clear all;
close all;

I = imread('boat.tif');

imshow(I); title('Imagem original'); figure; 

A = my_histeq(I);
imshow(A); title('Imagem equalizada'); figure;

[alt, lar] = size(I);
h1 = my_hist(I); h2 = my_hist(A);
hnorm1 = h1/(alt*lar); hnorm2 = h2/(alt*lar);
tam = 1:length(h1);

subplot(1,2,1); stem(tam,hnorm1); title('Imagem original'); grid on;
subplot(1,2,2); stem(tam,hnorm2); title('Imagem resultante'); grid on;
ylabel('Histograma normalizado');

acum1 = cumsum(hnorm1);
acum2 = cumsum(hnorm2);

figure;
subplot(1,2,1); stem(tam,acum1); title('Imagem original'); grid on;
subplot(1,2,2); stem(tam,acum2); title('Imagem resultante'); grid on;
ylabel('Histograma acumulado');