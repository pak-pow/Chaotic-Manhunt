# ====================================================
# CHAOS MANHUNT — admin/skip_event.mcfunction
# Called by /trigger manhunt_skip.
# Cancels any active event countdown or ongoing effect.
# ====================================================

# Only valid during active game
execute unless score $game mh.state matches 3 run return 0

# Clear dimension pulse if active
scoreboard players set $event mh.pulseactive 0

# Reset event timer and pick a fresh threshold
scoreboard players set $event mh.eventtimer 0
execute store result score $event mh.threshold run random value 9600..14400

title @a actionbar {"text":"⏭ Event skipped by host","color":"yellow"}
tellraw @a {"text":"[MANHUNT] Current event skipped.","color":"yellow"}
