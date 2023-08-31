%%Cited from below and we have modified for our application.
%MohammadReza Jabbari (Jabari) (2023). Iterative_Hard_Thresholding (https://www.mathworks.com/matlabcentral/fileexchange/124415-iterative_hard_thresholding), MATLAB Central File Exchange. Retrieved April 22, 2023.
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

load('iidBern10e3.mat');
K = nnz(w);
x = ItHT(t,phi,K);

save algo3flopcmpMAT

function [ ss ] = ItHT(t,phi,K)
N = length(phi);
ss = zeros(N,1);
proj = phi'*t;
[~,sortIndex] = sort(abs(proj),'descend');
T = sortIndex(1:K);
e(1)=0;
 g = phi'*(t-phi*ss);
 v = g(T)'*g(T)/(g(T)'*phi(:,T)'*phi(:,T)*g(T));
  z = ss + (v*g);
  [~,sortIndex] = sort(abs(z),'descend');   % Sort the values in descending order
 maxIndex = sortIndex(1:K);
 u = zeros(N,1);
 u(maxIndex) = z(maxIndex);
  ss = u;
 T = find(ss);
 m=2;
 t_dash=phi*ss;
 e(m)=(norm(t-t_dash,2))^2/(norm(t,2))^2;
while(e(m) ~= e(m-1))
    g = phi'*(t-phi*ss);
    v = g(T)'*g(T)/(g(T)'*phi(:,T)'*phi(:,T)*g(T));
    z = ss + (v*g);
    [~,sortIndex] = sort(abs(z),'descend');   % Sort the values in descending order
    maxIndex = sortIndex(1:K);
    u = zeros(N,1);
    u(maxIndex) = z(maxIndex);
    ss = u;
    m=m+1;
    t_dash=phi*ss;
   e(m)=(norm(t-t_dash,2))^2/(norm(t,2))^2;
    T = find(ss);
end
end
