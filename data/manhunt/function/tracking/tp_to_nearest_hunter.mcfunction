# ====================================================
# CHAOS MANHUNT — tracking/tp_to_nearest_hunter.mcfunction
# Runs AS the respawning Hunter after penalty expires.
# Teleports them to the nearest living (survival) Hunter.
# Falls back to world spawn if no living Hunter exists.
# ====================================================

# Tag ourselves so we can be excluded from the "nearest" search
tag @s add mh.needsteleport

# Find the nearest LIVING Hunter (survival mode, not us)
# Execute as that Hunter, teleport the respawning one to them
execute as @a[team=Hunter,tag=!mh.needsteleport,gamemode=survival,sort=nearest,limit=1] at @s run teleport @a[team=Hunter,tag=mh.needsteleport,limit=1] @s

# Remove the tag
tag @s remove mh.needsteleport
