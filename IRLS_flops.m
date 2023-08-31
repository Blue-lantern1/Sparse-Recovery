%%Cited from below and we have modified for our application.
% aresmiki (2023). CS-Recovery-Algorithms (https://github.com/aresmiki/CS-Recovery-Algorithms), GitHub. Retrieved April 22, 2023.
%%
%FLOPS calculation
%First run this program and then open FLOPSmeasure.m script, read the
%instructions(change the program name in FLOPSmeasure.m) change required things and run it.
%You can load different data sets, repeat the above process to get FLOPS of
%corresponding data sets.

%After getting FLOPS for all data sets, we stored them and plotted using
%plotFLOPS.m

%%  It takes more time to run this algorithm, so please be patient.
%%  example a data set with 400 observations takes around 2 minutes

clear all
clc

load('iidGauss1e1.mat');
x = IRLS(t,phi,1e-8,0.1);

save algoflopcmpMAT

function ss=IRLS(t,phi,threshold,s)
th=1; 
ss=pinv(phi)*t;
while (th>threshold)
    P=diag((power(ss,2)+th));
    g=sqrt(P)*pinv(phi*sqrt(P))*t;  
    if((g-ss)'*(g-ss) < power(sqrt(th)*s,2))
        th=th*s; 
    end
    ss=g;
end
end