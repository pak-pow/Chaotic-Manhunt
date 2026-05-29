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

# Store Runner's current coordinates in decoy scoreboards
execute store result score $decoy mh.rx run data get entity @s Pos[0]
execute store result score $decoy mh.ry run data get entity @s Pos[1]
execute store result score $decoy mh.rz run data get entity @s Pos[2]

# Offset X by +500 to create a convincing false trail
scoreboard players add $decoy mh.rx 500

# Store coordinates back to storage for the macro update
execute store result storage manhunt:decoy FakeX int 1 run scoreboard players get $decoy mh.rx
execute store result storage manhunt:decoy FakeY int 1 run scoreboard players get $decoy mh.ry
execute store result storage manhunt:decoy FakeZ int 1 run scoreboard players get $decoy mh.rz

# Store dimension based on current dimension
execute at @s if dimension minecraft:overworld run data modify storage manhunt:decoy FakeDim set value "minecraft:overworld"
execute at @s if dimension minecraft:the_nether run data modify storage manhunt:decoy FakeDim set value "minecraft:the_nether"
execute at @s if dimension minecraft:the_end run data modify storage manhunt:decoy FakeDim set value "minecraft:the_end"

execute at @s if dimension minecraft:overworld run scoreboard players set $decoy mh.dimension 0
execute at @s if dimension minecraft:the_nether run scoreboard players set $decoy mh.dimension 1
execute at @s if dimension minecraft:the_end run scoreboard players set $decoy mh.dimension 2

# Activate decoy
scoreboard players set $decoy mh.decoyactive 1
scoreboard players set $decoy mh.decoyduration 600

# Force compass update immediately to decoy position
execute if score $event mh.pulseactive matches 0 as @a[team=Hunter] if items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/update_compass_decoy_mainhand with storage manhunt:decoy
execute if score $event mh.pulseactive matches 0 as @a[team=Hunter] if items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/update_compass_decoy_offhand with storage manhunt:decoy

title @s times 5 40 10
title @s title {"text":"DECOY PING ACTIVE","color":"light_purple","bold":true}
title @s subtitle {"text":"Compasses now point to a fake location for 30s","color":"gray"}
execute as @s at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.5
execute as @a[team=Hunter] at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.3

tellraw @a[team=Hunter] {"text":"[TRACKER] Signal updated.","color":"red"}
