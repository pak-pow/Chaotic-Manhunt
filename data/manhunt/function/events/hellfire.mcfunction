# ====================================================
# CHAOS MANHUNT — events/hellfire.mcfunction
# All players take 2 hearts of damage and are set on fire.
# True chaos — affects everyone equally.
# ====================================================

title @a title {"text":"🔥 HELLFIRE","color":"dark_red","bold":true}
title @a subtitle {"text":"The world burns","color":"gray"}
playsound minecraft:entity.blaze.shoot master @a 0 64 0 1 0.5

# Set everyone on fire for 4 seconds (80 ticks)
execute as @a run data merge entity @s {Fire:80}

# Deal 4 damage (2 hearts) to all players
execute as @a run damage @s 4 minecraft:generic

tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"🔥 HELLFIRE — everyone takes 2 hearts of damage and burns!","color":"dark_red"}]
