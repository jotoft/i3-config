#!/bin/bash
rofi -show window -window-command 'echo i3-msg  [[id=\"{window}\"]] move workspace current'
