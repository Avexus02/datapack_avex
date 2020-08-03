# Avex
# Fires once upon loading or reloading.

title @a actionbar {"text":"AvexPack Loaded!", "bold":true}

scoreboard objectives add avex_flight_time dummy
scoreboard objectives add avex_y_motion dummy
scoreboard objectives add avex_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add avex_jump minecraft.custom:minecraft.jump
scoreboard objectives add avex_m2 minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add avex_drop minecraft.custom:minecraft.drop
scoreboard objectives add avex_walking minecraft.custom:minecraft.walk_one_cm

scoreboard objectives add pb_timer dummy
scoreboard objectives add defuser_uses dummy
scoreboard objectives add const dummy
scoreboard objectives add ticks_alive dummy
scoreboard objectives add pos dummy
scoreboard objectives add tipped_sword dummy
scoreboard objectives add es_cd1 dummy
scoreboard objectives add hook_angle dummy
scoreboard objectives add hook_angle_2 dummy
scoreboard objectives add hook_owner dummy
scoreboard objectives add hook_cd dummy
scoreboard objectives add uuid dummy

scoreboard players set 2 const 2
scoreboard players set 0 const 0
scoreboard players set 25 const 25


setblock -30000000 200 3000 minecraft:oak_sign replace
setblock -30000000 200 3001 minecraft:shulker_box replace

forceload add -30000000 3000

function avex:five_tick
function avex:ten_tick