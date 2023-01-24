#!/bin/bash

mapfile -t array < plugins-list.txt
   
for plugin in "${array[@]}"
    do
        echo "[INSTALL] ${plugin}"
        ./embulk gem install $plugin
    done

echo "
    INSTALLED ${#array[@]} PLUGINS SUCCESSFULLY!
"
