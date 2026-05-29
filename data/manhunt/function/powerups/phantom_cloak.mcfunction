# ====================================================
# CHAOS MANHUNT — powerups/phantom_cloak.mcfunction
# RUNNER powerup. Grants 20 seconds of Invisibility.
# Consumes the item from mainhand.
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Apply invisibility (20s = 400 ticks, amplifier 0, hide particles)
effect give @s minecraft:invisibility 20 0 true

title @s times 5 40 10
title @s title {"text":"PHANTOM CLOAK","color":"aqua","bold":true}
title @s subtitle {"text":"Invisible for 20 seconds","color":"gray"}
execute as @s at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.8
