# ====================================================
# CHAOS MANHUNT — tracking/calc_distance_decoy.mcfunction
# Calculates distance between Hunter (@s) and Decoy position.
# Displays it in the actionbar.
# ====================================================

# dx = hx - decoy.rx
scoreboard players operation @s mh.dx = @s mh.hx
scoreboard players operation @s mh.dx -= $decoy mh.rx
scoreboard players operation @s mh.dx2 = @s mh.dx
scoreboard players operation @s mh.dx2 *= @s mh.dx

# dy = hy - decoy.ry
scoreboard players operation @s mh.dy = @s mh.hy
scoreboard players operation @s mh.dy -= $decoy mh.ry
scoreboard players operation @s mh.dy2 = @s mh.dy
scoreboard players operation @s mh.dy2 *= @s mh.dy

# dz = hz - decoy.rz
scoreboard players operation @s mh.dz = @s mh.hz
scoreboard players operation @s mh.dz -= $decoy mh.rz
scoreboard players operation @s mh.dz2 = @s mh.dz
scoreboard players operation @s mh.dz2 *= @s mh.dz

# sum
scoreboard players operation @s mh.d2 = @s mh.dx2
scoreboard players operation @s mh.d2 += @s mh.dy2
scoreboard players operation @s mh.d2 += @s mh.dz2

# sqrt
function manhunt:math/sqrt

# Display distance in actionbar (still labeled "Runner Distance" to not give away decoy)
title @s actionbar [{"text":"Runner Distance: ","color":"gold"},{"score":{"name":"@s","objective":"mh.distance"},"color":"green","bold":true},{"text":" blocks","color":"gold"}]
