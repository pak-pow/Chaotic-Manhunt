# ====================================================
# CHAOS MANHUNT — powerups/lifeline.mcfunction
# RUNNER powerup. Restores Runner to 2 lives IF they
# have spent their first life (mh.lives <= 1).
# If Runner still has 2 lives, the item is NOT consumed.
# ====================================================

# Guard: if Runner still has 2 lives, refuse activation
execute if score @s mh.lives matches 2 run title @s actionbar {"text":"⚠ You still have both lives — Lifeline saved!","color":"yellow"}
execute if score @s mh.lives matches 2 run return 0

# Runner is on last life — restore them
item replace entity @s weapon.mainhand with minecraft:air

scoreboard players set @s mh.lives 2

title @a times 5 60 20
title @a[team=Runner] title {"text":"LIFELINE USED","color":"green","bold":true}
title @a[team=Runner] subtitle {"text":"First life restored!","color":"gray"}
title @a[team=Hunter] actionbar {"text":"⚠ THE RUNNER USED A LIFELINE!","color":"dark_red","bold":true}

execute as @a[team=Runner] at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2.0
execute as @a[team=Hunter] at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 1 0.5

tellraw @a [{"text":"[MANHUNT] ","color":"dark_gray"},{"text":"⚠ The Runner has used their Lifeline and restored their first life!","color":"yellow","bold":true}]

# Reset weather that may have been set on first death
weather clear
