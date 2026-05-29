# ====================================================
# CHAOS MANHUNT — powerups/decoy_end.mcfunction
# Called by timer/do_tick when decoy duration expires.
# Re-enables real Runner tracking.
# ====================================================

scoreboard players set $decoy mh.decoyactive 0
scoreboard players set $decoy mh.decoyduration 0

title @a[team=Runner] actionbar {"text":"Decoy Ping expired","color":"gray"}
