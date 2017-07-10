% Projeto 1 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

clc; clear all; close all;

% Como na primeira quest�o, reduz a imagem e depois a retorna ao tamanho
% original, para ent�o aplicar os filtros de agu�amento
I2 = imread('test80.jpg');
I = rgb2gray(I2);

I = imresize(I,1/2); I = imresize(I,2);
imshow(I); title('Imagem Original');

% Aplica��o dos filtros
final_gau = edge_improv2(I);
figure; imshow(final_gau); title('Filtro Gaussiano no Dom�nio da Frequ�ncia');

final_esp = edge_improv(I);
figure; imshow(final_esp); title('Filtro Laplaciano no Dom�nio do Espa�o');

% Repete o teste, para comparar os filtros em RGB
I2 = imresize(I2,1/2); I2 = imresize(I2,2);
figure; imshow(I2); title('Imagem Original');

final_gau = edge_improv2(I2);
figure; imshow(final_gau); title('Filtro Gaussiano no Dom�nio da Frequ�ncia');

final_esp = edge_improv(I2);
figure; imshow(final_esp); title('Filtro Laplaciano no Dom�nio do Espa�o');