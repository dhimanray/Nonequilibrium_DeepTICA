#!/bin/bash

source ~/gromacs-2024.3/source_gpu.sh

export OMP_NUM_THREADS=2

gmx_mpi grompp -f md.mdp -c folded.gro -p topol_01.top -o prd.tpr
mpiexec -n 1 gmx_mpi mdrun -deffnm prd -nsteps 2500000 -plumed plumed.dat -pin on -pinoffset 24 -gpu_id 1
