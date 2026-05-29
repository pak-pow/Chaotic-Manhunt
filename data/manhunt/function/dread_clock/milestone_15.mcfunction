# ====================================================
# CHAOS MANHUNT — dread_clock/milestone_15.mcfunction
# Fires at exactly 15 minutes of real game time.
# Hunters permanently get Speed I for the rest of the game.
# ====================================================

effect give @a[team=Hunter] minecraft:speed 999999 0 true

title @a times 5 60 20
title @a title {"text":"HUNTERS EMPOWERED","color":"red","bold":true}
title @a subtitle {"text":"Hunters gain permanent Speed I","color":"gray"}
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.7 0.7
tellraw @a [{"text":"[DREAD CLOCK] ","color":"dark_red","bold":true},{"text":"15 minutes — Hunters gain Speed I permanently!","color":"red"}]
