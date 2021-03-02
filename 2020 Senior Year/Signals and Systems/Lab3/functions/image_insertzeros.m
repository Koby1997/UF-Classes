function [xz, yz, zz] = image_insertzeros(zaas, U)
    % IMAGE_insertzeros doubles the image size and puts a value of 0
    % in between every value in the matrix
    
    % creates matrix zs filled with 0's.
    % dimensions(zass-rows*U, zass-col*U, zass-k)
    zz = zeros(ceil(size(zaas, 1) * U), ceil(size(zaas, 2) * U), ceil(size(zaas, 3)));
    % creates 2 new arrays. One that is double the size of zass' rows.
    % And one that is double the size of zass' columns
    % Both counting from 1 to their size
    yz = 1: ceil(size(zaas, 1) * U);
    xz = 1: ceil(size(zaas, 2) * U);
    % sets the zz pixels in rows and colums that are multiples of U
    % equal to the pixles in zass
    zz(1:U:end, 1:U:end, 1:end) = zaas(1:end, 1:end, 1:end);
end