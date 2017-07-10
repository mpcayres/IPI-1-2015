% Trabalho Final - Introdução ao Processamento de Imagens
% Professor: Bruno Macchiavello
% Componentes:
%   Marcos Paulo Cayres Rosa (14/0027131)
%   Rennê Ruan Alves Oliveira (14/0030930)
%   Edgar Fabiano de Souza Filho (14/0019201)

clc; clear all; close all;

I = imread('Imagem(1).jpg');
figure; imshow(I); title('Imagem Original');
[alt, ~, ~] = size(I);

% Se faces == 1, detecta apenas uma ou nenhuma face
% se faces ~= 1, detecta qualquer número de faces (padrão)
faces = 2;
H = mascara_hue(double(I));
Pele = DetectaPele(I,H,faces,1);
Cabelo = DetectaCabelo(I,H,faces,2);
figure;
subplot(1,2,1); imshow(Pele); title('Resultado - Pele');
subplot(1,2,2); imshow(Cabelo); title('Resultado - Cabelo');

Box_Pele = regionprops(Pele, 'BoundingBox');
Box_Cabelo = regionprops(Cabelo, 'BoundingBox');

figure; imshow(I);
if(~isempty(Box_Pele) && ~isempty(Box_Cabelo))
    title('Regiões encontradas pelo BoundingBox');
    for j = 1:length(Box_Pele)
        hold on;
        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                'EdgeColor','r','LineWidth',2);
        detectado(j) = -1;
    end
    for i = 1:length(Box_Cabelo)
        hold on;
        rectangle('Position',[Box_Cabelo(i).BoundingBox(1),Box_Cabelo(i).BoundingBox(2),Box_Cabelo(i).BoundingBox(3),Box_Cabelo(i).BoundingBox(4)],...
                'EdgeColor','b','LineWidth',2);
    end
else
    title('Imagem sem Faces');
end

num_faces = 0;
if(~isempty(Box_Pele) && ~isempty(Box_Cabelo))
    figure; imshow(I);
end
for j = 1:length(Box_Pele)
    for i = 1:length(Box_Cabelo)
        if(detectado(j) == -1)
            if (Box_Pele(j).BoundingBox(1) >= Box_Cabelo(i).BoundingBox(1) && Box_Pele(j).BoundingBox(2) >= Box_Cabelo(i).BoundingBox(2)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) <= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3)...
                    && Box_Pele(j).BoundingBox(2)+Box_Pele(j).BoundingBox(4) <= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4))
                        detectado(j) = 2;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                                'EdgeColor','y','LineWidth',2);
            elseif (Box_Pele(j).BoundingBox(1) <= Box_Cabelo(i).BoundingBox(1) && Box_Pele(j).BoundingBox(2) >= Box_Cabelo(i).BoundingBox(2)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) <= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3)...
                    && Box_Pele(j).BoundingBox(2)+Box_Pele(j).BoundingBox(4) >= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4)...
                    && Box_Pele(j).BoundingBox(2) <= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4))
                        detectado(j) = 3;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                                'EdgeColor','y','LineWidth',2);
            elseif (Box_Pele(j).BoundingBox(1) >= Box_Cabelo(i).BoundingBox(1) && Box_Pele(j).BoundingBox(2) >= Box_Cabelo(i).BoundingBox(2)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) >= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3)...
                    && Box_Pele(j).BoundingBox(2)+Box_Pele(j).BoundingBox(4) >= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4)...
                    && Box_Pele(j).BoundingBox(1) <= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3)...
                    && Box_Pele(j).BoundingBox(2) <= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4))
                        detectado(j) = 5;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                                'EdgeColor','y','LineWidth',2 );
            elseif (Box_Pele(j).BoundingBox(2) <= Box_Cabelo(i).BoundingBox(2)...
                    && Box_Pele(j).BoundingBox(2)+Box_Pele(j).BoundingBox(4) >= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4)...
                    && ((Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3) >= Box_Pele(j).BoundingBox(1)...
                    && Box_Cabelo(i).BoundingBox(1) <= Box_Pele(j).BoundingBox(1))...
                    || (Box_Cabelo(i).BoundingBox(1) <= Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3)...
                    && Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3) >= Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3))))
                        detectado(j) = 4;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                            'EdgeColor','y','LineWidth',2);
            elseif (Box_Pele(j).BoundingBox(2) >= Box_Cabelo(i).BoundingBox(2)...
                    && Box_Pele(j).BoundingBox(2) <= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4)+round(alt/100)...
                    && ((Box_Pele(j).BoundingBox(1) >= Box_Cabelo(i).BoundingBox(1)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) <= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3))...
                    || (Box_Pele(j).BoundingBox(1) <= Box_Cabelo(i).BoundingBox(1)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) >= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3))))
                        detectado(j) = 1;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                                'EdgeColor','y','LineWidth',2);
            elseif (Box_Pele(j).BoundingBox(1) <= Box_Cabelo(i).BoundingBox(1)...
                    && Box_Pele(j).BoundingBox(1)+Box_Pele(j).BoundingBox(3) >= Box_Cabelo(i).BoundingBox(1)+Box_Cabelo(i).BoundingBox(3)...
                    && Box_Pele(j).BoundingBox(2) <= Box_Cabelo(i).BoundingBox(2)...
                    && 3*(Box_Pele(j).BoundingBox(2)+Box_Pele(j).BoundingBox(4))/4 >= Box_Cabelo(i).BoundingBox(2)+Box_Cabelo(i).BoundingBox(4))
                        detectado(j) = 6;
                        num_faces = num_faces+1;
                        hold on;
                        rectangle('Position',[Box_Pele(j).BoundingBox(1),Box_Pele(j).BoundingBox(2),Box_Pele(j).BoundingBox(3),Box_Pele(j).BoundingBox(4)],...
                                'EdgeColor','y','LineWidth',2);
            end
        end
    end
end

if(~isempty(Box_Pele) && ~isempty(Box_Cabelo))
    if(num_faces == 0)
        title('Imagem sem Faces');
    elseif(num_faces == 1)
        title('1 face detectada');
    else
        title([num2str(num_faces) ' faces detectadas']);
    end
end