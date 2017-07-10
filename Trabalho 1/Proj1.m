% Projeto 1 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

clc; clear all; close all;

% Leitura da imagem
I = imread('test80.jpg');
imshow(I); title('Imagem original');

% Redu��o e interpola��o pela fun��o dec_int
[red interp] = dec_int(I);
figure; imshow(red); title('Imagem reduzida pela fun��o dec int()');
figure; imshow(interp); title('Imagem interpolada pela fun��o dec int()');
% Aplica��o de  edge_improv
interp_improv = edge_improv(interp);
figure; imshow(interp_improv); title('Resultado de edge improv() ap�s dec int()');

% Redu��o e interpola��o pela fun��o imresize
red2 = imresize(I,1/2,'bicubic');
figure; imshow(red2); title('Imagem reduzida pela fun��o imresize()');
red2 = imresize(red2,2,'bicubic');
figure; imshow(red2); title('Imagem interpolada pela fun��o imresize()');

% Aplica��o de  edge_improv
red2_improv = edge_improv(red2);
figure; imshow(red2_improv); title('Resultado de edge improv() ap�s imresize()');