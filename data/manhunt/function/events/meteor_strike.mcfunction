# ====================================================
# CHAOS MANHUNT — events/meteor_strike.mcfunction
# A charged creeper spawns at the Runner's location
# with instant fuse — creates an explosion near them.
# Runner is warned (they saw the 3s countdown).
# ====================================================

title @a title {"text":"☄ METEOR STRIKE","color":"dark_red","bold":true}
playsound minecraft:entity.generic.explode master @a 0 64 0 1 0.5

# Summon a charged creeper (ExplosionRadius:4) at Runner's last known position.
# Fuse:0 detonates immediately. No fire (ignited:0 by default).
execute as @a[team=Runner,limit=1] at @s run summon minecraft:creeper ~ ~ ~ {Fuse:0,ExplosionRadius:4,powered:1b,PersistenceRequired:1b}

tellraw @a [{"text":"[EVENT] ","color":"dark_gray"},{"text":"☄ METEOR STRIKE — explosion at the Runner's location!","color":"dark_red"}]
