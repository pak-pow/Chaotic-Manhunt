# ====================================================
# CHAOS MANHUNT — events/undead_surge.mcfunction
# 5 zombies spawn around each Hunter (chaos for Hunters).
# Runner gets Speed II for 10s as a free escape window.
# ====================================================

title @a title {"text":"☠ UNDEAD SURGE","color":"dark_green","bold":true}
title @a subtitle {"text":"Zombies flood the Hunters!","color":"gray"}
execute as @a at @s run playsound minecraft:entity.zombie.ambient master @s ~ ~ ~ 1 0.6

# Spawn 5 zombies at each Hunter's location
execute as @a[team=Hunter] at @s run summon minecraft:zombie ~ ~ ~ {PersistenceRequired:1b}
execute as @a[team=Hunter] at @s run summon minecraft:zombie ~1 ~ ~1 {PersistenceRequired:1b}
execute as @a[team=Hunter] at @s run summon minecraft:zombie ~-1 ~ ~-1 {PersistenceRequired:1b}
execute as @a[team=Hunter] at @s run summon minecraft:zombie ~1 ~ ~-1 {PersistenceRequired:1b}
execute as @a[team=Hunter] at @s run summon minecraft:zombie ~-1 ~ ~1 {PersistenceRequired:1b}

# Give Runner a free escape window with Speed II for 10s
effect give @a[team=Runner] minecraft:speed 10 1 true

title @a[team=Runner] actionbar {"text":"⚡ FREE ESCAPE — Speed II for 10s!","color":"green","bold":true}
tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"☠ UNDEAD SURGE — zombies flood every Hunter!","color":"dark_green"}]
