#!/bin/bash

get_spotify() {
    # Check if Spotify is running (requires Spotify app to be installed)
    if [[ $(uname)=="Darwin" ]]; then
      Spotify_running=$(osascript -e 'tell application "System Events" to (name of processes) contains "Spotify"')
      if [[ $Spotify_running == "true" ]]; then
          artist=$(osascript -e 'tell application "Spotify" to artist of current track as string')
          title=$(osascript -e 'tell application "Spotify" to name of current track as string')
          if [[ -n "$artist" && -n "$title" ]]; then
              echo "$artist - $title"
              return
          fi
      fi
    fi
    # If we get here, no media info was found
    echo ""
}

get_spotify
