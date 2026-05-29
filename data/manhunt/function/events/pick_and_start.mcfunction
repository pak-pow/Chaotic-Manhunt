# ====================================================
# CHAOS MANHUNT — events/pick_and_start.mcfunction
# Called when event timer hits threshold.
# Resets timer, picks random event type, starts countdown.
# ====================================================

# Reset timer and pick new random threshold (8–12 min)
scoreboard players set $event mh.eventtimer 0
scoreboard players random $event mh.threshold 9600 14400

# Pick a random event type 1–6
scoreboard players random $event mh.eventtype 1 6

# Start the 3-second warning countdown
function manhunt:events/countdown_3
