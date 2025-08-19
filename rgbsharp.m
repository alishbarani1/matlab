% Read color image
img = imread('imgg.jpg');  

% Extract individual color channels
fR = img(:,:,1); % Red channel
fG = img(:,:,2); % Green channel
fB = img(:,:,3); % Blue channel

% High-Boost parameters
A = 4.5;  % Boost factor (A > 1 for sharpening)

% Define a low-pass filter (Average filter)
h = fspecial('average', [3 3]);

% Apply low-pass filter to each channel
blur_fR = imfilter(fR, h);
blur_fG = imfilter(fG, h);
blur_fB = imfilter(fB, h);

% Compute the mask (original - blurred)
mask_fR = double(fR) - double(blur_fR);
mask_fG = double(fG) - double(blur_fG);
mask_fB = double(fB) - double(blur_fB);

% Apply High-Boost filtering formula
highboost_fR = double(fR) + (A-1) * mask_fR;
highboost_fG = double(fG) + (A-1) * mask_fG;
highboost_fB = double(fB) + (A-1) * mask_fB;

% Combine high-boost channels into final RGB image
highboost_img = cat(3, highboost_fR, highboost_fG, highboost_fB);
% Clip values to [0, 255] and convert to uint8
highboost_img = uint8(min(max(highboost_img, 0), 255));
% Display Results
figure;

% Original Image
subplot(2,3,1), imshow(img), title('Original Image (RGB)');

% Red Channel
subplot(2,3,2), imshow(fR), title('Red Channel');

% Green Channel
subplot(2,3,3), imshow(fG), title('Green Channel');

% Blue Channel
subplot(2,3,4), imshow(fB), title('Blue Channel');

% High-Boost Sharpened Image
subplot(2,3,5), imshow(highboost_img), title('High-Boost rgb Sharpened');