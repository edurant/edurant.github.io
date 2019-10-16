*version 9.1 416300944
u 264
M? 15
V? 4
? 9
C? 2
@libraries
@analysis
.DC 1 0 0 0 1 1
+ 0 0 Vin
+ 0 4 5
+ 0 5 0
+ 0 6 -.001
.TRAN 1 0 0 0
+0 0ns
+1 500ns
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 11473 
@status
n 0 107:04:01:17:03:09;1178056989 e 
s 2832 107:04:01:17:03:11;1178056991 e 
*page 1 0 970 720 iA
@ports
port 151 AGND 430 400 h
@parts
part 173 VDC 120 70 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 234 VPULSE 170 260 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=Vin
a 1 xp 9 0 20 10 hcn 100 REFDES=Vin
a 1 u 0 0 0 0 hcn 100 V1=0v
a 1 u 0 0 0 0 hcn 100 V2=5v
a 1 u 0 0 0 0 hcn 100 TD=0s
a 1 u 13 13 35 40 hcn 100 PER=100ns
a 1 u 0 0 0 0 hcn 100 TR=10ns
a 1 u 0 0 0 0 hcn 100 TF=10ns
a 1 u 0 0 0 0 hcn 100 PW=40ns
part 226 c 770 290 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 0 5 hln 100 VALUE=30p
part 155 MbreakP 540 190 V
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 3 55 hln 100 MODEL=CMOSP
a 0 x 0:13 0 0 0 hln 100 PKGREF=M8
a 0 xp 9 0 5 10 hln 100 REFDES=M8
a 0 u 13 13 10 0 hln 100 W=2.1u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 195 MbreakP 690 170 U
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 13 35 hln 100 MODEL=CMOSP
a 0 u 13 13 10 0 hln 100 W=21u
a 0 x 0:13 0 0 0 hln 100 PKGREF=M10
a 0 xp 9 0 5 10 hln 100 REFDES=M10
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 129 MbreakN 370 260 h
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 u 13 13 0 0 hln 100 W=1.2u
a 0 sp 13 0 -12 40 hln 100 MODEL=CMOSN
a 0 x 0:13 0 0 0 hln 100 PKGREF=M5
a 0 xp 9 0 5 10 hln 100 REFDES=M5
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 131 MbreakN 540 240 d
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 8 65 hln 100 MODEL=CMOSN
a 0 x 0:13 0 0 0 hln 100 PKGREF=M7
a 0 xp 9 0 5 10 hln 100 REFDES=M7
a 0 u 13 13 15 0 hln 100 W=1.2u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 6 MbreakP 290 130 U
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 13 30 hln 100 MODEL=CMOSP
a 0 x 0:13 0 0 0 hln 100 PKGREF=M2
a 0 xp 9 0 5 10 hln 100 REFDES=M2
a 0 u 13 13 10 0 hln 100 W=1.2u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 127 MbreakP 370 180 U
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 u 13 13 10 0 hln 100 W=2.1u
a 0 sp 13 0 13 35 hln 100 MODEL=CMOSP
a 0 x 0:13 0 0 0 hln 100 PKGREF=M6
a 0 xp 9 0 5 10 hln 100 REFDES=M6
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 128 MbreakP 450 130 U
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 13 35 hln 100 MODEL=CMOSP
a 0 x 0:13 0 0 0 hln 100 PKGREF=M4
a 0 xp 9 0 5 10 hln 100 REFDES=M4
a 0 u 13 13 10 0 hln 100 W=2.1u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 130 MbreakN 450 300 h
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 -12 40 hln 100 MODEL=CMOSN
a 0 x 0:13 0 0 0 hln 100 PKGREF=M3
a 0 xp 9 0 5 10 hln 100 REFDES=M3
a 0 u 13 13 0 0 hln 100 W=1.2u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 196 MbreakN 690 290 h
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 -12 40 hln 100 MODEL=CMOSN
a 0 u 13 13 0 0 hln 100 W=12u
a 0 x 0:13 0 0 0 hln 100 PKGREF=M9
a 0 xp 9 0 5 10 hln 100 REFDES=M9
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 2 MbreakN 290 300 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 u 0 0 0 0 hln 100 L=0.6u
a 0 u 0 0 0 0 hln 100 AS=@AD
a 0 u 0 0 0 0 hln 100 PS=@PD
a 0 sp 13 0 -12 40 hln 100 MODEL=CMOSN
a 0 u 13 13 -5 0 hln 100 W=2.1u
a 0 u 0 0 0 0 hln 100 AD={@W*1.5u}
a 0 u 0 0 0 0 hln 100 PD={2*(1.5u+@W)}
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 193 nodeMarker 170 220 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 233 nodeMarker 770 220 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 244 iMarker 320 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 6 20 hlb 100 LABEL=4
part 246 iMarker 480 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 6 20 hlb 100 LABEL=5
part 249 nodeMarker 400 210 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 248 iMarker 480 320 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 6 20 hlb 100 LABEL=7
part 247 iMarker 320 320 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 6 20 hlb 100 LABEL=6
@conn
w 133
a 0 up 0:33 0 0 0 hln 100 V=
s 480 280 480 270 132
s 480 270 520 270 134
a 0 up 33 0 500 269 hct 100 V=
w 206
a 0 sr 0 0 0 0 hln 100 LABEL=Out
a 0 up 0:33 0 0 0 hln 100 V=
s 770 220 720 220 223
a 0 sr 3 0 745 218 hcn 100 LABEL=Out
a 0 up 33 0 745 219 hct 100 V=
s 720 190 720 220 205
s 720 220 720 270 225
s 770 260 770 220 227
w 184
a 0 sr 0 0 0 0 hln 100 LABEL=In
a 0 up 0:33 0 0 0 hln 100 V=
s 170 220 230 220 185
a 0 sr 3 0 200 218 hcn 100 LABEL=In
a 0 up 33 0 200 219 hct 100 V=
s 170 260 170 220 183
s 230 300 290 300 43
s 230 130 230 160 64
s 290 130 230 130 39
s 230 270 230 300 78
s 340 270 230 270 62
s 340 300 340 270 60
s 230 160 230 220 83
s 340 160 230 160 49
s 340 130 340 160 47
s 450 300 340 300 58
s 450 130 340 130 45
s 230 220 230 270 187
w 202
a 0 up 0:33 0 0 0 hln 100 V=
s 690 290 650 290 201
s 620 220 650 220 191
a 0 up 33 0 635 219 hct 100 V=
s 560 160 620 160 164
s 320 150 320 210 9
s 370 180 340 180 100
s 340 180 340 210 102
s 340 260 370 260 104
s 320 210 320 220 108
s 340 210 340 260 109
s 320 210 340 210 106
s 320 220 320 280 112
s 320 220 620 220 145
s 620 220 620 270 147
s 620 270 560 270 149
s 620 160 620 220 166
s 690 170 650 170 197
s 650 170 650 220 199
s 650 290 650 220 203
w 161
a 0 up 0:33 0 0 0 hln 100 V=
s 480 150 480 160 160
s 480 160 520 160 162
a 0 up 33 0 500 159 hct 100 V=
w 114
a 0 up 0:33 0 0 0 hln 100 V=
s 400 200 400 210 113
s 540 240 540 230 136
s 400 230 400 240 140
s 540 230 400 230 138
s 400 210 400 230 170
s 400 210 540 210 168
a 0 up 33 0 470 209 hct 100 V=
s 540 210 540 190 171
w 175
a 0 up 0:33 0 0 0 hln 100 V=
s 120 70 120 50 174
s 520 150 520 50 156
s 320 110 320 50 13
s 320 50 400 50 15
s 480 50 480 110 17
s 520 50 480 50 21
s 400 50 480 50 117
s 400 160 400 50 115
s 120 50 320 50 176
a 0 up 33 0 220 49 hct 100 V=
s 520 50 720 50 215
s 720 50 720 150 217
s 720 50 730 50 219
s 730 50 730 150 221
s 330 110 320 110 250
s 410 160 400 160 252
s 490 110 480 110 254
w 230
a 0 up 0:33 0 0 0 hln 100 V=
s 320 320 330 320 262
s 320 320 320 370 26
s 170 370 320 370 190
s 320 370 400 370 38
s 120 370 170 370 180
s 170 300 170 370 188
s 400 370 410 370 123
s 400 280 400 370 121
s 120 110 120 370 178
a 0 up 33 0 122 240 hlt 100 V=
s 410 370 430 370 126
s 410 280 410 370 124
s 430 370 480 370 154
s 430 400 430 370 152
s 520 370 480 370 143
s 480 370 480 320 30
s 720 370 520 370 209
s 520 280 520 370 141
s 480 320 490 320 256
s 720 310 720 370 207
s 770 370 720 370 231
s 720 310 730 310 260
s 770 290 770 370 229
@junction
j 230 270
+ w 184
+ w 184
j 230 160
+ w 184
+ w 184
j 480 370
+ w 230
+ w 230
j 480 50
+ w 175
+ w 175
j 320 210
+ w 202
+ w 202
j 340 210
+ w 202
+ w 202
j 320 220
+ w 202
+ w 202
j 400 50
+ w 175
+ w 175
j 400 370
+ w 230
+ w 230
j 410 370
+ w 230
+ w 230
j 400 200
+ p 127 d
+ w 114
j 480 280
+ p 130 d
+ w 133
j 520 270
+ p 131 s
+ w 133
j 540 240
+ p 131 g
+ w 114
j 400 230
+ w 114
+ w 114
j 430 370
+ w 230
+ w 230
j 620 220
+ w 202
+ w 202
j 400 210
+ w 114
+ w 114
j 540 190
+ p 155 g
+ w 114
j 120 70
+ p 173 +
+ w 175
j 520 150
+ p 155 b
+ w 175
j 400 160
+ p 127 s
+ w 175
j 480 110
+ p 128 s
+ w 175
j 320 50
+ w 175
+ w 175
j 320 370
+ w 230
+ w 230
j 290 300
+ p 2 g
+ w 184
j 450 130
+ p 128 g
+ w 184
j 450 300
+ p 130 g
+ w 184
j 230 220
+ w 184
+ w 184
j 170 370
+ w 230
+ w 230
j 170 220
+ p 193 pin1
+ w 184
j 690 290
+ p 196 g
+ w 202
j 560 160
+ p 155 d
+ w 202
j 320 280
+ p 2 d
+ w 202
j 370 180
+ p 127 g
+ w 202
j 560 270
+ p 131 d
+ w 202
j 690 170
+ p 195 g
+ w 202
j 650 220
+ w 202
+ w 202
j 720 270
+ p 196 d
+ w 206
j 720 190
+ p 195 d
+ w 206
j 520 370
+ w 230
+ w 230
j 720 370
+ w 230
+ w 230
j 520 50
+ w 175
+ w 175
j 720 150
+ p 195 s
+ w 175
j 720 50
+ w 175
+ w 175
j 730 150
+ p 195 b
+ w 175
j 720 220
+ w 206
+ w 206
j 770 260
+ p 226 2
+ w 206
j 770 290
+ p 226 1
+ w 230
j 730 310
+ p 196 b
+ w 230
j 120 110
+ p 173 -
+ w 230
j 520 280
+ p 131 b
+ w 230
j 320 320
+ p 2 s
+ w 230
j 330 320
+ p 2 b
+ w 230
j 480 320
+ p 130 s
+ w 230
j 490 320
+ p 130 b
+ w 230
j 430 400
+ s 151
+ w 230
j 720 310
+ p 196 s
+ w 230
j 770 220
+ p 233 pin1
+ w 206
j 170 300
+ p 234 -
+ w 230
j 170 260
+ p 234 +
+ w 184
j 320 150
+ p 244 pin1
+ w 202
j 480 150
+ p 128 d
+ w 161
j 520 160
+ p 155 s
+ w 161
j 480 150
+ p 246 pin1
+ p 128 d
j 480 150
+ p 246 pin1
+ w 161
j 320 320
+ p 247 pin1
+ p 2 s
j 320 320
+ p 247 pin1
+ w 230
j 480 320
+ p 248 pin1
+ p 130 s
j 480 320
+ p 248 pin1
+ w 230
j 400 210
+ p 249 pin1
+ w 114
j 320 110
+ p 6 s
+ w 175
j 290 130
+ p 6 g
+ w 184
j 320 150
+ p 6 d
+ w 202
j 320 150
+ p 244 pin1
+ p 6 d
j 400 240
+ p 129 d
+ w 114
j 370 260
+ p 129 g
+ w 202
j 400 280
+ p 129 s
+ w 230
j 410 280
+ p 129 b
+ w 230
j 330 110
+ p 6 b
+ w 175
j 410 160
+ p 127 b
+ w 175
j 490 110
+ p 128 b
+ w 175
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 235 t 5 70 385 130 401 0 13
Design Notes:
t 236 t 5 70 421 300 400 0 60
1. M1, M2 sets Vth = 1.4 V  when Vin goes from 5V to 0v
   
t 238 t 5 70 435 352 451 0 71
3. M5, M6 minimum geometry inverter  used  to close  switches M7 and M8
t 239 t 5 70 455 267 471 0 49
4. M7 parallels M1 and M3, M8 parallels M2 and M4
t 240 t 5 70 475 380 491 0 79
5. Start design with M1 and M2 set for  Vth = 1.4v,  M3 and M4 set for Vth=2.5V
t 241 t 5 70 495 349 511 0 73
6. Increase size of M1 and M4 to adjust lower and upper Vth  respectively
t 242 t 5 70 530 450 510 0 102
7. Make size of switching transistors (M7 and M8)  same as the transistors (M5 and M6) connected to it
t 237 t 5 70 441 300 420 0 56
2. M3, M4 sets Vth = 2.05 V  when Vin goes from 0 to 5 v
