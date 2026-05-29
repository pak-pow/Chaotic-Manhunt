# ====================================================
# CHAOS MANHUNT — timer/grant_bonus.mcfunction
# Runs AS the credited Hunter (mh.killed=0 confirmed).
# Marks them as credited and adds 12000 ticks (+10 min)
# to the Runner timer.
# ====================================================

# Mark this Hunter as credited — won't grant bonus again
scoreboard players set @s mh.killed 1

# Add 10 minutes (12000 ticks) to the Runner timer
scoreboard players add $runner mh.timer 12000

# Announce bonus
title @a[team=Runner] times 5 40 10
title @a[team=Runner] title {"text":"+10:00 ADDED!","color":"green","bold":true}
title @a[team=Runner] subtitle {"text":"A Hunter has been eliminated","color":"gray"}
playsound minecraft:entity.player.levelup master @a[team=Runner] 0 64 0 1 1.0

tellraw @a [{"text":"[MANHUNT] ","color":"dark_gray"},{"text":"Runner eliminated a Hunter — +10 minutes added to the clock!","color":"green","bold":true}]
