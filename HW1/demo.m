img1 = imread('trucka.bmp');
img2 = imread('truckb.bmp');
block = 8;

tic
[retx, rety] = motionvector(img2, img1, block, 25);
% quiver(retx, rety);

for i=1 : size(retx, 1)
    for j=1 : size(rety, 2)
        hold on;
%         scatter( (j-1)*block, (i-1)*block, 'k' );
        plot( [ (j-1)*block, (j-1)*block-rety(i, j) ], [ (i-1)*block (i-1)*block-retx(i,j) ], 'b' );
        hold off;
    end
end
toc

axis('ij');
set(gca,'ytick',[]);
set(gca,'xtick',[]);