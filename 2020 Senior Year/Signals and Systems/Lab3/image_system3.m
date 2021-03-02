function [zb] = image_system3(za, Sx, Sy)
    % IMAGE_SYSTEM3 Takes a matrix and shift values. Shifts the given
    % matrix by the values with a revolving door effect for the
    % left/right direction and up/down direction
    % creates 2 new arrays with a size of the row/col length -1
    x = 0:1: size(za, 2) -1;
    y = 0:1: size(za, 1) -1;
    % takes the modulus of each index value minus the shift verses the size
    xs = mod(x - Sx, size(za, 2));
    ys = mod(y - Sy, size(za, 1));
    % creates zb with ys values in its rows and xs in its columns
    zb = za(ys +1, xs +1);
end