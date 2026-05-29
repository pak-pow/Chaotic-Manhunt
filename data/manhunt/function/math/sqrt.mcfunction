# ====================================================
# CHAOS MANHUNT — math/sqrt.mcfunction
# Calculates floor(sqrt(mh.d2)) for @s and stores it in mh.distance.
# Uses Babylonian method (Newton's method) for integer square root.
# ====================================================

# Handle 0 case
execute if score @s mh.d2 matches 0 run scoreboard players set @s mh.distance 0
execute if score @s mh.d2 matches 0 run return 1

# Set initial guess based on value of d2
scoreboard players set $x mh.tmp 1000
execute if score @s mh.d2 matches ..1000000 run scoreboard players set $x mh.tmp 300
execute if score @s mh.d2 matches ..10000 run scoreboard players set $x mh.tmp 30
execute if score @s mh.d2 matches ..100 run scoreboard players set $x mh.tmp 5

# Iteration 1: x = (x + S/x)/2
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Iteration 2
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Iteration 3
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Iteration 4
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Iteration 5
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Iteration 6
scoreboard players operation $val mh.tmp = @s mh.d2
scoreboard players operation $val mh.tmp /= $x mh.tmp
scoreboard players operation $x mh.tmp += $val mh.tmp
scoreboard players operation $x mh.tmp /= $c2 mh.const

# Store result in distance
scoreboard players operation @s mh.distance = $x mh.tmp
