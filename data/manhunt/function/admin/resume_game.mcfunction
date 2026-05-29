# ====================================================
# CHAOS MANHUNT — admin/resume_game.mcfunction
# Called by toggle_pause when game is being UN-paused.
# Separate file because toggle_pause logic needs a clean split.
# ====================================================

scoreboard players set $game mh.state 3
effect clear @a minecraft:slowness
title @a title {"text":"▶ RESUMING...","color":"green","bold":true}
title @a subtitle {"text":"The hunt continues!","color":"gray"}
playsound minecraft:block.note_block.pling master @a 0 64 0 1 1.5
tellraw @a {"text":"[MANHUNT] Game resumed.","color":"green"}
