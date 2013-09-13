trympi: trympi.o
	mpicxx -o trympi -L/tools/cluster/6.2/mpich2/1.4.1p1/lib -lmpich -lmpl trympi.o
trympi.o: trympi.c++
	mpicxx -c -I/tools/cluster/6.2/mpich2/1.4.1p1/include trympi.c++
