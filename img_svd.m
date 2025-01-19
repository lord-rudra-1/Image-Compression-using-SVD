clc;

% Load a color image
RGB = imread('image.jpg');

% Convert the image to double precision
RGB = im2double(RGB);

% Separate the color channels
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

% Perform SVD on each color channel
[UR, SR, VR] = svd(R);
[UG, SG, VG] = svd(G);
[UB, SB, VB] = svd(B);

% Select the number of singular values to keep for each channel
k = 10;

% Reconstruct each color channel with the selected number of singular values
Rk = UR(:,1:k) * SR(1:k,1:k) * VR(:,1:k)';
Gk = UG(:,1:k) * SG(1:k,1:k) * VG(:,1:k)';
Bk = UB(:,1:k) * SB(1:k,1:k) * VB(:,1:k)';

% Combine the reconstructed color channels into a color image
Ak = cat(3, Rk, Gk, Bk);

% Display the original and reconstructed images
subplot(1,2,1);
imshow(RGB);
title('Original Image');
subplot(1,2,2);
imshow(Ak);
title(['Reconstructed Image with k = ', num2str(k)]);