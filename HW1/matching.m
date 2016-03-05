function [ out ] = matching( file1, file2 )
%MATCHING Summary of this function goes here
%   Detailed explanation goes here


    rang = 50;
    img1 = imread(file1);
    img2 = imread(file2);
    %imshow(img1);
    %imshow(img2);
    
    minsum = 1e10;
    
    for x=-rang:rang
        for y=-rang:rang
            curr = getSum(img1, img2, x, y);
            if curr<minsum
                
                minsum = curr;
                out = [x y];
            end
        end
    end

end


function [ out ] = getSum( a1, a2, x, y )
    
    out = int32(0);
    sizev = size(a1);
    for i=1:sizev(1)
        for j=1:sizev(2)
            if i+x>=1 && i+x<=sizev(1) && j+y>=1 && j+y<=sizev(2)
                out = out + int32( abs( a1(i,j,1) - a2(i+x,j+y,1) ) );
                
            end
        end
    end
end


