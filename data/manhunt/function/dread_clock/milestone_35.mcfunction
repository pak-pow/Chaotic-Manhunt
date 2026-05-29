# ====================================================
# CHAOS MANHUNT — dread_clock/milestone_35.mcfunction
# Fires at exactly 35 minutes of real game time.
# Runner receives permanent Weakness I debuff.
# ====================================================

effect give @a[team=Runner] minecraft:weakness 999999 0 true

title @a times 5 60 20
title @a title {"text":"THE RUNNER WEAKENS","color":"dark_red","bold":true}
title @a subtitle {"text":"Runner gains permanent Weakness I","color":"gray"}
execute as @a at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 1.0
tellraw @a [{"text":"[DREAD CLOCK] ","color":"dark_red","bold":true},{"text":"35 minutes — Runner is permanently weakened!","color":"red"}]
