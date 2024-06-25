#!/bin/bash
#SBATCH --account=chaijy2
#SBATCH --partition=spgpu
#SBATCH --time=80:00:00  # Adjusted to 96 hours, change as needed
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4  # Increased CPU count for parallel processing
#SBATCH --mem=100G  # Adjust as per your job's requirement
#SBATCH --gres=gpu:1  # Adjust based on GPU needs
#SBATCH --job-name="glamm_5by1_train"
#SBATCH --output=//nfs/turbo/coe-chaijy/xuejunzh/output-glamm-5by1/train.log
#SBATCH --mail-type=BEGIN,END,FAIL  # Removed BEGIN and REQUEUE notifications

#export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:128

# LLaVA-7b  COCO single turn
python 5by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/merged_mixed_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm-5by1/train/mixed_data_with_predictions.json --dataset_type train

# LLaVA-7b  ADE single turn
python 5by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/merged_homogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm-5by1/train/homogenous_data_with_predictions.json --dataset_type train

# LLaVA-7b  VG single turn
python 5by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/merged_heterogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm-5by1/train/heterogenous_data_with_predictions.json --dataset_type train

# python 5by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/AAAAB_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm-5by1/train/AAAAB_data_with_predictions.json --dataset_type train

# python 5by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/train/BAAAA_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm-5by1/train/BAAAA_data_with_predictions.json --dataset_type train