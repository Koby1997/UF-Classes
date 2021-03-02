function [za] = image_system2(z, Sx, Sy)
    % IMAGE_SYSTEM2 Translates an image up/down left/right and halves
    % the value. Does not do the 'revolving door' effect creates new
    % matrix filled with 0's that has the same dimensions as z
    za = zeros(size(z, 1), size(z, 2));
    for nn = 1: size(z, 1)
        for mm = 1: size (z, 2)
        % if your current row/colum - is within Sx/Sy distance from
        % each end of the matrix
            if nn > Sy && nn - Sy < size(z, 1) && mm > Sx && mm - Sx < size(z, 2)
            % sets za value to half of the z value that is (Sx, Sy)
            % distance away
            za (nn, mm) = 1/2* z(nn - Sy , mm - Sx);
            end
        end
    end
end