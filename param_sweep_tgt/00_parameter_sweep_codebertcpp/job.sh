#!/bin/bash

# Project to run under
#SBATCH -A SNIC2020-5-453
# Name of the job (makes easier to find in the status lists)
#SBATCH -J repair
# Exclusive use when using more than 2 GPUs
#SBATCH --exclusive
# Use GPU
#SBATCH --gres=gpu:k80:1
# the job can use up to x minutes to run
#SBATCH --time=96:00:00

# run the program

onmt_build_vocab -config /content/VRepair2.0/param_sweep_tgt/00_parameter_sweep_codebertcpp/vocab_config.yml
sed -i '1iCWE-119\t99999999\nCWE-125\t99999999\nCWE-20\t99999999\nCWE-200\t99999999\nCWE-264\t99999999\nCWE-476\t99999999\nCWE-399\t99999999\nCWE-189\t99999999\nCWE-416\t99999999\nCWE-190\t99999999\nCWE-362\t99999999\nCWE-787\t99999999\nCWE-284\t99999999\nCWE-772\t99999999\nCWE-415\t99999999' /content/VRepair2.0/param_sweep_tgt/00_parameter_sweep_codebertcpp/data.vocab.src
onmt_train --config /content/VRepair2.0/param_sweep_tgt/00_parameter_sweep_codebertcpp/new_train_config.yml 2>&1 | tee -a /content/VRepair2.0/param_sweep_tgt/00_parameter_sweep_codebertcpp/log.txt

    