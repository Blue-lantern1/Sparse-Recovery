%%Cited from below and we have modified for our application.
% aresmiki (2023). CS-Recovery-Algorithms (https://github.com/aresmiki/CS-Recovery-Algorithms), GitHub. Retrieved April 22, 2023.
%%
%%in command window, run times will be displayed for all the data sets.
%We collected that data in excel sheet and used for plotting in the
%plotRecoveyTime.m script
%tic-toc is used to calculated the run time

%%  It takes more time to run this algorithm, so please be patient.
%%  example a data set with 400 observations takes around 2 minutes
%%  this programs runs for all datasets, so it takes around 30 minutes.

clear all
clc
observations=40:40:400;
for b=1:3
   for a=1:10
     load("iidGauss"+a+"e"+b+".mat");
     tic();
     x = IRLS(t,phi,1e-8,0.1);
     toc();
   end
end
%figure(1)
%plot(observations,SE_gaussian_IRLS(1,:),'r')
%hold on;
%plot(observations,SE_gaussian_IRLS(2,:),'g')
%hold on;
%plot(observations,SE_gaussian_IRLS(3,:),'k')
%hold on 
%grid on
%title("IRLS-NMSE vs observations of gaussian entries")
%xlabel("observations")
%ylabel("NMSE")
%legend('e1','e2','e3')



for b=1:3
   for a=1:10
     load("iidBern"+a+"e"+b+".mat");
     tic();
     x = IRLS(t,phi,1e-8,0.1);
     toc();
   end
end
%figure(2)
%plot(observations,SE_bern_IRLS(1,:),'r')
%hold on;
%plot(observations,SE_bern_IRLS(2,:),'g')
%hold on;
%plot(observations,SE_bern_IRLS(3,:),'k')
%hold on 
%grid on
%title("IRLS-NMSE vs observations of bern entries")
%xlabel("observations")
%ylabel("NMSE")
%legend('e1','e2','e3')

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
% time taken : 247.800278 seconds
