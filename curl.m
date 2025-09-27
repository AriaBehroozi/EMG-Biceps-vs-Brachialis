clear;
close all;
clc;
%% reading the excell file 
raw_biceps_mvc = xlsread('biceps_ mvc.exc.xlsx');
raw_biceps_mvc = raw_biceps_mvc(1:end,2);
%% filter data
F_sampling =  1 / 0.0005;
F_nyquist = F_sampling/2;
F_band_low = 20; %lower ferequencies get removed
F_band_high = 500; %higher ferequencies get removed
wn = [F_band_low/F_nyquist,F_band_high/F_nyquist];
order = 2; %its advided to use 4 as order, but when we use filtfilt it atomatically equals 4
[b,a] = butter(order,wn,'bandpass');
filtered_data_biceps = filtfilt(b,a,raw_biceps_mvc);
%% reaching the mvc for biceps
square = (filtered_data_biceps).^2;
moving_mean= movmean(square,20); 
root_mvc_bicep = sqrt(moving_mean);
MVC_bicep = max(root_mvc_bicep);
%% reading the excell file 
raw_breachi_mvc = xlsread('br_mvc_exc.xlsx');
raw_breachi_mvc = raw_breachi_mvc(1:end,10);
%% filter data
%F_sampling =  1 / 0.0005;
%F_nyquist = F_sampling/2;
%F_band_low = 20; %lower ferequencies get removed
%F_band_high = 500; %higher ferequencies get removed
%wn = [F_band_low/F_nyquist,F_band_high/F_nyquist];
%order = 2; %its advided to use 4 as order, but when we use filtfilt it atomatically equals 4
%[b2,a2] = butter(order,wn,'bandpass');
filtered_data_breachi = filtfilt(b,a,raw_breachi_mvc);
%% reaching the mvc for breachi
square_breachi = (filtered_data_breachi).^2;
moving_mean_breachi = movmean(square_breachi,20); 
root_mvc_breachi = sqrt(moving_mean_breachi);
MVC_breachi = max(root_mvc_breachi);

%clearvars -except MVC_biceps MVC_breachi
%% reading the real data
raw_bicep_curl =  xlsread('bicep_curl.exc.xlsx');
raw_curl_bicep = raw_bicep_curl(1:end,2);
raw_curl_breachi = raw_bicep_curl(1:end,10);
raw_hammer_curl = xlsread('br_curl.exc.xlsx');
raw_hammer_bicep = raw_hammer_curl(1:end,2);
raw_hammer_breachi = raw_hammer_curl(1:end,10);
%% filtering data
filtered_curl_bicep = filtfilt(b,a,raw_curl_bicep);
filtered_curl_breachi =filtfilt(b,a,raw_curl_breachi);
filtered_hammer_bicep = filtfilt(b,a,raw_hammer_bicep);
filtered_hammer_breachi = filtfilt(b,a,raw_hammer_breachi);
%% RMS for bicep in curl
square_curl_bicep = filtered_curl_bicep.^2;
moving_mean_curl_bicep = movmean(square_curl_bicep,20);
root_curl_bicep = sqrt(moving_mean_curl_bicep);
%RMS_curl_bicep = max(root_curl_bicep);
%% RMS for breachi in curl
square_curl_breachi = filtered_curl_breachi.^2;
moving_mean_curl_breachi = movmean(square_curl_breachi,20);
root_curl_breachi = sqrt(moving_mean_curl_breachi);
%RMS_curl_breachi = max(root_curl_breachi);
%% RMS for bicep in hammer
square_hammer_bicep = filtered_hammer_bicep.^2;
moving_mean_hammer_bicep = movmean(square_hammer_bicep,20);
root_hammer_bicep= sqrt(moving_mean_hammer_bicep);
%RMS_hammer_bicep = max(root_hammer_bicep);
%% RMS for breachi in hammer
square_hammer_breachi = filtered_hammer_breachi.^2;
moving_mean_hammer_breachi = movmean(square_hammer_breachi,20);
root_hammer_breachi= sqrt(moving_mean_hammer_breachi);
%RMS_hammer_breachi = max(root_hammer_breachi);
%% RMX bicep / MVC bicep in curl 
normalized_curl_bicep = (root_curl_bicep / MVC_bicep)*100;
%% RMS breachi/ MVC breachi in curl 
normalized_curl_breachi = (root_curl_breachi / MVC_breachi)*100;
%% RMS bicep / MVC bicep in hammer
normalized_hammer_bicep = (root_hammer_bicep / MVC_bicep)*100;
%% RMS breachi / MVC breachi in hammer
normalized_hammer_breachi = (root_hammer_breachi / MVC_breachi)*100;
%% plot normalized bicep and normalized breachi in curl 
figure;
plot(normalized_curl_bicep, 'b', 'LineWidth', 1.5); hold on;
plot(normalized_curl_breachi, 'r', 'LineWidth', 1.5);
xlabel('Samples');
ylabel('Normalized EMG (%MVC)');
title('Normalized EMG during Bicep Curl');
legend('Bicep', 'Brachii');
ylim([0, 100]);
grid on;
%% plot nomralized bicep and normalized breachi in hammer 
figure;
plot(normalized_hammer_bicep, 'b', 'LineWidth', 1.5); hold on;
plot(normalized_hammer_breachi, 'r', 'LineWidth', 1.5);
xlabel('Samples');
ylabel('Normalized EMG (%MVC)');
title('Normalized EMG during Hammer Curl');
legend('Bicep', 'Brachii');
ylim([0, 100])
grid on;






