# ====================================================
# CHAOS MANHUNT — setup/headstart_end.mcfunction
# Called when headstart timer expires OR via
# /trigger manhunt_start (manual override).
# Clears Hunter effects and transitions to active game.
# ====================================================

# Guard: only run from headstart or idle states
execute unless score $game mh.state matches 2 unless score $game mh.state matches 0 run return 0

# ── Remove freeze effects ─────────────────────────────

effect clear @a[team=Hunter] minecraft:mining_fatigue
effect clear @a[team=Hunter] minecraft:slowness
effect clear @a[team=Hunter] minecraft:blindness

# ── Initialise event engine ───────────────────────────

scoreboard players set $event mh.eventtimer 0
execute store result score $event mh.threshold run random value 9600..14400
scoreboard players set $event mh.pulseactive 0

# ── Initialise timer and dread clock ─────────────────

scoreboard players set $timer mh.timertick 0
scoreboard players set $game mh.realtime 0

# Reset dread clock milestone flags
scoreboard players set $dread mh.m15 0
scoreboard players set $dread mh.m25 0
scoreboard players set $dread mh.m35 0
scoreboard players set $dread mh.m40 0

# ── Initialise Hunter powerup delivery ───────────────

scoreboard players set $powerup mh.deliverytick 0

# ── Transition to active game ─────────────────────────

scoreboard players set $game mh.state 3

# Big announcement
title @a times 5 60 20
title @a title {"text":"THE HUNT BEGINS","color":"red","bold":true}
title @a subtitle {"text":"May chaos ensue.","color":"gray"}
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 1.0
tellraw @a [{"text":"[MANHUNT] ","color":"dark_gray"},{"text":"The hunt has begun! ","color":"red","bold":true},{"text":"Runner has 45 minutes. Good luck.","color":"yellow"}]

# Show health on sidebar for Hunters
scoreboard objectives setdisplay sidebar mh.health
