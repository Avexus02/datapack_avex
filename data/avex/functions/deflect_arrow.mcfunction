# Avex
# Deflects an arrow.

tag @s add deflected
execute at @s run particle minecraft:sweep_attack ~ ~ ~
execute at @s run playsound minecraft:entity.player.attack.sweep master @a
execute store result entity @s Motion[0] double -0.001 run data get entity @s Motion[0] 800
execute store result entity @s Motion[1] double -0.001 run data get entity @s Motion[1] 800
execute store result entity @s Motion[2] double -0.001 run data get entity @s Motion[2] 800