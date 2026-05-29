# ====================================================
# CHAOS MANHUNT — powerups/bloodlust.mcfunction
# HUNTER powerup. ALL Hunters get Strength VI for 10s.
# One-shot window — coordinate with your team!
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Strength VI (amplifier 5) for all Hunters for 10 seconds
effect give @a[team=Hunter] minecraft:strength 10 5 true

title @a[team=Hunter] times 5 40 10
title @a[team=Hunter] title {"text":"BLOODLUST","color":"dark_red","bold":true}
title @a[team=Hunter] subtitle {"text":"All Hunters: Strength VI for 10 seconds!","color":"gray"}
execute as @a[team=Hunter] at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.7 1.0

title @a[team=Runner] actionbar {"text":"⚠ BLOODLUST — Hunters empowered! RUN!","color":"dark_red","bold":true}
execute as @a[team=Runner] at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 1 0.3
