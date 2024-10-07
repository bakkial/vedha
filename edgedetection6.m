
clear;
clc;
close all;
I = imread("C:\Users\admin\Pictures\Saved Pictures\b.jpg");
if size(I, 3) == 3
I_gray = rgb2gray(I);
else
I_gray = I;
end
I_gray = double(I_gray);
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];
edge_roberts_x = imfilter(I_gray, roberts_x, 'replicate');
edge_roberts_y = imfilter(I_gray, roberts_y, 'replicate');
edge_roberts = sqrt(edge_roberts_x.^2 + edge_roberts_y.^2);
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];
edge_prewitt_x = imfilter(I_gray, prewitt_x, 'replicate');
edge_prewitt_y = imfilter(I_gray, prewitt_y, 'replicate');
edge_prewitt = sqrt(edge_prewitt_x.^2 + edge_prewitt_y.^2);
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
edge_sobel_x = imfilter(I_gray, sobel_x, 'replicate');
edge_sobel_y = imfilter(I_gray, sobel_y, 'replicate');
edge_sobel = sqrt(edge_sobel_x.^2 + edge_sobel_y.^2);
edge_roberts = mat2gray(edge_roberts);
edge_prewitt = mat2gray(edge_prewitt);
edge_sobel = mat2gray(edge_sobel);
figure;
subplot(2,2,1);
imshow(I_gray, []);
title('Original Image');
subplot(2,2,2);
imshow(edge_roberts);
title('Roberts Edge Detection');
subplot(2,2,3);
imshow(edge_prewitt);
title('Prewitt Edge Detection');
subplot(2,2,4);
imshow(edge_sobel);
title('Sobel Edge Detection');
