# ====================================================
# CHAOS MANHUNT — pick_sequence/assign.mcfunction
# Scheduled 60t after show_roles.
# Gives Hunters their tracking compasses, sets Runner
# lives + timer, and kicks off the 60s head start.
# ====================================================

# ── Give tracking compasses to all Hunters ────────────
# Placed in the offhand slot; tracking/do_update refreshes the NBT each cycle.
execute as @a[team=Hunter] run item replace entity @s weapon.offhand with minecraft:compass[minecraft:custom_name='{"text":"▶ TRACKING RUNNER","color":"red","bold":true}',minecraft:lodestone_tracker={tracked:false,pos:{X:0,Y:64,Z:0},dimension:"minecraft:overworld"}]

# ── Initialise Runner stats ───────────────────────────

scoreboard players set @a[team=Runner] mh.lives 2
scoreboard players set $runner mh.timer 54000
scoreboard players set $game mh.realtime 0

# ── Initialise tracking state ─────────────────────────

scoreboard players set $tracking mh.interval 60
scoreboard players set $tracking mh.tracktick 0
scoreboard players set $runner mh.dimension 0
scoreboard players set $runner mh.prevdim 0

# Snapshot current deathcounts so we don't get false positives on first tick
execute as @a run scoreboard players operation @s mh.prevdeaths = @s mh.deathcount

# ── Initialise headstart ──────────────────────────────

scoreboard players set $headstart mh.headtick 1200

# Switch to headstart state — setup/headstart.mcfunction takes over
scoreboard players set $game mh.state 2

# Announce head start
title @a times 5 40 10
title @a title {"text":"HEAD START: 60 SECONDS","color":"aqua","bold":true}
title @a subtitle {"text":"Hunters are frozen. Runners — RUN!","color":"gray"}
playsound minecraft:block.note_block.pling master @a 0 64 0 1 2.0
tellraw @a {"text":"[MANHUNT] 60 second head start! Hunters cannot move.","color":"aqua","bold":true}
