    int cl = 20, sample_iterations =5, new_size = 1000*0.1, k_sample = 9, batch_sample_num = new_size/2, local_peak_threshold_sample = 25,
        k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 40;

ACC：0.929
ARI：0.927
AMI：0.974

----
    int cl = 20, sample_iterations = 10, new_size = 1000*0.1, k_sample = 10, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 40,k_out = 4, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 50;

ACC：0.998
ARI：0.996
AMI：0.996

----
    int cl = 20, sample_iterations = 15, new_size = 1000*0.1, k_sample = 30, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 40,k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 120;

ACC：0.999
ARI：0.998
AMI：0.998

----

    int cl = 20, sample_iterations = 20, new_size = 1000*0.1, k_sample = 20, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 40,k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 120;

ACC：1.0
ARI：1.0
AMI：1.0
