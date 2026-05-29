# ====================================================
# CHAOS MANHUNT — events/thunder_surge.mcfunction
# Lightning bolts strike 3 random players (Hunter or Runner).
# Nobody is safe — chaos event.
# ====================================================

title @a title {"text":"⚡ THUNDER SURGE","color":"yellow","bold":true}
playsound minecraft:entity.lightning_bolt.thunder master @a 0 64 0 1 0.7

# Strike 3 random players with lightning
execute as @a[sort=random,limit=1] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @a[sort=random,limit=1] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @a[sort=random,limit=1] at @s run summon minecraft:lightning_bolt ~ ~ ~

tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"⚡ THUNDER SURGE — lightning strikes 3 random players!","color":"yellow"}]
