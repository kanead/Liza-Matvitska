;last edit: 22/11/2022


extensions [ rnd ]
globals [day total_energy probabilities some_list]
;;----------------------------------------------------------------------------------------
;; Trex Breeds and Own Variables
;;----------------------------------------------------------------------------------------

breed [trexes100 trex100]
breed [trexes500 trex500]
breed [trexes1000 trex1000]
breed [trexes2000 trex2000]
breed [trexes3000 trex3000]
breed [trexes4000 trex4000]
breed [trexes5000 trex5000]
breed [trexes6000 trex6000]
breed [trexes7000 trex7000]
breed [trexes8000 trex8000]
breed [trexes9000 trex9000]
breed [trexes10000 trex10000]

trexes100-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes500-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes1000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes2000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes3000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes4000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes5000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes6000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes7000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes8000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes9000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]
trexes10000-own [mycarcass rex_energy capacity fitness flesh-gain energy occupied?]

;;----------------------------------------------------------------------------------------
;; Competitor Breeds and Own Variables
;;----------------------------------------------------------------------------------------

breed [dromaeosaurs dromaeosaur]
breed [troodons troodon]
breed [albertosaurus albertosaur]

dromaeosaurs-own [mycarcass rap_energy flesh-gain-rap capacity occupied?]
troodons-own [mycarcass rap_energy flesh-gain-rap capacity occupied?]
albertosaurus-own [mycarcass rap_energy flesh-gain-rap capacity occupied?]

;;----------------------------------------------------------------------------------------
;; Carcass Breeds and Own Variables
;;----------------------------------------------------------------------------------------

breed [carcasses75 carcass75]
breed [carcasses216 carcass216]
breed [carcasses700 carcass700]
breed [carcasses2500 carcass2500]
breed [carcasses5000 carcass5000]
breed [carcasses8500 carcass8500]
breed [carcasses25000 carcass25000]

carcasses75-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses216-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses700-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses2500-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses5000-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses8500-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]
carcasses25000-own [energy rex_energy rap_energy flesh-gain flesh-gain-rap occupied? start-day]


;;----------------------------------------------------------------------------------------------------;;
;; Setup Section
;;----------------------------------------------------------------------------------------------------;;
;; Trex stages
;-------------------
to setup

clear-all


create-trexes100 N-trex100
[
set size 0.7
set color green
set heading random 360
set capacity 6
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes500 N-trex500
[
set size 0.8
set color green
set heading random 360
set capacity 26
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes1000 N-trex1000
[
set size 0.9
set color green
set heading random 360
set capacity 50
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes2000 N-trex2000
[
set size 1.1
set color green
set heading random 360
set capacity 95
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes4000 N-trex4000
[
set size 1.2
set color green
set heading random 360
set capacity 182
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes6000 N-trex6000
[
set size 1.3
set color green
set heading random 360
set capacity 267
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes8000 N-trex8000
[
set size 1.4
set color green
set heading random 360
set capacity 350
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-trexes10000 N-trex10000
[
set size 1.5
set color green
set heading random 360
set capacity 432
set flesh-gain 0
set rex_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

;-------------------
; Competitor species
;-------------------
create-dromaeosaurs N-dromaeosaur
[
set size 0.5
set color blue
set heading random 360
set capacity 1.25
set flesh-gain-rap 0
set rap_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-troodons N-troodon
[
set size 0.6
set color blue
set heading random 360
set capacity 3
set flesh-gain-rap 0
set rap_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

create-albertosaurus N-albertosaurus
[
set size 1
set color blue
set heading random 360
set capacity 56
set flesh-gain-rap 0
set rap_energy 0
set occupied? "no"
setxy random-xcor random-ycor]

reset-ticks



end

;;----------------------------------------------------------------------------------------------------;;
;; Go Code
;;----------------------------------------------------------------------------------------------------;;

to go
if ticks = 28800  [set day day + 1 create-next-day]  ;; equals 8 hours ;; changed from 43200
if day = 30 [stop]


if ticks = 0
[
    ask turtles with [shape = "circle"] [ if (day - start-day >= 7) [die]]

    ask turtles with [shape = "circle" and color = violet] [decay75]
    ask turtles with [shape = "circle" and color = magenta] [decay216]
    ask turtles with [shape = "circle" and color = pink] [decay700]
    ask turtles with [shape = "circle" and color = red] [decay2500]
    ask turtles with [shape = "circle" and color = orange] [decay5000]
    ask turtles with [shape = "circle" and color = yellow] [decay8500]
    ask turtles with [shape = "circle" and color = brown] [decay25000]
  ]

if ticks = 0
  [    while [sum [energy] of turtles with [shape = "circle"] < 1752] [
let choose-size random-float 1
  if choose-size <= 0.493 [ create_carcass75 ]
  if choose-size >= 0.493 and choose-size <= 0.861  [ create_carcass216 ]
  if choose-size >= 0.861 and choose-size <= 0.921  [ create_carcass700 ]
  if choose-size >= 0.921 and choose-size <= 0.988  [ create_carcass2500 ]
  if choose-size >= 0.988 and choose-size <= 0.994  [ create_carcass5000 ]
  if choose-size >= 0.994 and choose-size <= 0.998  [ create_carcass8500 ]
  if choose-size >= 0.998 [ create_carcass25000 ]

  ]]


ask turtles with [shape = "circle" and color = violet] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = magenta] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = pink] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = red] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = orange] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = yellow] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]
ask turtles with [shape = "circle" and color = brown] [eaten_by_dromaeosaurs eaten_by_troodons eaten_by_albertosaurs]

set total_energy sum [energy] of turtles with [shape = "circle"]

ask turtles with [shape = "circle"] [if energy <= 0 [die]]

;;----------------------------------------------------------------------------------------------------;;
;;----------------------------------------------------------------------------------------------------;;

  ask turtles with [color = green]
  [;jump 0.0025
    forage_trex
 if random-float 1 < ( 1 / 3600 )   ;
 [ ifelse random 2 = 0              ;
 [ rt 45 ]
 [ lt 45 ] ]
 if ticks  = 0 [calculate-fitness]]

  ask trexes100 [jump 0.00133 avoidTrex100 set rex_energy rex_energy - 0.97]
  ask trexes500 [jump 0.00171 avoidTrex500 set rex_energy rex_energy - 3.82]
  ask trexes1000 [jump 0.0019 avoidTrex1000 set rex_energy rex_energy - 6.94]
  ask trexes2000 [jump 0.00212 avoidTrex2000 set rex_energy rex_energy - 12.85]
  ask trexes4000 [jump 0.00236 avoidTrex4000 set rex_energy rex_energy - 23.26]
  ask trexes6000 [jump 0.00252 avoidTrex6000 set rex_energy rex_energy - 33.33]
  ask trexes8000 [jump 0.00263 avoidTrex8000 set rex_energy rex_energy - 43.4]
  ask trexes10000 [jump 0.00273            set rex_energy rex_energy - 52.08]
;;----------------------------------
ask dromaeosaurs
[jump 0.001
  if random-float 1 < ( 1 / 3600 )
 [ ifelse random 2 = 0
 [ rt 45 ]
 [ lt 45 ]
 ]]
  ask dromaeosaurs  [avoidDrom
 if not any? turtles with [size > 0.5] in-radius rap_vision [ forage_dromaeosaurs]]

ask troodons
[jump 0.001   ;; ;set rap_energy rap_energy - 0.089  changed from fd to jump for optimisation
 if random-float 1 < ( 1 / 3600 )
 [ ifelse random 2 = 0
 [ rt 45 ]
 [ lt 45 ]
 ]]

  ask troodons [avoidTrood
  if not any? turtles with [size > 0.6] in-radius rap_vision [forage_troodons]]

ask albertosaurus
[jump 0.0019    ;; ;set rap_energy rap_energy - 0.089  changed from fd to jump for optimisation
 if random-float 1 < ( 1 / 3600 )
 [ ifelse random 2 = 0
 [ rt 45 ]
 [ lt 45 ]
 ]]

ask albertosaurus [avoidAlbert
 if not any? turtles with [size > 1] in-radius rex_vision [ forage_albertosaurs]]




tick
end



;;----------------------------------------------------------------------------------------------------;;
;; Creating Carcasses Code
;;----------------------------------------------------------------------------------------------------;;

to create_carcass75
create-carcasses75 1
[setxy random-xcor random-ycor
set shape "circle"
set color violet
set size 0.4
set energy 75
set occupied? "no"
set start-day day
]
end

to create_carcass216
create-carcasses216 1
[setxy random-xcor random-ycor
set shape "circle"
set color magenta
set size 0.4
set energy 216
set occupied? "no"
set start-day day
]
end

to create_carcass700
create-carcasses700 1
[setxy random-xcor random-ycor
set shape "circle"
set color pink
set size 0.4
set energy 700
set occupied? "no"
set start-day day
]
end

to create_carcass2500
create-carcasses2500 1
[setxy random-xcor random-ycor
set shape "circle"
set color red
set size 0.4
set energy 2500
set occupied? "no"
set start-day day
]
end

to create_carcass5000
create-carcasses5000 1
[setxy random-xcor random-ycor
set shape "circle"
set color orange
set size 0.4
set energy 5000
set occupied? "no"
set start-day day
]
end

to create_carcass8500
create-carcasses8500 1
[setxy random-xcor random-ycor
set shape "circle"
set color yellow
set size 0.4
set energy 8500
set occupied? "no"
set start-day day
]
end

to create_carcass25000
create-carcasses25000 1
[setxy random-xcor random-ycor
set shape "circle"
set color brown
set size 0.4
set energy 25000
set occupied? "no"
set start-day day
]
end

;;----------------------------------------------------------------------------------------------------;;
;;----------------------------------------------------------------------------------------------------;;

to decay75
  set energy energy - 10.7136
end

to decay216
  set energy energy - 30.816
end

to decay700
  set energy energy - 99.9936
end

to decay2500
  set energy energy - 357.12
end

to decay5000
  set energy energy - 714.24
end

to decay8500
  set energy energy - 1214.2944
end

to decay25000
  set energy energy - 3571.2
end

;;----------------------------------------------------------------------------------------------------;;
;; Trex Foraging Code
;;----------------------------------------------------------------------------------------------------;;

to forage_trex
 if any? turtles with [shape = "circle" and occupied? = "no"] in-radius rex_vision and (flesh-gain) / capacity < 1
    [ set mycarcass min-one-of turtles with [shape = "circle"]  in-radius rex_vision
      [distance myself]
      set heading towards mycarcass
   if distance mycarcass < 0.1  [fd 0 set flesh-gain flesh-gain + 1];[fd 0 set flesh-gain flesh-gain + 0.5] ;; THIS IS THE NEW LINE OF CODE
        ask mycarcass  [if any? turtles with [color = green] in-radius 0.101  [set energy energy - 1] ;set occupied? "yes"];[set occupied? "no"]
          ]]
end


;;----------------------------------------------------------------------------------------------------;;
;; Competitor Foraging Code
;;----------------------------------------------------------------------------------------------------;;

to forage_dromaeosaurs
 if any? turtles with [shape = "circle"] in-radius rap_vision and flesh-gain-rap / capacity < 1
    [ set mycarcass min-one-of turtles with [shape = "circle"] in-radius rap_vision
      [distance myself]
      set heading towards mycarcass
     if distance mycarcass < 0.1 [fd 0 set flesh-gain-rap flesh-gain-rap + 0.0032]];0.00288]]
end

to eaten_by_dromaeosaurs
if shape = "circle" and any? dromaeosaurs in-radius 0.101 with [flesh-gain-rap / capacity < 1] [set energy energy - 0.0032 * count dromaeosaurs-here]
end

to forage_troodons
 if any? turtles with [shape = "circle"] in-radius rap_vision and flesh-gain-rap / capacity < 1
    [ set mycarcass min-one-of turtles with [shape = "circle"] in-radius rap_vision
      [distance myself]
     set heading towards mycarcass
    if distance mycarcass < 0.1 [set flesh-gain-rap flesh-gain-rap + 0.0032]]
end

to eaten_by_troodons
if shape = "circle" and any? troodons in-radius 0.101 with [flesh-gain-rap / capacity < 1] [set energy energy - 0.0032 * count troodons-here]
end

to forage_albertosaurs
 if any? turtles with [shape = "circle"] in-radius rex_vision and flesh-gain-rap / capacity < 1
    [ set mycarcass min-one-of turtles with [shape = "circle"] in-radius rex_vision
      [distance myself]
     set heading towards mycarcass
    if distance mycarcass < 0.1 [set flesh-gain-rap flesh-gain-rap + 1]] ;; this value should change
end

to eaten_by_albertosaurs
if shape = "circle" and any? albertosaurus in-radius 0.101 with [flesh-gain-rap / capacity < 1] [set energy energy - 1 * count albertosaurus-here] ;; this value should change

end

;;----------------------------------------------------------------------------------------------------;;
;; Species Interaction Code
;;----------------------------------------------------------------------------------------------------;;

to avoidDrom
if any? turtles in-radius rap_vision with [size > 0.5]
    [set heading (towards min-one-of turtles in-radius rap_vision with [size > 0.5] [distance myself]) + 180
    ]
end

to avoidTrood
if any? turtles in-radius rap_vision with [size > 0.6]
    [ set heading (towards min-one-of turtles in-radius rap_vision with [size > 0.6] [distance myself]) + 180
    ]
end

to avoidAlbert
if any? turtles in-radius rex_vision with [size > 1]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 1] [distance myself]) + 180
    ]
end

to avoidTrex100
if any? turtles in-radius rap_vision with [size > 0.7]
    [ set heading (towards min-one-of turtles in-radius rap_vision with [size > 0.7] [distance myself]) + 180
    ]
end

to avoidTrex500
if any? turtles in-radius rex_vision with [size > 0.8]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 0.8] [distance myself]) + 180
    ]
end

to avoidTrex1000
if any? turtles in-radius rap_vision with [size > 0.9]
    [ set heading (towards min-one-of turtles in-radius rap_vision with [size > 0.9] [distance myself]) + 180
    ]
end

to avoidTrex2000
if any? turtles in-radius rex_vision with [size > 1.1]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 1.1] [distance myself]) + 180
    ]
end

to avoidTrex4000
if any? turtles in-radius rex_vision with [size > 1.2]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 1.2] [distance myself]) + 180
    ]
end

to avoidTrex6000
if any? turtles in-radius rex_vision with [size > 1.3]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 1.3] [distance myself]) + 180
    ]
end

to avoidTrex8000
if any? turtles in-radius rex_vision with [size > 1.4]
    [ set heading (towards min-one-of turtles in-radius rex_vision with [size > 1.4] [distance myself]) + 180
    ]
end

to calculate-fitness
  set fitness rex_energy
end




;;----------------------------------------------------------------------------------------------------;;
;;----------------------------------------------------------------------------------------------------;;


to create-next-day
  clear-links
  reset-ticks
 ; ask turtles with [color = "green"] [set rex_energy (flesh-gain) + ()

  ask turtles with [color = green] [set rex_energy (flesh-gain * 4200)
  set flesh-gain 0
  ]

  ask dromaeosaurs [  ;set rap_energy (flesh-gain-rap * 7000)
      set flesh-gain-rap 0]

  ask troodons [  ;set rap_energy (flesh-gain-rap * 7000)
      set flesh-gain-rap 0]

  ask albertosaurus [  ;set rap_energy (flesh-gain-rap * 7000)
      set flesh-gain-rap 0]

  go
end

;;----------------------------------------------------------------------------------------------------;;
;;---------------------------------------End of the Model --------------------------------------------;;
;;----------------------------------------------------------------------------------------------------;;
@#$#@#$#@
GRAPHICS-WINDOW
210
10
478
279
-1
-1
13.0
1
10
1
1
1
0
0
0
1
0
19
0
19
0
0
1
ticks
30.0

BUTTON
108
17
171
50
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
23
18
90
51
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
723
14
895
47
N-trex100
N-trex100
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
19
76
191
109
rex_vision
rex_vision
0.1
10
0.9
0.1
1
NIL
HORIZONTAL

SLIDER
737
395
909
428
N-dromaeosaur
N-dromaeosaur
0
500
55.0
1
1
NIL
HORIZONTAL

PLOT
936
10
1136
160
Fitness Plot Trex100
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes100[\n\n  let rex-list [fitness] of trexes100\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex100\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

SLIDER
19
116
191
149
rap_vision
rap_vision
0
10
0.5
.1
1
NIL
HORIZONTAL

TEXTBOX
773
528
893
581
Dromeosaurs = 55\nTroodons = 22\nAlbertosaurs = 2
12
0.0
1

SLIDER
725
55
897
88
N-trex500
N-trex500
0
100
1.0
1
1
NIL
HORIZONTAL

SLIDER
727
97
899
130
N-trex1000
N-trex1000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
728
137
900
170
N-trex2000
N-trex2000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
729
176
901
209
N-trex4000
N-trex4000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
730
215
902
248
N-trex6000
N-trex6000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
731
256
903
289
N-trex8000
N-trex8000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
732
295
904
328
N-trex10000
N-trex10000
0
100
0.0
1
1
NIL
HORIZONTAL

SLIDER
739
437
911
470
N-troodon
N-troodon
0
200
22.0
1
1
NIL
HORIZONTAL

SLIDER
741
480
913
513
N-albertosaurus
N-albertosaurus
0
200
2.0
1
1
NIL
HORIZONTAL

PLOT
936
159
1136
309
Fitness Plot Trex500
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes500[\n\n  let rex-list [fitness] of trexes500\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex500\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
938
309
1138
459
Fitness Plot Trex1000
day
Trex Energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes1000[\n\n  let rex-list [fitness] of trexes1000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex1000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
938
459
1138
609
Fitness Plot Trex2000
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes2000[\n\n  let rex-list [fitness] of trexes2000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex2000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
1135
10
1335
160
Fitness Plot Trex4000
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes4000[\n\n  let rex-list [fitness] of trexes4000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex4000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
1137
159
1337
309
Fitness Plot Trex6000
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes6000[\n\n  let rex-list [fitness] of trexes6000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex6000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
1137
309
1337
459
Fitness Plot Trex8000
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes8000[\n\n  let rex-list [fitness] of trexes8000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex8000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

PLOT
1138
459
1338
609
Fitness Plot Trex10000
day
Trex energy
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"fitness" 1.0 0 -16777216 true "ask trexes10000[\n\n  let rex-list [fitness] of trexes10000\n  let mean-fitness mean rex-list\n  set-current-plot \"Fitness Plot Trex10000\"\n  set-current-plot-pen \"Fitness\"\n  plotxy day mean-fitness\n\n  output-show fitness]" ""

MONITOR
507
67
660
112
Total Kg of carrion in system
total_energy
2
1
11

MONITOR
507
121
641
166
Age of oldest carcass
max [day - start-day] of turtles with [shape = \"circle\"]
17
1
11

MONITOR
507
15
564
60
Day
day
17
1
11

MONITOR
24
291
112
336
Carcass 700
count turtles with [color = pink]
17
1
11

MONITOR
24
348
112
393
Carcass 2500
count turtles with [color = red]
17
1
11

MONITOR
24
404
112
449
Carcass 5000
count turtles with [color = orange]
17
1
11

MONITOR
24
459
112
504
Carcass 8500
count turtles with [color = yellow]
17
1
11

MONITOR
24
515
113
560
Carcass 25000
count turtles with [color = brown]
17
1
11

MONITOR
24
185
112
230
Carcass 75
count turtles with [color = violet]
17
1
11

MONITOR
24
239
112
284
Carcass 216
count turtles with [color = magenta]
17
1
11

@#$#@#$#@
## ## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## ## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## ## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## ## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## ## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## ## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## ## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## ## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## ## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dinosaur
true
1
Polygon -6459832 true false 169 212 170 277 193 288 190 276 179 265 181 214 171 213
Polygon -6459832 true false 124 219 125 284 148 295 145 283 134 272 136 221 126 220
Polygon -8630108 true false 1 165 13 161 26 161 39 158 54 151 58 145 67 130 84 122 104 114 127 111 153 104 160 93 167 87 178 97 188 107 202 116 208 123 213 130 213 145 213 151 214 169 213 181 213 190 217 207 210 215 201 226 196 231 184 238 175 244 173 245 169 247 162 251 159 253 155 254
Polygon -8630108 true false 164 89 161 80 161 74 165 61 170 56 179 49 181 44 182 37 187 32 196 34 199 39 205 41 207 43 210 44 209 43 214 33 222 34 227 38 232 45 235 55
Polygon -8630108 true false 232 50 237 53 240 55 243 58 250 59 258 65 262 75 263 79 262 81 261 83 259 88 255 92 252 94 248 94 244 95 241 95 234 95 231 95 225 95 220 94 214 93 206 91 199 87 184 75
Circle -7500403 true false 185 37 12
Circle -7500403 true false 213 38 12
Polygon -1184463 true false 206 137 198 139 194 144 180 150 170 158 163 168 157 173 148 185 138 197 140 210 142 226 158 241 167 248 175 246 184 239 194 233 205 222 214 212 216 208 213 196 213 187 216 174 214 159 213 143
Polygon -6459832 true false 182 134 183 149 195 173 205 159 189 148 187 135 188 131 180 132 176 127
Circle -16777216 true false 217 43 4
Circle -16777216 true false 189 42 4
Polygon -7500403 true false 245 93 244 107 236 100 231 105 227 95 216 103 215 94 205 99 203 90 198 96 195 83 189 92 183 82 179 87 176 80 183 76 190 76 200 83 206 87 220 92 230 91 237 91 241 91 246 94
Polygon -7500403 true false 176 97 180 103 177 100 196 110 230 115 224 107 221 107 220 104 215 104 216 101 202 107 203 100 195 105 195 100 187 102 186 96 179 98 178 93 169 92 173 94 174 94 174 97 171 92 173 96

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

godzilla
true
0
Rectangle -7500403 true true 150 240 210 270
Rectangle -7500403 true true 135 210 165 270
Rectangle -7500403 true true 90 210 135 225
Rectangle -7500403 true true 60 195 90 210
Rectangle -7500403 true true 45 210 90 225
Rectangle -7500403 true true 30 195 45 210
Rectangle -7500403 true true 15 180 30 195
Rectangle -7500403 true true 0 165 15 180
Rectangle -7500403 true true 0 135 15 165
Rectangle -7500403 true true 15 120 30 135
Rectangle -7500403 true true 30 105 45 120
Rectangle -7500403 true true 15 135 30 150
Rectangle -7500403 true true 15 150 30 180
Rectangle -7500403 true true 30 180 90 195
Rectangle -7500403 true true 45 195 60 210
Rectangle -7500403 true true 135 120 210 135
Rectangle -7500403 true true 150 105 210 120
Rectangle -7500403 true true 165 90 180 105
Rectangle -7500403 true true 180 75 210 105
Rectangle -7500403 true true 195 60 210 75
Rectangle -7500403 true true 210 45 225 180
Rectangle -7500403 true true 225 45 240 150
Rectangle -7500403 true true 240 45 255 60
Rectangle -7500403 true true 255 60 270 75
Rectangle -7500403 true true 270 75 285 90
Rectangle -7500403 true true 240 105 285 120
Rectangle -7500403 true true 240 60 270 90
Rectangle -7500403 true true 240 120 270 135
Rectangle -7500403 true true 240 135 255 150
Rectangle -16777216 true false 195 240 210 255
Rectangle -16777216 true false 240 135 255 150
Rectangle -7500403 true true 255 150 270 165
Rectangle -7500403 true true 240 165 255 180
Rectangle -7500403 true true 225 165 240 180
Rectangle -7500403 true true 240 180 255 195
Rectangle -7500403 true true 255 180 270 195
Rectangle -7500403 true true 240 90 255 105
Rectangle -2674135 true false 240 60 255 75
Rectangle -7500403 true true 135 135 210 180
Rectangle -7500403 true true 135 180 165 210
Rectangle -7500403 true true 165 180 195 210
Rectangle -7500403 true true 165 210 180 225
Rectangle -7500403 true true 195 180 210 195
Rectangle -7500403 true true 120 135 135 150
Rectangle -7500403 true true 105 150 120 165
Rectangle -7500403 true true 90 165 105 180
Rectangle -7500403 true true 90 180 135 210
Rectangle -7500403 true true 105 165 135 180
Rectangle -7500403 true true 120 150 135 165
Rectangle -7500403 true true 30 165 45 180
Rectangle -7500403 true true 45 165 60 180
Rectangle -2674135 true false 120 105 135 120
Rectangle -2674135 true false 150 75 165 90
Rectangle -2674135 true false 90 135 105 150

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="repeat 28799" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799 [ go ]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes100</metric>
    <metric>[flesh-gain] of trexes500</metric>
    <metric>[flesh-gain] of trexes1000</metric>
    <metric>[flesh-gain] of trexes2000</metric>
    <metric>[flesh-gain] of trexes4000</metric>
    <metric>[flesh-gain] of trexes6000</metric>
    <metric>[flesh-gain] of trexes8000</metric>
    <metric>[flesh-gain] of trexes10000</metric>
    <metric>[flesh-gain-rap] of dromaeosaurs</metric>
    <metric>[flesh-gain-rap] of troodons</metric>
    <metric>[flesh-gain-rap] of albertosaurus</metric>
    <metric>count carcasses75</metric>
    <metric>count carcasses216</metric>
    <metric>count carcasses700</metric>
    <metric>count carcasses2500</metric>
    <metric>count carcasses5000</metric>
    <metric>count carcasses8500</metric>
    <metric>count carcasses25000</metric>
    <enumeratedValueSet variable="N-trex8000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex4000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex100" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799 [go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes100</metric>
    <metric>[fitness] of trexes100</metric>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex 2000" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799 [go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes2000</metric>
    <metric>[fitness] of trexes2000</metric>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex 4000" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes4000</metric>
    <metric>[fitness] of trexes4000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex 6000" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes6000</metric>
    <metric>[fitness] of trexes6000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="trex 8000" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes8000</metric>
    <metric>[fitness] of trexes8000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="trex 10 000" repetitions="3" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes10000</metric>
    <metric>[fitness] of trexes10000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex 8000 radius 1000" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes8000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Trex 10000 radius 1000" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes10000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="16"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D+ L Trex 100 radius 500" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes100</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 4000 radius 500 CHECK" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes4000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 6000 radius 750" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes6000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.75"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 1000 radius 350" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes1000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.35"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 8000 radius 750" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes8000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.75"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 10000 radius 750" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes10000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.75"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 500 radius 1000" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes500</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 1000 radius 1000" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes1000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 500 radius 900" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes500</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="0.9"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 1000 radius 1200" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes1000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1.2"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 2000 radius 1600" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes2000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="1.6"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 4000 radius 2100" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes4000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="2.1"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 6000 radius 2400" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes6000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="2.4"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 8000 radius 2700" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes8000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="2.7"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="D Trex 10000 radius 2900" repetitions="5" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>repeat 28799[go]</go>
    <exitCondition>day = 30</exitCondition>
    <metric>ticks</metric>
    <metric>day</metric>
    <metric>total_energy</metric>
    <metric>[flesh-gain] of trexes10000</metric>
    <enumeratedValueSet variable="N-trex4000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex8000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex10000">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-albertosaurus">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-dromaeosaur">
      <value value="55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex2000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex100">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex6000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex500">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-trex1000">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rap_vision">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N-troodon">
      <value value="22"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rex_vision">
      <value value="2.9"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
