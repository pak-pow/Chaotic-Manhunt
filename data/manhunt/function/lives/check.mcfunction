# ====================================================
# CHAOS MANHUNT — lives/check.mcfunction
# Runs every tick while state=3.
# Detects Runner death via the mh.deathcount stat and
# routes to on_death for processing.
# ====================================================

# If Runner's deathcount stat has incremented, they died.
# mh.deathcount is a stat objective (minecraft.custom:minecraft.deaths)
# so it auto-increments — we compare against mh.prevdeaths snapshot.

execute as @a[team=Runner] if score @s mh.deathcount > @s mh.prevdeaths run function manhunt:lives/on_death
