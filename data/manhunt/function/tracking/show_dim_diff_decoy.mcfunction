# ====================================================
# CHAOS MANHUNT — tracking/show_dim_diff_decoy.mcfunction
# Runs AS a Hunter holding the compass in a different dimension than the Decoy.
# Displays the decoy's current dimension in the actionbar.
# ====================================================

# If decoy is in Overworld
execute if score $decoy mh.dimension matches 0 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"Overworld","color":"green","bold":true}]

# If decoy is in Nether
execute if score $decoy mh.dimension matches 1 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"The Nether","color":"red","bold":true}]

# If decoy is in End
execute if score $decoy mh.dimension matches 2 run title @s actionbar [{"text":"Runner is in: ","color":"gold"},{"text":"The End","color":"dark_purple","bold":true}]
