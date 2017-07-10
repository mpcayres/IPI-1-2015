% Projeto 1 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

function [out_red output] = dec_int(im);

[alt, lar, cor] = size(im);

% Redu��o da imagem
out_red(1:alt/2,1:lar/2,1:cor)=im(1:2:alt,1:2:lar,1:cor);

% Amplia��o da imagem
for i=1:2
    for j=1:2
        out_amp(i:2:alt,j:2:lar,1:cor)=out_red(1:alt/2,1:lar/2,1:cor);
    end
end

output = out_amp;
end