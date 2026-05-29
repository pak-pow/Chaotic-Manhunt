# ====================================================
# CHAOS MANHUNT — tracking/alert_nether.mcfunction
# Fires when Runner enters the Nether.
# ====================================================

tellraw @a[team=Hunter] [{"text":"[TRACKER] ","color":"dark_gray"},{"text":"⚠ Runner entered the ","color":"red"},{"text":"NETHER","color":"dark_red","bold":true},{"text":"!","color":"red"}]
title @a[team=Hunter] actionbar {"text":"⚠ RUNNER ENTERED THE NETHER","color":"dark_red","bold":true}
playsound minecraft:block.portal.ambient master @a[team=Hunter] 0 64 0 1 0.7
