clear
clc
profile on
BP_flops % <-------change program name here
profileStruct = profile('info');
[flopTotal,Details]  = FLOPS('BP_flops','algoflopcmpMAT',profileStruct); %<-------change program name