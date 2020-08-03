# Avex
# Fires once per tick.

scoreboard objectives add avex_initialized dummy
execute unless score $init avex_initialized matches 1 run function avex:scripts/init

tag @a[nbt = {SelectedItem:{tag:{custom_item: "pipe_bomb"}}, OnGround: 1b}, scores = {avex_sneak = 1}] add equipped_pipe_bomb
tag @a[nbt = {SelectedItem:{tag:{custom_item: "defuser"}}}] add equipped_defuser
tag @a[nbt = {SelectedItem:{tag:{custom_item: "sentry_spawner"}}}] add equipped_sentry_spawner
tag @a[nbt = {SelectedItem:{tag:{enchant_bloodlust: 1b}}}] add bloodlust_sword
tag @a[nbt = {SelectedItem:{tag:{custom_item: "katana"}}}] add equipped_katana
tag @e[type = armor_stand, tag = hook_as, tag = !hook_ready, nbt = {HurtTime: 40s}] add hook_ready

execute as @e[type = arrow] run data modify entity @s Glowing set value 0b

execute as @a[nbt = {Inventory:[{Slot: 100b, tag:{custom_item: "rocket_boots"}}]}] run function avex:items/rocket_boots
execute as @a[tag = equipped_katana] run function avex:items/katana

# Bloodlust
tag @e[type = !item, nbt = {HurtTime: 10s}] add hurt

execute as @a[tag = bloodlust_sword] at @s if entity @e[tag = hurt, distance = ..2.5] store success score @s const if predicate avex:quarter
execute as @a[tag = bloodlust_sword] if score @s const matches 1 run effect give @s minecraft:regeneration 1 2 true

execute as @a[predicate = avex:equipped_end_staff, scores = {avex_sneak = 1}] at @s run function avex:items/staff_of_the_end

# Hook
execute as @a[predicate = avex:equipped_hook_mainhand, scores = {avex_m2 = 1, hook_cd = 0}] at @s run function avex:items/hook
execute as @e[type = armor_stand, tag = hook_as, tag = hook_ready] at @s run function avex:behavior/hook_behavior
execute at @e[predicate = avex:equipped_full_obsidian_armor, nbt = {HurtTime: 9s}] run function avex:events/obsidian_armor_hit

# Pipe Bomb
execute as @a[scores = {avex_drop = 1, avex_sneak = 1}] at @s as @e[type = item, nbt = {Age: 0s, Item:{tag:{custom_item:"pipe_bomb"}}}, distance = ..1] run data merge entity @s {Item:{tag:{thrown: 1b}}}

scoreboard players set @a[nbt = {OnGround: 1b}] avex_jump 0
scoreboard players set @a avex_sneak 0
scoreboard players set @a avex_m2 0
scoreboard players set @a avex_drop 0
scoreboard players set @a const 0
scoreboard players remove @a[scores = {es_cd1 = 1..}] es_cd1 1

tag @e[tag = hurt] remove hurt
tag @a remove equipped_pipe_bomb
tag @a remove equipped_defuser
tag @a remove equipped_sentry_spawner
tag @a remove equipped_katana
tag @a remove bloodlust_sword
tag @a remove using_rocket_boots

tag @a[nbt = {OnGround: 1b}] remove flight_expired