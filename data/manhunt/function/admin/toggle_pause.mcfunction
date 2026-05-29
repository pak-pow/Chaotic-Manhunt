# ====================================================
# CHAOS MANHUNT — admin/toggle_pause.mcfunction
# Called when any player fires /trigger manhunt_pause.
# Toggles between active (3) and paused (4) states.
# ====================================================

# Reset temp flag
scoreboard players set $pause mh.tmp 0

# If state is 3, we want to pause. Set temp flag and change state to 4.
execute if score $game mh.state matches 3 run scoreboard players set $pause mh.tmp 1
execute if score $game mh.state matches 3 run scoreboard players set $game mh.state 4

# If state is 4, but we did NOT just set it (meaning $pause mh.tmp is 0), then we want to resume.
execute if score $pause mh.tmp matches 0 if score $game mh.state matches 4 run function manhunt:admin/resume_game

# If we just paused ($pause mh.tmp is 1), apply pause effects
execute if score $pause mh.tmp matches 1 run effect give @a minecraft:slowness 999999 255 true
execute if score $pause mh.tmp matches 1 run title @a title {"text":"⏸ PAUSED","color":"yellow","bold":true}
execute if score $pause mh.tmp matches 1 run title @a subtitle {"text":"Use /trigger manhunt_pause to resume","color":"gray"}
execute if score $pause mh.tmp matches 1 as @a at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score $pause mh.tmp matches 1 run tellraw @a {"text":"[MANHUNT] Game paused.","color":"yellow"}
