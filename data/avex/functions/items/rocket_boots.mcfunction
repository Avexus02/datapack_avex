# Rocket Boots

execute as @s[tag = !flight_expired, nbt = {OnGround: 0b, abilities:{flying: 0b}}, scores = {avex_sneak = 1}] at @s unless block ~ ~ ~ water run tag @s add using_rocket_boots

scoreboard players add @s[tag = using_rocket_boots, scores = {avex_sneak = 1, avex_flight_time = ..60}] avex_flight_time 1
scoreboard players remove @s[tag = !using_rocket_boots, scores = {avex_flight_time = 1..}] avex_flight_time 1

title @s[scores = {avex_flight_time = 1}] actionbar {"text":"██████","color":"#00FF21"}
title @s[scores = {avex_flight_time = 10}] actionbar [{"text":"█████","color":"#A7FF21"},{"text":"█","color":"dark_gray"}]
title @s[scores = {avex_flight_time = 20}] actionbar [{"text":"████","color":"#FFFF21"},{"text":"██","color":"dark_gray"}]
title @s[scores = {avex_flight_time = 30}] actionbar [{"text":"███","color":"#FF9F21"},{"text":"███","color":"dark_gray"}]
title @s[scores = {avex_flight_time = 40}] actionbar [{"text":"██","color":"#FF5D21"},{"text":"████","color":"dark_gray"}]
title @s[scores = {avex_flight_time = 50}] actionbar [{"text":"█","color":"#FF0021"},{"text":"█████","color":"dark_gray"}]

title @s[scores = {avex_flight_time = 60..}] actionbar {"text":"██████","color":"dark_gray"}

tag @s[tag = using_rocket_boots, scores = {avex_flight_time = 60..}] add flight_expired
scoreboard players set @a[scores = {avex_flight_time = 60..}] avex_flight_time 60

effect clear @s levitation

execute at @s[tag = using_rocket_boots] run playsound block.sand.break player @a ~ ~ ~ 0.33 0.8

effect give @s[tag = using_rocket_boots] levitation 1 4 true
execute at @s[tag = using_rocket_boots] run particle cloud ~ ~ ~ 0.125 0 0.125 0.033 2 force