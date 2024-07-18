int cl = 2, sample_iterations = 5, new_size = 4096*0.1, k_sample = 9, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 8;

ACC:0.948
ARI:0.804
AMI:0.714

----

int cl = 2, sample_iterations = 10, new_size = 4096*0.1, k_sample = 9, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 5, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 10;

ACC:0.960
ARI:0.848
AMI:0.761

----

    int cl = 2, sample_iterations = 15, new_size = 4096*0.1, k_sample = 12, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 6, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 12;

ACC:0.963
ARI:0.859
AMI:0.773

----
    int cl = 2, sample_iterations = 20, new_size = 4096*0.1, k_sample = 10, batch_sample_num = new_size/2,
    local_peak_threshold_sample = 50,k_out = 4, batch_out_num = cl*sample_iterations/2, local_peak_threshold_out = 10;

ACC:0.964
ARI:0.862
AMI:0.778

