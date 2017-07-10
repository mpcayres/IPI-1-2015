% Projeto 1 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

function [output] = edge_improv2(im);
% Gráficos exemplificando os filtros estão comentados

s = size(im);
F = fftshift(fft2(im));

med1 = (s(1)/2)+1;
med2 = (s(2)/2)+1;
if (length(s) == 2)
    [alt,lar] = meshgrid(1:s(2),1:s(1));
else
    [alt,lar,tam] = meshgrid(1:s(2),1:s(1),1:s(3));
end
D = (alt-med2).^2 + (lar-med1).^2; 

% filtro: 1 = gaussiano, 2 = butterworth, 3 = ideal
% passa: se igual a 0, passa-altas
filtro = 1; passa = 0;
Do = 30; n = 1;
switch filtro
    case 2                              %   passa-baixas butterworth
        H = 1/(1+(sqrt(D)/Do).^(2*n));
    case 3                              %   passa-baixas ideal
        H = double(D<Do.^2);            
    otherwise                           %   passa-baixas gaussiano
        H = exp(-D/(2*Do.^2));          
end
if (passa == 0)                         %   passa-altas
    H = 1 - H;
end


if (length(s) == 2)
    G = F .* H;
    %figure; mesh(H); figure; imshow(H);
    g = uint8(real(ifft2(ifftshift(G))));
    %figure; imshow(g);
else
    for n=1:s(3)
        G(:,:,n) = F(:,:,n) .* H(:,:,n);
        %figure; mesh(H(:,:,n)); figure; imshow(H(:,:,n));
    end
    g = uint8(real(ifft2(ifftshift(G))));
    %for n=1:s(3)
    %    figure; imshow(g(:,:,n));
    %end
end

output = (abs(im))+g;
end