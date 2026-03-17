#!/bin/bash
#SBATCH -J gpqa_qwen3-4b_s4            # Job name
#SBATCH -p short                       # Partition
#SBATCH -N 1                           # Number of nodes
#SBATCH -n 1                           # Number of tasks
#SBATCH --gres=gpu:a100:2              # Request 2 A100 GPUs
#SBATCH --mem=300G                     # Memory
#SBATCH -c 16                          # CPU cores
#SBATCH -t 240:00:00                   # Max runtime 240 hours (24*10)
#SBATCH -D /home/comp/23481501/datasets/RiskEval_local
#SBATCH -o /home/comp/23481501/datasets/RiskEval_local/output/slurm-%j.out
#SBATCH -e /home/comp/23481501/datasets/RiskEval_local/output/slurm-%j.err

# Load CUDA module
module load cuda/11.4

# Activate Python environment
source ~/py312env/bin/activate

# Go to src directory
cd /home/comp/23481501/datasets/RiskEval_local/src

# Run GPQA diamond with Qwen3-4B solver, strategy 4
python -m riskeval.cli --config ../configs/gpqa_qwen3-4b_strategy4.toml
