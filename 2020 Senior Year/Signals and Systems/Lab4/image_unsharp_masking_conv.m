function im_out = image_unsharp_masking_conv(im_in)

wb = [1/9,1/9,1/9;1/9,-8/9,1/9;1/9,1/9,1/9];
conv = conv2(wb, im_in);

conv(end - 1: end, :) = [];
conv(: ,end - 1 : end) = [];

%I know this is very hacky code, but I didn't know what else to do
%and I was running out of time/had a lot of other classwork to do

im_out = im_in - conv;

end