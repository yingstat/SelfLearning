how slurm works
========================================================
author: yingying
date: 2019.01.15
autosize: true

Simple Linux Utility for Resource Management
========================================================
Slurm is an open source, fault-tolerant, and highly scalable cluster management and job scheduling system for large and small Linux clusters. 

Slurm has three key functions:
- First, it allocates exclusive and/or non-exclusive access to resources (compute nodes) to users for some duration of time so they can perform work.
- Second, it provides a framework for starting, executing, and monitoring work (normally a parallel job) on the set of allocated nodes.
- Finally, it arbitrates contention for resources by managing a queue of pending work.

resources:

```bash
man slurm
```
https://slurm.schedmd.com/quickstart.html
https://slurm.schedmd.com/archive/slurm-17.02.9/
https://nesi.github.io/hpc_training/lessons/kupe-slurm/

commonly used slurm commands
========================================================

- squeue - view information about jobs located in the Slurm scheduling queue.
- sinfo - view information about Slurm nodes and partitions.
- sbatch - Submit a batch script to Slurm.
- scancel - Stop the job and remove it from the queue.
- scontrol - Administrative and more indepth information functionalities
- salloc - allocate resources for a job in real time.
- srun - launch a process across multiple CPUs
- sacct - check completed jobs

Commonly used Slurm environment variables
=============================================================
These can be useful within Slurm job scripts:

    $SLURM_JOBID (job id)
    $SLURM_NNODES (number of nodes)
    $SLURM_NTASKS (number of MPI tasks)
    $SLURM_CPUS_PER_TASK (CPUs per MPI task)
    $SLURM_SUBMIT_DIR (directory job was submitted from)
    $SLURM_ARRAY_JOB_ID (job id for the array)
    $SLURM_ARRAY_TASK_ID (job array index value)




An example script
========================================================


```bash
#!/bin/bash#
#SBATCH -p general # partition (queue)
#SBATCH -N 1 # number of nodes
#SBATCH -n 1 # number of cores
#SBATCH --mem 100 # memory pool for all cores
#SBATCH -t 0-2:00 # time (D-HH:MM)
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERR
for i in {1..100000}; do
echo $RANDOM >> SomeRandomNumbers.txt
done
sort SomeRandomNumbers.txt
```


```bash
sbatch myscript.sh
```

ref: 
https://www.rc.fas.harvard.edu/resources/documentation/convenient-slurm-commands/
https://www.rc.fas.harvard.edu/resources/running-jobs/
