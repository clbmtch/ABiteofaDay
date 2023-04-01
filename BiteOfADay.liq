#Define sources
EveningAmbient = single("BiteOfADay-Evening-Ambient.wav")
EveningVO = playlist("BiteOfADay-Evening.m3u")
#these sources are 20 minutes long exactly

#Combine the two
BOAD-Evening = add([EveningAmbient, EveningVO])

#Output combined
output.portaudio(
  mksafe(mixed)
)

#4am-5am schedule
radio = switch([
({4h-4h20}, BiteOfADay-Morning), ({4h20-4h40}, BOAD-Afternoon), ({4h40-5h}, BOAD-Evening)
({19h-19h20}, BiteOfADay-Evening), ({19h20-19h40}, BOAD-Morning), ({19h40-20h}, BOAD-Afternoon)
])

#9am-10am

#14-15

#19-20
#({19h-19h20}, BiteOfADay-Evening), ({19h20-19h40}, BOAD-Morning), ({19h40-20h}, BOAD-Afternoon)

#afternoon schedule

output.portaudio(
  mksafe(radio)
)
