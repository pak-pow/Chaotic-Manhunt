# ====================================================
# CHAOS MANHUNT — win/hunters_win_death.mcfunction
# Called when Runner dies with mh.lives = 1 (last life).
# Wither spawn audio + red title + lightning at Runner.
# ====================================================

# Guard: only fire once
execute unless score $game mh.state matches 3 run return 0

scoreboard players set $game mh.state 5

# ── Win sequence ──────────────────────────────────────

execute as @a at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 1.0

title @a times 10 100 30
title @a title {"text":"THE HUNT IS OVER","color":"dark_red","bold":true}
title @a subtitle {"text":"The Runner has fallen.","color":"gray"}

# Lightning at Runner's last location (they may have respawned — use current pos)
execute at @a[team=Runner,limit=1] run summon minecraft:lightning_bolt ~ ~ ~
execute at @a[team=Runner,limit=1] run summon minecraft:lightning_bolt ~2 ~ ~2

tellraw @a [{"text":"","extra":[{"text":"=== ","color":"dark_gray"},{"text":"HUNTERS WIN","color":"red","bold":true},{"text":" ===","color":"dark_gray"}]}]
tellraw @a [{"text":"The Hunters eliminated ","color":"red"},{"selector":"@a[team=Runner,limit=1]","color":"gold","bold":true},{"text":"!","color":"red"}]

effect clear @a
