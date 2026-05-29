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
execute if score @s mh.spectator matches ..0 run title @s actionbar {"text":"Back in the hunt!","color":"green","bold":true}
