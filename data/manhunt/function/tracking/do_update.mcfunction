# ====================================================
# CHAOS MANHUNT — tracking/do_update.mcfunction
# Called on each throttled tracking interval.
# Reads Runner position, detects dimension changes,
# updates all Hunter compasses, and shows health UI.
# ====================================================

# ── Read Runner position into scores ─────────────────
# These scores ($rx/$ry/$rz) are also used by tracker_ping powerup.

execute as @a[team=Runner,limit=1] store result score $rx mh.rx run data get entity @s Pos[0]
execute as @a[team=Runner,limit=1] store result score $ry mh.ry run data get entity @s Pos[1]
execute as @a[team=Runner,limit=1] store result score $rz mh.rz run data get entity @s Pos[2]

# ── Write position to storage for macro compass update ──

execute as @a[team=Runner,limit=1] store result storage manhunt:tracking RunnerX int 1 run data get entity @s Pos[0]
execute as @a[team=Runner,limit=1] store result storage manhunt:tracking RunnerY int 1 run data get entity @s Pos[1]
execute as @a[team=Runner,limit=1] store result storage manhunt:tracking RunnerZ int 1 run data get entity @s Pos[2]

# ── Detect Runner dimension ───────────────────────────
# Snapshot previous dimension before updating.

scoreboard players operation $runner mh.prevdim = $runner mh.dimension

execute in minecraft:overworld as @a[team=Runner,limit=1] run scoreboard players set $runner mh.dimension 0
execute in minecraft:the_nether as @a[team=Runner,limit=1] run scoreboard players set $runner mh.dimension 1
execute in minecraft:the_end    as @a[team=Runner,limit=1] run scoreboard players set $runner mh.dimension 2

# Write dimension string to storage for macro
execute if score $runner mh.dimension matches 0 run data modify storage manhunt:tracking RunnerDim set value "minecraft:overworld"
execute if score $runner mh.dimension matches 1 run data modify storage manhunt:tracking RunnerDim set value "minecraft:the_nether"
execute if score $runner mh.dimension matches 2 run data modify storage manhunt:tracking RunnerDim set value "minecraft:the_end"

# ── Dimension change alerts ───────────────────────────

execute if score $runner mh.dimension matches 1 unless score $runner mh.prevdim matches 1 run function manhunt:tracking/alert_nether
execute if score $runner mh.dimension matches 2 unless score $runner mh.prevdim matches 2 run function manhunt:tracking/alert_end
execute if score $runner mh.dimension matches 0 if score $runner mh.prevdim matches 1 run function manhunt:tracking/alert_overworld
execute if score $runner mh.dimension matches 0 if score $runner mh.prevdim matches 2 run function manhunt:tracking/alert_overworld

# ── Update compass for each Hunter ───────────────────
# If decoy ping is active, point to decoy storage instead.

execute if score $event mh.pulseactive matches 0 if score $decoy mh.decoyactive matches 0 as @a[team=Hunter] run function manhunt:tracking/update_compass with storage manhunt:tracking
execute if score $event mh.pulseactive matches 0 if score $decoy mh.decoyactive matches 1 as @a[team=Hunter] run function manhunt:tracking/update_compass_decoy with storage manhunt:decoy

# ── Health sidebar (only visible to Hunters) ──────────

scoreboard objectives setdisplay sidebar mh.health

# ── Low health warning ────────────────────────────────
# 8 half-hearts = 4 hearts. Flashes warning on Hunter action bars.

execute as @a[team=Runner] if score @s mh.health matches ..8 run title @a[team=Hunter] actionbar {"text":"⚠ THE RUNNER IS BLEEDING","color":"red","bold":true}
