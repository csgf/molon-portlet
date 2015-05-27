//============================================================================
// Name        : zenodo_c.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <fstream>
#include <math.h>       /* log */

using namespace std;


int main(int argc, char *argv[]) {
	cout << "Wavelength	Sigma	Molar_absortion_coefficient" << endl; // prints !!!Hello World!!!

	char *inputFileName = argv[1];

	double avogadro_number =  6.022e23;

	 ifstream inputFile (inputFileName);

	  if (inputFile.is_open())
	  {
		 double wavelength, sigma;
		 while (inputFile >> wavelength >> sigma){
			double molar_absortion_coefficient = sigma * avogadro_number / (1000 * log(10));
			printf("%e	%e	%e\n",wavelength,sigma, molar_absortion_coefficient);


	    }
	    inputFile.close();
	  }


	return 0;
}
