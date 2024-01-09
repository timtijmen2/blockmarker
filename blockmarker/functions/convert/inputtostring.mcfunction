$data merge storage minecraft:stringchange {output:{state:'$(block)'}}
scoreboard players set index1 rewrite.index 0
scoreboard players set index2 rewrite.index 1
execute store result storage minecraft:stringchange output.index.1 int 1 run scoreboard players get index1 rewrite.index
execute store result storage minecraft:stringchange output.index.2 int 1 run scoreboard players get index2 rewrite.index
data merge storage minecraft:stringchange {output:{block:""}}
function blockmarker:convert/rewrite with storage minecraft:stringchange output.index
data modify entity @s data.block.State set from storage minecraft:stringchange output.block