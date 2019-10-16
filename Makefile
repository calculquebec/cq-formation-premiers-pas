# ############################
# LIST OF OBJECTS/EXES
# ############################
EXES = filterImage.exe

CPP = g++
CXX = mpic++
LIBS = -lboost_program_options -lboost_filesystem -lboost_system $(shell Magick++-config --ldflags)
CPPFLAGS = -g --std=c++11 -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 $(shell Magick++-config --cppflags)
GLOBAL_DEPEND = Makefile
all:: $(EXES)
clean:
	rm -rf $(EXES) $(OBJECTS) *.o *.openss *.txt *.exe *.bin */*.jpg */*.png */*.out

filterImage.exe: code/filterImage.cpp $(GLOBAL_DEPEND)
	mpic++ $(CPPFLAGS) $< -o $@ $(DEFINES) $(LIBS)

