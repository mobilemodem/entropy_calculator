% Entropy Calculator 
%
% Purpose 
% To compare analytic and estimated values of entropy for two distributions 
% Record of Revision : 
%       date            programmer            description
%       ====            ==========            ===========
%     05/24/2019     Mehrdad Kashefi        Original code 
% 
% Define variables : 
%   num_bin       -- Number of bins to calculate histogram 
%   num_sample    -- Number of samples used
%...........................................................
% clearing the page and variables
clear;
clc;
%% Create samples
num_bin = 100; % Number of bins to claculate histograms and entropy
num_sample = 10000; % Number of samples 
variance = 1;  % Variance of distributions
x_normal = random('Normal',0,variance,num_sample,1); 
x_uniform = random('Uniform',0,sqrt(12*variance),num_sample,1);
%% Plot Histograms
figure
hist(x_uniform,num_bin)
title('Uniform Histogram')

figure
hist(x_normal,num_bin)
title('Normal Histogram')
%% Calculate Real and Stimated Entropies
entropy_normal_estimated = sample_entropy(x_normal,num_bin);
entropy_normal = log(variance*sqrt(2*pi*exp(1)));
% Uniform
entropy_uniform_estimated = sample_entropy(x_uniform,num_bin);
entropy_uniform = log(max(x_uniform)-min(x_uniform));
%% Print Results
disp('Uniform Distribution')
disp(['Analytic Entropy: ', num2str(entropy_uniform)])
disp(['Estimated Entropy: ',num2str(entropy_uniform_estimated)])
disp(['Estimation Error: ',num2str( abs( entropy_uniform-entropy_uniform_estimated))])
disp('===============')
disp('Normal Distribution')
disp(['Analytic Entropy: ', num2str(entropy_normal)])
disp(['Estimated Entropy: ',num2str(entropy_normal_estimated)])
disp(['Estimation Error: ',num2str( abs(entropy_normal-entropy_normal_estimated))])