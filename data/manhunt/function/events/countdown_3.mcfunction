# ====================================================
# CHAOS MANHUNT — events/countdown_3.mcfunction
# Step 1 of the 3-second event countdown.
# Shows event name + "IN 3..." then schedules step 2.
# ====================================================

execute if score $event mh.eventtype matches 1 run title @a title {"text":"⚠ METEOR STRIKE IN 3...","color":"yellow","bold":true}
execute if score $event mh.eventtype matches 2 run title @a title {"text":"⚠ THUNDER SURGE IN 3...","color":"yellow","bold":true}
execute if score $event mh.eventtype matches 3 run title @a title {"text":"⚠ BLACKOUT IN 3...","color":"yellow","bold":true}
execute if score $event mh.eventtype matches 4 run title @a title {"text":"⚠ UNDEAD SURGE IN 3...","color":"yellow","bold":true}
execute if score $event mh.eventtype matches 5 run title @a title {"text":"⚠ HELLFIRE IN 3...","color":"yellow","bold":true}
execute if score $event mh.eventtype matches 6 run title @a title {"text":"⚠ DIMENSION PULSE IN 3...","color":"yellow","bold":true}

execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.8 1.5

schedule function manhunt:events/countdown_2 20t
