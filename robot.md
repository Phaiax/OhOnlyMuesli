
## how the robot works

type wobjdata 

    Beschreibt ein Objekt (trans+rot) relativ zu einem User-Koordinatensystem (z.B. der Tisch) relativ zum Welt-Koordinatensystem

type tooldata

    Tool Center Point (TCP) relativ zum wrist-coordinate-system, masse (falls der roboter etwas trägt sowie schwerpunkt und inertialrotationsachsen)

MoveJ

    Hat optinales argument wobjdata, wenn nicht gegeben, dann angabe in welt koordinaten

