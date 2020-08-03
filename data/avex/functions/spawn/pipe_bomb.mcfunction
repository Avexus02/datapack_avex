# Spawn Rocket Boots
recipe take @s avex:pipe_bomb
advancement revoke @s only avex:unlocked_pipe_bomb
clear @s minecraft:knowledge_book
give @s minecraft:carrot_on_a_stick{CustomModelData: 3, HideFlags: 63, Unbreakable: 1b, RepairCost: 80000, custom_item: "pipe_bomb", display:{Name:'{"text":"Pipe Bomb","color":"red","bold":true,"italic":false}', Lore:['{"text":"AvexPack Item","color":"gray","italic":false}', '{"text":"Hold sneak and throw to activate.","color":"blue","italic":false}', '{"text":"Attracts zombies and illagers.","color":"dark_gray","italic":false}', '{"text":"Detonates after thirty seconds.","color":"dark_gray","italic":false}']}}