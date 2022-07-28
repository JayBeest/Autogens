#include <iostream>
#include "ClassSample.hpp"

using namespace ::std;

int main ( ){

	Sample	test1(6);
	Sample	test2;

	cout << test2.getVars() << endl;
	cout << test2.getNb_Sample_created() << endl;

	test2 = test1;

	cout << test2.getVars() << endl;
	cout << test2.getNb_Sample_created() << endl;

	return 0;
}