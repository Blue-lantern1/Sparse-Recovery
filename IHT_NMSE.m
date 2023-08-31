%%Cited from below and we have modified for our application.
%MohammadReza Jabbari (Jabari) (2023). Iterative_Hard_Thresholding (https://www.mathworks.com/matlabcentral/fileexchange/124415-iterative_hard_thresholding), MATLAB Central File Exchange. Retrieved April 22, 2023.
%%
tic()
clear all
clc
observations=40:40:400;
for b=1:3
   for a=1:10
     load("iidGauss"+a+"e"+b+".mat");
     K = nnz(w);
     x = ItHT(t,phi,K);
     SE_gaussian_IHT(b,a) = (norm(w-x,2))^2/(norm(w,2))^2;
   end
end
figure(1)
plot(observations,SE_gaussian_IHT(1,:),'r')
hold on;
plot(observations,SE_gaussian_IHT(2,:),'g')
hold on;
plot(observations,SE_gaussian_IHT(3,:),'k')
hold on 
grid on
title("IHT-NMSE vs observations of gaussian entries")
xlabel("observations")
ylabel("NMSE")
legend('e1','e2','e3')



for b=1:3
   for a=1:10
     load("iidBern"+a+"e"+b+".mat");
     K = nnz(w);
     x = ItHT(t,phi,K);
     SE_bern_IHT(b,a) = (norm(w-x,2))^2/(norm(w,2))^2;
   end
end
figure(2)
plot(observations,SE_bern_IHT(1,:),'r')
hold on;
plot(observations,SE_bern_IHT(2,:),'g')
hold on;
plot(observations,SE_bern_IHT(3,:),'k')
hold on 
grid on
title("IHT-NMSE vs observations of bern entries")
xlabel("observations")
ylabel("NMSE")
legend('e1','e2','e3')
toc()

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
%Elapsed time is 6.365654 seconds.
