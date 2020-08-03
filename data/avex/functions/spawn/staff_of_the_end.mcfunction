# Spawn Staff of the End
recipe take @s avex:staff_of_the_end
advancement revoke @s only avex:unlocked_staff_of_the_end
clear @s minecraft:knowledge_book
give @s minecraft:carrot_on_a_stick{Count: 1b, CustomModelData: 8, HideFlags: 63, Unbreakable: 1b, RepairCost: 80000, custom_item: "end_staff", Enchantments:[{id:"minecraft:infinity", lvl: 1s}], display:{Name:'{"text":"Staff of the End","color":"#39d486","bold":true,"italic":false}', Lore:['{"text":"AvexPack Item","color":"gray","italic":false}', '{"text":"Placeholder.","color":"blue","italic":false}']}}