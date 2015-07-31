#include <cmath>
#include <cstdlib>
#include <iostream>
#include "boost/program_options.hpp"
#include <iomanip>
#include <random>
using namespace std;

void make_it_slow(int nb_steps) { for (int i=0; i<nb_steps; i++); }
int main(int argc, char ** argv)
{
	int type, a, p;
	size_t nb_step;
	bool slow;
	
	namespace po = boost::program_options;
	po::options_description desc("Options");
	desc.add_options()
		("help,h","Print help messages")
		("type,t",po::value<int>(&type)->default_value(1),"Type de somme (0,1,2)")
		("alterner,a",po::value<int>(&a)->default_value(0), "Alterner la série ?")
		("parametre,p",po::value<int>(&p)->required(), "Valeur du paramètre ?")
		("nb_pas,n",po::value<size_t>(&nb_step)->default_value(500*1000000), "Nombre de pas (défaut: 500M) ?")
		("ralentir,r",po::bool_switch(&slow)->default_value(false), "Ralentir artificiellement le calcul ?")
		;
	po::variables_map vm;
	try {
		po::store(po::parse_command_line(argc,argv,desc),vm);
		if (vm.count("help")) {
			std::cout << "Calcule une série" << std::endl << desc << std::endl;
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
	
	std::random_device rd;
	std::default_random_engine generator(rd());
	std::uniform_int_distribution<int> distribution(1,100000000);
	int nb_slow_steps = distribution(generator);
	double val = 0;
	#pragma omp parallel for reduction(+:val) shared(p,nb_step,a,type,slow,nb_slow_steps) default(none)
	for (size_t i=0; i<nb_step; i++)
	{
		if (type == 0)
			val += pow(-1,a*i) * 1./double(1+i*p);
		else if (type == 1)
			val += pow(-1,a*i) * 1./pow(double(p),double(i));
		else if (type == 2)
			val += pow(-1,a*i) * 1./pow(double(i+1),double(p));
		if (slow) make_it_slow(nb_slow_steps);
	}
	cout << setprecision(12);
	cout << "Resultat: (type=" << type << "), (a=" << a << "), (p=" << p << "), (nb_pas=" << nb_step << ") " << val << endl;
	return 0;
}
