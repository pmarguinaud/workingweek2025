#!/bin/bash

set -e
set -x


PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

cpan install -f File::Type 
cpan install -f List::MoreUtils 
cpan install -f XML::LibXML 
cpan install -f XML::SAX::Exception 
cpan install -f XML::XPath::Parser 
cpan install -f XML::Parser 

git clone https://github.com/pmarguinaud/fxtran
cd fxtran
make -j4
cd perl5
perl Makefile.PL
make -j4
make install

