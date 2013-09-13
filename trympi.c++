// trympi.c++ - a first very basic MPI program

#include <iostream>
#include <mpi.h>

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv);
	int pid, nProcesses;
	MPI_Comm_rank(MPI_COMM_WORLD, &pid);
	MPI_Comm_size(MPI_COMM_WORLD, &nProcesses);
	//std::cout << "My process ID: " << pid << "; there are "
	//          << nProcesses << " processes.\n";

	int token;
	if(pid != 0) {
		MPI_Recv(&token, 1, MPI_INT, pid-1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		printf("Process %d received token %d from process %d\n", pid, token, pid-1);
	}
	else{
		token = 100;
	}
	MPI_Send(&token, 1, MPI_INT, (pid+1)%nProcesses, 0, MPI_COMM_WORLD);

	if(pid == 0){
		MPI_Recv( &token, 1, MPI_INT, nProcesses-1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		printf("Process 0 received token %d from process %d. End of token ring!\n", token, nProcesses);
	}

	MPI_Finalize();
	return 0;
}
