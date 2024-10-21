clear all; close all; clc;
pkg load signal;

x = [1 2 3 3];
h = [1 -1 1];

% convolucao linear
conv(x,h)

% convolucao circular
% o ultimo termo representa a quantidade de amostras
cconv(x,h,4)

