#Define sources
MorningAmbient= single("BiteOfADay-Morning-Ambient.wav")
MorningVO = playlist(mode="normal", "morning_vo.m3u")
AfternoonAmbient = single(“BiteOfADay-Afternoon-Ambient.wav”)
AfternoonVO = playlist(mode="normal",“BiteOfADay-Afternoon.m3u”)
EveningAmbient = single("BiteOfADay-Evening-Ambient.wav")
EveningVO = playlist("BiteOfADay-Evening.m3u")
#these sources are 20 minutes long exactly

#Combine the Ambient & VO

BOAD-Morning = add([MorningAmbient, MorningVO])
BOAD-Afternoon = add([AfternoonAmbient, AfternoonVO])
BOAD-Evening = add([EveningAmbient, EveningVO])

#full schedule
radio = switch([({4h-4h20}, BiteOfADay-Morning), ({4h20-4h40}, BOAD-Afternoon), ({4h40-5h}, BOAD-Evening),
({9h-9h20}, BOAD-Morning), ({9h20-9h40}, BOAD-Afternoon), ({9h40-10h}, BOAD-Evening),
({14h-14h20}, BOAD-Afternoon), ({14h20-14h40}, BOAD-Night), ({14h40-15h}, BOAD-Morning),
({19h-19h20}, BiteOfADay-Evening), ({19h20-19h40}, BOAD-Morning), ({19h40-20h}, BOAD-Afternoon)])

#Output
output.portaudio(
  mksafe(radio)
)
