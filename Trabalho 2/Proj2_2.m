% Projeto 2 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

clc; close all; clear all;

% Leitura da imagem
I = imread('morf_test.png');
imshow(I); title('Imagem original');

% Procedimentos pr�vios � binariza��o
se = strel('disk',14);
bot = imbothat(I,se);
bot_adj = imadjust(bot);
figure; 
subplot(1,2,1); imshow(bot); title('Imagem ap�s a transformada bottom-hat');
subplot(1,2,2); imshow(bot_adj); title('Imagem ap�s o uso da fun��o imadjust');

% Binariza��o
bot_neg = imcomplement(bot_adj);
I2 = im2bw(bot_neg,graythresh(bot_neg));
figure; imshow(I2); title('Imagem binarizada');

% Aplica��o de opera��es morfol�gicas e filtros
se = strel('disk',1);
final = imopen(I2,se);
val = 1/11;
im_med = imfilter(final,[val val val; val val val; val val val]);
figure; imshow(im_med); title('Imagem ap�s abertura e filtro de m�dia');

% Eros�o da imagem original
se = strel('disk',14);
im_fundo = imclose(I,se);
figure; imshow(im_fundo); title('Imagem da silhueta da Mona Lisa encontrada ap�s eros�o');

% Ajustes finais
im_final = imcomplement(im_med);
im_final = imrotate(im_final,3);
im_final = imcomplement(im_final);
figure; imshow(im_final); title('Imagem bin�ria final');