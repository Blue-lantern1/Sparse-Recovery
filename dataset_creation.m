%%
%Everytime change N,M,D_o, and generate phi,w
%keeping phi,w constant change variance and generate epsilon, thereby
%generate t and then save the data set

clear t;
clc;

N=40; % change N as required (our case +40)
M=80; % change M as required (our case + 80
D_o=14; % sparsity level (k)/ change as required (our case +14)

variances_dB=[-20 -10 0]; % dB 
variances = 10.^(variances_dB/10); % e1, e2, e3

phi = normrnd(0,1,[N,M]); %generating iid Gaussian design matrix
%phi = randsrc(N,M); % generating iid Bernoulli design matrix

w = sparse(sort(randsample(1:M,D_o)),ones(1,D_o),normrnd(0,1,[1,D_o]),M,1); % generating sparse vector
epsilon = normrnd(0,sqrt(variances(1)),[N,1]); % generating noise entries
    
t = phi*w + epsilon; % generating t

save iidGauss1e1.mat t phi w epsilon %saving the data set