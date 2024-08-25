#!/usr/bin/env bash

LEEFRC=leefrc
LEEFRC_DEST="${HOME}/.${LEEFRC}"
BASHRC="${HOME}/.bashrc"

# Copy file
cp ${LEEFRC} ${LEEFRC_DEST} || {
    echo "[Error] Cannot copy ${LEEFRC} to ${HOME} !";
    exit 1;
}

# Append to .bashrc
grep -q "source ${LEEFRC_DEST}" ${BASHRC} ||
{
    printf '%s\n' "
# Source leefrc
source ${LEEFRC_DEST}
    " >> ${BASHRC} || {
        echo "[Error] Cannot enable ${LEEFRC} sourcing in ${BASHRC}";
        exit 1;
    };
}