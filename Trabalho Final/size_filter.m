% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

function [output,opt] = size_filter(I,faces,cond)

[alt, lar] = size(I);
opt = 0;
if(faces == 1)
    se = strel('disk',round(sqrt(alt*lar)/50));
else
    se = strel('disk',round(sqrt(alt*lar)/70));
end
I = imclose(I,se);

I_conect = bwconncomp(I, 8);
S = regionprops(I_conect, 'Area');
L = labelmatrix(I_conect);
[~,~,Val] = find([S.Area]);

% Condicionais correspondem à:
%   1 - pele, regiões grandes e de tamanho pouco variado
%   2 - cabelo, regiões de tamanho muito variado, podendo ser pequeno
if(faces == 1)
    P = max(Val);
else
    if(cond == 1)
        P = max(Val)/3;
    else
        P = 2*sqrt(alt*lar);
        if(P > max(Val))
            P = max(Val);
            opt = 1;
        end
    end
end
output = ismember(L, find([S.Area] >= P));

end