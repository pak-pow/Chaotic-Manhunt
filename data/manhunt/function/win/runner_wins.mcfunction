# ====================================================
# CHAOS MANHUNT — win/runner_wins.mcfunction
# Called by the dragon_killed advancement reward.
# Guards that the game is active and killer is Runner.
# Fires the win celebration sequence.
# ====================================================

# Only process if game is active and the killer is on Runner team
execute unless score $game mh.state matches 3 run return 0
execute unless entity @s[team=Runner] run return 0

# Set state to ended first to prevent double-fire
scoreboard players set $game mh.state 5

# ── Win celebration ───────────────────────────────────

playsound minecraft:ui.toast.challenge_complete master @a 0 64 0 1 1.0

title @a times 10 100 30
title @a title {"text":"THE DRAGON IS DEAD","color":"green","bold":true}
title @a subtitle {"text":"The Runner has won.","color":"gray"}

# Fireworks at Runner's location
execute at @a[team=Runner,limit=1] run particle minecraft:firework_rocket ~ ~1 ~ 2 2 2 0.1 100 force
execute at @a[team=Runner,limit=1] run particle minecraft:firework_rocket ~ ~2 ~ 1 1 1 0.2 50 force

# More fireworks spread around
execute as @a[team=Runner,limit=1] at @s run summon minecraft:firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:2,colors:[I;16711680,65280,255],fade_colors:[I;16776960]}],flight_duration:1}}}}

tellraw @a [{"text":"","extra":[{"text":"=== ","color":"dark_gray"},{"text":"RUNNER WINS","color":"green","bold":true},{"text":" ===","color":"dark_gray"}]}]
tellraw @a [{"text":"Runner: ","color":"green"},{"selector":"@a[team=Runner,limit=1]","color":"gold","bold":true},{"text":" slayed the Ender Dragon!","color":"green"}]

# Clear all pending effects
effect clear @a
