# ====================================================
# CHAOS MANHUNT — loop/main.mcfunction
# Runs every tick via minecraft:tick tag.
# Routes execution to the correct module based on game state.
# ====================================================

# Always listen for admin triggers regardless of game state
function manhunt:admin/triggers

# State 1 — pick sequence animation (randomiser reel)
execute if score $game mh.state matches 1 run function manhunt:pick_sequence/animate

# State 2 — headstart (Hunters frozen, 60s countdown)
execute if score $game mh.state matches 2 run function manhunt:setup/headstart

# State 3 — active game (all gameplay systems running)
execute if score $game mh.state matches 3 run function manhunt:tracking/loop
execute if score $game mh.state matches 3 run function manhunt:dread_clock/tick
execute if score $game mh.state matches 3 run function manhunt:events/engine
execute if score $game mh.state matches 3 run function manhunt:lives/check
execute if score $game mh.state matches 3 run function manhunt:timer/tick
execute if score $game mh.state matches 3 run function manhunt:powerups/check_use

# State 4 — paused (all gameplay halted, handled by toggle_pause)
# Nothing additional needed here — effects keep players frozen

# State 5 — ended (game over, no systems run)
