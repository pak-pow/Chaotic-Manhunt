# ====================================================
# CHAOS MANHUNT — powerups/decoy_end.mcfunction
# Called by timer/do_tick when decoy duration expires.
# Re-enables real Runner tracking.
# ====================================================

scoreboard players set $decoy mh.decoyactive 0
scoreboard players set $decoy mh.decoyduration 0

# Force compass update immediately back to real Runner
execute if score $event mh.pulseactive matches 0 as @a[team=Hunter] if items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/update_compass_mainhand with storage manhunt:tracking
execute if score $event mh.pulseactive matches 0 as @a[team=Hunter] if items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run function manhunt:tracking/update_compass_offhand with storage manhunt:tracking

title @a[team=Runner] actionbar {"text":"Decoy Ping expired","color":"gray"}
