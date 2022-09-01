#!/bin/bash

function new_class()
{
if ! [ -e ".project_name" ]; then
  if [[ "$1" == "" ]]; then
  echo -n ".project_name not found, name your project: "
  read -r NAME;
    if [[ "$NAME" == "" ]]; then
      echo "quitting.."
      return;
    else
      echo "$NAME" > ".project_name"; fi
  else
      echo "$1" > ".$1"; fi
else
  echo -n "-> Project: "; cat ".project_name"
fi

SRC_DIR="src/"

if [[ $1 == "" ]]; then
  echo -n "Class name: "
  read -r CLASS_N;
  if [[ "$CLASS_N" == "" ]]; then
    echo "quitting.."
    return; fi
else
  CLASS_N=$1
fi

CLASS_N=$(echo "$CLASS_N"| awk '{print toupper(substr($0,0,1))substr($0,2)}')
HEADER_N=$(echo "$CLASS_N"| awk '{print toupper($0)}')"_H"
FILE_N="$CLASS_N"

if [ -f "$SRC_DIR$FILE_N.hpp" ]; then
  while [[ "$ANSWER" == "" ]]; do
      echo -n "overwrite $SRC_DIR$FILE_N.hpp? (y/n [n]) "
      read -r ANSWER
      case "$ANSWER" in
        [yY] | [yY][eE][sS])
          echo "overwriting $FILE_N.hpp.."
          WRITE_HPP=1
          ;;
        [nN] | [nN][oO])
          ;;
        *)
          echo "skipping.."
          return
          ;;
      esac
  done
else
  echo "writing $FILE_N.hpp.."
  WRITE_HPP=1
fi

if [ $WRITE_HPP ]; then
  cat << EOF > "$SRC_DIR$FILE_N.hpp"
#ifndef $HEADER_N
# define $HEADER_N

class $CLASS_N {

public:

	int				getId( ) const;
	int				getVars( ) const;
	static int		getNb_${CLASS_N}_created( );

	explicit		$CLASS_N( int arg );
					$CLASS_N( );
					$CLASS_N( const $CLASS_N & other );
					~$CLASS_N( );
					$CLASS_N & operator=( const $CLASS_N & rhs );

	void			doStuff() const;

	static void		makeSilent( void );

private:

	int				_id;
	int				_vars;
	static int		_nb_${CLASS_N}_created;

	static bool		_loud;

};

#endif
EOF
fi

if [ -f "$SRC_DIR$FILE_N.cpp" ]; then
  while [[ "$ANSWER2" == "" ]]; do
      echo -n "overwrite $SRC_DIR$FILE_N.cpp? (y/n [n]) "
      read -r ANSWER2
      case "$ANSWER2" in
        [yY] | [yY][eE][sS])
          echo "Overwriting $FILE_N.cpp.."
          WRITE_CPP=1
          ;;
        [nN] | [nN][oO])
          ;;
        *)
          ;;
      esac
    done
else
  echo "Writing $FILE_N.cpp.."
  WRITE_CPP=1
fi

if [ $WRITE_CPP ]; then
  cat << EOF > "$SRC_DIR$FILE_N.cpp"
#include <iostream>
#include "$FILE_N.hpp"

///			Public:

///			Getters / Setters

int		$CLASS_N::getId( ) const {

	return this->_id;
}

int		$CLASS_N::getVars( ) const {

	return this->_vars;
}

int		$CLASS_N::getNb_${CLASS_N}_created( ) {

	return $CLASS_N::_nb_${CLASS_N}_created;
}

///			Constructor / Destructor

$CLASS_N::$CLASS_N( int args ) : _vars(args) {

	this->_id = _nb_${CLASS_N}_created++;
	if ($CLASS_N::_loud)
  		std::cout << "[$CLASS_N] Specific constructor called" << std::endl;
}

$CLASS_N::$CLASS_N( ) {

										// TODO not counting default constructor
	if ($CLASS_N::_loud)
  		std::cout << "[$CLASS_N] Default constructor called" << std::endl;
}

$CLASS_N::$CLASS_N( const $CLASS_N & other) {

	if (this != &other)
	{
	  *this = other;
	  // TODO
	}
	if ($CLASS_N::_loud)
  		std::cout << "[$CLASS_N] Copy constructor called" << std::endl;
}

$CLASS_N::~$CLASS_N( ) {

	// TODO
	if ($CLASS_N::_loud)
  		std::cout << "[$CLASS_N] Destructor called" << std::endl;
}

$CLASS_N &	$CLASS_N::operator=( const $CLASS_N & rhs ) {

	if (this != &rhs)
	{
		this->_vars = rhs.getVars();	// TODO
	}
	if ($CLASS_N::_loud)
  		std::cout << "[$CLASS_N] Copy assignment operator called" << std::endl;
	return *this;
}

///			Functions / Methods

void	$CLASS_N::doStuff( ) const {

	// TODO

}

void	$CLASS_N::makeSilent( void ) {

	$CLASS_N::_loud = false;
}

///			Private:



int	$CLASS_N::_nb_${CLASS_N}_created = 0;

bool	$CLASS_N::_loud = true;

EOF
fi
}
