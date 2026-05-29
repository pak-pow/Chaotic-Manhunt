# ====================================================
# CHAOS MANHUNT — tracking/calc_distance_real.mcfunction
# Calculates distance between Hunter (@s) and real Runner.
# Displays it in the actionbar.
# ====================================================

# dx = hx - rx
scoreboard players operation @s mh.dx = @s mh.hx
scoreboard players operation @s mh.dx -= $runner mh.rx
scoreboard players operation @s mh.dx2 = @s mh.dx
scoreboard players operation @s mh.dx2 *= @s mh.dx

# dy = hy - ry
scoreboard players operation @s mh.dy = @s mh.hy
scoreboard players operation @s mh.dy -= $runner mh.ry
scoreboard players operation @s mh.dy2 = @s mh.dy
scoreboard players operation @s mh.dy2 *= @s mh.dy

# dz = hz - rz
scoreboard players operation @s mh.dz = @s mh.hz
scoreboard players operation @s mh.dz -= $runner mh.rz
scoreboard players operation @s mh.dz2 = @s mh.dz
scoreboard players operation @s mh.dz2 *= @s mh.dz

# sum
scoreboard players operation @s mh.d2 = @s mh.dx2
scoreboard players operation @s mh.d2 += @s mh.dy2
scoreboard players operation @s mh.d2 += @s mh.dz2

# sqrt
function manhunt:math/sqrt

# Display distance in actionbar
title @s actionbar [{"text":"Runner Distance: ","color":"gold"},{"score":{"name":"@s","objective":"mh.distance"},"color":"green","bold":true},{"text":" blocks","color":"gold"}]
