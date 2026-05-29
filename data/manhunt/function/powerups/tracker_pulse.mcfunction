# ====================================================
# CHAOS MANHUNT — powerups/tracker_pulse.mcfunction
# HUNTER powerup. Heartbeat sensor — shows Runner's
# exact coordinates in chat every second for 20 seconds.
# Uses mh.pulsecount for countdown and mh.pulsing tag.
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Set pulse state on the activating Hunter
scoreboard players set @s mh.pulsecount 20
tag @s add mh.pulsing

title @s times 5 40 10
title @s title {"text":"TRACKER PULSE","color":"blue","bold":true}
title @s subtitle {"text":"Heartbeat sensor active for 20 seconds","color":"gray"}
playsound minecraft:block.note_block.bass master @s 0 64 0 1 2.0
