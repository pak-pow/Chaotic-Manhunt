# ====================================================
# CHAOS MANHUNT — tracking/show_distance_real.mcfunction
# Runs AS a Hunter holding the compass.
# Compares dimensions with the real Runner.
# ====================================================

execute if score @s mh.dimension = $runner mh.dimension run function manhunt:tracking/calc_distance_real
execute unless score @s mh.dimension = $runner mh.dimension run function manhunt:tracking/show_dim_diff
