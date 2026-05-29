# ====================================================
# CHAOS MANHUNT — events/countdown_fire.mcfunction
# Fires the actual event after the 3-second countdown.
# ====================================================

execute unless score $game mh.state matches 3 run return 0

execute if score $event mh.eventtype matches 1 run function manhunt:events/meteor_strike
execute if score $event mh.eventtype matches 2 run function manhunt:events/thunder_surge
execute if score $event mh.eventtype matches 3 run function manhunt:events/blackout
execute if score $event mh.eventtype matches 4 run function manhunt:events/undead_surge
execute if score $event mh.eventtype matches 5 run function manhunt:events/hellfire
execute if score $event mh.eventtype matches 6 run function manhunt:events/dimension_pulse
