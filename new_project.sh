#!/bin/bash

new_project()
{
if [ "$1" == "" ]
then
    read -p "Project name: " -r PROJECT
    if [ "$PROJECT" == "" ]; then
      exit
    fi
else
  PROJECT=$1
fi

if ! [ -e "$PROJECT" ] && ! [ -e "../$PROJECT" ]; then
  echo "creating project dir.."
  mkdir "$PROJECT"
fi

if [ -e "$PROJECT" ]; then
  cd "$PROJECT"
fi

if ! [ -e "src" ]; then
  echo "creating src dir.."
  mkdir "src"
fi

if ! [ -e "/bin" ]; then
  echo "creating bin dir.."
  mkdir "bin"
fi

if [ -f "src/$PROJECT.cpp" ]; then
  while [ "$ANSWER" == "" ]; do
      read -r -p "overwrite.$PROJECT.cpp? (y/n [n]) " ANSWER
      case "$ANSWER" in
        [yY] | [yY][eE][sS])
          echo "Overwriting $PROJECT.cpp.."
          ;;
        [nN] | [nN][oO])
          exit
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

new_project "$@"