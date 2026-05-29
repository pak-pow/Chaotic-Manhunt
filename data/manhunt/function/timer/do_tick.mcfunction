# ====================================================
# CHAOS MANHUNT — timer/do_tick.mcfunction
# Runs once per second. Decrements the Runner timer,
# formats and displays it on the Runner's action bar,
# and checks for timeout or tracker-pulse pings.
# ====================================================

# ── Decrement Runner timer ────────────────────────────

scoreboard players remove $runner mh.timer 20

# ── Format minutes and seconds ───────────────────────
# Minutes: timer / 1200   (1200 ticks = 1 minute)
# Seconds: (timer % 1200) / 20

scoreboard players operation $display mh.tmins = $runner mh.timer
scoreboard players operation $display mh.tmins /= $c1200 mh.const

scoreboard players operation $display mh.tsecs = $runner mh.timer
scoreboard players operation $display mh.tsecs %= $c1200 mh.const
scoreboard players operation $display mh.tsecs /= $c20 mh.const

# ── Display on Runner's action bar ───────────────────
title @a[team=Runner] actionbar [{"text":"⏱ ","color":"yellow"},{"score":{"name":"$display","objective":"mh.tmins"},"color":"yellow"},{"text":"m ","color":"yellow"},{"score":{"name":"$display","objective":"mh.tsecs"},"color":"yellow"},{"text":"s remaining","color":"yellow"}]

# ── Decoy ping duration countdown ────────────────────
execute if score $decoy mh.decoyactive matches 1 run scoreboard players remove $decoy mh.decoyduration 20
execute if score $decoy mh.decoyactive matches 1 if score $decoy mh.decoyduration matches ..0 run function manhunt:powerups/decoy_end

# ── Tracker Pulse pings (if any Hunter is pulsing) ───
execute as @a[team=Hunter,tag=mh.pulsing,scores={mh.pulsecount=1..}] run function manhunt:powerups/tracker_ping
scoreboard players remove @a[team=Hunter,tag=mh.pulsing] mh.pulsecount 1
execute as @a[team=Hunter,tag=mh.pulsing,scores={mh.pulsecount=..0}] run tag @s remove mh.pulsing

# ── Hunter and Runner powerup delivery (every 150 ticks = 2.5 min) ─

scoreboard players add $powerup mh.deliverytick 1
execute if score $powerup mh.deliverytick matches 150.. run function manhunt:powerups/deliver_hunter_powerup
execute if score $powerup mh.deliverytick matches 150.. run function manhunt:powerups/deliver_runner_powerup
execute if score $powerup mh.deliverytick matches 150.. run scoreboard players set $powerup mh.deliverytick 0

# ── Timeout check ─────────────────────────────────────

execute if score $runner mh.timer matches ..0 run function manhunt:win/hunters_win_timeout
