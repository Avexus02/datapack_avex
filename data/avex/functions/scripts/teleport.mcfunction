playsound minecraft:entity.enderman.teleport master @a

scoreboard players set $tp_effect const 0
execute as @e[type = area_effect_cloud, tag = avex_raycast_end, limit = 1, sort = nearest] at @s run function avex:particle/tp_effect

tp ~ ~ ~