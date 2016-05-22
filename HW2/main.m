obj = {'600mm'; '1200mm'; '1800mm'};
shi = {'0mm'; '1mm'; '5mm'; '10mm'; '20mm'};
objmm = [600, 1200, 1800];
shimm = [0, 1, 5, 10, 20];
pixelbymm = [4762/23.4, 3104/15.6];

for i=1 : 3
    
%     focal = 18;
%     interstArea(1,:) = [1350 1700 2100 2450];
%     interstArea(2,:) = [1450 1650 2250 2450];
%     interstArea(3,:) = [1450 1600 2250 2400];
    
%     focal = 53;
%     interstArea(1,:) = [1000 1800 1800 2700];
%     interstArea(2,:) = [1300 1700 2200 2600];
%     interstArea(3,:) = [1150 1400 2250 2550];
    
    focal = 135;
    interstArea(1,:) = [500 2000 1500 3000];
    interstArea(2,:) = [1000 2000 2000 3000];
    interstArea(3,:) = [500 1200 2000 2500];
    
    grays = zeros(interstArea(i,2)-interstArea(i,1)+1, interstArea(i,4)-interstArea(i,3)+1, 'uint8');
    for j=1 : 5
        img = imread( [obj{i} '_' shi{j} '.jpg'] );
        grays(:,:,j) = rgb2gray( img( interstArea(i,1):interstArea(i,2), interstArea(i,3):interstArea(i,4), :) );
        
    end
    
    multi = 1;
    while size(grays, 1)/multi > 300
        multi = multi + 1;
    end
    
    for j=2 : 5
        theoshift = hw1(grays(1:multi:end, 1:multi:end, 1), ...
                        grays(1:multi:end, 1:multi:end, j), 30, 100);
        theoshift = theoshift * multi;
    
        disp( ['Object distance: ' obj{i}] );
        disp( ['Object displacement: ' shi{j}] );
        disp( ['theoretical values: ' num2str(theoshift)] );
        x = shimm(j) * focal / objmm(i);
        disp( ['measured values: ' num2str(x * pixelbymm(1))] );
        disp( ['filed of view in degrees of angle: ' num2str(atan(23.4/2/focal)*180/pi)] );
        disp(' ');
    end
end