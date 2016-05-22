function [ output ] = hw1( img1, img2, block, range )
%HW1 Summary of this function goes here
%   Detailed explanation goes here

%     block = 30;
%     range = 20;

    tic
    [retx, rety] = motionvector(img2, img1, block, range);
    
    for i=1 : size(retx, 1)
        for j=1 : size(rety, 2)
            hold on;
            scatter( (j-1)*block, (i-1)*block, 'k' );
            plot( [ (j-1)*block, (j-1)*block-rety(i, j) ], [ (i-1)*block (i-1)*block-retx(i,j) ], 'b' );
            hold off;
        end
    end
    toc

    axis('ij');
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    
%     xx = sort(retx);
%     xx = xx(max(1, floor(size(xx,2)/4)) : min(end, ceil(size(xx,2)*3/4)));
%     output = mean(xx);
    
    yy = sort( reshape(rety, 1, numel(rety)) );
    yy = yy(max(1, floor(size(yy,2)/4)) : min(end, ceil(size(yy,2)*3/4)));
    output = -mean(yy);
    
%     keyboard;

end

