#!/bin/bash
#SBATCH --job-name="a.out_symmetric"
#SBATCH --output="a.out.%j.%N.out"
#SBATCH --partition=gpuA100x4
#SBATCH --mem=208G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --constraint="scratch&projects&ime"
#SBATCH --gpus-per-node=4
#SBATCH --gpu-bind=closest
#SBATCH --account=bcwg-delta-gpu
#SBATCH -t 15:00:00
#SBATCH --exclusive
#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out



PID_FILE="process_ids_gpt4o.txt"

# Empty the PID file if it exists or create if not
> $PID_FILE

export OMP_NUM_THREADS=1

# source /sw/external/python/anaconda3/bin/activate /u/zzhang27/.conda/envs/opencompass
source /sw/external/python/anaconda3/bin/activate /scratch/bcwg/Metabench/anaconda/envs/opencompass

export HF_HOME=/scratch/bcwg/hf_cache

# py-torch example, --ntasks-per-node=1 --cpus-per-task=64


# export MKL_THREADING_LAYER=INTEL
# export MKL_SERVICE_FORCE_INTEL=1

export CUDA_LAUNCH_BLOCKING=1
export CUDA_VISIBLE_DEVICES=0

export MKL_THREADING_LAYER=GNU
export MKL_SERVICE_FORCE_INTEL=1

export HF_TOKEN=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
# which python3
# python3 run.py --models hf_qwen2_7b_instruct hf_llama3_8b_instruct hf_yi_1_5_9b_chat hf_phi_3_small_8k_instruct hf_gemma2_9b_it hf_glm4_9b_chat --datasets gsm8k_gen 
# echo $! >> $PID_FILE
which python3
python3 run.py --models  hf_gemma2_9b_it --datasets math_gen 
echo $! >> $PID_FILE


echo "All processes have been started and their PIDs stored in $PID_FILE."

echo "All processes have completed."
