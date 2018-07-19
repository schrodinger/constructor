#!/bin/sh
# Copyright (c) 2012-2017 Anaconda, Inc.
# All rights reserved.

# $2 is the install location, which is ~ by default, but which the user can
# change.
PREFIX=$(echo "$2/__NAME_LOWER__" | sed -e 's,//,/,g')

# Logic borrowed from the official Python Mac OS X installer
if [ -e "${HOME}/.bash_profile" ]; then
    BASH_RC="${HOME}/.bash_profile"
elif [ -e "${HOME}/.bash_login" ]; then
    BASH_RC="${HOME}/.bash_login"
elif [ -e "${HOME}/.profile" ]; then
    BASH_RC="${HOME}/.profile"
else
    BASH_RC="${HOME}/.bash_profile"
fi

BASH_RC_BAK="${BASH_RC}-__NAME_LOWER__.bak"

cp -fp $BASH_RC ${BASH_RC_BAK}

echo "
Prepending PATH=$PREFIX/bin to PATH in $BASH_RC

For this change to become active, you have to open a new terminal.
"
echo "
# added by __NAME__ __VERSION__ installer
export PATH=\"$PREFIX/bin:\$PATH\"" >>$BASH_RC

chown "$USER" "$BASH_RC" "$BASH_RC_BAK"
exit 0
