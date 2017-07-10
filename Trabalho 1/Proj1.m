% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc; clear all; close all;

% Leitura da imagem
I = imread('test80.jpg');
imshow(I); title('Imagem original');

% Redução e interpolação pela função dec_int
[red interp] = dec_int(I);
figure; imshow(red); title('Imagem reduzida pela função dec int()');
figure; imshow(interp); title('Imagem interpolada pela função dec int()');
% Aplicação de  edge_improv
interp_improv = edge_improv(interp);
figure; imshow(interp_improv); title('Resultado de edge improv() após dec int()');

% Redução e interpolação pela função imresize
red2 = imresize(I,1/2,'bicubic');
figure; imshow(red2); title('Imagem reduzida pela função imresize()');
red2 = imresize(red2,2,'bicubic');
figure; imshow(red2); title('Imagem interpolada pela função imresize()');

% Aplicação de  edge_improv
red2_improv = edge_improv(red2);
figure; imshow(red2_improv); title('Resultado de edge improv() após imresize()');