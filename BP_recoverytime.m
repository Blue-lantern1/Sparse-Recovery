%%Cited from below and we have modified for our application.
% MohammadReza Jabbari (Jabari) (2023). Basis Pursuit(https://www.mathworks.com/matlabcentral/fileexchange/73846-basis-pursuit), MATLAB Central File Exchange. Retrieved April 22, 2023.
%%
%%in command window, run times will be displayed for all the data sets.
%We collected that data in excel sheet and used for plotting in the
%plotRecoveyTime.m script
%tic-toc is used to calculated the run time
clear all
clc
observations=40:40:400;
for b=1:3
   for a=1:10
     load("iidGauss"+a+"e"+b+".mat"); % loading data set
     tic(); 
     x = BP(t,phi); % calling BP function to calculate sparse vector.
     toc();
   end
end


for b=1:3
   for a=1:10
     load("iidBern"+a+"e"+b+".mat");
     tic();
     x = BP(t,phi);
     toc();
   end
end


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