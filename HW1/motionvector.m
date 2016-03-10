function [ motionx, motiony ] = motionvector( img1, img2, blockSize, range )
%motoinvector Summary of this function goes here
%   Detailed explanation goes here

    % image size
    sizev = size(img1);
    img1 = int32(img1);
    img2 = int32(img2);
    
    % crop
    m = floor(sizev(1)/blockSize) * blockSize;
    n = floor(sizev(2)/blockSize) * blockSize;
    img1 = img1(1:m, 1:n);
    img2 = img2(1:m, 1:n);
    
    % image new size
    sizev = size(img1);
    % block size
    sizem = sizev / blockSize;
    
    motionx = zeros(sizem(1), sizem(2));
    motiony = zeros(sizem(1), sizem(2));

    
    for i=1 : sizem(1)
        for j=1 : sizem(2)
            minSum = 1e9;
            for x=-range : range
                for y=-range : range
                    value = countSum(img1, img2, (i-1)*blockSize+1, (j-1)*blockSize+1, x, y, blockSize);
                    if value < minSum
                        minSum = value;
                        vec = [x y];
                    end
                end
            end
            motionx(i, j) = vec(1);
            motiony(i, j) = vec(2);

        end
    end
end

function [ out ] = countSum( a1, a2, posx, posy, x, y , blockSize)
    out = int32(0);
    sizev = size(a2);
    for i=posx : posx+blockSize-1
        for j=posy : posy+blockSize-1
            if i+x>=1 && i+x<=sizev(1) && j+y>=1 && j+y<=sizev(2)
                out = out + int32( abs( a1(i,j) - a2(i+x,j+y) ) );
            else
                out = out + int32( abs( a1(i,j) - 128 ) );
            end
        end
    end
end
