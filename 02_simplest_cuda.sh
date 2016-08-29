
#!/bin/sh

#PBS -l walltime=00:01:00
## Run this program for 1 minute

#PBS -l select=01:ncpus=01:ngpus=01:mem=1024
## Run the program with one cpu and one gpu

#PBS -q gpgpu

module load cuda

$HOME/projects/PBS_learning/bin/cuda/02_cuda
