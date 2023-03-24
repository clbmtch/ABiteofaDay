#!/usr/bin/liquidsoap

#Creating variables for sources
sndscape = playlist(mode="normal", "morning_ambient.m3u")
vo = playlist(mode="normal", "morning_vo.m3u")



master = add([sndscape, vo])


# Output to local sound card
output.portaudio(
  mksafe(master)
)

#Issues: vo playlist is not functioning, sndscape is working as intended