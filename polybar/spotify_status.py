#!/usr/bin/env python3

import subprocess
import sys

def get_spotify_status():
    try:
        # Get player status
        status = subprocess.check_output(['playerctl', 'status', '-p', 'spotify'], 
                                       stderr=subprocess.DEVNULL).decode('utf-8').strip()
        
        # Get metadata
        artist = subprocess.check_output(['playerctl', 'metadata', 'artist', '-p', 'spotify'], 
                                       stderr=subprocess.DEVNULL).decode('utf-8').strip()
        song = subprocess.check_output(['playerctl', 'metadata', 'title', '-p', 'spotify'], 
                                     stderr=subprocess.DEVNULL).decode('utf-8').strip()
        
        # Truncate if too long
        if len(artist) > 25:
            artist = artist[:22] + "..."
        if len(song) > 25:
            song = song[:22] + "..."
        
        # Add play/pause icon
        if status == "Playing":
            status_icon = "󰏤"  # pause icon when playing
        else:
            status_icon = "󰐊"  # play icon when paused
            
        # Format based on command line argument
        if len(sys.argv) > 2 and sys.argv[1] == '-f':
            format_str = sys.argv[2]
            output = format_str.replace('{artist}', artist).replace('{song}', song)
        else:
            output = f"{artist}: {song}"
            
        print(output)
    except subprocess.CalledProcessError:
        # Spotify not running or no song playing
        print("")

if __name__ == "__main__":
    get_spotify_status()