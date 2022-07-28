#!/bin/bash

new_makefile()
{

BIN_DIR="bin/"
OBJ_DIR="obj/"
SRC_DIR="src/"

if ! [ -e "$BIN_DIR" ]
then
  mkdir $BIN_DIR
fi

if ! [ -e "$SRC_DIR" ]
then
  mkdir $SRC_DIR
fi

if ls -1 src/*.cpp > /dev/null 2>&1; then
  SRC_LIST=$(ls -1 src/*.cpp | sed 's/.*\///' | awk 'NR>1{printf "\t\t\t\t"}; {print $0" \\"}')
else
  SRC_LIST=""
fi

if [ "$1" == "" ]
then
  read -p "Project name: " -r NAME
  case "$NAME" in
    [])
      exit
      ;;
  esac
else
  NAME=$1
fi

if [ -f "Makefile" ]
then
  read -p "overwrite ./Makefile? (y/n [n]) " ANSWER
  case "$ANSWER" in
    [yY] | [yY][eE][sS])
    echo 'overwriting...'
    WRITE_MAKEFILE=1
    ;;
    *)
      exit
      ;;
  esac
else
  echo 'writing ./Makefile'
  WRITE_MAKEFILE=1
fi

if [ $WRITE_MAKEFILE ]; then
  echo 'Generating Makefile'
  echo "###               auto-generated Makefile               ###" > "Makefile";
  echo
  {
  echo;
  echo "NAME		=	$NAME";
  echo;
  echo "SRC_DIR		=	$SRC_DIR";
  echo "OBJ_DIR		=	$OBJ_DIR";
  echo "BIN_DIR		=	$BIN_DIR";
  echo 'BIN			=	$(BIN_DIR)$(NAME)';
  echo;
  echo -n "SRC			=	";
  ls -1 src/*.cpp | sed 's/.*\///' | awk 'NR>1{printf "\t\t\t\t"}; {print $0" \\"}';
  echo;
  echo 'OBJ 		=	$(addprefix $(OBJ_DIR), $(SRC:%.cpp=%.o))';
  echo;
  echo 'CFLAGS		=	-Wall -Werror -Wextra -std=c++98 -g #-fsanitize=address';
  echo "CC			=	c++";
  echo;
  echo 'ifeq ("$(VERBOSE)","1")';
  echo 'Q :=';
  echo 'VECHO = @echo';
  echo 'else';
  echo 'Q := @';
  echo 'VECHO = @echo';
  echo 'endif';
  echo;
  echo 'vpath %.cpp $(SRC_DIR)';
  echo;
  echo 'all: $(BIN)';
  echo;
  echo '$(BIN): $(OBJ)';
  echo '	$(VECHO)';
  printf '	$(VECHO) "\\033[36mLinking binary file:     $@ 🚨\\033[0m"\n';
  echo '	$(VECHO)';
  echo '	$(Q)$(CC) $^ $(CFLAGS) -o $@';
  echo;
  echo '$(OBJ_DIR)%.o:%.cpp';
  echo '	$(Q)mkdir -p $(@D)';
  printf '	$(VECHO) "\\033[34mCompiling object file:   $@\\033[0m"\n';
  echo '	$(Q)$(CC) -c $< $(CFLAGS) -o $@';
  echo;
  echo 'clean:';
  printf '	$(VECHO) "\\033[31mRemoving object files\\033[0m"\n';
  echo '	$(VECHO)';
  echo '	$(Q)rm -rf $(OBJ_DIR)';
  echo;
  echo 'fclean: clean';
  printf '	$(VECHO) "\\033[31mRemoving binary\\033[0m"\n';
  echo '	$(VECHO)';
  echo '	$(Q)rm -f $(BIN)';
  echo;
  echo 're: clean all';
  echo;
  echo 'reall: fclean all';
  echo;
  echo 'rerun: re';
  echo '	./miniRT';
  echo;
  echo '.PHONY:	all libft norme clean fclean re reall';
  echo;
  } >> "Makefile"
fi

}