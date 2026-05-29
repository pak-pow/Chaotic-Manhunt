# ====================================================
# CHAOS MANHUNT — lives/apply_immunity.mcfunction
# Runs AS the Runner when they have respawned (mh.respawn_state=1, health>=1).
# Gives brief resistance and blindness to prevent immediate spawn-killing.
# ====================================================

# Apply resistance and blindness
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:blindness 3 0 true

# Clear the respawn state
scoreboard players set @s mh.respawn_state 0

# Broadcast a message/sound for immunity activation
execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
