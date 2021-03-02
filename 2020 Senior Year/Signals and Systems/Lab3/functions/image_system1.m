function [xs, ys, zs] = image_system1(z, Dx, Uy)
    % IMAGE_SYSTEM1 Creates a new matrix based on z and given
    % proportions. Can stretch vertically or squish horizontally.
    % The size of the proportion need to make sure that the dimensions
    % of zs are opposite of z (meaning if z has dimensions(r,c), zs
    % needs to be (c,r) Then it fills zs with only some of the values
    % from z.
    
    % creates matrix zs filled with 0's.
    % dimensions(z-rows*Uy, z-col/Dx)
    zs = zeros(ceil(Uy * size(z, 1)), ceil(size(z, 2) / Dx));
    % creates 2 new arrays. One that is double the size of z's rows.
    % And one that is half of the size of z's columns.
    % Both counting from 1 to their size
    ys = 1: ceil(Uy * size(z ,1));
    xs = 1: ceil(size(z, 2) / Dx);
    % sets the zs rows that are multiples of Uy equal to the z columns
    % that are multiples of Dx. The rest of zs is 0
    zs(1: Uy : end, 1: end) = z(1: end, 1: Dx : end);
end