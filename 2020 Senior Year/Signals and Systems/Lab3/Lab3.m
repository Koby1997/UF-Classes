%% Koby Miller Lab3
%% Exercise 3.1

% USER DEFINED VARIABLES
w = 15; % Width
x = 1:160; % Horiztonal Axis
y = 1:80; % Vertical Axis
% creates a matrix z filled with color values at each (x,y) position
z = round(127 * exp(-1/w.^2 * ((y.' -40).^2 + (x -80).^2)));
% set the colormap to gray. Now the values are on a scale of black to
% white
colormap(gray);
% call image_system1 to create dimensions needed for rotated images.
% Also creates a translated 
[xs, ys, zs] = image_system1(z, 2, 2);
za = image_system2(zs, -10, 35);
zb = image_system3(za, -30, 35);
% PLOT RESULT WITH SUBPLOT
figure(1);
subplot(2, 2, 1); % breaks Figure window into 2x2 matrix. Puts plot in position 1 (top left) 
imagesc(x, y, z); % display the Z values on an x_y plane
axis image ; % each tick mark increments on the x-,y- and z-axis are equal in size.
             % also the plot box fits tightly around the data
title(' Original ')

subplot(2 ,2 ,2) ; % breaks Figure window into 2x2 matrix. Puts plot in position 2 (top right)
imagesc(xs, ys, zs); % display the zs values on an x_y plane
axis image; % each tick mark increments on the x-,y- and z-axis are equal in size.
            % also the plot box fits tightly around the data
title(' After System 1 ')

subplot(2, 2, 3); % breaks Figure window into 2x2 matrix. Puts plot in position 3 (bottom left)
imagesc(xs, ys, za); % display the za values on an x_y plane
axis image; % each tick mark increments on the x-,y- and z-axis are equal in size.
            % also the plot box fits tightly around the data
title(' After System 2 ')

subplot(2, 2, 4); % breaks Figure window into 2x2 matrix. Puts plot in position 4 (bottom right)
imagesc(xs, ys, zb); % display the zb values on an x_y plane
axis image; % each tick mark increments on the x-,y- and z-axis are equal in size.
            % also the plot box fits tightly around the data
title(' After System 3 ')

%% Exercise 3.2
%(a)
% Function image_sample is under 'My Functions' section


%(b)
load ('lighthouse.mat');

figure(2)
% Sometimes throughout this lab I use image_sample with a factor of 1
% just to make sure I have the correct dimensions xs, ys.
[xs, ys, zs] = image_sample(lighthouse, 1);
subplot(1, 2, 1);
imagesc(xs, ys, zs);
axis image;
title 'Original Lighthouse';

[xss, yss, lighthouse_sampled] = image_sample(lighthouse, 2);
subplot(1, 2, 2);
imagesc(xss, yss, lighthouse_sampled);
axis image;
title 'Lighthouse sampled every 2';

% When comparing the two, you can see the number of pixels on the
% x-axis and y-axis of the original lighthouse are greater than the
% sampled. But even without seeing those numbers, you can tell that
% the sampled image looks more pixelated. It is not as sharp/clear.
% Overall, the images look very similar, but they are not the same.
% The sample that we took did not have enough values to make the
% pictures indistinguishable. Therefore, aliasing has manifested in
% our images, just like when you don't sample at a high enough
% frequency and get a signal that is different from your original.


%(c)
% Function amage_antialias is under 'My Functions' section

%(d)

lighthouse_aax6 = lighthouse;
for a = 1 : 6
    lighthouse_aax6 = image_antialias(lighthouse_aax6);
end

xs = size(lighthouse,1);
ys = size(lighthouse,2);

figure(3)

subplot(2, 2, 1);
imagesc(xs, ys, lighthouse);
axis image;
title 'Lighthouse';

subplot(2, 2, 2);
imagesc(xs, ys, lighthouse_aax6);
axis image;
title 'Lighthouse aax6';

[xs, ys, lighthouse_sampled] = image_sample(lighthouse, 2);
subplot(2, 2, 3);
imagesc(xs, ys, lighthouse_sampled);
axis image;
title 'Lighthouse sampled';

[xs, ys, lighthouse_aax6_sampled] = image_sample(lighthouse_aax6,2);
subplot(2, 2, 4);
imagesc(xs, ys, zs);
axis image;
title 'Lighthouse aax6 sampled';

% The anti-aliasing filter seems to blur the image a little bit. When
% you zoom in you can see that it sort of blends the colors together
% that are around each other. Now that the pixel groups are blended
% together, when you sample the image and take out some of the pixles,
% the image will still look very similar. This is shown with
% lighthouse_aax6_sampled. This is useful because we can now shrink
% images, yet keep most of the quality as shown with our example
% above. Smaller images are less memory to keep track of, less pixels
% to output.


%(e)
% Function image_insertzeros is under 'My Functions' section

%(f)

figure(4)
[xs, ys, zs] = image_sample(lighthouse, 1);
subplot(2, 2, 1);
imagesc(xs, ys, lighthouse);
axis image;
title 'Lighthouse';


[xz, yz, lighthouse_zeros] = image_insertzeros(lighthouse_aax6_sampled,2);
subplot(2, 2, 2);
imagesc(xz, yz, lighthouse_zeros);
axis image;
title 'Lighthouse Zeros';

lighthouse_interpolated = lighthouse_zeros;
for a = 1 : 6
    lighthouse_interpolated = image_antialias(lighthouse_interpolated);
end

subplot(2, 2, 3);
imagesc(xz, yz, lighthouse_interpolated);
axis image;
title 'Lighthouse Interpolated';

% The dimensions of lighthouse_interpolated are: 326x426 which is the
% size of the original image. This makes sense because we were
% interpolated a sampled image. So the process - relating to the
% size - shrunk, then expanded the image. The interpolation did the
% same thing as the last part, it blended the colors of each pixel.
% Becuase there were blank pixels this time, it helped fill those
% pixels with color.

colormap(gray);

%% Given Functions
% <include>image_system1.m</include>
%
% <include>image_stystem2.m</include>
%
% <include>image_system3.m</include>

%% My Functions
% <include>image_sample.m</include>
%
% <include>image_antialias.m</include>
%
% <include>image_insertzeros.m</include>

%% Extra Credit

%(b)
load('zebra.mat');

figure(5)

[xs, ys, zs] = image_sample(zebra, 1);
subplot(1, 2, 1);
imagesc(xs, ys, zs);
axis image;
title 'Original Zebra';

[xss, yss, zebra_sampled] = image_sample(zebra, 2);
subplot(1, 2, 2);
imagesc(xss, yss, zebra_sampled);
axis image;
title 'Zebra Sampled every 2';

% This time, it is definitely harder to see that the sampled image is
% more pixilated. This is due to the original image being much bigger.


%(d)

zebra_aax6 = zebra;
for a = 1 : 6
    zebra_aax6 = image_antialias(zebra_aax6);
end

xs = size(zebra,1);
ys = size(zebra,2);

figure(6)

subplot(2, 2, 1);
imagesc(xs, ys, zebra);
axis image;
title 'zebra';

subplot(2, 2, 2);
imagesc(xs, ys, zebra_aax6);
axis image;
title 'zebra aax6';

[xs, ys, zebra_sampled] = image_sample(zebra, 2);
subplot(2, 2, 3);
imagesc(xs, ys, zebra_sampled);
axis image;
title 'zebra sampled';

[xs, ys, zebra_aax6_sampled] = image_sample(zebra_aax6,2);
subplot(2, 2, 4);
imagesc(xs, ys, zs);
axis image;
title 'zebra aax6 sampled';

%(e)

figure(7)
[xs, ys, zs] = image_sample(zebra, 1);
subplot(2, 2, 1);
imagesc(xs, ys, zebra);
axis image;
title 'zebra';


[xz, yz, zebra_zeros] = image_insertzeros(zebra_aax6_sampled,2);
subplot(2, 2, 2);
imagesc(xz, yz, zebra_zeros);
axis image;
title 'zebra Zeros';

zebra_interpolated = zebra_zeros;
for a = 1 : 20
    zebra_interpolated = image_antialias(zebra_interpolated);
end

subplot(2, 2, 3);
imagesc(xz, yz, zebra_interpolated);
axis image;
title 'zebra Interpolated';
