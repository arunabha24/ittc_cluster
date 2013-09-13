#PBS -N trympi
#PBS -l nodes=2:ppn=8,walltime=00:00:02
#PBS -d /users/a778c506/Downloads/first
#PBS -e /users/a778c506/Downloads/first/stderr.txt
#PBS -o /users/a778c506/Downloads/first/stdout.txt
#PBS -M arunabhac@ku.edu
#!PBS -m abe

mpirun -f $PBS_NODEFILE -wdir /nfs/users/a778c506/Downloads/first -np 16 ./trympi
