% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

function [output] = DetectaPele(I,H,faces,cond)

I = double(I);
[alt,lar,tam] = size(I);

I_r = I(:,:,1);
I_g = I(:,:,2);
I_b = I(:,:,3);

div = (I_r(:,:) + I_g(:,:) + I_b(:,:));
r = I_r./div;
g = I_g./div;
b = I_b./div;
I_norm(:,:,1) = r; I_norm(:,:,2) = g; I_norm(:,:,3) = b;

% F1(r) = -1.376r^2 + 1.0743r + 0.2 - limite superior
% F2(r) = -0.776r^2 + 0.5601r + 0.18 - limite inferior
% w = (r - 0.33)^2 + (g - 0.33)^2 > 0.001
% Branco: r = 0.33 e g = 0.33
% Pele: 1, se (g < F1(r) e g > F2(r) e w > 0.001); 0, c.c.

F1 = -1.376*(r.^2) + 1.0743*r + 0.2;
F2 = -0.776*(r.^2) + 0.5601*r + 0.18;
w = ((r - 0.33).^2) + ((g - 0.33).^2);

for i = 1:alt
    for j = 1:lar
        if(g(i,j) < F1(i,j) && g(i,j) > F2(i,j) && w(i,j) > 0.001)
            I_adpt(i,j,1) = 1;
            I_adpt(i,j,2) = 1;
            I_adpt(i,j,3) = 1;
        else
            I_adpt(i,j,1) = 0;
            I_adpt(i,j,2) = 0;
            I_adpt(i,j,3) = 0;
        end
    end
end

% Pele: 1, se (g < F1(r) e g > F2(r) e w > 0.001 e (H > 240º ou H <= 20º)); 0, c.c.

% Originalmente, considera H(i,j) > degtorad(240) || H(i,j) <= degtorad(20)
for i = 1:alt
    for j = 1:lar
        if(I_adpt(i,j,1) == 1 && (H(i,j) <= degtorad(30)))
                I_adpt2(i,j,1) = 1;
                I_adpt2(i,j,2) = 1;
                I_adpt2(i,j,3) = 1;
        else
            I_adpt2(i,j,1) = 0;
            I_adpt2(i,j,2) = 0;
            I_adpt2(i,j,3) = 0;
        end
    end
end

I_quant2 = quantizacao(I_adpt2(:,:,1),12);
figure;
subplot(1,2,1); imshow(I_adpt2); title('Detecção da pele');
subplot(1,2,2); imshow(I_quant2); title('Quantização da pele');

[output,~] = size_filter(I_quant2,faces,cond);

end