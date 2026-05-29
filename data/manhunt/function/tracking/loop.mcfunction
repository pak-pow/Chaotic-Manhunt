# ====================================================
# CHAOS MANHUNT — tracking/loop.mcfunction
# Runs every tick while state=3.
# Uses an internal tick counter to throttle updates:
#   - Every 60 ticks (3s) by default
#   - Every 20 ticks (1s) after Dread Clock hits 25 min
# Also handles Hunter death detection and spectator penalty.
# ====================================================

# ── Throttled tracking update ─────────────────────────

scoreboard players add $tracking mh.tracktick 1

execute if score $tracking mh.tracktick >= $tracking mh.interval run function manhunt:tracking/do_update
execute if score $tracking mh.tracktick >= $tracking mh.interval run scoreboard players set $tracking mh.tracktick 0

# ── Hunter death detection (every tick) ──────────────
# Compare each Hunter's deathcount stat vs their stored snapshot.
# If deathcount > prevdeaths, they died — process it.

execute as @a[team=Hunter] if score @s mh.deathcount > @s mh.prevdeaths run function manhunt:tracking/on_hunter_death

# ── Hunter spectator penalty tick (every tick) ────────
# Hunters with mh.spectator > 0 are in their penalty window.

execute as @a[team=Hunter,scores={mh.spectator=1..}] run function manhunt:tracking/hunter_spectate_tick
