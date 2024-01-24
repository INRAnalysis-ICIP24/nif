> schedule.sh

for loss in "l1" "mse" "logcosh" "logcosh_ssim" "l1_ssim"
do
    for config in $(find configurations/nif/clic2020_losses/$loss/*.yaml)
    do
        config_file=$(basename $config)
        config_id="${config_file%.yaml}"
        for file in test_images/clic2020/*.png
        do
            basename=$(basename $file)
            i=${basename%.*}
            log_file="logs/${loss}_${config_id}_$i.txt"
            echo "./experiment.sh $config test_images/clic2020/$i.png results/nif/clic2020/${loss}/$config_id/$i > $log_file 2>&1" >> schedule.sh
        done
    done
done
