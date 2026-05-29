# ====================================================
# CHAOS MANHUNT — events/engine.mcfunction
# Runs every tick while state=3.
# Random event timer: fires an event every 8–12 minutes
# (9600–14400 ticks). When threshold is reached, picks
# a random event (1–6) and starts the 3-second countdown.
# ====================================================

# Increment event timer each tick
scoreboard players add $event mh.eventtimer 1

# Check if timer has reached the threshold
execute if score $event mh.eventtimer >= $event mh.threshold run function manhunt:events/pick_and_start
