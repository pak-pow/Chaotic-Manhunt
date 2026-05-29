# ====================================================
# CHAOS MANHUNT — setup/init.mcfunction
# Runs on /reload via minecraft:load tag.
# Creates all scoreboards, teams, and initialises state.
# ====================================================

# ── Core game scoreboards ────────────────────────────

# Game state: 0=idle 1=picking 2=headstart 3=active 4=paused 5=ended
scoreboard objectives add mh.state dummy "Game State"

# Runner lives (starts at 2)
scoreboard objectives add mh.lives dummy "Runner Lives"

# Runner timer in ticks (starts at 54000 = 45 min)
scoreboard objectives add mh.timer dummy "Runner Timer"

# Real game time in ticks — drives the Dread Clock
scoreboard objectives add mh.realtime dummy "Real Time"

# Per-Hunter flag: 0=not yet credited for +10min, 1=already credited
scoreboard objectives add mh.killed dummy "Killed Hunters"

# Hunter death count — used for respawn delay (deaths × 200 ticks)
scoreboard objectives add mh.deaths dummy "Hunter Deaths"

# Dimension tracking: 0=overworld, 1=nether, 2=end
scoreboard objectives add mh.dimension dummy "Dimension"

# Right-click detection (carrot on a stick = powerup activation)
scoreboard objectives add mh.use minecraft.used:minecraft.carrot_on_a_stick "Use Item"

# Stat-based death tracker — auto-increments when a player dies
scoreboard objectives add mh.deathcount minecraft.custom:minecraft.deaths "Deaths"

# Health display (health objective tracks actual HP in half-hearts)
scoreboard objectives add mh.health health "❤ Runner HP"

# ── Internal / system objectives ─────────────────────

# General constants pool for math operations
scoreboard objectives add mh.const dummy "Constants"

# Display and math temporary scores
scoreboard objectives add mh.headsecs dummy "Headstart Secs"
scoreboard objectives add mh.tmins dummy "Timer Mins"
scoreboard objectives add mh.tsecs dummy "Timer Secs"
scoreboard objectives add mh.tmp dummy "Temp Calc"

# Pick sequence animation phase (1=fast roll, 2=slow roll)
scoreboard objectives add mh.phase dummy "Pick Phase"

# Sub-tick flash counter for pick sequence animation
scoreboard objectives add mh.flashcount dummy "Flash Count"

# Headstart countdown in ticks (1200 = 60s)
scoreboard objectives add mh.headtick dummy "Headstart Tick"

# Compass update interval in ticks (60 default, 20 after 25 min)
scoreboard objectives add mh.interval dummy "Track Interval"

# Tracking update sub-tick counter
scoreboard objectives add mh.tracktick dummy "Track Tick"

# Runner X/Y/Z integer block positions (updated each tracking cycle)
scoreboard objectives add mh.rx dummy "Runner X"
scoreboard objectives add mh.ry dummy "Runner Y"
scoreboard objectives add mh.rz dummy "Runner Z"

# Previous dimension value (0/1/2) — used to detect dimension changes
scoreboard objectives add mh.prevdim dummy "Prev Dimension"

# Previous deathcount snapshot per player — detects new deaths
scoreboard objectives add mh.prevdeaths dummy "Prev Deaths"

# Timer sub-tick counter (fires do_tick every 20 ticks = 1s)
scoreboard objectives add mh.timertick dummy "Timer Tick"

# Event engine: elapsed ticks since last event
scoreboard objectives add mh.eventtimer dummy "Event Timer"

# Event engine: random threshold between 9600–14400 ticks
scoreboard objectives add mh.threshold dummy "Event Threshold"

# Current random event type (1–6)
scoreboard objectives add mh.eventtype dummy "Event Type"

# Per-Hunter spectator penalty countdown (deaths × 200 ticks)
scoreboard objectives add mh.spectator dummy "Spectator Timer"

# Decoy ping: 1=active, 0=inactive
scoreboard objectives add mh.decoyactive dummy "Decoy Active"

# Decoy ping duration countdown (600 ticks = 30s)
scoreboard objectives add mh.decoyduration dummy "Decoy Duration"

# Dimension pulse: 1=active (compasses disabled), 0=inactive
scoreboard objectives add mh.pulseactive dummy "Pulse Active"

# Dread Clock milestone fired flags (keyed per-milestone on $dread)
scoreboard objectives add mh.dread dummy "Dread Flags"

# Hunter powerup delivery sub-tick counter
scoreboard objectives add mh.deliverytick dummy "Delivery Tick"

# Tracker Pulse: remaining pings countdown
scoreboard objectives add mh.pulsecount dummy "Pulse Count"

# Powerup selection type
scoreboard objectives add mh.poweruptype dummy "Powerup Type"

# Runner respawn tracking state
scoreboard objectives add mh.respawn_state dummy "Respawn State"

# ── Teams ─────────────────────────────────────────────

team add Runner
team modify Runner color green
team modify Runner prefix [{"text":"[Runner] ","color":"green"}]
team modify Runner friendlyFire false

team add Hunter
team modify Hunter color red
team modify Hunter prefix [{"text":"[Hunter] ","color":"red"}]
team modify Hunter friendlyFire false

# ── Initialise global state ───────────────────────────

scoreboard players set $game mh.state 0
scoreboard players set $tracking mh.interval 60
scoreboard players set $tracking mh.tracktick 0
scoreboard players set $decoy mh.decoyactive 0
scoreboard players set $decoy mh.decoyduration 0
scoreboard players set $event mh.pulseactive 0
scoreboard players set $dread mh.m15 0
scoreboard players set $dread mh.m25 0
scoreboard players set $dread mh.m35 0
scoreboard players set $dread mh.m40 0
scoreboard players set $runner mh.timer 54000

# Hunter X/Y/Z integer block positions
scoreboard objectives add mh.hx dummy "Hunter X"
scoreboard objectives add mh.hy dummy "Hunter Y"
scoreboard objectives add mh.hz dummy "Hunter Z"

# Delta X/Y/Z differences
scoreboard objectives add mh.dx dummy "Delta X"
scoreboard objectives add mh.dy dummy "Delta Y"
scoreboard objectives add mh.dz dummy "Delta Z"

# Squaring differences and sum
scoreboard objectives add mh.dx2 dummy "Delta X Sq"
scoreboard objectives add mh.dy2 dummy "Delta Y Sq"
scoreboard objectives add mh.dz2 dummy "Delta Z Sq"
scoreboard objectives add mh.d2 dummy "Distance Sq"
scoreboard objectives add mh.distance dummy "Distance"

# Preset math constants used throughout the datapack
scoreboard players set $c2 mh.const 2
scoreboard players set $c20 mh.const 20
scoreboard players set $c200 mh.const 200
scoreboard players set $c1200 mh.const 1200

# ── Announce ──────────────────────────────────────────

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"CHAOS MANHUNT","color":"gold","bold":true},{"text":"]","color":"dark_gray"},{"text":" Loaded! Use ","color":"gray"},{"text":"/trigger manhunt_random","color":"aqua"},{"text":" to begin.","color":"gray"}]
