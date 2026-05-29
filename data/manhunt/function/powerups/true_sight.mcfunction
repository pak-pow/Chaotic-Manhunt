# ====================================================
# CHAOS MANHUNT — powerups/true_sight.mcfunction
# HUNTER powerup. Runner gets Glowing for 60 seconds —
# visible through walls as a bright silhouette.
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Apply Glowing to the Runner (60s, amplifier 0)
effect give @a[team=Runner] minecraft:glowing 60 0 true

title @a[team=Hunter] times 5 40 10
title @a[team=Hunter] title {"text":"TRUE SIGHT","color":"white","bold":true}
title @a[team=Hunter] subtitle {"text":"Runner is visible through walls for 60s!","color":"gray"}
execute as @a[team=Hunter] at @s run playsound minecraft:entity.evoker.cast_spell master @s ~ ~ ~ 1 1.5

title @a[team=Runner] actionbar {"text":"⚠ TRUE SIGHT — You are glowing! Hide!","color":"red","bold":true}
execute as @a[team=Runner] at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 0.7 0.5
