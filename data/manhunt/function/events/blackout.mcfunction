# ====================================================
# CHAOS MANHUNT — events/blackout.mcfunction
# 15 seconds of Blindness for ALL players + eerie sound.
# Levels the playing field — nobody can see anything.
# ====================================================

title @a title {"text":"🌑 BLACKOUT","color":"dark_gray","bold":true}
title @a subtitle {"text":"Darkness falls for 15 seconds","color":"gray"}
execute as @a at @s run playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.5

# Blindness for 15 seconds (300 ticks), amplifier 5, hide particles
effect give @a minecraft:blindness 15 5 true

tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"🌑 BLACKOUT — complete darkness for 15 seconds!","color":"dark_gray","bold":true}]
