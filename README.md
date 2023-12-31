# Sparse-Recovery
Sparse Recovery using non-convex optimization techniques
Course: EE609A: Convex Optimization in Signal Processing and Communication
– Measurement vector in data is obtained by projections on design matrix, whose rows look like noise-waveforms; corresponding regressor vector is sparse when encoded. Capable algorithms are required to recover these sparse vectors.
– In this work, we have implemented three algorithms namely; Basis Pursuit(BP), Iteratively Reweighted Least Squares
(IRLS) and Iterative Hard Thresholding (IHT) alognside generating our own data set namely, iid Gaussian and Bernoulli.
– The performance of the algorithms is compared on the basis of NMSE, FLOP count and recovery time.

Simulation results have been provided in 'simulation results' folder

simulation data has been captured in plotting scripts. please run them to see the results
1.plotNMSE
2.plotRecoveryTime
3.plotFLOPS

Execution flow: (see the instruction as well provided inside each script)

1.data creation
Data sets created follow the systax - "iid"+"type of design matrix"+number1+"e"+number2
Type of design matrix - Gauss,Bern
number1 range - 1 to 10
number2 range - 1 to 3

2.IHT_NMSE
3.IHT_recoverytime
4.IHT_flops
5.FLOPSmeasure (to get flops count)

6.BP_NMSE
7.BP_recoverytime
8.BP_flops
9.FLOPSmeasure (to get flops count)

following scripts take comparitively longer time for larger data set
10.IRLS_NMSE
11.IRLS_recoverytime
12.IRLS_flops
13.FLOPSmeasure (to get flops count)
