%%Cited from below and we have modified for our application.
% MohammadReza Jabbari (Jabari) (2023). Basis Pursuit(https://www.mathworks.com/matlabcentral/fileexchange/73846-basis-pursuit), MATLAB Central File Exchange. Retrieved April 22, 2023.
%%
%FLOPS calculation
%First run this program and then open FLOPSmeasure.m script, read the
%instructions(change the program name in FLOPSmeasure.m) change required things and run it.
%You can load different data sets, repeat the above process to get FLOPS of
%corresponding data sets.

%After getting FLOPS for all data sets, we stored them and plotted using
%plotFLOPS.m
clear all
clc

load('iidGauss1e1.mat'); % loading data set
x = BP(t,phi); % calling BP function to calculate sparse vector.

save algoflopcmpMAT

function [ sparse_signal ] = BP( t,phi,e)
     D= length(phi); 
     cvx_begin quiet
       variables w(D) e
       minimize(norm(w,1)+1*e)
       subject to
         norm(t-phi*w,1)<=e;
         e>=0;
     cvx_end
     sparse_signal = w;
end
