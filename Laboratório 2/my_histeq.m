% Laboratório 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

function [output] = my_histeq(im);

acum = zeros(1,256);

[alt, lar] = size(im);
h = my_hist(im);
hnorm = h/(alt*lar);

acum = round(255*cumsum(hnorm));

for i = 1:alt
    for j = 1:lar
            Eq(i,j) = acum(im(i,j)+1);
    end
end
output = uint8(Eq);