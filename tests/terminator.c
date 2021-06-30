/*
 * Copyright (c) 2020, Rutgers Discovery Informatics Institute, Rutgers
 * University
 *
 * See COPYRIGHT in top-level directory.
 */

#include "mpi.h"
#include "timer.h"
#include <dspaces.h>
#include <margo.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
    char* listen_addr_str = NULL;
    if(argc == 2) {
        listen_addr_str = argv[1];
    }
    dspaces_client_t ds;
    int rank;
    char *listen_addr_str;

    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    dspaces_init(rank, &ds, listen_addr_str);

    dspaces_kill(ds);

    dspaces_fini(ds);

    MPI_Finalize();

    return (0);
}
