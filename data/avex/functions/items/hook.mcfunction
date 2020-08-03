# Hook
clear @s carrot_on_a_stick{custom_item:"hook"} 1
scoreboard players set @s hook_cd 5
playsound minecraft:entity.ender_pearl.throw master @a[distance = ..20] ~ ~ ~ 0.2 0.5
summon armor_stand ~ ~ ~ {Marker: 1b, Invisible: 1b, HurtTime: 44s, Silent: 1b, ArmorItems:[{}, {}, {}, {id:"minecraft:carrot_on_a_stick", Count: 1b, tag:{CustomModelData: 1}}], Pose:{Head:[90f, 0f, 90f]}, Tags:["hook_as"]}
# execute as @a[scores = {avex_sneak = 1}] run tag @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] add hook_grapple

# Set the owner of the hook.
execute store result score @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] hook_owner run data get entity @s UUID[0]

# Align the model to where the player is looking.
execute store result score @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] hook_angle run data get entity @s Rotation[1] 1
execute as @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] store result score @s hook_angle_2 run scoreboard players get @s hook_angle
scoreboard players remove @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] hook_angle 45

execute as @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] if score @s hook_angle < 0 const store result entity @s Pose.Head[1] float -1 run scoreboard players get @s hook_angle
execute as @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] if score @s hook_angle >= 0 const store result entity @s Pose.Head[1] float 1 run scoreboard players get @s hook_angle

# Rotate the model properly.
execute as @e[type = armor_stand, tag = hook_as, sort = nearest, limit = 1] at @p run tp ^-0.275 ^-0.5 ^

tag @s add hook_immune

scoreboard players add @e[type = armor_stand, tag = hook_as] ticks_alive 0