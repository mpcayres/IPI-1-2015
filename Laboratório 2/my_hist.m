% Laborat�rio 2 - Introdu��o ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

function [output] = my_hist(im);
% H = my_hist(im) calcula o histograma de uma imagem monocrom�tica ou
% colorida
% Se im � bi-dimensional retorna um vetor H de dimens�o 1x256; se
% tri-dimensional, 3x256, no qual cada linha � o histograma de cada canal
% de cor
s = size(im);
% S tem as dimens�es de im

if length(s) == 3
    b = zeros(3,256);
    for i=1:1:s(3)
        for x=1:1:s(1)
            for y=1:1:s(2)
                t = im(x,y,i) + 1;
                b(i,t) = b(i,t) + 1;
            end
        end
    end
else if length(s) == 2
        b = zeros(256,1,'double');
        double t;
        for x=1:1:s(1)
            for y=1:1:s(2)
                if(im(x,y) == 255)
                    t = 256;
                else
                    t = im(x,y)+1;
                end
                    b(t) = b(t) + 1;
            end
        end
        
    end
end

output = b;