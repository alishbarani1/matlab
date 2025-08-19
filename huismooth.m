%Read color image
img = imread('naturebeauty.jpeg');  
% Convert RGB to HSI
hsi = rgb2hsv(img);  % Use hsv function as a substitute for HSI
% Extract individual channels
Hue = hsi(:,:,1);      % Hue channel
Sat = hsi(:,:,2);      % Saturation channel
Intensity = hsi(:,:,3); % Intensity channel

% Smooth each channel using average filter (3x3)
h = fspecial('average', [3 3]);
smooth_Hue = imfilter(Hue, h);
smooth_Sat = imfilter(Sat, h);
smooth_Intensity = imfilter(Intensity, h);

% Recombine the smoothed channels back into HSI
smooth_hsi = cat(3, smooth_Hue, smooth_Sat, smooth_Intensity);

% Convert the smoothed HSI back to RGB
smooth_img = hsv2rgb(smooth_hsi);

% Display Results
figure;

% Original Image
subplot(2,3,1), imshow(img), title('Original Image (RGB)');

% Display Hue Channel
subplot(2,3,2), imshow(Hue), title('Hue Channel');

% Display Saturation Channel
subplot(2,3,3), imshow(Sat), title('Saturation Channel');

% Display Intensity Channel
subplot(2,3,4), imshow(Intensity), title('Intensity Channel');

% Display Smoothed Image
subplot(2,3,5), imshow(smooth_img), title('Smoothed Image ');
% D0isplay smooth image of hsi 
subplot(2,3,6), imshow(smooth_hsi), title('Smoothed Image hsi');