> schedule.sh

for loss in "l1" "mse" "logcosh" "logcosh_ssim" "l1_ssim"
do
    for config in $(find configurations/nif/kodak_losses/$loss/*.yaml)
    do
        config_file=$(basename $config)
        config_id="${config_file%.yaml}"
        for i in {1..24}
        do
            log_file="logs/${loss}_${config_id}_$i.txt"
            echo "./experiment.sh $config test_images/kodak/$i.png results/nif/kodak/${loss}/$config_id/$i > $log_file 2>&1" >> schedule.sh
        done
    done
done
