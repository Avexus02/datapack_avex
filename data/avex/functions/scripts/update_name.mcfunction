scoreboard players operation #current pb_timer = @s pb_timer
scoreboard players operation #current pb_timer /= 2 const
data modify block -30000000 200 3000 Text1 set value '{"score":{"name":"#current","objective":"pb_timer"},"color":"red","bold":true,"italic":false}'
data modify entity @s CustomName set from block -30000000 200 3000 Text1