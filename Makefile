# ############################
# LIST OF OBJECTS/EXES
# ############################
EXES = filterImage.exe

#MODULE_CMDS = module load libs/boost libs/image_magick

CPP = g++
CXX = mpic++
LIBS = -lboost_program_options -lboost_filesystem -lboost_system $(shell Magick++-config --ldflags)
CPPFLAGS = -g --std=c++11 -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16
GLOBAL_DEPEND = Makefile
all:: $(EXES)
clean:
	rm -rf $(EXES) $(OBJECTS) *.o *.openss *.txt *.exe *.bin

filterImage.exe: code/filterImage.cpp $(GLOBAL_DEPEND)
	mpic++ $(CPPFLAGS) $< -o $@ $(DEFINES) $(LIBS)

