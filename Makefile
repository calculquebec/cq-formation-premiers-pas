# ############################
# LIST OF OBJECTS/EXES
# ############################
EXES = filterImage.exe

#MODULE_CMDS = module load libs/boost libs/image_magick

CPP = g++
CPPFLAGS = -g --std=c++11 -lboost_program_options -lMagick++-6.Q16 -fopenmp
GLOBAL_DEPEND = Makefile
all:: $(EXES)
clean:
	rm -rf $(EXES) $(OBJECTS) *.o *.openss *.txt *.exe *.bin

filterImage.exe: code/blackwhite.cpp $(GLOBAL_DEPEND)
	mpic++ $(CPPFLAGS) $< -o $@ $(DEFINES)

