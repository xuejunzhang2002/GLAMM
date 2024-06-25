#!/bin/bash
#SBATCH --account=chaijy2
#SBATCH --partition=spgpu
#SBATCH --time=80:00:00  # Adjusted to 96 hours, change as needed
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4  # Increased CPU count for parallel processing
#SBATCH --mem=80G  # Adjust as per your job's requirement
#SBATCH --gres=gpu:1  # Adjust based on GPU needs
#SBATCH --job-name="glamm_validation"
#SBATCH --output=//nfs/turbo/coe-chaijy/xuejunzh/output-glamm/validation.log
#SBATCH --mail-type=BEGIN,END,FAIL  # Removed BEGIN and REQUEUE notifications

# LLaVA-7b  COCO single turn
python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/validation/merged_mixed_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/validation/mixed_data_with_predictions.json --dataset_type validation

# LLaVA-7b  ADE single turn
# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/validation/merged_homogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/validation/homogenous_data_with_predictions.json --dataset_type validation

# # LLaVA-7b  VG single turn
# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/validation/merged_heterogenous_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/validation/heterogenous_data_with_predictions.json --dataset_type validation

# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/validation/AAAAB_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/validation/AAAAB_data_with_predictions.json --dataset_type validation

# python 1by1.py --input_file /nfs/turbo/coe-chaijy/xuejunzh/data/validation/BAAAA_data.json --output_file /nfs/turbo/coe-chaijy-unreplicated/xuejunzh/output-glamm/validation/BAAAA_data_with_predictions.json --dataset_type validation