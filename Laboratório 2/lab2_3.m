% Laborat�rio 2 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

clc;
clear all;
close all;

I = imread('boat.tif');
A = my_histeq(I);
B = histeq(I,256);

C = B - A;
resul = sum(sum(C));