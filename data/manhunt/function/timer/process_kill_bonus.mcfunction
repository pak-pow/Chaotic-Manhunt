# ====================================================
# CHAOS MANHUNT — timer/process_kill_bonus.mcfunction
# Runs AS the Runner who just killed a Hunter.
# Uses the mh.justdied tag (set in on_hunter_death)
# to find the killed Hunter and credit +10 min if unique.
# ====================================================

# Find Hunters who JUST died (mh.justdied tag) AND haven't
# been credited yet (mh.killed = 0). Grant bonus for each.
execute as @a[team=Hunter,tag=mh.justdied,scores={mh.killed=0}] run function manhunt:timer/grant_bonus

# Clear all justdied tags now that we've processed them
tag @a[team=Hunter] remove mh.justdied
