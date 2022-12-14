#ifndef SAMPLE_H
# define SAMPLE_H

class Sample {

public:

	int				getId( ) const;
	int				getVars( ) const;
	static int		getNb_Sample_created( );

	explicit		Sample( int arg );
					Sample( );
					Sample( const Sample & src );
					~Sample( );
					Sample & operator=( const Sample & rhs);

	void			doStuff() const;

private:

	int				_id;
	int				_vars;
	static int		_nb_Sample_created;

};

#endif
