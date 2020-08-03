# Hook Grappling Behavior

kill @e[type = armor_stand, tag = hook_temp, distance = ..1, sort = nearest, limit = 1]
tp ~ ~ ~
execute if entity @e[type = armor_stand, tag = hook_as, distance = ..1] run tag @s remove hook_grappling
kill @e[type = armor_stand, tag = hook_as, distance = ..1]
