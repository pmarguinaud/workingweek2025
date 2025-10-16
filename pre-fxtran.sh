#!/bin/bash

set -x
set -e

if [[ $(hostname) =~ leonardo ]]
then
  HOMEPHIL=~pmarguin
elif [[ $(hostname) =~ ^a.*\.bullx$ ]]
then
  HOMEPHIL=~sor
else
  echo "Unkwnon machine $(hostname)"
  exit 1
fi

HOMEUSER=$HOME

perl5=1

if [ -L "$HOMEUSER/perl5" ]
then
  l=$(readlink $HOMEUSER/perl5)
  if [ "x$l" = "x$HOMEPHIL/perl5" ]
  then
    perl5=0
  fi
fi

if [[ $perl5 -eq 1 ]] && [[ "$HOMEUSER" != "$HOMEPHIL" ]]
then

  if [[ -d "$HOMEUSER/perl5" ]] 
  then
    \mv "$HOMEUSER/perl5" "$HOMEUSER/perl5.old"
  fi

  ln -s $HOMEPHIL/perl5 $HOMEUSER/perl5

fi

mkdir -p $HOMEUSER/bin
ln -sf $HOMEPHIL/bin/fxtran $HOMEUSER/bin/fxtran

cat > $HOMEUSER/env-fxtran.sh << EOF
export PATH=/usr/bin:$HOMEUSER/bin:$PATH
EOF


echo "source $HOMEUSER/env-fxtran.sh before working with fxtran"
