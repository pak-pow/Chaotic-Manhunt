# ====================================================
# CHAOS MANHUNT — powerups/check_use.mcfunction
# Runs every tick while state=3.
# Detects right-click on any Carrot on a Stick via
# the mh.use stat (minecraft.used:minecraft.carrot_on_a_stick).
# Routes to activate, then resets the stat.
# ====================================================

# Any player with mh.use >= 1 just right-clicked a CoaS
execute as @a[scores={mh.use=1..},gamemode=!spectator] run function manhunt:powerups/activate

# Reset stat after processing
scoreboard players set @a mh.use 0
