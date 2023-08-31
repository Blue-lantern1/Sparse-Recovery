%%Cited from below and we have modified for our application.
% MohammadReza Jabbari (Jabari) (2023). Basis Pursuit(https://www.mathworks.com/matlabcentral/fileexchange/73846-basis-pursuit), MATLAB Central File Exchange. Retrieved April 22, 2023.
%%
tic()
clear all
clc
observations=40:40:400;
for b=1:3
   for a=1:10
     load("iidGauss"+a+"e"+b+".mat"); % loading dataset
     x = BP(t,phi); % calling BP function to calculate sparse vector
     SE_gaussian_BP(b,a) = (norm(w-x,2))^2/(norm(w,2))^2; % calculating NMSE for each dataset
   end
end
figure(1)
plot(observations,SE_gaussian_BP(1,:),'r')
hold on;
plot(observations,SE_gaussian_BP(2,:),'g')
hold on;
plot(observations,SE_gaussian_BP(3,:),'k')
hold on 
grid on
title("BP-NMSE vs observations of gaussian entries")
xlabel("observations")
ylabel("NMSE")
legend('e1','e2','e3')



for b=1:3
   for a=1:10
     load("iidBern"+a+"e"+b+".mat");
     x = BP(t,phi);
     SE_bern_BP(b,a) = (norm(w-x,2))^2/(norm(w,2))^2;
   end
end
figure(2)
plot(observations,SE_bern_BP(1,:),'r')
hold on;
plot(observations,SE_bern_BP(2,:),'g')
hold on;
plot(observations,SE_bern_BP(3,:),'k')
hold on 
grid on
title("BP-NMSE vs observations of bern entries")
xlabel("observations")
ylabel("NMSE")
legend('e1','e2','e3')
toc()

function [ sparse_signal ] = BP(t,phi,e)
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
% time taken : 247.800278 seconds
