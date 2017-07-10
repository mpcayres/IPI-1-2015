% Marcos Paulo Cayres Rosa - 14/0027131
% load color image and display it
I = imread('mandrill.tif');
figure; imshow(I); %display de image
% convert it to an intensity image (gray scale)
I = rgb2gray(I);
% take some image rows: 8, 64, and 128
row8 = I(8,:); row64 = I(64,:); row128 = I(128,:);
% plot something
figure;
subplot(4, 1, 1); imshow(I); title('Image'); axis image tight on;
subplot(4, 1, 2); plot(row8); title('Row 8'); axis tight;
subplot(4, 1, 3); plot(row64); title('Row 64'); axis tight;
subplot(4, 1, 4); plot(row128); title('Row 128'); axis tight;