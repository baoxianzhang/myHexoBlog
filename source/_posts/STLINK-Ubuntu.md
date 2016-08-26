---
layout: post
title: Ubuntu下使用STLINK
---

使用STLINK烧录调试程序

**参考链接：**

[Flashing the STM32VL with stlink](http://gpio.kaltpost.de/?page_id=148)

[Flashing via JTAF/SWD with ST-LINK](https://pixhawk.org/dev/nuttx/building_and_flashing_console)

1. **下载stlink包**

从github里下载stlink代码

```
$ git clone git://github.com/texane/stlink.git
```

编译stlink代码

```
$ cd stlink
$ ./autogen.sh
$ make
$ cd flash
$ make
```

安装程序

```
$ cd ..
$ sudo install -s -m 775 gdbserver/st-util /usr/bin/st-util
$ sudo install -s -m 775 flash/st-flash /usr/bin/st-flash
```
if missing package libusb-1.0

```
$ sudo apt-get install libsgutils2-dev libusb-1.0.0-dev
$ sudo install -m 644 49-stlinkv1.rules /etc/udev/rules.d/49-stlinkv1.rules
$ sudo install -m 644 49-stlinkv2.rules /etc/udev/rules.d/49-stlinkv2.rules
$ sudo install -m 644 49-stlinkv2-1.rules /etc/udev/rules.d/49-stlinkv2-1.rules 
$ sudo install -m 644 stlink_v1.modprobe.conf /etc/modprobe.d/stlink_v1.modprobe.conf
$ sudo udevadm control --reload-rules
```

Start ST-util:

```
$ st-util -p 1234 & # if failed, unknown chip id! 0, please try more times!
```

Start GDB

```
$ arm-none-eabi-gdb xxxx.elf
```

Within gdb:

```
(gdb)tar ext:1234
(gdb)load
(gdb)run
```
Loading will take a few moments. Watch the gdb output to see when it is completed. When loading is complete you should see something similar to this for gdb output.

```
(gdb)kill
(gdb)quit
```
