% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc; clear all; close all;

im1 = imread('car.png');
im2 = imread('crowd.png');
im3 = imread('university.png');

% Correção gama de car.png
g1 = imadjust(im1,[],[],0.5);
g2 = imadjust(im1,[],[],3);
g3 = imadjust(im1,[],[],5);

subplot(2,2,1); imshow(im1); title('Imagem original "car.png"');
subplot(2,2,2); imshow(g1); title('gamma: 0.5');
subplot(2,2,3); imshow(g2); title('gamma: 3 (melhor resultado)');
subplot(2,2,4); imshow(g3); title('gamma: 5');

% Correção gama de crowd.png
g1 = imadjust(im2,[],[],0.3);
g2 = imadjust(im2,[],[],0.6);
g3 = imadjust(im2,[],[],2);

figure;
subplot(2,2,1); imshow(im2); title('Imagem original "crowd.png"');
subplot(2,2,2); imshow(g1); title('gamma: 0.3');
subplot(2,2,3); imshow(g2); title('gamma: 0.6 (melhor resultado)');
subplot(2,2,4); imshow(g3); title('gamma: 2');

% Correção gama de university.png
g1 = imadjust(im3,[],[],0.2);
g2 = imadjust(im3,[],[],0.5);
g3 = imadjust(im3,[],[],2);

figure;
subplot(2,2,1); imshow(im3); title('Imagem original "university.png"');
subplot(2,2,2); imshow(g1); title('gamma: 0.2');
subplot(2,2,3); imshow(g2); title('gamma: 0.5 (melhor resultado)');
subplot(2,2,4); imshow(g3); title('gamma: 2');

% Equalização das imagens
figure; histeq(im1); title('Imagem equalizada de "car.png"');
figure; histeq(im2); title('Imagem equalizada de "crowd.png"');
figure; histeq(im3); title('Imagem equalizada de "university.png"');

% Histogramas e CDF
[EQ, CDF1] = histeq(im1);
[EQ, CDF2] = histeq(EQ);

figure;
subplot(1,2,1); imhist(im1); title('Histograma de "car.png"');
subplot(1,2,2); imhist(EQ); title('Histograma Equalizado');

figure;
subplot(1,2,1); bar(CDF1); title('Imagem original'); grid on;
subplot(1,2,2); bar(CDF2); title('Imagem equalizada'); grid on;
ylabel('Histogramas acumulados de "car.png"');