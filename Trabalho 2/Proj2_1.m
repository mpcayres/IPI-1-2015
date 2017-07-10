% Projeto 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc; close all; clear all;

% Leitura da imagem
im = imread('moire.tif');

% Determinação das máscaras
% Do = 10, uk = 39, vk = 30
H1 = butterworth(im, 10, 39, 30);
% Do = 10, uk = -39, vk = 30
H2 = butterworth(im, 10, -39, 30);
% Do = 5, uk = 78, vk = 30
H3 = butterworth(im, 5, 78, 30);
% Do = 5, uk = -78, vk = 30
H4 = butterworth(im, 5, -78, 30);

H = H1.*H2.*H3.*H4;

% Aplicação do filtro
F = fftshift(fft2(im));
G = F .* H;
figure;
subplot(1,2,1); imshow(H); title('Filtro Rejeita-notch');
subplot(1,2,2); imshow(log(1+abs(G)),[]); title('Magnitude da imagem filtrada');

% Imagem resultante
g = uint8(real(ifft2(ifftshift(G))));
figure;
subplot(1,2,1); imshow(im); title('Imagem original');
subplot(1,2,2); imshow(g); title('Imagem filtrada');