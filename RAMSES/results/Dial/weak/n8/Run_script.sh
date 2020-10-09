#/bin/bash

#PBS -o mpi_ramses.out
#PBS -e mpi_ramses.error
#PBS -N Standard_build_simulation
#PBS -l nodes=8:ppn=36
#PBS -l walltime=01:00:00
#PBS -m bea
#PBS -A ds004

# Load requires modules
module purge
module load intel/compilers/18
module load intel/mpi/18

ulimit -s 819200

#Change to current directory.
cd $PBS_O_WORKDIR

rm -rf output_*

#Change the following command accordingly to reflect your executable (default name: ramses3D) path and file name.
# mpirun -n 72 /path_to_your_executable/ramses3d ./params.nml > my_out.log
# Rename my_out.log if running more than one time (in most cases, the results have been obtained by averaging over 3 runs).

mpirun -n 288 /home/dc-ragt1/Ramses/ramses/bin/ramses_intelmpi3d ./params.nml > my_out.log
