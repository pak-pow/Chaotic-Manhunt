# ====================================================
# CHAOS MANHUNT — tracking/show_distance_decoy.mcfunction
# Runs AS a Hunter holding the compass when decoy is active.
# Compares dimensions with the decoy target.
# ====================================================

execute if score @s mh.dimension = $decoy mh.dimension run function manhunt:tracking/calc_distance_decoy
execute unless score @s mh.dimension = $decoy mh.dimension run function manhunt:tracking/show_dim_diff_decoy
