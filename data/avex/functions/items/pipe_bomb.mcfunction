# Pipe Bomb

tag @e[type = item, tag = !defused, nbt = {OnGround: 1b, Item:{tag:{custom_item:"pipe_bomb", thrown: 1b}}}] add pipe_bomb
execute at @e[type = item, tag = pipe_bomb] run particle smoke ~ ~0.5 ~ 0.1 0.1 0.1 0.01 1 force
execute at @e[type = item, scores = {pb_timer = ..20}] run particle flame ~ ~0.5 ~ 0.1 0.1 0.1 0.01 1 force

execute as @e[type = item, tag = pipe_bomb] unless score @s pb_timer matches ..2147483647 run scoreboard players set @s pb_timer 60

# Initiate the bomb.
execute as @e[type = item, scores = {pb_timer = 60}] run data merge entity @s {Invulnerable: 1b, CustomNameVisible: 1b, Age: 4800s, PickupDelay: 32767s}
execute as @e[type = item, scores = {pb_timer = 60}] run summon villager 0 -100 0 {NoAI: 1b, Silent: 1b, AgeLocked: 1b, Age: -2147483648, ArmorItems:[{id:"leather_boots", Count:1b}, {id:"leather_leggings", Count:1b}, {id:"leather_chestplate", Count:1b}, {id:"leather_helmet", Count:1b}], ActiveEffects:[{Id: 14, Duration: 800s, ShowParticles: 0b}, {Id: 10, Duration: 800s, Amplifier: 100, ShowParticles: 0b}, {Id: 11, Duration: 800s, Amplifier: 5, ShowParticles: 0b}], Tags:["pb_tp", "pb_kill"]}
execute as @e[type = item, scores = {pb_timer = 60}] run summon husk 0 -100 0 {NoAI: 1b, Silent: 1b, IsBaby: 1b, ActiveEffects:[{Id: 14, Duration: 800s, ShowParticles: 0b}, {Id: 10, Duration: 800s, Amplifier: 100, ShowParticles: 0b}, {Id: 11, Duration: 800s, Amplifier: 5, ShowParticles: 0b}], Tags:["pb_tp", "pb_kill"]}
execute at @e[type = item, scores = {pb_timer = 60}] run tp @e[tag = pb_tp] ~ ~-0.5 ~
execute at @e[type = item, scores = {pb_timer = 60}] as @e[tag = pb_tp, distance = ..2] run tag @s remove pb_tp

# Tick down the bomb.
execute at @e[type = item, tag = !defused, scores = {pb_timer = 21..}] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.2 1.25
execute at @e[type = item, tag = !defused, scores = {pb_timer = ..20}] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.5 1.3

scoreboard players remove @e[scores = {pb_timer = 1..}] pb_timer 1

# Detonate the bomb.
execute as @e[type = item, scores = {pb_timer = 0}] run summon creeper 0 -100 0 {Fuse: 1s, ignited: 1b, Tags:["pb_creeper"]}
execute at @e[type = item, scores = {pb_timer = 0}] unless entity @e[tag = pb_creeper, distance = ..2] run tp @e[tag = pb_creeper] ~ ~ ~
execute at @e[type = item, scores = {pb_timer = 0}] run tp @e[tag = pb_kill, distance = ..2] 0 -100 0
kill @e[type = item, scores = {pb_timer = 0}]
execute positioned 0 -100 0 run kill @e[tag = pb_kill, distance = ..2] 

execute as @e[type = item, tag = pipe_bomb] run function avex:scripts/update_name
execute as @e[type = item, tag = pipe_bomb] run data modify entity @s Item.tag.CustomModelData set value 2