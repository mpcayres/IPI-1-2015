% Laboratório 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

clc;
clear all;
close all;

I = imread('boat.tif');
A = my_histeq(I);
B = histeq(I,256);

C = B - A;
resul = sum(sum(C));