#include "ClassSample.hpp"

///			Public:

int		Sample::getId( ) const {

	return this->_id;
}

int		Sample::getVars( ) const {

	return this->_vars;
}

///			Constructer/Destroyer

int		Sample::getNb_Sample_created( ) const {

	return Sample::_nb_Sample_created;
}

Sample::Sample( int args ) : _vars(args) {

	this->_id = _nb_Sample_created++;
}

Sample::Sample(	) {


}

Sample::Sample( const Sample& other) {

	if (this != &other)
	{
		this->_vars = other.getVars();
	}
	*this = other;
}

Sample::~Sample( ) {


}

Sample &	Sample::operator=( const Sample& rhs ) {

	if (this != &rhs)
	{
		this->_vars = rhs.getVars();
	}
	return *this;
}

///			Functions/Methods

void	Sample::doStuff( ) const {


}

///			Private:



int	Sample::_nb_Sample_created = 0;
