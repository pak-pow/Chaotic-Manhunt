# ====================================================
# CHAOS MANHUNT — pick_sequence/start.mcfunction
# Entry point: called by /trigger manhunt_random.
# Only runs from idle state (0). Initialises the pick
# sequence and switches state to 1 (picking).
# ====================================================

# Guard: only allow pick from idle state
execute unless score $game mh.state matches 0 run return 0

# Initialise animation counters
scoreboard players set $pick mh.phase 1
scoreboard players set $pick mh.flashcount 0

# Switch to picking state — main loop will now call pick_sequence/animate
scoreboard players set $game mh.state 1

# Schedule phase transitions
# Phase 1 (fast roll) lasts 60 ticks, then slow phase starts
schedule function manhunt:pick_sequence/begin_slowdown 60t

# Phase 2 (slow roll) lasts 40 ticks, then reveal fires at tick 100
schedule function manhunt:pick_sequence/reveal 100t

# Fanfare
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"CHAOS MANHUNT","color":"gold","bold":true},{"text":"]","color":"dark_gray"},{"text":" Rolling for Runner...","color":"yellow"}]
playsound minecraft:block.note_block.pling master @a 0 64 0 1 2.0
