# ====================================================
# CHAOS MANHUNT — tracking/alert_end.mcfunction
# Fires when Runner enters The End.
# Also triggers the "Runner at The End" atmosphere FX.
# ====================================================

tellraw @a[team=Hunter] [{"text":"[TRACKER] ","color":"dark_gray"},{"text":"⚠ Runner entered ","color":"dark_purple"},{"text":"THE END","color":"light_purple","bold":true},{"text":"!","color":"dark_purple"}]
title @a[team=Hunter] title {"text":"THE RUNNER HAS REACHED THE END","color":"dark_purple","bold":true}
title @a[team=Hunter] subtitle {"text":"Stop them before they reach the Dragon!","color":"gray"}
execute as @a[team=Hunter] at @s run playsound minecraft:entity.wither.ambient master @s ~ ~ ~ 1 0.5
execute as @a at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.5 1
