# ====================================================
# CHAOS MANHUNT — pick_sequence/reveal.mcfunction
# Scheduled 100t after start — stops animation, assigns
# teams, and shows the big gold reveal title.
# ====================================================

# Stop animation — switch state to idle temporarily while we show reveal
scoreboard players set $game mh.state 0

# ── Assign teams ──────────────────────────────────────

# Put EVERYONE into Hunter first
team join Hunter @a

# Pull one random player out to be the Runner
execute as @a[sort=random,limit=1] run team join Runner @s

# ── Reveal title ──────────────────────────────────────

# Show the picked Runner's name in gold to all players
title @a times 10 80 20
title @a title [{"text":""},{"selector":"@a[team=Runner,limit=1]","color":"gold","bold":true}]
title @a subtitle {"text":"IS THE RUNNER","color":"yellow","italic":true}

# Dramatic reveal sound
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.5
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 0.4 0.8

# Wait 2 seconds then show personal role screens
schedule function manhunt:pick_sequence/show_roles 40t
