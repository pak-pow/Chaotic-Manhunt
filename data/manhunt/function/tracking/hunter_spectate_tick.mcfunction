# ====================================================
# CHAOS MANHUNT — tracking/hunter_spectate_tick.mcfunction
# Runs AS each Hunter with mh.spectator > 0 (every tick).
# Applies immobilising effects during penalty window.
# When penalty expires: switches back to survival and
# teleports them to the nearest living Hunter.
# ====================================================

# Decrement penalty timer
scoreboard players remove @s mh.spectator 1

# Keep Hunter in spectator (unable to interact) during penalty
gamemode spectator @s

# Show countdown on action bar
execute store result score $penaltydisplay mh.tmp run scoreboard players get @s mh.spectator
scoreboard players operation $penaltydisplay mh.tmp /= $c20 mh.const
title @s actionbar [{"text":"Respawning in ","color":"red"},{"score":{"name":"$penaltydisplay","objective":"mh.tmp"},"color":"yellow"},{"text":"s...","color":"red"}]

# When penalty reaches 0: restore and teleport
execute if score @s mh.spectator matches ..0 run gamemode survival @s
execute if score @s mh.spectator matches ..0 run function manhunt:tracking/tp_to_nearest_hunter
execute if score @s mh.spectator matches ..0 unless items entity @s contents minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run give @s minecraft:compass[minecraft:custom_name={"text":"▶ TRACKING RUNNER","color":"red","bold":true},minecraft:custom_data={manhunt_tracker:1b},minecraft:lodestone_tracker={target:{pos:[I;0,64,0],dimension:"minecraft:overworld"},tracked:false}]
execute if score @s mh.spectator matches ..0 run title @s actionbar {"text":"Back in the hunt!","color":"green","bold":true}
