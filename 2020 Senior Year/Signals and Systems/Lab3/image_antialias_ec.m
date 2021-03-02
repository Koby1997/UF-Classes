function [za] = image_antialias_ec(z)
    % IMAGE_antialias filters a grayscale matrix by blending each
    % pixles with the pixels around it. Outputs the new blended matrix
    
    za = zeros(size(z, 1), size(z, 2), size(z, 3));
    for k = 1: size(z,3)
        for x = 1: size(z, 1)
            for y = 1: size (z, 2)
            % if your current row/colum - is within Sx/Sy distance from
            % each end of the matrix
                if x - 1 > 0 && y - 1 > 0 && x + 1 < size(z,1) && y + 1 < size(z,2)
                % sets za value to half of the z value that is (Sx, Sy)
                % plus, 1/8th of each pixle on the left/right/top/bottom
                za (x,y,k) = 1/2*z(x,y,k) + 1/8*(z(x-1,y,k) + z(x+1,y,k) + z(x,y-1,k) + z(x,y+1,k));
                end
            end
        end
    end
end