# ====================================================
# CHAOS MANHUNT — pick_sequence/show_roles.mcfunction
# Scheduled 40t after reveal — shows personal role
# titles to Runner and Hunters separately.
# ====================================================

# ── Runner personal screen ────────────────────────────
title @a[team=Runner] times 5 60 20
title @a[team=Runner] title {"text":"YOU ARE THE RUNNER","color":"green","bold":true}
title @a[team=Runner] subtitle {"text":"Run. Survive. Kill the Dragon.","color":"gray"}
playsound minecraft:entity.player.levelup master @a[team=Runner] 0 64 0 1 1.0

# ── Hunter personal screen ────────────────────────────
title @a[team=Hunter] times 5 60 20
title @a[team=Hunter] title {"text":"YOU ARE A HUNTER","color":"red","bold":true}
title @a[team=Hunter] subtitle {"text":"Hunt them down.","color":"gray"}
playsound minecraft:entity.wither.ambient master @a[team=Hunter] 0 64 0 1 1.0

# Broadcast to chat who the Runner is
tellraw @a [{"text":"[MANHUNT] Runner: ","color":"gold","bold":true},{"selector":"@a[team=Runner,limit=1]","color":"green","bold":true},{"text":" | Good luck everyone!","color":"gray"}]

# Wait 3 seconds then auto-assign compasses and begin headstart
schedule function manhunt:pick_sequence/assign 60t
