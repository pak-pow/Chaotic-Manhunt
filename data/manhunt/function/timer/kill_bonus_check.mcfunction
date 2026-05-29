# ====================================================
# CHAOS MANHUNT — timer/kill_bonus_check.mcfunction
# Called as the Runner via the hunter_kill_bonus
# advancement reward (fires when Runner kills a Hunter).
# ====================================================

# Only process during active game
execute if score $game mh.state matches 3 if entity @s[team=Runner] run function manhunt:timer/process_kill_bonus

# Revoke the advancement so it can fire again next kill
advancement revoke @s only manhunt:hunter_kill_bonus
