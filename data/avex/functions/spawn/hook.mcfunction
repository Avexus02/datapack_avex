# Spawn Hook
recipe take @s avex:hook
advancement revoke @s only avex:unlocked_hook
clear @s minecraft:knowledge_book
give @s minecraft:carrot_on_a_stick{Count: 1b, CustomModelData: 1, HideFlags: 63, Unbreakable: 1b, RepairCost: 80000, custom_item: "hook", display:{Name:'{"text":"Hook","color":"white","bold":false,"italic":false}', Lore:['{"text":"AvexPack Item","color":"gray","italic":false}', '{"text":"Hold in offhand and right click to throw.","color":"blue","italic":false}', '{"text":"Pulls in enemies.","color":"dark_gray","italic":false}', '{"text":"Has a reach of 18 blocks.","color":"dark_gray","italic":false}']}}