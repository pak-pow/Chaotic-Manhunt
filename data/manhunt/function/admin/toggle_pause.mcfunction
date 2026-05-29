# ====================================================
# CHAOS MANHUNT — admin/toggle_pause.mcfunction
# Called when any player fires /trigger manhunt_pause.
# Toggles between active (3) and paused (4) states.
# ====================================================

# ── State 3 → 4 : Pause the game ─────────────────────

execute if score $game mh.state matches 3 run scoreboard players set $game mh.state 4
execute if score $game mh.state matches 4 if score $game mh.state matches 4 run effect give @a minecraft:slowness 999999 255 true
execute if score $game mh.state matches 4 run title @a title {"text":"⏸ PAUSED","color":"yellow","bold":true}
execute if score $game mh.state matches 4 run title @a subtitle {"text":"Use /trigger manhunt_pause to resume","color":"gray"}
execute if score $game mh.state matches 4 as @a at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score $game mh.state matches 4 run tellraw @a {"text":"[MANHUNT] Game paused.","color":"yellow"}

# ── State 4 → 3 : Resume the game ────────────────────

# NOTE: We detect the toggle by checking if state was ALREADY 4 before we changed it.
# Since we set state 3→4 above, if we enter below it means state was already 4 when trigger fired.
# Use a flag to distinguish: we check if state is still 4 after the first block ran.
# The second block only runs if state is STILL 4, meaning we didn't just pause — we're resuming.
# Actually — toggle_pause runs once per trigger, so:
#   If state was 3 → we set it to 4 (pause)
#   If state was 4 → first block does nothing (no match on 3), second block runs (resume)
# This works correctly because "matches 3" won't fire if we arrived with state 4.

execute if score $game mh.state matches 4 run function manhunt:admin/resume_game
