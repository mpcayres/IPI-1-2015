% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

function [output] = DetectaCabelo(I,H,faces,cond)

I = double(I);
[alt,lar,tam] = size(I);

I_r = I(:,:,1);
I_g = I(:,:,2);
I_b = I(:,:,3);
Int = (I_r + I_g + I_b)/3;

% Branco: r = 0.33 e g = 0.33
% Pele: 1, se {(I < 80 e [(B-G) < 15 ou (B-R) < 15]) ou (20 < H <= 40)}; 0, c.c

for i = 1:alt
    for j = 1:lar
        if(I(i,j) < 80 && ((I_b(i,j) - I_g(i,j)) < 15 || (I_b(i,j) - I_r(i,j)) < 15))
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

% Originalmente, considera degtorad(20) < H(i,j) && degtorad(40) >= H(i,j)
for i = 1:alt
    for j = 1:lar
        if(I_adpt(i,j,1) == 1 || (degtorad(15) < H(i,j) && degtorad(40) >= H(i,j)))
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

I_quant = quantizacao(I_adpt(:,:,1),12);

% Considera se o tamanho do menor objeto é maior do que o valor usado como
% limiar, caso seja, também considera o Hue, aumentando a área analisada
[output,opt] = size_filter(I_quant,faces,cond);
if(opt == 1)
    I_quant2 = quantizacao(I_adpt2(:,:,1),12);
    figure;
    subplot(1,2,1); imshow(I_adpt2); title('Detecção do cabelo');
    subplot(1,2,2); imshow(I_quant2); title('Quantização do cabelo');
    [output,~] = size_filter(I_quant2,faces,cond);
else
    figure;
    subplot(1,2,1); imshow(I_adpt); title('Detecção do cabelo');
    subplot(1,2,2); imshow(I_quant); title('Quantização do cabelo');
end

end