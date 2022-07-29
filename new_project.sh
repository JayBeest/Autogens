#!/bin/bash

new_project()
{

if [ -e ".project_name" ]; then
  PROJECT="$(cat .project_name)"
elif [[ "$1" == "" ]]
then
    echo -n "Project not initialized, name it: "
    read -r PROJECT
    if [[ "$PROJECT" == "" ]]; then
      return
    fi
else
  PROJECT=$1
fi

echo
while [[ "$INIT" == "" ]]; do
  echo "about to initialize project '$PROJECT' here:"
  echo -n "$(pwd) <- OK? "
  read -r INIT
  case "$INIT" in
    [yY] | [yY][eE][sS])
      echo "Initializing $PROJECT.."
      ;;
    [nN] | [nN][oO])
      return
      ;;
    "")
      ANSWER="no"
      ;;
    *)
      ANSWER=""
      ;;
  esac
done

if ! [ -e "src" ]; then
  echo "creating src dir.."
  mkdir "src"
fi

if ! [ -e "bin" ]; then
  echo "creating bin dir.."
  mkdir "bin"
fi

if ! [ -e "include" ]; then
  echo "creating include dir.."
  mkdir "include"
fi

if [ -f "src/$PROJECT.cpp" ]; then
  while [[ "$ANSWER" == "" ]]; do
      echo -n "overwrite src/$PROJECT.cpp? (y/n [n]) "
      read -r ANSWER
      case "$ANSWER" in
        [yY] | [yY][eE][sS])
          echo "Overwriting $PROJECT.cpp.."
          ;;
        [nN] | [nN][oO])
          return
          ;;
        "")
          ANSWER="no"
          ;;
        *)
          ANSWER=""
          ;;
      esac
  done
else
  echo "Writing $PROJECT.cpp.."
fi

echo "$PROJECT" > ".project_name"
cat << EOF > "src/$PROJECT.cpp"
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
EOF
}
