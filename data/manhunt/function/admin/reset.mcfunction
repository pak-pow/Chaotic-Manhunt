# ====================================================
# CHAOS MANHUNT — admin/reset.mcfunction
# Hard resets the game state, clears teams, and removes items.
# ====================================================

tellraw @a {"text":"[MANHUNT] Game resetting...","color":"red"}

# Reset game state to idle
scoreboard players set $game mh.state 0

# Remove all players from teams
team leave @a

# Clear any ongoing effects
effect clear @a

# Remove custom tracking compasses
clear @a minecraft:compass[minecraft:lodestone_tracker]

# Remove any unused powerups
clear @a minecraft:carrot_on_a_stick[minecraft:custom_data]

# Clear tags
tag @a remove mh.justdied

# Clear actionbar displays
title @a actionbar ""

# Hide the health display on the sidebar
scoreboard objectives setdisplay sidebar

tellraw @a {"text":"[MANHUNT] Reset complete. Use /trigger manhunt_random to play again.","color":"green"}
