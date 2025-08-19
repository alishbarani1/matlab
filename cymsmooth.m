clear all;
close all;
% Read color image
img = imread('butterfly.jpeg'); 
% Extract individual color channels
fR = img(:,:,1); % Red channel
fG = img(:,:,2); % Green channel
fB = img(:,:,3); % Blue channel

% Smooth each RGB channel using average filter (3x3)
h = fspecial('average', [3 3]);
smooth_fR = imfilter(fR, h);
smooth_fG = imfilter(fG, h);
smooth_fB = imfilter(fB, h);

% Recombine the smoothed RGB channels back into an image
smooth_rgb= cat(3, smooth_fR, smooth_fG, smooth_fB);

% Convert the smoothed RGB image to CMY
smooth_fC = 255 - smooth_fR; % Cyan channel
smooth_fM = 255 - smooth_fG; % Magenta channel
smooth_fY = 255 - smooth_fB; % Yellow channel

% Recombine the CMY channels back into an image
smooth_cmy = cat(3, smooth_fC, smooth_fM, smooth_fY);

% Display Results
figure;

% Original Image
subplot(2,4,1), imshow(img), title('Original Image *RGB*');

% Display Red Channel
subplot(2,4,2), imshow(fR), title('Red Channel');

% Display Green Channel
subplot(2,4,3), imshow(fG), title('Green Channel');

% Display Blue Channel
subplot(2,4,4), imshow(fB), title('Blue Channel');

% Display the combined smoothed RGB image
subplot(2,4,5), imshow(smooth_rgb), title('Smoothed RGB Image');

% Display the combined smoothed CMY image
subplot(2,4,6), imshow(smooth_cmy), title('Smoothed CMY Image');