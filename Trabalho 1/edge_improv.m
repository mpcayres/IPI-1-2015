% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

function [output] = edge_improv(im);

H = [0 -1 0; -1 4 -1; 0 -1 0];
H = -1*H;

aux = imfilter(im,H);
%figure; imshow(aux);

if H(2,2) < 0
    output = im - aux;
else    
    output = im + aux;
end

end