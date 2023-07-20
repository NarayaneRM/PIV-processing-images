function x=ReadImage(image)
    I = imread(image);
    I = rgb2gray(I);
    I = mat2gray(I);
    x=I;
    return;
end