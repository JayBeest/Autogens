#include "ClassSample.hpp"

///			Public:

int		Sample::getId( ) const {

	return this->_id;
}

int		Sample::getVars( ) const {

	return this->_vars;
}

int		Sample::getNb_Sample_created( ) const {

	return Sample::_nb_Sample_created;
}

///			Constructor/Destroyer

Sample::Sample( int args ) : _vars(args) {

	this->_id = _nb_Sample_created++;
}

Sample::Sample(	) {

										// TODO not counting default constructor

}

Sample::Sample( const Sample& other) {

	if (this != &other)
	{
		this->_vars = other.getVars();	// TODO
	}
	*this = other;
}

Sample::~Sample( ) {

	// TODO

}

Sample &	Sample::operator=( const Sample& rhs ) {

	if (this != &rhs)
	{
		this->_vars = rhs.getVars();	// TODO
	}
	return *this;
}

///			Functions/Methods

void	Sample::doStuff( ) const {

	// TODO

}

///			Private:



int	Sample::_nb_Sample_created = 0;
