# godot-pack-replacement-test

An experiment to answer these questions:

- Can the main PCK file loaded by Godot be replaced while the program is running? 
- Can it pick up new ProjectSettings in a sane way? 

## Usage

You may NOT run this experiment in the Godot editor!  PCK files don't really work the same way, there.  We're interested in replacing a PCK file as it's seen when users run an exported game.

Run `export.sh`.  It will export both a PCK file and a Mac DMG file.  It will also create a file `/tmp/000-test.pck` on your system, which will be used if you unzip the Mac DMG and run it.

Then pick a flavor:
    - `sh run_system_install.sh`: this will use the system install of Godot
    - Unzip the DMG then `sh run_exported_mac_app.sh`
    - Unzip the DMG then run the Mac app by clicking it.
