#!/bin/bash

FLAG="-i"
if [[ "$1" == "-f" ]]; then FLAG="-f"; fi
if cp $FLAG new_project.sh ~/.new_project.sh; then echo '~/.new_project.sh created..'; fi
if cp $FLAG new_class.sh ~/.new_class.sh; then echo '~/.new_class.sh created..'; fi
if cp $FLAG new_makefile.sh ~/.new_makefile.sh; then echo '~/.new_makefile.sh created..'; fi
if cp $FLAG new_all.sh ~/.new_all.sh; then echo '~/.new_all.sh created..'; fi

if ! grep "source ~/.new_project.sh" ~/.zshrc &> /dev/null ; then
  echo 'source ~/.new_project.sh' >> ~/.zshrc
  echo '"~/.new_project.sh" added to ~/.zshrc'
else
  echo '"source ~/.new_project.sh" found inside ~/.zshrc'
fi

if ! grep "source ~/.new_class.sh" ~/.zshrc &> /dev/null ; then
  echo 'source ~/.new_class.sh' >> ~/.zshrc
  echo '"~/.new_project.sh" added to ~/.zshrc'
else
  echo '"source ~/.new_class.sh" found inside ~/.zshrc'
fi

if ! grep "source ~/.new_makefile.sh" ~/.zshrc &> /dev/null ; then
  echo 'source ~/.new_makefile.sh' >> ~/.zshrc
  echo '"~/.new_project.sh" added to ~/.zshrc'
else
  echo '"source ~/.new_makefile.sh" found inside ~/.zshrc'
fi

if ! grep "source ~/.new_all.sh" ~/.zshrc &> /dev/null ; then
  echo 'source ~/.new_all.sh' >> ~/.zshrc
  echo '"~/.new_all.sh" added to ~/.zshrc'
else
  echo '"source ~/.new_all.sh" found inside ~/.zshrc'
fi
