# ====================================================
# CHAOS MANHUNT — powerups/deliver_hunter_powerup.mcfunction
# Called every 2.5 minutes (150 seconds) from timer/do_tick.
# Gives a random powerup to ALL Hunters simultaneously.
# Uses scoreboard players random to pick the type.
# ====================================================

# Pick random powerup type 1–4
execute store result score $powerup mh.poweruptype run random value 1..4

execute if score $powerup mh.poweruptype matches 1 run give @a[team=Hunter] minecraft:carrot_on_a_stick[minecraft:custom_name={"text":"True Sight","color":"white","italic":false},minecraft:custom_data={manhunt_powerup:"true_sight"}]
execute if score $powerup mh.poweruptype matches 2 run give @a[team=Hunter] minecraft:carrot_on_a_stick[minecraft:custom_name={"text":"Tracker Pulse","color":"blue","italic":false},minecraft:custom_data={manhunt_powerup:"tracker_pulse"}]
execute if score $powerup mh.poweruptype matches 3 run give @a[team=Hunter] minecraft:carrot_on_a_stick[minecraft:custom_name={"text":"Bloodlust","color":"dark_red","italic":false},minecraft:custom_data={manhunt_powerup:"bloodlust"}]
execute if score $powerup mh.poweruptype matches 4 run give @a[team=Hunter] minecraft:carrot_on_a_stick[minecraft:custom_name={"text":"Sabotage","color":"gold","italic":false},minecraft:custom_data={manhunt_powerup:"sabotage"}]

title @a[team=Hunter] times 5 40 10
title @a[team=Hunter] title {"text":"⚡ POWER-UP RECEIVED","color":"red","bold":true}
title @a[team=Hunter] subtitle {"text":"A power-up has appeared in your inventory!","color":"gray"}
execute as @a[team=Hunter] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2.0
