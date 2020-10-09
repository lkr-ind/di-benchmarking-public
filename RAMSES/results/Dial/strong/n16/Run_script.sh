#/bin/bash

#PBS -o mpi_ramses.out
#PBS -e mpi_ramses.error
#PBS -N Standard_build_simulation
#PBS -l nodes=16:ppn=36
#PBS -l walltime=00:20:00
#PBS -m bea
#PBS -A ds004

# Load requires modules
module purge
#module load openmpi/gcc/4.0.3
module load intel/compilers/18
module load intel/mpi/18

ulimit -s 819200

#Change to current directory.
cd $PBS_O_WORKDIR

#rm -rf BMARK_DIR

# WORKDIR=.
# mkdir BMARK_DIR

# OUTPUTDIR=BMARK_DIR

# TROVE=./trove_mpiifort.x
# INFILE=N14.inp
# OUTFILE=$OUTPUTDIR/$INFILE

# cd $WORKDIR

# Ex. 2 nodes, 2 processes per node, 18 OMP threads
#export OMP_NUM_THREADS=1
#mpirun -n 18 $TROVE $INFILE > $OUTFILE.1n.1x10

mpirun -n 576 /home/dc-ragt1/Ramses/ramses/bin/ramses_intelmpi3d ./params.nml > my_out.log
