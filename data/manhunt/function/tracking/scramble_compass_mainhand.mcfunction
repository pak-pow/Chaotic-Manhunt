# ====================================================
# CHAOS MANHUNT — tracking/scramble_compass_mainhand.mcfunction
# Replaces mainhand compass with a scrambled version during Dimension Pulse.
# ====================================================
item replace entity @s weapon.mainhand with minecraft:compass[minecraft:custom_name={"text":"◇ SIGNAL LOST","color":"gray","bold":true},minecraft:custom_data={manhunt_tracker:1b},minecraft:lodestone_tracker={target:{pos:[I;0,64,0],dimension:"minecraft:overworld"},tracked:false}]
