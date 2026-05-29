# ====================================================
# CHAOS MANHUNT — powerups/tracker_ping.mcfunction
# Runs AS each Hunter with mh.pulsing tag, once per second.
# Shows the Runner's exact coordinates from $rx/$ry/$rz scores.
# ====================================================

tellraw @s [{"text":"◈ HEARTBEAT ","color":"blue","bold":true},{"text":"Runner at ","color":"white"},{"text":"X: ","color":"gray"},{"score":{"name":"$rx","objective":"mh.rx"},"color":"aqua"},{"text":" Y: ","color":"gray"},{"score":{"name":"$ry","objective":"mh.ry"},"color":"aqua"},{"text":" Z: ","color":"gray"},{"score":{"name":"$rz","objective":"mh.rz"},"color":"aqua"},{"text":" | ","color":"dark_gray"},{"score":{"name":"@s","objective":"mh.pulsecount"},"color":"gray"},{"text":"s left","color":"gray"}]

playsound minecraft:block.note_block.basedrum master @s 0 64 0 0.5 1.0
