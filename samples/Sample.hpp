#ifndef SAMPLE_H
# define SAMPLE_H

class ClassSample {

public:

	int			getId( ) const;
	int			getVars( ) const;
	int			getNb_ClassSample_created( ) const;

				ClassSample( int arg );
				ClassSample( );
				ClassSample( const ClassSample & src );
				~ClassSample( );
				ClassSample & operator=( const ClassSample & rhs);

	void		doStuff() const;

private:

	int			_id;
	int			_vars;
	static int	_nb_ClassSample_created;

};

#endif
