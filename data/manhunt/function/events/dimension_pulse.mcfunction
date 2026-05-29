# ====================================================
# CHAOS MANHUNT — events/dimension_pulse.mcfunction
# Disables all Hunter compasses for 30 seconds (600 ticks).
# The tracking/do_update function checks mh.pulseactive
# and points compasses to the decoy location instead.
# Also affects the Decoy Ping powerup (prevents stacking).
# ====================================================

title @a title {"text":"🌀 DIMENSION PULSE","color":"blue","bold":true}
title @a subtitle {"text":"Hunter compasses are scrambled for 30 seconds!","color":"gray"}
execute as @a at @s run playsound minecraft:block.portal.travel master @s ~ ~ ~ 0.5 0.7

# Activate the pulse flag — tracking/do_update reads this
scoreboard players set $event mh.pulseactive 1

# Point Hunter compasses to a scrambled location (world spawn area)
execute as @a[team=Hunter] if items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/scramble_compass_mainhand
execute as @a[team=Hunter] if items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/scramble_compass_offhand

title @a[team=Hunter] actionbar {"text":"◈ SIGNAL LOST — compass scrambled","color":"dark_gray","bold":true}
tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"🌀 DIMENSION PULSE — Hunter compasses are scrambled for 30 seconds!","color":"blue"}]

# Schedule end of pulse after 600 ticks (30s)
schedule function manhunt:events/dimension_pulse_end 600t
