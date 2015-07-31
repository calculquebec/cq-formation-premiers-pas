# ############################
# LIST OF OBJECTS/EXES
# ############################
EXES = serie.exe serie.mpi.exe serie.omp.exe

CPP = g++
CPPFLAGS = -g --std=c++11 -lboost_program_options
GLOBAL_DEPEND = Makefile
all:: $(EXES)
clean:
	rm -rf $(EXES) $(OBJECTS) *.o *.openss *.txt *.exe *.bin

%.exe: code/%.cpp $(GLOBAL_DEPEND)
	$(MODULE_CMDS) $(CPP) $(CPPFLAGS) code/$*.cpp -o $*.exe $(DEFINES)

%.omp.exe: code/%.cpp $(GLOBAL_DEPEND)
	$(MODULE_CMDS) $(CPP) $(CPPFLAGS) -fopenmp code/$*.cpp -o $*.omp.exe $(DEFINES)

%.mpi.exe: code/%.mpi.cpp $(GLOBAL_DEPEND)
	$(MODULE_CMDS) mpic++ $(CPPFLAGS) code/$*.mpi.cpp -o $*.mpi.exe $(DEFINES)


