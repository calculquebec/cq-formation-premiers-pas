# ############################
# LIST OF OBJECTS/EXES
# ############################
EXES = filterImage.exe filterImage-mpi.exe

#MODULE_CMDS = module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6

CXX = icpc
MPIXX = mpic++
LIBS = -lboost_program_options -lboost_filesystem -lboost_system $(shell Magick++-config --ldflags)
CPPFLAGS = -g --std=c++11 -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16
GLOBAL_DEPEND = Makefile

all: $(EXES)

clean:
	rm -rf $(EXES) $(OBJECTS) *.o *.openss *.txt *.exe *.bin

filterImage.exe: code/filterImage.cpp $(GLOBAL_DEPEND)
	$(CXX) $(CPPFLAGS) $< -o $@ $(DEFINES) $(LIBS)

filterImage-mpi.exe: code/filterImage.cpp $(GLOBAL_DEPEND)
	$(MPIXX) -DUSE_MPI $(CPPFLAGS) $< -o $@ $(DEFINES) $(LIBS)

