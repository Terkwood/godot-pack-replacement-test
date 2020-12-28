# godot-pack-replacement-test

An experiment to answer these questions:

- Can the main PCK file loaded by Godot be replaced _while the program is running_? 
- Can it pick up new ProjectSettings in a sane way? 

## Findings

We can export a Mac app, and _successfully replace the pck file_ that's contained inside the Mac application folder structure _while the app is running_.  The next time the app starts up, it goes straight to the replacement PCK, and the old one is gone completely.

If you're delivering incremental updates to game with a large set of assets, this is good news:  you can get rid of the bulky, outdated PCK file that you originally shipped, and virtuously save your user's disk space.

## Project Settings 

We don't believe that we can update these while the game is running. If you need to ship changes to project.godot/project.binary, you'll either need to figure out how to update each value based on its functionality, or you'll need to require that the user restart after the update. 

## Usage

You may NOT run this experiment in the Godot editor!  PCK files don't really work the same way, there.  We're interested in replacing a PCK file as it's seen when users run an exported game.

Run `export.sh`.  It will export both a PCK file and a Mac DMG file.  It will also create a file `/tmp/000-test.pck` on your system, which will be used if you unzip the Mac DMG and run it.

Then pick a flavor:
    
- `sh run_system_install.sh`: this will use the system install of Godot
- Unzip the DMG then `sh run_exported_mac_app.sh`  
- Unzip the DMG then run the Mac app by clicking it.
