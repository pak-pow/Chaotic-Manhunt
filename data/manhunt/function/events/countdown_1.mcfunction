# ====================================================
# CHAOS MANHUNT — events/countdown_1.mcfunction
# Step 3 of the 3-second event countdown.
# ====================================================

execute unless score $game mh.state matches 3 run return 0

execute if score $event mh.eventtype matches 1 run title @a title {"text":"⚠ METEOR STRIKE IN 1...","color":"red","bold":true}
execute if score $event mh.eventtype matches 2 run title @a title {"text":"⚠ THUNDER SURGE IN 1...","color":"red","bold":true}
execute if score $event mh.eventtype matches 3 run title @a title {"text":"⚠ BLACKOUT IN 1...","color":"red","bold":true}
execute if score $event mh.eventtype matches 4 run title @a title {"text":"⚠ UNDEAD SURGE IN 1...","color":"red","bold":true}
execute if score $event mh.eventtype matches 5 run title @a title {"text":"⚠ HELLFIRE IN 1...","color":"red","bold":true}
execute if score $event mh.eventtype matches 6 run title @a title {"text":"⚠ DIMENSION PULSE IN 1...","color":"red","bold":true}

execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1.0 1.0

schedule function manhunt:events/countdown_fire 20t
