#!/bin/bash
#SBATCH --job-name=BayesOpt           # Job name
#SBATCH --output=BO.log           # Standard output log file
#SBATCH --error=error_BO.log             # Standard error log file
#SBATCH --time=48:00:00               # Time limit hrs:min:sec
#SBATCH --partition=standard          # Partition name
#SBATCH --account=sc139-wetting       # Account
#SBATCH --qos=lowpriority             # QoS
#SBATCH --ntasks=25                # Number of MPI tasks (1 = single process)
#SBATCH --cpus-per-task=32            # Number of CPU cores for this process

# ===============================
# OpenMP configuration
# ===============================
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_DISPLAY_ENV=TRUE   # Optional: print OpenMP environment info at startup

echo "===================================="
echo "Running LBM simulation with OpenMP"
echo "Allocated CPUs per task: $SLURM_CPUS_PER_TASK"
echo "OMP_NUM_THREADS: $OMP_NUM_THREADS"
echo "===================================="

# Run the executable
srun ./run.exe
