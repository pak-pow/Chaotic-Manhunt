# ====================================================
# CHAOS MANHUNT — tracking/show_dim_diff.mcfunction
# Runs AS a Hunter holding the compass in a different dimension than the real Runner.
# Displays the Runner's current dimension in the actionbar.
# ====================================================

# If Runner is in Overworld
execute if score $runner mh.dimension matches 0 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"Overworld","color":"green","bold":true}]

# If Runner is in Nether
execute if score $runner mh.dimension matches 1 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"The Nether","color":"red","bold":true}]

# If Runner is in End
execute if score $runner mh.dimension matches 2 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"The End","color":"dark_purple","bold":true}]
