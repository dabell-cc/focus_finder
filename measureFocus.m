%David Bell - 2014
%measureFocus.m
function [stdc, sumc, avgc] = measureFocus(file)
Im = imread(file); %Load image
BW = rgb2gray(Im); %Confirm image is grayscale intensities
hy = fspecial('sobel');hx = -1.*hy.'; %define sobel filter

%Perform filtering and combine x - y components
Sx = imfilter(double(BW),hx);Sy = imfilter(double(BW), hy);
S = sqrt(Sx.^2 + Sy.^2); 

%Compute aggregates with filtered values
stdc = std2(S);
%For sum and mean focus is identified easier without sqrt
sumc = sum(sum(Sx.^2 + Sy.^2)); 
avgc = mean(mean(Sx.^2 + Sy.^2));
%imtool(S/max(max(S)));imtool(BW);
