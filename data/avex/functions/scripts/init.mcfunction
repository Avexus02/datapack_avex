# Avex
# Fires once upon the datapack initializing, hence "init".

function avex:scripts/install

tellraw @a {"text":"Initialized!"}

scoreboard players set $init avex_initialized 1