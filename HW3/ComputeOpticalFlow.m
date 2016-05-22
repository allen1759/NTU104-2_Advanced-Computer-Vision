function [ Vx, Vy ] = ComputeOpticalFlow( img1, img2, iter, alpha )
%COMPUTEOPTICALFLOW Summary of this function goes here
%   Detailed explanation goes here

    img1 = rgb2gray(img1);
    img2 = rgb2gray(img2);

    img1 = im2double(img1) * 256;
    img2 = im2double(img2) * 256;
    
    
    % declare all variable I need
    [height, width] = size(img1);

    Vx = zeros(height, width);
    Vy = zeros(height, width);

    Ex = zeros(height-1, width-1);
    Ey = zeros(height-1, width-1);
    Et = zeros(height-1, width-1);
    
    images = cat(3, img1, img2);

    for x = 2:width-1
        for y = 2:height-1

            tmp = images(y+1,x+1,1) - images(y+1,x,1) + images(y,x+1,1)...
                  - images(y,x,1) + images(y+1,x+1,2) - images(y+1,x,2)...
                  + images(y,x+1,2) - images(y,x,2);
            Ex(y, x) = tmp/4;

            tmp = images(y,x,1) - images(y+1,x,1) + images(y,x+1,1)...
                  - images(y+1,x+1,1) + images(y,x,2) - images(y+1,x,2)...
                  + images(y,x+1,2) - images(y+1,x+1,2);
            Ey(y, x) = tmp/4;

            tmp = images(y+1,x,2) - images(y+1,x,1) + images(y,x,2)...
                  - images(y,x,1) + images(y+1,x+1,2) - images(y+1,x+1,1)...
                  + images(y,x+1,2) - images(y,x+1,1);
            Et(y, x) = tmp/4;
        end
    end

    for i = 1 : iter
        for x = 2 : width-1
            for y = 2 : height-1

                tmp1 = (Vx(y-1,x) + Vx(y,x+1) + Vx(y+1,x) + Vx(y,x-1)) / 6;
                tmp2 = (Vx(y-1,x-1) + Vx(y-1,x+1) + Vx(y+1,x+1) + Vx(y+1,x-1)) / 12;
                Vxbar = tmp1 + tmp2;

                tmp1 = (Vy(y-1,x) + Vy(y,x+1) + Vy(y+1,x) + Vy(y,x-1)) / 6;
                tmp2 = (Vy(y-1,x-1) + Vy(y-1,x+1) + Vy(y+1,x+1) + Vy(y+1,x-1)) / 12;
                Vybar = tmp1 + tmp2; 

                tmp1 = (Ex(y,x)*Vxbar+Ey(y,x)*Vybar+Et(y,x));
                tmp2 = (alpha^2 + Ex(y,x)^2 + Ey(y,x)^2);
                tmp3 = tmp1 / tmp2;
                
                Vx(y, x) = Vxbar - Ex(y,x)*tmp3;
                Vy(y, x) = Vybar - Ey(y,x)*tmp3;

            end
        end
    end

end

