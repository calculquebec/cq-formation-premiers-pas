#include <cmath>
#include <cstdlib>
#include <iostream>
#include <boost/program_options.hpp>
#include <boost/algorithm/string.hpp>
#include <iomanip>
#include "mpi.h"
#include <Magick++.h>
#include <random>
#include <omp.h>
using namespace std;
using namespace Magick;
using namespace boost;

string applyFilter(const string & filter, const string & filename)
{
	int comm_rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &comm_rank);
	string outfilename = filter + "_" + filename;
	try {
		cout << "Application du filtre " << filter << " sur l'image " << filename << endl;
		Image image;
		image.read(filename);
		if (filter == "grayscale") {
			image.quantizeColorSpace( GRAYColorspace );
			image.quantize( );
		}
		else if (filter == "monochrome") {
			image.quantizeColorSpace( GRAYColorspace );
			image.quantizeColors( 2 );
			image.quantizeDither( false );
			image.quantize( );
		}
		else if (filter == "edges")
			image.edge();
		else if (filter == "emboss")
			image.emboss();
		else if (filter == "negate")
			image.negate();
		else if (filter == "solarize")
			image.solarize();
		else if (filter == "flip")
			image.flip();
		else if (filter == "flop")
			image.flop();
		else if (filter == "add_noise")
			image.addNoise( LaplacianNoise );
		else { cout << "Filtre inconnu" << endl; return ""; }
		image.write(outfilename);
	} catch (Error &err) {
		cerr << err.what() << endl;
		return "";
	}
	return outfilename;
}

int main(int argc, char ** argv)
{
	MPI_Init(&argc, &argv);
	InitializeMagick(*argv);

	int comm_size, comm_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &comm_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &comm_rank);

	string srcdir, dstdir;
	vector<string> vFilters;
	vector<string> vDefaultfilters = { "grayscale" };
	vector<string> vFilenames;
	
	namespace po = program_options;
	po::options_description desc("Options");
	desc.add_options()
		("help,h","Print help messages")
		("srcdir,i",po::value<string>(&srcdir)->default_value(""),"Repertoire source ?")
		("dstdir,o",po::value<string>(&dstdir)->default_value(""), "Repertoire de destination ?")
		("filters,f",po::value<vector<string> >(&vFilters)->multitoken(), "Filtre(s) à appliquer : grayscale, edges, emboss, negate, solarize, flip, flop, monochrome, add_noise")
		("files,f",po::value<vector<string> >(&vFilenames)->multitoken(), "Liste de fichiers ?")
		;
	po::variables_map vm;
	try {
		po::store(po::parse_command_line(argc,argv,desc),vm);
		if (vm.count("help")) {
			std::cout << "Applique des filtres sur une série d'images" << std::endl << desc << std::endl;
			return 0;
		}
		po::notify(vm);
	}
	catch(po::error& e)
	{
		std::cerr << "ERROR: " << e.what() << std::endl << std::endl;
		std::cerr << desc << std::endl;
		return 1;
	}

	size_t nb_images = vFilenames.size();

	size_t start = comm_rank;
	size_t step_size = comm_size;

	for (size_t i=start; i<nb_images; i+=step_size)
	{
		string filename = vFilenames[i];
		for (auto filter : vFilters) {
			filename = applyFilter(filter, filename);
			if (filename == "") exit(1);
		}
	}

	MPI_Finalize();
	return 0;
}