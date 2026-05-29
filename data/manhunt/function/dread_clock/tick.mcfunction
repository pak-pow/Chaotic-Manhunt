# ====================================================
# CHAOS MANHUNT — dread_clock/tick.mcfunction
# Runs every tick while state=3.
# Tracks REAL elapsed game time and fires escalating
# effects at key milestones. Each milestone uses a
# separate flag (mh.dread on $dread) so it fires exactly once.
# ====================================================

# Increment real time counter
scoreboard players add $game mh.realtime 1

# ── 15 minutes (18000 ticks) — Hunters get Speed I ───
execute if score $game mh.realtime matches 18000.. if score $dread mh.m15 matches 0 run function manhunt:dread_clock/milestone_15
execute if score $game mh.realtime matches 18000.. run scoreboard players set $dread mh.m15 1

# ── 25 minutes (30000 ticks) — Compass updates every 1s ─
execute if score $game mh.realtime matches 30000.. if score $dread mh.m25 matches 0 run function manhunt:dread_clock/milestone_25
execute if score $game mh.realtime matches 30000.. run scoreboard players set $dread mh.m25 1

# ── 35 minutes (42000 ticks) — Runner gets Weakness I ─
execute if score $game mh.realtime matches 42000.. if score $dread mh.m35 matches 0 run function manhunt:dread_clock/milestone_35
execute if score $game mh.realtime matches 42000.. run scoreboard players set $dread mh.m35 1

# ── 40 minutes (48000 ticks) — Runner gets Glowing ───
execute if score $game mh.realtime matches 48000.. if score $dread mh.m40 matches 0 run function manhunt:dread_clock/milestone_40
execute if score $game mh.realtime matches 48000.. run scoreboard players set $dread mh.m40 1

# ── 45 minutes (54000 ticks) — Force timeout ──────────
execute if score $game mh.realtime matches 54000.. run function manhunt:win/hunters_win_timeout
