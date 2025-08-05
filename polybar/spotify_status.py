#!/usr/bin/env python3

import subprocess
import sys

def get_spotify_status():
    try:
        # Get metadata using playerctl
        artist = subprocess.check_output(['playerctl', 'metadata', 'artist', '-p', 'spotify'], 
                                       stderr=subprocess.DEVNULL).decode('utf-8').strip()
        song = subprocess.check_output(['playerctl', 'metadata', 'title', '-p', 'spotify'], 
                                     stderr=subprocess.DEVNULL).decode('utf-8').strip()
        
        # Truncate if too long
        if len(artist) > 30:
            artist = artist[:27] + "..."
        if len(song) > 30:
            song = song[:27] + "..."
            
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