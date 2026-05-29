# ====================================================
# CHAOS MANHUNT — win/hunters_win_timeout.mcfunction
# Called when Runner timer hits 0 OR Dread Clock
# reaches 45 minutes. Ominous cave sound + dark red.
# ====================================================

# Guard: only fire once
execute unless score $game mh.state matches 3 run return 0

scoreboard players set $game mh.state 5

# ── Win sequence ──────────────────────────────────────

execute as @a at @s run playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.5
execute as @a at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 1 0.3

title @a times 10 100 30
title @a title {"text":"TIME HAS RUN OUT","color":"dark_red","bold":true}
title @a subtitle {"text":"The Runner was not fast enough.","color":"gray"}

tellraw @a [{"text":"","extra":[{"text":"=== ","color":"dark_gray"},{"text":"HUNTERS WIN","color":"red","bold":true},{"text":" ===","color":"dark_gray"}]}]
tellraw @a [{"text":"The Runner ran out of time.","color":"dark_red"}]

effect clear @a
