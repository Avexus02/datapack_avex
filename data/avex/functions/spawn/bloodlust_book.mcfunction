# Spawn Bloodlust Book
recipe take @s avex:bloodlust_book
advancement revoke @s only avex:unlocked_bloodlust_book
clear @s minecraft:knowledge_book
give @s minecraft:enchanted_book{Count: 1b, HideFlags: 63, bloodlust_book: 1b, display:{Lore:['{"text":"Bloodlust I","color":"gray","italic":false}']}}