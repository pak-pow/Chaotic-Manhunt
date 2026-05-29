# ====================================================
# CHAOS MANHUNT — timer/tick.mcfunction
# Runs every tick while state=3.
# Uses an internal counter to fire do_tick every 20 ticks
# (1 real second). Also drives Hunter powerup delivery.
# ====================================================

scoreboard players add $timer mh.timertick 1

execute if score $timer mh.timertick matches 20.. run function manhunt:timer/do_tick
execute if score $timer mh.timertick matches 20.. run scoreboard players set $timer mh.timertick 0
