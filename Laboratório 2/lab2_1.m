% Laboratório 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc;
clear all;
close all;

A = imread('clown.tif');
h = my_hist(A);
bar(h,0.001); title('Histograma de "clown.tif"');

B = imread('mandrill.tif');
s = size(B);
h2 = my_hist(B);

B = rgb2gray(B); h3 = my_hist(B);
figure;
subplot(2,2,1); bar(h2(1,:),0.01); xlabel('Vermelho');
title('Histogramas de "mandrill.tif"');
subplot(2,2,2); bar(h2(2,:),0.01); xlabel('Verde');
subplot(2,2,3); bar(h2(3,:),0.01); xlabel('Azul');
subplot(2,2,4); bar(h3,0.01); xlabel('Imagem em escala de cinza');