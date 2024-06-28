#!/bin/bash
#SBATCH --account=chaijy2
#SBATCH --partition=spgpu
#SBATCH --time=80:00:00  # Adjusted to 96 hours, change as needed
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4  # Increased CPU count for parallel processing
#SBATCH --mem=80G  # Adjust as per your job's requirement
#SBATCH --gres=gpu:1  # Adjust based on GPU needs
#SBATCH --job-name="glamm_train"
#SBATCH --output=//nfs/turbo/coe-chaijy/xuejunzh/output-glamm/train.log
#SBATCH --mail-type=BEGIN,END,FAIL  # Removed BEGIN and REQUEUE notifications

# LLaVA-7b  COCO single turn
python 1by1.py --input_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/mixed_data_with_predictions_new2.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/mixed_data_with_predictions_new3.json --dataset_type train

# # LLaVA-7b  ADE single turn
# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/merged_homogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/homogenous_data_with_predictions.json --dataset_type train

# # LLaVA-7b  VG single turn
# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/merged_heterogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/heterogenous_data_with_predictions.json --dataset_type train

# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/AAAAB_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/AAAAB_data_with_predictions.json --dataset_type train

# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/BAAAA_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/train/BAAAA_data_with_predictions.json --dataset_type train