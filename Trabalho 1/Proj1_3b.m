% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc; clear all; close all;

% Como na primeira questão, reduz a imagem e depois a retorna ao tamanho
% original, para então aplicar os filtros de aguçamento
I2 = imread('test80.jpg');
I = rgb2gray(I2);

I = imresize(I,1/2); I = imresize(I,2);
imshow(I); title('Imagem Original');

% Aplicação dos filtros
final_gau = edge_improv2(I);
figure; imshow(final_gau); title('Filtro Gaussiano no Domínio da Frequência');

final_esp = edge_improv(I);
figure; imshow(final_esp); title('Filtro Laplaciano no Domínio do Espaço');

% Repete o teste, para comparar os filtros em RGB
I2 = imresize(I2,1/2); I2 = imresize(I2,2);
figure; imshow(I2); title('Imagem Original');

final_gau = edge_improv2(I2);
figure; imshow(final_gau); title('Filtro Gaussiano no Domínio da Frequência');

final_esp = edge_improv(I2);
figure; imshow(final_esp); title('Filtro Laplaciano no Domínio do Espaço');