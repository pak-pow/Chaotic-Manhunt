# ====================================================
# CHAOS MANHUNT — timer/kill_bonus_check.mcfunction
# Called as the Runner via the hunter_kill_bonus
# advancement reward (fires when Runner kills a Hunter).
# ====================================================

# Only process during active game. Schedule for 1 tick later so the main loop
# has time to detect the death and assign the mh.justdied tag.
execute if score $game mh.state matches 3 if entity @s[team=Runner] run schedule function manhunt:timer/process_kill_bonus 1t

# Revoke the advancement so it can fire again next kill
advancement revoke @s only manhunt:hunter_kill_bonus
