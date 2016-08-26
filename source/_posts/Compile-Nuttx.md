---
layout: post
title: Compile Nuttx RTOS on Ubuntu
---
在Ubuntu下编译Nuttx实时操作系统

**1. Download Nuttx source files**

***1.1 Download using git***

Main command:

```
 $ git clone https://bitbucket.org/patacongo/nuttx.git nuttx
 $ git clone https://bitbucket.org/nuttx/apps.git apps
 $ cd nuttx
 $ git submodule init
 $ git submodule update
```
The following is optional:

```
 $ git config --global user.name "My Name"
 $ git config --global user.email my.name@example.com
 $ git config --global color.branch auto
 $ git config --global color.diff auto
 $ git config --global color.interactive auto
 $ git config --global color.status auto
```

***1.2 Download from sourceforge***

Web URL: http://sourceforge.net/projects/nuttx/

**2.Configure the compile environment**

***2.1 Configure gcc-arm-none-eabi tool***

2.1.1 Download the tar.bz2 file 

Web URL: https://launchpad.net/gcc-arm-embedded/+download

2.1.2 Extract the tar.bz2 file

```
$ tar -xjvf gcc-arm-none-eabi-xxxxxxxxxxx.tar.bz2
```

2.1.3 Install gcc-arm-none-eabi

```
$ sudo cp -r gcc-arm-none-eabi-xxxxxxxxxx /usr/srci
```

2.1.4 Add to the environment

Add "export PATH=$PATH:/usr/src/gcc/arm-none-eabi-xxxxxxxxxx/bin" at the end of the /etc/profile

2.1.5 If 64 bit system, it can't find arm-none-eabi-gcc, please install the ia32-libs

```
$ sudo apt-get install ia32-libs
```

Tips:  Ubuntu has removed the ia32-libs since 13.10. So in 13.10+, do the following:

```
$ cd /etc/apt/sources.list.d
$ echo "deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse" > ia32-libs-raring.list
$ sudo apt-get update
$ sudo apt-get install ia32-libs
```

When finished, remove the ia32-libs-raring.list, and do sudo apt-get update

2.1.6 Add "source /etc/profile" at the end of the "~/.bashrc", to setup the enviroment every terminal start.

***2.2 Install "kconfig-mconf" tool***

2.2.1 Download from http://ymorin.is-a-geek.org/projects/kconfig-frontends

2.2.2 Extract and install

```
$ tar -xjvf kconfig-frontends-xxxx.tar.bz2
$ cd kconfig-frontends-xxxx
$ ./configure --enable-mconf
$ make 
$ make install
```

Tips:  when the not find gperf, flex and parser generator, do 

```
$ sudo apt-get install gperf
$ sudo apt-get install flex
$ sudo apt-get install bison
```

**3.Compile Nuttx**

```
$ cd ${TODIR}
$ cd tools
$ ./configure.sh -a <app-dir> <board-name>[/<config-dir>]
```

If the apps in the standard path(../apps or ../apps-<verison></verison>), we can do this simple,

```
$ ./configure.sh <board-name>[/<config-dir>]
$ cd ${TOPDIR}
$ source setenv.sh
$ make
```

For example, the simulation (This example need install zlib1g-dev: sudo apt-get install zlib1g-dev)

```
$ cd tools
$ ./configure.sh sim/nsh
$ cd ..
$ make 
```
