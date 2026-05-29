# ====================================================
# CHAOS MANHUNT — powerups/dash.mcfunction
# RUNNER powerup. Speed III for 8 seconds.
# Consumes the item from mainhand.
# ====================================================

# Consume the powerup
item replace entity @s weapon.mainhand with minecraft:air

# Speed III (amplifier 2) for 8 seconds (160 ticks)
effect give @s minecraft:speed 8 2 true

title @s times 5 30 5
title @s title {"text":"DASH","color":"yellow","bold":true}
title @s subtitle {"text":"Speed III for 8 seconds","color":"gray"}
playsound minecraft:entity.player.levelup master @s 0 64 0 1 2.0
