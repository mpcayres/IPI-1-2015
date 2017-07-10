% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc; clear all; close all;

im1 = imread('clown.tif');
im2 = imread('mandrill.tif');

% FFT das imagens
f1 = fft2(im1);
f2 = fft2(im2);
f3 = fft2(rgb2gray(im2));

% Mostrar magnitude e fase
imshow(log(abs(fftshift(f1))+ 0.1),[]); title('Magnitude de "clown.tif"');
figure; imshow(angle(fftshift(f1)),[]); title('Fase de "clown.tif"');

figure;
subplot(2,2,1); imshow(log(abs(fftshift(f2(:,:,1)))+ 0.1),[]); title('Magnitude de R');
ylabel('Magnitudes de "mandrill.tif"');
subplot(2,2,2); imshow(log(abs(fftshift(f2(:,:,2)))+ 0.1),[]); title('Magnitude de G');
subplot(2,2,3); imshow(log(abs(fftshift(f2(:,:,3)))+ 0.1),[]); title('Magnitude de B');
subplot(2,2,4); imshow(log(abs(fftshift(f3))+ 0.1),[]); title('Magnitude da imagem em escala de cinza');
figure;
subplot(2,2,1); imshow(angle(fftshift(f2(:,:,1))),[]); title('Fase de R');
ylabel('Fases de "mandrill.tif"');
subplot(2,2,2); imshow(angle(fftshift(f2(:,:,2))),[]); title('Fase de G');
subplot(2,2,3); imshow(angle(fftshift(f2(:,:,3))),[]); title('Fase de B');
subplot(2,2,4); imshow(angle(fftshift(f3)),[]); title('Fase da imagem em escala de cinza');

% Troca de fase
troca_f1 = abs(f1).*exp(i*angle(f3));
troca_f3 = abs(f3).*exp(i*angle(f1));

imageC = ifft2(troca_f1);
imageD = ifft2(troca_f3);

figure; imshow(abs(imageC),[]); title('Troca de fase de "clown.tif"');
figure; imshow(abs(imageD),[]); title('Troca de fase de "mandrill.tif"');