# ====================================================
# CHAOS MANHUNT — tracking/update_compass_decoy.mcfunction
# MACRO FUNCTION — used when Runner activates Decoy Ping.
# Points Hunter compasses at a fake location stored in
# storage manhunt:decoy instead of the real Runner position.
#
# Variables injected from storage manhunt:decoy:
#   $(FakeX) $(FakeY) $(FakeZ) $(FakeDim)
# ====================================================

$item replace entity @s weapon.offhand with minecraft:compass[minecraft:custom_name={"text":"▶ TRACKING RUNNER","color":"red","bold":true},minecraft:lodestone_tracker={tracked:false,pos:{X:$(FakeX),Y:$(FakeY),Z:$(FakeZ)},dimension:"$(FakeDim)"}]
