img1 = imread('lenna1.png');
img2 = imread('lenna2.png');

% img1 = imread('sphere.1.jpg');
% img2 = imread('sphere.2.jpg');

[retx, rety] = ComputeOpticalFlow(img1, img2, 90, 1);

scale = 5;
hold on;
for i = 2 : 10 : size(img1, 2)
    for j = 2 : 10 : size(img1, 1)
        scatter(j, i, '.g');
        plot([j, j+(-scale)*retx(i, j)], [i, i + (scale)*rety(i, j)], 'b');
    end
end
hold off;
        

axis('ij');
set(gca,'ytick',[]);
set(gca,'xtick',[]);
axis([0 size(img1, 1) 0 size(img1, 2)]);