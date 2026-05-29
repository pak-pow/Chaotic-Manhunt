# ====================================================
# CHAOS MANHUNT — powerups/deliver_runner_powerup.mcfunction
# Randomly selects and delivers a powerup to the Runner.
# Called every 5 minutes by the main timer loop.
# ====================================================

# Roll a random powerup (1 to 4)
execute store result score $powerup mh.poweruptype run random value 1..4

# 1. Phantom Cloak
execute if score $powerup mh.poweruptype matches 1 run give @a[team=Runner] minecraft:carrot_on_a_stick[minecraft:set_name={"text":"Phantom Cloak","color":"aqua","italic":false},minecraft:custom_data={manhunt_powerup:"phantom_cloak"}]

# 2. Dash
execute if score $powerup mh.poweruptype matches 2 run give @a[team=Runner] minecraft:carrot_on_a_stick[minecraft:set_name={"text":"Dash","color":"yellow","italic":false},minecraft:custom_data={manhunt_powerup:"dash"}]

# 3. Decoy Ping
execute if score $powerup mh.poweruptype matches 3 run give @a[team=Runner] minecraft:carrot_on_a_stick[minecraft:set_name={"text":"Decoy Ping","color":"light_purple","italic":false},minecraft:custom_data={manhunt_powerup:"decoy_ping"}]

# 4. Lifeline
execute if score $powerup mh.poweruptype matches 4 run give @a[team=Runner] minecraft:carrot_on_a_stick[minecraft:set_name={"text":"Lifeline","color":"red","italic":false},minecraft:custom_data={manhunt_powerup:"lifeline"}]

# Fanfare for Runner
title @a[team=Runner] title {"text":"POWERUP RECEIVED","color":"green","bold":true}
execute as @a[team=Runner] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.0

# Alert Hunters
tellraw @a[team=Hunter] [{"text":"[MANHUNT] ","color":"dark_gray"},{"text":"The Runner has received a Powerup...","color":"dark_red","italic":true}]
