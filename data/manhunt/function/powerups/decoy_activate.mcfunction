# ====================================================
# CHAOS MANHUNT — powerups/decoy_activate.mcfunction
# Stores fake coordinates in storage manhunt:decoy and
# activates the decoy flag so tracking uses fake coords.
# Fake location: Runner's current position + 500 block offset
# (we use a fixed world-spawn area as the fake ping to
# keep it believable but wrong).
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Store a convincing fake location in storage
# Use Runner's current Y but offset X/Z significantly
execute store result storage manhunt:decoy FakeX int 1 run data get entity @s Pos[0]
execute store result storage manhunt:decoy FakeY int 1 run data get entity @s Pos[1]
execute store result storage manhunt:decoy FakeZ int 1 run data get entity @s Pos[2]

# Offset X by +500 to create a convincing false trail
data modify storage manhunt:decoy FakeX set value 500
data modify storage manhunt:decoy FakeDim set value "minecraft:overworld"

# Activate decoy
scoreboard players set $decoy mh.decoyactive 1
scoreboard players set $decoy mh.decoyduration 600

title @s times 5 40 10
title @s title {"text":"DECOY PING ACTIVE","color":"light_purple","bold":true}
title @s subtitle {"text":"Compasses now point to a fake location for 30s","color":"gray"}
execute as @s at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.5
execute as @a[team=Hunter] at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.3

tellraw @a[team=Hunter] {"text":"[TRACKER] Signal updated.","color":"red"}
