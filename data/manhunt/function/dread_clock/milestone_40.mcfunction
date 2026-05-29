# ====================================================
# CHAOS MANHUNT — dread_clock/milestone_40.mcfunction
# Fires at exactly 40 minutes of real game time.
# Runner gets permanent Glowing — visible through walls.
# ====================================================

effect give @a[team=Runner] minecraft:glowing 999999 0 true

title @a times 5 60 20
title @a title {"text":"NOWHERE TO HIDE","color":"dark_red","bold":true}
title @a subtitle {"text":"Runner is now permanently glowing","color":"gray"}
execute as @a at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 1 0.3
execute as @a at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 0.8 0.8
tellraw @a [{"text":"[DREAD CLOCK] ","color":"dark_red","bold":true},{"text":"40 minutes — Runner is permanently glowing through walls!","color":"dark_red","bold":true}]
