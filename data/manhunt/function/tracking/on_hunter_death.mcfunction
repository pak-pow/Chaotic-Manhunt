# ====================================================
# CHAOS MANHUNT — tracking/on_hunter_death.mcfunction
# Runs AS the Hunter whose deathcount just increased.
# Handles: kill-bonus flag, respawn delay, and particles.
# ====================================================

# ── Snapshot new deathcount ───────────────────────────
# Must do this first to stop re-triggering next tick.

scoreboard players operation @s mh.prevdeaths = @s mh.deathcount

# ── Accumulate Hunter deaths (for respawn delay calc) ─

scoreboard players add @s mh.deaths 1

# ── Set respawn delay: deaths × 200 ticks (10s per death) ─

scoreboard players operation @s mh.spectator = @s mh.deaths
scoreboard players operation @s mh.spectator *= $c200 mh.const

# ── Tag as "just died" for kill-bonus detection ───────
# timer/kill_bonus_check reads this tag on the same tick
# to identify which Hunter was just killed by the Runner.

tag @s add mh.justdied

# ── Broadcast death and particles ─────────────────────

execute at @s run particle minecraft:explosion_emitter ~ ~1 ~ 0.5 0.5 0.5 0 5 force
tellraw @a[team=Runner] [{"text":"[KILL FEED] ","color":"dark_gray"},{"text":"Hunter ","color":"red"},{"selector":"@s","color":"gold"},{"text":" was eliminated!","color":"red"}]
