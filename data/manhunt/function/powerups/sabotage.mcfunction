# ====================================================
# CHAOS MANHUNT — powerups/sabotage.mcfunction
# HUNTER powerup. Runner screen flashes red and they
# receive Slowness II for 10 seconds.
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Apply Slowness II (amplifier 1) to Runner for 10 seconds
effect give @a[team=Runner] minecraft:slowness 10 1 true

# Flash Runner's screen red
title @a[team=Runner] times 3 20 5
title @a[team=Runner] title {"text":"⚡ SABOTAGED","color":"red","bold":true}
title @a[team=Runner] subtitle {"text":"Slowness II for 10 seconds!","color":"gray"}
execute as @a[team=Runner] at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 1.0

# Announce to Hunters
title @a[team=Hunter] actionbar {"text":"⚡ Sabotage deployed!","color":"gold","bold":true}
execute as @s at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
