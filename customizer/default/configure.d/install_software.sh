#!/bin/bash
source /etc/profile.d/alces-clusterware.sh
alces gridware init
echo 'Install software'

alces gridware install main/mpi/mpich2/1.5
alces gridware install main/mpi/openmpi/1.10.2
alces gridware install main/apps/R/3.4.0
