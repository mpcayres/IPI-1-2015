% Projeto 2 - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

function [output] = butterworth(im, Do, u, v)

% Determinação dos tamanhos médios, D1 e D2
s = size(im);
med1 = (s(1)/2)+1;
med2 = (s(2)/2)+1;
if (length(s) == 2)
    [alt,lar] = meshgrid(1:s(2),1:s(1));
else
    [alt,lar,tam] = meshgrid(1:s(2),1:s(1),1:s(3));
end
D1 = sqrt((alt-med2-v).^2 + (lar-med1-u).^2);
D2 = sqrt((alt-med2+v).^2 + (lar-med1+u).^2);

% Aplicação do passa-altas butterworth
n = 4;
H1 = 1./(1+(Do./D1).^(2*n));
H2 = 1./(1+(Do./D2).^(2*n));
output = H1.*H2;

%figure; subplot(2,1,1); mesh(output); subplot(2,1,2); imshow(output);
end