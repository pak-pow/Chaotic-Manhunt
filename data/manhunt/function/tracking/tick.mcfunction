# ====================================================
# CHAOS MANHUNT — tracking/tick.mcfunction
# Runs every tick from loop.mcfunction when state=3.
# Updates positions and dimensions, and displays distance to hunters.
# ====================================================

# ── Update Runner position and dimension every tick ──
execute as @a[team=Runner,limit=1] store result score @s mh.rx run data get entity @s Pos[0]
execute as @a[team=Runner,limit=1] store result score @s mh.ry run data get entity @s Pos[1]
execute as @a[team=Runner,limit=1] store result score @s mh.rz run data get entity @s Pos[2]
scoreboard players operation $runner mh.rx = @a[team=Runner,limit=1] mh.rx
scoreboard players operation $runner mh.ry = @a[team=Runner,limit=1] mh.ry
scoreboard players operation $runner mh.rz = @a[team=Runner,limit=1] mh.rz

execute as @a[team=Runner,limit=1] at @s if dimension minecraft:overworld run scoreboard players set $runner mh.dimension 0
execute as @a[team=Runner,limit=1] at @s if dimension minecraft:the_nether run scoreboard players set $runner mh.dimension 1
execute as @a[team=Runner,limit=1] at @s if dimension minecraft:the_end run scoreboard players set $runner mh.dimension 2

# ── Update Hunter dimensions every tick ──
execute as @a[team=Hunter] at @s if dimension minecraft:overworld run scoreboard players set @s mh.dimension 0
execute as @a[team=Hunter] at @s if dimension minecraft:the_nether run scoreboard players set @s mh.dimension 1
execute as @a[team=Hunter] at @s if dimension minecraft:the_end run scoreboard players set @s mh.dimension 2

# ── Run distance calculation for Hunters holding compass ──
# Only if they are alive / not in spectator mode. We tag them when they hold it.
execute as @a[team=Hunter,gamemode=!spectator] if items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run tag @s add mh.holding_compass
execute as @a[team=Hunter,gamemode=!spectator] if items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run tag @s add mh.holding_compass

# Run distance calculation for tagged players
execute as @a[team=Hunter,tag=mh.holding_compass,gamemode=!spectator] run function manhunt:tracking/show_distance

# If they just stopped holding the compass, clear their actionbar instantly and remove the tag
execute as @a[team=Hunter,tag=mh.holding_compass] unless items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] unless items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run title @s actionbar ""
execute as @a[team=Hunter,tag=mh.holding_compass] unless items entity @s weapon.mainhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] unless items entity @s weapon.offhand minecraft:compass[minecraft:custom_data={manhunt_tracker:1b}] run tag @s remove mh.holding_compass
