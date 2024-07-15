#!/bin/bash

# Check if the screen session named "minecraft" exists
if ! screen -list | grep -q "minecraft"; then
    # If it doesn't exist, create a new screen session and start the Minecraft server
    screen -S minecraft -dm java -Xms1G -Xmx4G -jar server1201.jar nogui
else
    # If it exists, reattach to the existing screen session
    screen -d -r minecraft
fi

