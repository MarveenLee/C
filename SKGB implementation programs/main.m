clear;clc;
data = importdata('data/Chainlink_data.txt');  

% ------------------------Parameters---------------------------------------
num_samples = 50;                                   % parameter S: number of sample sets,
sample_size = round(0.1 * size(data, 1));           % parameter alpha
target_ball_count = 10;                             % parameter M: the number of balls
k = 2;                                              % the number peak balls, category number CK
%--------------------------------------------------------------------------
% Shuffle the seed based on the current time
rng('shuffle');
% Record the current seed and the random number generator settings
seedData = rng;
% Display the seed
disp(['Seed: ', num2str(seedData.Seed)]);
% Save the seed to a file
save('generate_files/seedData.mat', 'seedData');

all_peaks = [];
total_time_tic = tic;
time_Step2 = tic;
for i = 1:num_samples
   
    % Step1: Randomly sampling
    sampled_set = data(randperm(size(data, 1), sample_size), :);
    % Step2: Find peaks of GB and merge them
    [ball_centers, ball_radius, points_per_ball] = GB_generation(sampled_set, target_ball_count);  % Generate GB for each sample set 
    median_radius = median(ball_radius);
    
    density = calculateDensity2(ball_radius, points_per_ball, median_radius);
    delta = calculateDelta(density, ball_centers);   % Calculate delta for each GB
    gamma = density .* delta;
    peaks = getTopKPeaks(gamma, ball_centers, k);
    all_peaks(end + 1:end + size(peaks, 1), :) = peaks;
   
end

total_time_Step2  = toc(time_Step2);
disp(['Time for Step2: ', num2str(total_time_Step2 ), ' s']);

% Deduplicate merged peaks
all_peaks = unique(all_peaks, 'rows');
dlmwrite('generate_files/ori_all_peaks.txt', all_peaks);
try
    % Divide merged peaks into Keyballs
    tic; 
    [all_peaks, ball_radius, points_per_ball] = GB_generation_2(all_peaks);
    time_Step3 = toc; 
    disp(['Time for Step3: ', num2str(time_Step3), ' s']);
    dlmwrite('generate_files/all_peaks.txt', all_peaks);
    if size(all_peaks, 1) < k
        error('Insufficient number of input data points.'); 
    end
    % Step4: Construct the skeleton by DPeak-like on GB
    tic;
    [label_all_peaks, peaks, nneigh, ordgamma] = obtain_skeleton2(all_peaks, ball_radius, points_per_ball, k);
    time_Step4 = toc; 
    disp(['Time for Step4: ', num2str(time_Step4), ' s']);
catch e
    disp(getReport(e, 'basic'));  
    return; 
end

% Step4: Calculate the min distance between all_peaks and all data points to assign labels
tic; 
labels_data = assignLabelsToData(label_all_peaks, all_peaks, data);
time_Step5 = toc; 
disp(['Time for Step5: ', num2str(time_Step5), ' s']);

total_time = toc(total_time_tic);
disp(['Total time for Clustering: ', sprintf('%.4f', total_time), ' s']);

%Saving labels to .txt labels
tic;
writematrix(labels_data, 'generate_files/Chainlink_labels.txt');
time_save = toc; 
disp(['Time for saving labels: ', num2str(time_save), ' s']);
