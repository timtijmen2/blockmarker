gamerule maxCommandChainLength 1000000
scoreboard objectives add rewrite.index dummy

##clear data
data remove storage minecraft:stringchange input
data remove storage minecraft:stringchange output
data remove entity @s data.block



##Get Basic block Properties
execute at @s run summon armor_stand ~ ~ ~ {Tags:["safeblock"],Invulnerable:1b,NoGravity:1b,Invisible:1}
execute at @s positioned ~ ~ ~ run loot replace entity @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1] weapon loot blockmarker:get
execute as @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1] at @s run loot replace entity @s weapon.offhand mine ~ ~ ~
execute as @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1] run data modify storage stringchange input.block set from entity @s HandItems[0].tag.Properties
data modify entity @s data.block.Name set from entity @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1] HandItems[0].tag.Name
execute unless data entity @s data.block.State run data modify entity @s data.block.State set value ""
execute at @s run data modify entity @s data.block.NBT set from block ~ ~ ~
execute at @s run data modify entity @s data.block.NBT.Empty set value 1

##Find Related Item
data modify entity @s data.block.Item set from entity @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1] HandItems[1].id

##Start string converting
execute at @s run function blockmarker:convert/inputtostring with storage minecraft:stringchange input
execute at @s run kill @e[tag=safeblock,limit=1,sort=nearest,distance=..0.1]
