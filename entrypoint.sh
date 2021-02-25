#!/bin/bash

# Download Valheim Dedicated Server via SteamCMD
/usr/games/steamcmd \
    +login anonymous \
    +force_install_dir /server \
    +app_info_update 1 \
    +app_update 896660 validate \
    +quit

exec ${@}
