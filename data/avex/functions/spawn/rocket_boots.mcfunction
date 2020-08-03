# Spawn Rocket Boots
recipe take @s avex:rocket_boots
advancement revoke @s only avex:unlocked_rocket_boots
clear @s minecraft:knowledge_book
give @s minecraft:iron_boots{Count: 1b, CustomModelData: 1, HideFlags: 63, Unbreakable: 1b, RepairCost: 80000, custom_item: "rocket_boots", Enchantments:[{id:"minecraft:feather_falling", lvl: 4s}], display:{Name:'{"text":"Rocket Boots","color":"#44AEFF","bold":true,"italic":false}', Lore:['{"text":"AvexPack Item","color":"gray","italic":false}', '{"text":"Jump hold sneak to activate.","color":"blue","italic":false}', '{"text":"Allows three seconds of flight.","color":"dark_gray","italic":false}', '{"text":"Reduces fall damage.","color":"dark_gray","italic":false}']}}