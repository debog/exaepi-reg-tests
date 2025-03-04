#!/bin/bash

OUTFILE=out.${SYS_TYPE}.log

EXEC=$(ls $EXAEPI_BUILD/bin/*agent*)
echo "Executable file is ${EXEC}."

INP=$(ls inputs*)
echo "Input file is ${INP}."

NNODE=1
NPROC=9
NOMP=4

export OMP_NUM_THREADS=$NOMP
rm -rf Backtrace* plt* cases* $OUTFILE *.core output.dat
#srun -N $NNODE -n $NPROC -p pdebug $EXEC $INP 2>&1 > $OUTFILE
srun -N $NNODE -n $NPROC -p pdebug $EXEC $INP
