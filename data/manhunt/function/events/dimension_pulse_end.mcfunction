# ====================================================
# CHAOS MANHUNT — events/dimension_pulse_end.mcfunction
# Scheduled 600t after dimension_pulse fires.
# Re-enables compass tracking by clearing the pulse flag.
# ====================================================

scoreboard players set $event mh.pulseactive 0

title @a[team=Hunter] actionbar {"text":"◈ SIGNAL RESTORED","color":"blue","bold":true}
tellraw @a[team=Hunter] {"text":"[TRACKER] Compass signal restored.","color":"blue"}
playsound minecraft:block.note_block.pling master @a[team=Hunter] 0 64 0 1 2.0
