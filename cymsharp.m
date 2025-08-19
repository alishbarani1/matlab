% Read color image
img = imread('img1.jpg');  % Replace with your image file

% Extract RGB channels
fR = img(:,:,1);
fG = img(:,:,2);
fB = img(:,:,3);

% Convert RGB to CMY
fC = 255 - fR; % Cyan
fM = 255 - fG; % Magenta
fY = 255 - fB; % Yellow

% High-Boost parameters
A = 3;  % Boost factor

% Define low-pass filter (Average)
h = fspecial('average', [3 3]);

% Apply low-pass filter to each CMY channel
blur_fC = imfilter(fC, h);
blur_fM = imfilter(fM, h);
blur_fY = imfilter(fY, h);

% Create mask
mask_fC = double(fC) - double(blur_fC);
mask_fM = double(fM) - double(blur_fM);
mask_fY = double(fY) - double(blur_fY);

% High-Boost filtering
highboost_fC = double(fC) + (A - 1) * mask_fC;
highboost_fM = double(fM) + (A - 1) * mask_fM;
highboost_fY = double(fY) + (A - 1) * mask_fY;

% Combine sharpened CMY channels
highboost_cmy_img = cat(3, highboost_fC, highboost_fM, highboost_fY);

% Clip values to [0, 255] and convert to uint8 only once
highboost_cmy_img = uint8(min(max(highboost_cmy_img, 0), 255));

% Display Results
figure;

subplot(2,3,1), imshow(img), title('Original Image (RGB)');
subplot(2,3,2), imshow(fC), title('Cyan Channel');
subplot(2,3,3), imshow(fM), title('Magenta Channel');
subplot(2,3,4), imshow(fY), title('Yellow Channel');
subplot(2,3,5), imshow(highboost_cmy_img), title('High-Boost CMY');