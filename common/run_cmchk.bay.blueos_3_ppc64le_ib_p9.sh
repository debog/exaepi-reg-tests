#!/bin/bash

OUTFILE=out.${SYS_TYPE}.log

# -n: number of resource sets
# -r: number of resource sets per node
# -c: number of CPU cores per resource set
# -g: number of GPU per resource set
# -a: number of tasks per resource set

EXEC=$(ls $EXAEPI_BUILD/bin/*agent*)
echo "Executable file is ${EXEC}."

INP=$(ls inputs*)
echo "Input file is ${INP}."

rm -rf Backtrace* plt* cases* $OUTFILE output.dat *.core
export CUDA_LAUNCH_BLOCKING=1
lrun -T 1 compute-sanitizer --tool memcheck $EXEC $INP 2>&1 |tee $OUTFILE
