% Projeto 2 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

clc; close all; clear all;

% Leitura da imagem
I = imread('img_cells.jpg');
I = rgb2gray(I);
figure; imshow(I); title('Imagem original');

% Procedimentos pr�vios � binariza��o
im_med = medfilt2(I);
se = strel('disk',25);
im_top = imtophat(im_med,se);
figure;
subplot(1,2,1); imshow(im_med,[]); title('Imagem ap�s o filtro de m�dia');
subplot(1,2,2); imshow(im_top,[]); title('Imagem ap�s transformada top-hat');

% Binariza��o e preenchimento de espa�os desconectados
I_bin = im2bw(im_top,graythresh(im_top));
figure; subplot(1,2,1); imshow(I_bin); title('Imagem binarizada');
I_bin = bwareaopen(I_bin,100);
subplot(1,2,2); imshow(I_bin); title('Imagem ap�s abertura');

% Preenchimento de buracos
Iadj = imcomplement(I_bin);
figure; subplot(1,2,1); imshow(Iadj); title('Complemento da imagem');
im_fill = imfill(Iadj,'holes');
im_fill = bwareaopen(im_fill,70);
subplot(1,2,2); imshow(im_fill); title('Preenchimento dos buracos e abertura');

% Determina��o da dist�ncia e aplica��o do watershed
D = bwdist(imcomplement(im_fill));
figure; imshow(D,[]); title('Resultado do bwdist');
D = imcomplement(D);
D(imcomplement(im_fill)) = -Inf;
L = watershed(D);
figure; imshow(label2rgb(L)); title('Resultado do Watershed');

% Comparativos da imagem original com alguns resultados encontrados
D = bwdist(imcomplement(im_fill));
mask = imextendedmin(D,8);
figure; imshowpair(I,D,'blend'); title('Imagem original associada � dist�ncia');
figure; imshowpair(I,mask,'blend'); title('Imagem original associada aos pontos m�nimos');
figure; imshowpair(I,L,'blend'); title('Imagem original associada ao Watershed');