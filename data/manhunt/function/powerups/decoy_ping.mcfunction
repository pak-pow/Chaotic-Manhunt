# ====================================================
# CHAOS MANHUNT — powerups/decoy_ping.mcfunction
# RUNNER powerup. Points Hunter compasses to a fake
# location for 30 seconds (600 ticks).
# REFUND if Dimension Pulse is already active (would stack).
# ====================================================

# If Dimension Pulse is already active, refund and abort
execute if score $event mh.pulseactive matches 1 run title @s actionbar {"text":"⚠ Dimension Pulse active — Decoy Ping refunded!","color":"yellow","bold":true}
execute if score $event mh.pulseactive matches 1 run return 0

# Pulse is not active — activate decoy
function manhunt:powerups/decoy_activate
