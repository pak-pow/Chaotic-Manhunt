# ====================================================
# CHAOS MANHUNT — tracking/alert_nether.mcfunction
# Fires when Runner enters the Nether.
# ====================================================

tellraw @a[team=Hunter] [{"text":"[TRACKER] ","color":"dark_gray"},{"text":"⚠ Runner entered the ","color":"red"},{"text":"NETHER","color":"dark_red","bold":true},{"text":"!","color":"red"}]
title @a[team=Hunter] actionbar {"text":"⚠ RUNNER ENTERED THE NETHER","color":"dark_red","bold":true}
execute as @a[team=Hunter] at @s run playsound minecraft:block.portal.ambient master @s ~ ~ ~ 1 0.7
