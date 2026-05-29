# ====================================================
# CHAOS MANHUNT — pick_sequence/animate.mcfunction
# Called every tick from loop/main when state=1.
# Manages the name-cycling animation across two phases:
#   Phase 1: flash every 2 ticks (fast roll)
#   Phase 2: flash every 8 ticks (slow, tension-building)
# ====================================================

# ── Phase 1: Fast roll (every 2 ticks) ───────────────

execute if score $pick mh.phase matches 1 run function manhunt:pick_sequence/flash_fast

# ── Phase 2: Slow roll (every 8 ticks) ───────────────

execute if score $pick mh.phase matches 2 run function manhunt:pick_sequence/flash_slow
