@echo off
title PurgeMC Minecraft Server Console
color 0A

:: Set Java parameters
set MIN_RAM=4G
set MAX_RAM=10G
set JAVA_PARAMS=-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=20 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1

echo Starting PurgeMC Minecraft Server...
echo.
echo Server will start with %MIN_RAM% - %MAX_RAM% of RAM
echo.
echo Press CTRL+C to stop the server properly when needed
echo.

:: Start the server
java -Xms%MIN_RAM% -Xmx%MAX_RAM% %JAVA_PARAMS% -jar server.jar nogui

:: If the server stops, pause so you can see any error messages
echo.
echo Server stopped. Check above for any errors.
echo.
echo Press any key to exit...
pause > nul