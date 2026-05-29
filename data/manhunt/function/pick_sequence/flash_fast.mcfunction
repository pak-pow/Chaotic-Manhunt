# ====================================================
# CHAOS MANHUNT — pick_sequence/flash_fast.mcfunction
# Phase 1: shows a random player name every 2 ticks.
# ====================================================

scoreboard players add $pick mh.flashcount 1

# Flash on every 2nd tick
execute if score $pick mh.flashcount matches 2.. run title @a title [{"text":""},{"selector":"@a[sort=random,limit=1]","color":"yellow","bold":true}]
execute if score $pick mh.flashcount matches 2.. run playsound minecraft:block.note_block.hat master @a 0 64 0 0.4 2.0
execute if score $pick mh.flashcount matches 2.. run scoreboard players set $pick mh.flashcount 0
