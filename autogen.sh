#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="Gnome Bluetooth Controller"

(cd $srcdir && cat python.m4 bluez-sdp.m4 bluez-libs.m4 >acinclude.m4)

(test -f $srcdir/configure.in) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level directory"
    exit 1
}

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}

USE_GNOME2_MACROS=1 . gnome-autogen.sh

