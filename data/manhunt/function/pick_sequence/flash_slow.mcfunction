# ====================================================
# CHAOS MANHUNT — pick_sequence/flash_slow.mcfunction
# Phase 2: shows a random player name every 8 ticks.
# Slowing sound pitch mirrors the deceleration.
# ====================================================

scoreboard players add $pick mh.flashcount 1

# Flash on every 8th tick
execute if score $pick mh.flashcount matches 8.. run title @a title [{"text":""},{"selector":"@a[sort=random,limit=1]","color":"gold","bold":true}]
execute if score $pick mh.flashcount matches 8.. as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.6 0.8
execute if score $pick mh.flashcount matches 8.. run scoreboard players set $pick mh.flashcount 0
