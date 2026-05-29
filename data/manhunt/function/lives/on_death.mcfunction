# ====================================================
# CHAOS MANHUNT — lives/on_death.mcfunction
# Runs AS the Runner who just died.
# Branches on remaining lives to either lose_life_1
# (still has lives) or trigger Hunters win (out of lives).
# ====================================================

# Snapshot deathcount immediately to prevent re-firing next tick
scoreboard players operation @s mh.prevdeaths = @s mh.deathcount

# Branch based on current lives remaining
execute if score @s mh.lives matches 1 run function manhunt:win/hunters_win_death
execute if score @s mh.lives matches 2 run function manhunt:lives/lose_life_1
