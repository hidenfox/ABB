#!/bin/bash
pushd /docker
/usr/bin/docker-compose -f docker-compose.azure.yml -f docker-compose.yml restart
#Disable DPMS and screensaver.
xscreensaver -no-splash 
xset -dpms
xset s off
xset s noblank
#while true; do
    # Clean up previously running apps, gracefully at first then harshly
    killall -TERM chromium-browser 2>/dev/null;
    #killall -TERM matchbox-window-manager 2>/dev/null;

    sleep 2;

    killall -9 chromium-browser 2>/dev/null;
    #killall -9 matchbox-window-manager 2>/dev/null;

    # Launch window manager without title bar.
    #exec matchbox-window-manager -use_titlebar no -use_cursor no -theme bluebox &

    # Run unclutter
    unclutter &
    sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences

    # Launch browser.
    chromium-browser --incognito --kiosk --noerrdialogs --disable-translate --disable-cache --disk-cache-dir=/dev/null --disk-cache-size=1 --app=http://127.0.0.1

#done;
