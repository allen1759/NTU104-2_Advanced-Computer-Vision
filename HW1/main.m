img1 = imread('trucka.bmp');
img2 = imread('truckb.bmp');

currans = matching(img1, img2);

mergedisplay(img1, img2, currans);