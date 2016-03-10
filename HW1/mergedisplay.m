function [ output_args ] = mergedisplay( img1, img2, shift )
%MERGEDISPLAY Summary of this function goes here
%   Detailed explanation goes here

    x = shift(1);
    y = shift(2);
    
    sizev = size(img1);
    merge1 = zeros(sizev(1), sizev(2), 'uint8');
    newsize = sizev + 20;
    img3 = zeros(newsize(1), newsize(2), 'uint8');
    img4 = zeros(newsize(1), newsize(2), 'uint8');
    merge2 = zeros(newsize(1), newsize(2), 'uint8');
    
    for i=1 : sizev(1)
        for j=1 : sizev(2)
            merge1(i, j) = img1(i, j)/2 + img2(i, j)/2;
            img3(i+10, j+10) = img1(i, j);
            img4(i+10-x, j+10-y) = img2(i, j);
        end
    end
    
    for i=1 : newsize(1)
        for j=1 : newsize(2)
            merge2(i, j) = img3(i, j)/2 + img4(i, j)/2;
        end
    end
    
    imshow(merge1);
    pause(3);
    imshow(merge2);

end

