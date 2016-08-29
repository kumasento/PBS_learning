#!/bin/sh

#PBS -l walltime=00:01:00
## Run this program for 1 minute

#PBS -l select=01:ncpus=01:mem=1024
## This program will only use one node with one CPU and 1GB memory

$HOME/projects/PBS_learning/bin/01_print
