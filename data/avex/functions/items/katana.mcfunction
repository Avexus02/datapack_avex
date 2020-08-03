# Katana

execute at @s run tag @e[type = arrow, distance = ..3, nbt = {inGround: 0b}] add selected_arrow
execute as @e[type = arrow, tag = selected_arrow, tag = !deflected] run data modify entity @s Glowing set value 1b
execute at @s[scores = {avex_m2 = 1}] as @e[type = arrow, tag = selected_arrow, tag = !deflected] run function avex:deflect_arrow

tag @e[type = arrow] remove selected_arrow