#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

INSTALL=$HOME/opt/GNAT
NATIVE_GNAT=2018/bin
ARM_GNAT=2018-arm-elf/bin

export GPR_PROJECT_PATH=$DIR/game_support:$GPR_PROJECT_PATH
export GPR_PROJECT_PATH=$DIR/gnat_sdl:$GPR_PROJECT_PATH

export PATH=$INSTALL/$ARM_GNAT:$INSTALL/$NATIVE_GNAT:$PATH
export LD_LIBRARY_PATH=$HOME/opt/stlink/build/Debug:$LD_LIBRARY_PATH
export HOST=Linux

