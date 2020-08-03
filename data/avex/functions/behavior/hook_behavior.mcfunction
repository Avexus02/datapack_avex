# Hook Entity Behavior

# This denotes the maximum amount of ticks the hook is allowed to fly for.
tag @s[tag = !hook_anchor, scores = {ticks_alive = 30}] add hook_retract

scoreboard players add @s[tag = !hook_retract] ticks_alive 1
scoreboard players remove @s[tag = hook_retract] ticks_alive 1

# Stop when a solid block is hit.
execute unless block ~ ~1.5 ~ #passable run tag @s[tag = !hook_grapple] add hook_retract
execute unless block ~ ~1.5 ~ #passable run tag @s[tag = hook_grapple] add hook_anchor

# Stop when an entity is hit.
# Grab behavior!
execute as @s[tag = !hook_grapple] positioned ~ ~1.5 ~ run tag @e[type = !#non_living, type = !#bosses, gamemode = !spectator, tag = !hook_immune, distance = 0.1..1.5] add hook_in_range
execute as @s[tag = !hook_grapple] positioned ~ ~1.5 ~ if entity @e[type = !#non_living, tag = hook_in_range, distance = ..1.5] run tag @s add hook_retract

execute as @s[tag = !hook_grapple, tag = hook_retract, scores = {ticks_alive = 2..}] as @e[type = !#non_living, tag = hook_in_range, sort = nearest, limit = 2] run tp ^-0.275 ^1 ^

# Grapple behavior!
execute as @s[tag = hook_anchor] if score @s hook_owner = @p[tag = hook_immune] uuid run tag @p[tag = hook_immune] add hook_grappling
execute as @a[tag = hook_grappling] at @s positioned as @e[type = armor_stand, tag = hook_temp, distance = ..2, sort = nearest, limit = 1] run function avex:behavior/grappling_behavior

execute as @s[tag = !hook_anchor, tag = !hook_retract] run tp ^ ^ ^0.6
execute as @s[tag = !hook_anchor, tag = hook_retract] run tp ^ ^ ^-0.6

execute as @s[tag = !hook_retract, tag = !hook_anchor] run summon armor_stand ~ ~ ~ {Marker: 1b, Invisible: 1b, Silent: 1b, ArmorItems:[{}, {}, {}, {id:"minecraft:chain", Count: 1b}], Pose:{Head:[90f, 0f, 90f]}, Tags:["hook_temp"]}
execute as @s[tag = !hook_retract, tag = !hook_anchor] rotated as @s as @e[type = armor_stand, tag = hook_temp, sort = nearest, limit = 1] run tp ^ ^0.5 ^0.6
execute as @e[type = armor_stand, tag = hook_temp, sort = nearest, limit = 1] store result entity @s Pose.Head[1] float -1 run scoreboard players get @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] hook_angle_2
execute as @s[tag = hook_retract] run kill @e[type = armor_stand, tag = hook_temp, sort = nearest, limit = 1]

tag @s[tag = hook_retract, scores = {ticks_alive = 0}] add hook_dead
execute as @s[tag = hook_dead] run tag @e[type = !#non_living, tag = hook_in_range, distance = ..3] remove hook_in_range
execute as @s[tag = hook_dead] at @s as @p[tag = hook_immune] run function avex:spawn/hook
execute as @s[tag = hook_dead] run tag @p[tag = hook_immune] remove hook_immune
kill @s[tag = hook_dead]
