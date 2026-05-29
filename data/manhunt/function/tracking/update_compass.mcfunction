# ====================================================
# CHAOS MANHUNT — tracking/update_compass.mcfunction
# MACRO FUNCTION — called via:
#   execute as @a[team=Hunter] run function manhunt:tracking/update_compass with storage manhunt:tracking
#
# Variables injected from storage manhunt:tracking:
#   $(RunnerX)   — Runner block X (int)
#   $(RunnerY)   — Runner block Y (int)
#   $(RunnerZ)   — Runner block Z (int)
#   $(RunnerDim) — Runner dimension string
#
# Replaces the Hunter's offhand compass with updated
# Lodestone NBT pointing at the Runner's last known position.
# tracked:false means it works WITHOUT an actual lodestone block.
# ====================================================

$item replace entity @s weapon.offhand with minecraft:compass[minecraft:custom_name={"text":"▶ TRACKING RUNNER","color":"red","bold":true},minecraft:lodestone_tracker={tracked:false,pos:{X:$(RunnerX),Y:$(RunnerY),Z:$(RunnerZ)},dimension:"$(RunnerDim)"}]
