# ====================================================
# CHAOS MANHUNT — tracking/show_distance.mcfunction
# Runs AS a Hunter holding the compass.
# Reads their current position and forwards based on decoy/pulse status.
# ====================================================

# If dimension pulse is active, show SIGNAL LOST
execute if score $event mh.pulseactive matches 1 run title @s actionbar {"text":"◇ SIGNAL LOST","color":"gray","bold":true}
execute if score $event mh.pulseactive matches 1 run return 1

# Read Hunter position
execute store result score @s mh.hx run data get entity @s Pos[0]
execute store result score @s mh.hy run data get entity @s Pos[1]
execute store result score @s mh.hz run data get entity @s Pos[2]

# Forward to appropriate distance calculation
execute if score $decoy mh.decoyactive matches 1 run function manhunt:tracking/show_distance_decoy
execute if score $decoy mh.decoyactive matches 0 run function manhunt:tracking/show_distance_real
