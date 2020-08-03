execute positioned ~ ~1.3 ~ run function avex:scripts/raycast

execute at @e[type = area_effect_cloud, tag = avex_raycast_end] positioned ~ ~0.1 ~ run function avex:particle/circle

execute as @s[scores = {avex_m2 = 1}] positioned as @e[type = area_effect_cloud, tag = avex_raycast_end, limit = 1, sort = nearest] run function avex:scripts/teleport
kill @e[type = area_effect_cloud, tag = avex_raycast_end, limit = 1, sort = nearest]