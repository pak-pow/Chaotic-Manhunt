# ====================================================
# CHAOS MANHUNT — tracking/alert_overworld.mcfunction
# Fires when Runner returns to the Overworld.
# ====================================================

tellraw @a[team=Hunter] [{"text":"[TRACKER] ","color":"dark_gray"},{"text":"Runner returned to the ","color":"green"},{"text":"OVERWORLD","color":"dark_green","bold":true},{"text":"!","color":"green"}]
title @a[team=Hunter] actionbar {"text":"Runner returned to the Overworld","color":"green"}
playsound minecraft:block.bell.use master @a[team=Hunter] 0 64 0 1 1
