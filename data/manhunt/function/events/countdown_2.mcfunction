# ====================================================
# CHAOS MANHUNT — events/countdown_2.mcfunction
# Step 2 of the 3-second event countdown.
# ====================================================

# Guard: abort if game is no longer active (paused/ended)
execute unless score $game mh.state matches 3 run return 0

execute if score $event mh.eventtype matches 1 run title @a title {"text":"⚠ METEOR STRIKE IN 2...","color":"gold","bold":true}
execute if score $event mh.eventtype matches 2 run title @a title {"text":"⚠ THUNDER SURGE IN 2...","color":"gold","bold":true}
execute if score $event mh.eventtype matches 3 run title @a title {"text":"⚠ BLACKOUT IN 2...","color":"gold","bold":true}
execute if score $event mh.eventtype matches 4 run title @a title {"text":"⚠ UNDEAD SURGE IN 2...","color":"gold","bold":true}
execute if score $event mh.eventtype matches 5 run title @a title {"text":"⚠ HELLFIRE IN 2...","color":"gold","bold":true}
execute if score $event mh.eventtype matches 6 run title @a title {"text":"⚠ DIMENSION PULSE IN 2...","color":"gold","bold":true}

playsound minecraft:block.note_block.hat master @a 0 64 0 0.8 1.2

schedule function manhunt:events/countdown_1 20t
