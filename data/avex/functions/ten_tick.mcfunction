# Apply the tags. Ensure this is among the first functions executed.
function avex:scripts/apply_tags

# Pipe Bomb
function avex:items/pipe_bomb

# Clean up stranded Armor Stands.
tag @e[type = armor_stand, tag = es_as1, nbt = {HurtTime: 0s}] add dead

# Update UUID Score
execute as @a store result score @s uuid run data get entity @s UUID[0] 1
scoreboard players add @a hook_cd 0
scoreboard players add @a avex_flight_time 0
scoreboard players remove @a[scores = {hook_cd = 1..}] hook_cd 1

effect give @a[predicate = avex:equipped_retribution, scores = {avex_hp = ..4}] strength 1 0 true

execute as @a run attribute @s minecraft:generic.attack_speed modifier remove a-0-0-0-0
execute as @a[predicate = avex:equipped_shadowstalker, predicate = avex:in_darkness] run attribute @s minecraft:generic.attack_speed modifier add a-0-0-0-0 Shadowstalker 0.2

execute at @e[type = item, tag = dropped_sword] as @e[type = item, distance = ..1, sort = nearest, limit = 1, nbt = {Item:{Count: 1b, tag:{bloodlust_book: 1b}}}] run tag @s add bl_book
execute at @e[type = item, tag = bl_book] as @e[type = item, tag = dropped_sword, distance = ..1, sort = nearest, limit = 1] run data merge entity @s {Item:{tag:{enchant_bloodlust: 1b, Enchantments:[{id:1}], display:{Lore:['{"text":"Bloodlust I","color":"gray","italic":false}']}}}}
execute at @e[type = item, tag = bl_book] run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1 1
execute at @e[type = item, tag = bl_book] run particle minecraft:smoke ~ ~ ~ 0 0 0 0.025 50 force
kill @e[type = item, tag = bl_book]

execute at @e[type = item, tag = dropped_sword] as @e[type = item, distance = ..1, sort = nearest, limit = 1, nbt = {Item:{Count: 1b, tag:{retribution_book: 1b}}}] run tag @s add rt_book
execute at @e[type = item, tag = rt_book] as @e[type = item, tag = dropped_sword, distance = ..1, sort = nearest, limit = 1] run data merge entity @s {Item:{tag:{enchant_retribution: 1b, Enchantments:[{id:1}], display:{Lore:['{"text":"Bloodlust I","color":"gray","italic":false}']}}}}
execute at @e[type = item, tag = rt_book] run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1 1
execute at @e[type = item, tag = rt_book] run particle minecraft:smoke ~ ~ ~ 0 0 0 0.025 50 force
kill @e[type = item, tag = rt_book]

execute at @e[type = item, tag = dropped_sword] as @e[type = item, distance = ..1, sort = nearest, limit = 1, nbt = {Item:{Count: 1b, tag:{shadowstalker_book: 1b}}}] run tag @s add ss_book
execute at @e[type = item, tag = ss_book] as @e[type = item, tag = dropped_sword, distance = ..1, sort = nearest, limit = 1] run data merge entity @s {Item:{tag:{enchant_shadowstalker: 1b, Enchantments:[{id:1}], display:{Lore:['{"text":"Bloodlust I","color":"gray","italic":false}']}}}}
execute at @e[type = item, tag = ss_book] run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1 1
execute at @e[type = item, tag = ss_book] run particle minecraft:smoke ~ ~ ~ 0 0 0 0.025 50 force
kill @e[type = item, tag = ss_book]

schedule function avex:ten_tick 10t