#include "Sample.hpp"

///			Public:

int		ClassSample::getId( ) const {

	return this->_id;
}

int		ClassSample::getVars( ) const {

	return this->_vars;
}

int		ClassSample::getNb_ClassSample_created( ) const {

	return ClassSample::_nb_ClassSample_created;
}

///			Constructor/Destroyer

ClassSample::ClassSample( int args ) : _vars(args) {

	this->_id = _nb_ClassSample_created++;
}

ClassSample::ClassSample(	) {

										// TODO not counting default constructor

}

ClassSample::ClassSample( const ClassSample& other) {

	if (this != &other)
	{
		this->_vars = other.getVars();	// TODO
	}
	*this = other;
}

ClassSample::~ClassSample( ) {

	// TODO

}

ClassSample &	ClassSample::operator=( const ClassSample& rhs ) {

	if (this != &rhs)
	{
		this->_vars = rhs.getVars();	// TODO
	}
	return *this;
}

///			Functions/Methods

void	ClassSample::doStuff( ) const {

	// TODO

}

///			Private:



int	ClassSample::_nb_ClassSample_created = 0;
