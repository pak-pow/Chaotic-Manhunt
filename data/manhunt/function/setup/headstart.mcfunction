# ====================================================
# CHAOS MANHUNT — setup/headstart.mcfunction
# Runs every tick while state=2.
# Keeps Hunters frozen with effects and shows a countdown
# on everyone's action bar. When counter hits 0, calls
# headstart_end to transition to active game.
# ====================================================

# ── Re-apply freeze effects each tick ────────────────
# Duration 2s ensures effects never expire between ticks.
# true = hide particles (no visual clutter).

effect give @a[team=Hunter] minecraft:mining_fatigue 2 2 true
effect give @a[team=Hunter] minecraft:slowness 2 254 true
effect give @a[team=Hunter] minecraft:blindness 2 0 true

# ── Decrement countdown ───────────────────────────────

scoreboard players remove $headstart mh.headtick 1

# ── Display seconds remaining ─────────────────────────
# Calculate seconds: headtick / 20 (integer division)
scoreboard players operation $display mh.headsecs = $headstart mh.headtick
scoreboard players operation $display mh.headsecs /= $c20 mh.const

title @a[team=Hunter] actionbar [{"text":"⚙ Head Start: ","color":"aqua"},{"score":{"name":"$display","objective":"mh.headsecs"},"color":"yellow"},{"text":"s | You are frozen","color":"gray"}]
title @a[team=Runner] actionbar [{"text":"⚡ HEAD START — ","color":"green","bold":true},{"score":{"name":"$display","objective":"mh.headsecs"},"color":"yellow"},{"text":"s | RUN!","color":"green","bold":true}]

# ── End headstart when timer expires ──────────────────

execute if score $headstart mh.headtick matches ..0 run function manhunt:setup/headstart_end
