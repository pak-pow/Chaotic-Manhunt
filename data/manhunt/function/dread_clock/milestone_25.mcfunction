# ====================================================
# CHAOS MANHUNT — dread_clock/milestone_25.mcfunction
# Fires at exactly 25 minutes of real game time.
# Tracking interval switches from 60 ticks → 20 ticks
# (3s updates → 1s updates). Compasses become real-time.
# ====================================================

scoreboard players set $tracking mh.interval 20

title @a times 5 60 20
title @a title {"text":"COMPASS LOCKED ON","color":"dark_red","bold":true}
title @a subtitle {"text":"Tracking updates every second — nowhere to hide","color":"gray"}
execute as @a at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.5
execute as @a at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 0.8 1.5
tellraw @a [{"text":"[DREAD CLOCK] ","color":"dark_red","bold":true},{"text":"25 minutes — Compass now updates every second!","color":"red"}]
