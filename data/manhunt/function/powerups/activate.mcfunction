# ====================================================
# CHAOS MANHUNT — powerups/activate.mcfunction
# Runs AS the player who right-clicked a CoaS.
# Checks which powerup item is in their mainhand using
# the custom_data component, then routes to the correct
# powerup function. Team-checks ensure correct access.
# ====================================================

# Only fire during active game
execute unless score $game mh.state matches 3 run return 0

# ── RUNNER POWERUPS (mainhand) ────────────────────────
execute if entity @s[team=Runner] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"phantom_cloak"}] run function manhunt:powerups/phantom_cloak
execute if entity @s[team=Runner] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"dash"}] run function manhunt:powerups/dash
execute if entity @s[team=Runner] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"decoy_ping"}] run function manhunt:powerups/decoy_ping
execute if entity @s[team=Runner] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"lifeline"}] run function manhunt:powerups/lifeline

# ── HUNTER POWERUPS (mainhand) ───────────────────────
execute if entity @s[team=Hunter] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"true_sight"}] run function manhunt:powerups/true_sight
execute if entity @s[team=Hunter] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"tracker_pulse"}] run function manhunt:powerups/tracker_pulse
execute if entity @s[team=Hunter] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"bloodlust"}] run function manhunt:powerups/bloodlust
execute if entity @s[team=Hunter] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data={manhunt_powerup:"sabotage"}] run function manhunt:powerups/sabotage
