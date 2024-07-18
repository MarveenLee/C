int cl = 15, sample_iterations =10, new_size = 5000*0.1, k_sample = 10, batch_sample_num = new_size/2, local_peak_threshold_sample = 30,
        k_out = 6, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 20;

ACC:0.94

----

int cl = 15, sample_iterations = 20, new_size = 5000*0.1, k_sample = 10, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 7, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 30;

ACC:0.934
ARI:0.871
AMI:0.898

----
 int cl = 15, sample_iterations = 5, new_size = 5000*0.1, k_sample = 12, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 30,k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 20;

ACC：0.935
ARI：0.874
AMI：0.900

----

 int cl = 15, sample_iterations = 15, new_size = 5000*0.1, k_sample = 10, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 7, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 25;

ACC:0.935
ARI:0.872
AMI:0.899