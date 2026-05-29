# ====================================================
# CHAOS MANHUNT — admin/triggers.mcfunction
# Runs every tick (called from loop/main).
# Sets up trigger objectives and routes host commands.
# ====================================================

# ── Enable triggers for all online players ────────────
# (Must be re-enabled after each use — triggers auto-disable on fire)

scoreboard players enable @a manhunt_random
scoreboard players enable @a manhunt_start
scoreboard players enable @a manhunt_skip
scoreboard players enable @a manhunt_pause
scoreboard players enable @a manhunt_reset

# ── Route trigger fires ───────────────────────────────

# /trigger manhunt_random — start the Runner pick sequence
execute as @a[scores={manhunt_random=1..}] run function manhunt:pick_sequence/start

# /trigger manhunt_start — manually kick off headstart (skip pick sequence)
execute as @a[scores={manhunt_start=1..}] run function manhunt:setup/headstart_end

# /trigger manhunt_skip — skip the current random event early
execute as @a[scores={manhunt_skip=1..}] run function manhunt:admin/skip_event

# /trigger manhunt_pause — toggle pause on/off
execute as @a[scores={manhunt_pause=1..}] run function manhunt:admin/toggle_pause

# /trigger manhunt_reset — reset the game state
execute as @a[scores={manhunt_reset=1..}] run function manhunt:admin/reset

# ── Reset trigger scores to 0 ─────────────────────────

scoreboard players set @a manhunt_random 0
scoreboard players set @a manhunt_start 0
scoreboard players set @a manhunt_skip 0
scoreboard players set @a manhunt_pause 0
scoreboard players set @a manhunt_reset 0

# ── Create trigger objectives on first load ───────────
# (safe to run every tick — silently fails if already exists in older packs,
#  but in 1.21 /scoreboard silently skips duplicates)

scoreboard objectives add manhunt_random trigger "Start Manhunt"
scoreboard objectives add manhunt_start trigger "Force Start"
scoreboard objectives add manhunt_skip trigger "Skip Event"
scoreboard objectives add manhunt_pause trigger "Pause Game"
scoreboard objectives add manhunt_reset trigger "Reset Game"
