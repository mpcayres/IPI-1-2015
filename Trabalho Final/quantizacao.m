% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

function [output] = quantizacao(I,limiar)

[alt,lar] = size(I);
for i = 1:alt
    for j = 1:lar
        
        cont = 0;
        for aux1 = 0:2
            for aux2 = 0:2
                if(i+aux1 <= alt && j+aux2 <= lar)
                    if(I(i+aux1,j+aux2) == 0)
                        cont = cont+1;
                    end
                else
                    cont = cont+1;
                end
                if(aux2 ~= 0)
                    if(i+aux1 <= alt && j-aux2 > 0)
                        if(I(i+aux1,j-aux2) == 0)
                            cont = cont+1;
                        end
                    else
                        cont = cont+1;
                    end
                end
                if(aux1 ~= 0)
                    if(i-aux1 > 0 && j+aux2 <= lar)
                        if(I(i-aux1,j+aux2) == 0)
                            cont = cont+1;
                        end
                    else
                        cont = cont+1;
                    end
                end
                if(aux1 ~= 0 && aux2 ~= 0)
                    if(i-aux1 > 0 && j-aux2 > 0)
                        if(I(i-aux1,j-aux2) == 0)
                            cont = cont+1;
                        end
                    else
                        cont = cont+1;
                    end
                end
            end
        end

        if(cont > limiar)
            output(i,j) = 0;
        else
            output(i,j) = 1;
        end
        
    end
end

end