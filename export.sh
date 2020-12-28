#!/bin/bash

# see https://docs.godotengine.org/en/stable/getting_started/editor/command_line_tutorial.html

godot --export-pack "Mac OSX" export/main.pck
godot --export "Mac OSX" export/Test.dmg
