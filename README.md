# cmake & fxtran

## Platforms

The following is supposed to work on ECMWF clusters and Leonardo.

## Pre-requisistes

### Perl & Perl modules

Some Perl modules are required, but have already been installed on my account, so you just need to point to my HOME. It is not possible to provide an exhaustive list, as some are already pre-installed with the OS.

Perl modules installed in my HOME have been compiled using the Perl executable /usr/bin/perl, so if you are using a custom Perl install, you need to remove that from your PATH, and use /usr/bin/perl instead.

### fxtran

The fxtran executable should be in your PATH.

### Getting everything

This [script](pre-fxtran.sh) can do the job for you; it will:
- create a link from my perl5 directory into your HOME
- create a env-fxtran.sh file that you can source to get you environment ready

### Installing yourself

This [script](perl5.sh) shows how to install everything. Some Perl modules may be missing, but you could add them yourself.

## Compiling with cmake & fxtran pre-processing

You need to run these commands, either on ECMWF cluster or on Leonardo; please note that you may want to user a fast filesystem and reserve a node for speeding up the compilation process:

```
$ source $HOME/env-fxtran.sh
$ git clone -b CY50T1-workingweek https://github.com/pmarguinaud/IAL-bundle
$ cd IAL-bundle
$ ./ial-bundle \
  build -j 32 --arch arch/nvhpc+fxtran/ --verbose \
  --build-type FXTRAN_GPUCC80_O1_NVHPC25.9_CUDA12.9_HPCX2.24 \
  --with-openacc
```
## Result

If you prefer to look directory at the result, you can see that here:
```
ecmwf:/perm/sor/IAL-bundle
leonardo:/leonardo_scratch/fast/DestE_330_25/pmarguin/IAL-bundle
```
