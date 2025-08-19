% Read color image
img = imread('img.jpg');  
% Extract individual color channels
fR = img(:,:,1); % Red channel
fG = img(:,:,2); % Green channel
fB = img(:,:,3); % Blue channel

% Smooth each channel using average filter (3x3)
h = fspecial('average', [3 3]);
smooth_fR = imfilter(fR, h);
smooth_fG = imfilter(fG, h);
smooth_fB = imfilter(fB, h);

% Recombine the smoothed channels back into RGB image
smooth_img = cat(3, smooth_fR, smooth_fG, smooth_fB);

% Display Results
figure;

% Original Image
subplot(2,3,1), imshow(img), title('Original Image (RGB)');
% Display Red Channel
subplot(2,3,2), imshow(fR), title('Red Channel');

% Display Green Channel
subplot(2,3,3), imshow(fG), title('Green Channel');

% Display Blue Channel
subplot(2,3,4), imshow(fB), title('Blue Channel');

% Smoothing on RGB Channels
subplot(2,3,5), imshow(smooth_img), title('Smoothed Image RGb');