# ====================================================
# CHAOS MANHUNT — events/hellfire.mcfunction
# All players take 2 hearts of damage and are set on fire.
# True chaos — affects everyone equally.
# ====================================================

title @a title {"text":"🔥 HELLFIRE","color":"dark_red","bold":true}
title @a subtitle {"text":"The world burns","color":"gray"}
execute as @a at @s run playsound minecraft:entity.blaze.shoot master @s ~ ~ ~ 1 0.5

# Set everyone on fire safely by temporarily placing a fire block at their feet
execute as @a at @s run setblock ~ ~ ~ minecraft:fire keep
execute as @a at @s run setblock ~ ~ ~ minecraft:air replace minecraft:fire

# Deal 4 damage (2 hearts) to all players as fire damage
execute as @a run damage @s 4 minecraft:on_fire

tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"🔥 HELLFIRE — everyone takes 2 hearts of damage and burns!","color":"dark_red"}]
