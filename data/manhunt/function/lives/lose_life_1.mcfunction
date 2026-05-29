# ====================================================
# CHAOS MANHUNT — lives/lose_life_1.mcfunction
# Runs AS the Runner after their FIRST death.
# Reduces lives to 1, broadcasts last-life warning,
# and grants brief immunity on respawn.
# ====================================================

# Reduce Runner lives to 1
scoreboard players remove @s mh.lives 1

# ── Broadcast last-life warning to ALL players ────────

title @a times 5 70 20
title @a title {"text":"THE RUNNER IS ON THEIR LAST LIFE","color":"dark_red","bold":true}
title @a subtitle {"text":"One more kill ends the hunt.","color":"gray"}

weather thunder
playsound minecraft:entity.wither.spawn master @a 0 64 0 1 1.0

tellraw @a [{"text":"[MANHUNT] ","color":"dark_gray"},{"text":"⚠ THE RUNNER IS ON THEIR LAST LIFE!","color":"dark_red","bold":true}]

# ── Immunity on respawn ───────────────────────────────
# Give 5 seconds (100 ticks) of resistance + brief blindness
# to prevent spawn-killing on respawn.
# These are applied now; they'll be active when they respawn.

effect give @a[team=Runner] minecraft:resistance 5 255 true
effect give @a[team=Runner] minecraft:blindness 3 0 true
