% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

function [output] = mascara_hue(I)
I_r = I(:,:,1);
I_g = I(:,:,2);
I_b = I(:,:,3);

% teta = acos{0.5*[(R-G)+(R-B)]/sqrt[((R-G)^2)+[(R-B)*(G-B)]]};
% H: teta, se B <= G; 360º - 0, c.c.

output = 0.5.*((I_r-I_g)+(I_r-I_b));
output = output./(sqrt(((I_r-I_g).^2)+((I_r-I_b).*(I_g-I_b)))+eps);
output = acos(output);

output(I_b>I_g) = 2*pi-output(I_b>I_g);
output(I_b<=I_g) = output(I_b<=I_g);

end