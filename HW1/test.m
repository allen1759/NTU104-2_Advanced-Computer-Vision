function [ output_args ] = test( file1, file2, shift )
%TEST Summary of this function goes here
%   Detailed explanation goes here

    img1 = imread(file1);
    img2 = imread(file2);
    x = shift(1);
    y = shift(2);
    
    sizev = size(img1);
    newsize = sizev + 20;
    img3 = zeros(newsize(1), newsize(2), 'uint8');
    img4 = zeros(newsize(1), newsize(2), 'uint8');
    
    for i=1 : sizev(1)
        for j=1 : sizev(2)
            img3(i+10, j+10) = img1(i, j);
            img4(i+10-x, j+10-y) = img2(i, j);
        end
    end
    
%     for i=1:20
%         if mod(i,2) == 0
%             imshow(img1);
%         else
%             imshow(img2);
%         end
%         pause(0.1);
%     end

    for i=1:30
        if mod(i,2) == 0
            imshow(img3);
        else
            imshow(img4);
        end
        pause(0.1);
    end

end

