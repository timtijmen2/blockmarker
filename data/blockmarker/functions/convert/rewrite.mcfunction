
$data modify storage minecraft:stringchange output.char set string storage minecraft:stringchange output.state $(1) $(2)
$execute store success score end rewrite.index run data modify storage minecraft:stringchange output.old set string storage minecraft:stringchange output.state 0 $(2)

execute if data storage minecraft:stringchange {output:{char:"{"}} run data modify storage minecraft:stringchange output.char set value "["
execute if data storage minecraft:stringchange {output:{char:"}"}} run data modify storage minecraft:stringchange output.char set value "]"
execute if data storage minecraft:stringchange {output:{char:":"}} run data modify storage minecraft:stringchange output.char set value "="
execute if data storage minecraft:stringchange {output:{char:"\""}} run data modify storage minecraft:stringchange output.char set value ""
execute if score end rewrite.index matches 1 run function blockmarker:convert/addchar with storage minecraft:stringchange output


scoreboard players add index1 rewrite.index 1
scoreboard players add index2 rewrite.index 1
execute store result storage minecraft:stringchange output.index.1 int 1 run scoreboard players get index1 rewrite.index
execute store result storage minecraft:stringchange output.index.2 int 1 run scoreboard players get index2 rewrite.index
execute if score end rewrite.index matches 0 run data remove storage minecraft:stringchange output.old
execute if score end rewrite.index matches 1 run function blockmarker:convert/rewrite with storage minecraft:stringchange output.index