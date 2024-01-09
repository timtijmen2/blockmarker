# Save and restore blockstate in Marker entities

This datapack can store block, block state and nbt data in marker's and place these back on command.
Its programmed to be as dynamic as posible and very easily implemented in other datapacks.

## How to use
The pack is made to be used in command creations and thus, requires some command knownledge.

There are a few functions that you can use in your pack:
- `blockmarker:get`
- `blockmarker:turnback`
- `blockmarker:killdrops`
----

### Function get:

The `blockmarker:get` function gets all block data from the block that the marker is in and converts the data so it can be used later.
All block data will be stored in the markers `data.block` nbt data.

#### How to use:
The function must always be executed as a marker.

Multiple markers can get their data at once.

Example:
`execute as @e[type=marker] at @s run function blockmarker:get`

----

### Function turnback:
The `blockmarker:turnback` function takes the `data.block` data from the marker and uses it to place the block with its old state and nbt data.

#### How to use:
The function places the block stored in the marker back at the markers location with its block state and nbt data.

Multiple markers can place their block at once.

Example:
`execute as @e[type=marker] at @s run function blockmarker:turnback`

_If you want to use a different set of data then `data.block` from the marker, you can use `blockmarker:placeblock` with the data set you want._

---


### Function killdrops:
The `blockmarker:killdrops` function is a extra option that removes the items that drop because a block around it breaks, with for example doors, lanterns, ect.

Its recommended you use it if you use this pack for buildings.

The function needs to get the data from `data.block` so it only removes items that are dropped when the block breaks.

Example:
`execute as @e[type=marker] at @s run function blockmarker:killdrops with entity @s data.block`

---

## Extra's

A small usefull pack to quickly place markers in a area: [Place marker Pack](https://github.com/timtijmen2/placemarker)

---

## Use Demo:

### Ghost house
1. Use a the [Place marker Pack](https://github.com/timtijmen2/placemarker) to place markers around your building.

2. Run command `/execute as @e[tag=blockmarker] at @s if block ~ ~ ~ air run kill @s` in chat to remove any unused markers.

3. Run command `/execute as @e[tag=blockmarker] at @s run function blockmarker:get` in chat to store the building.

4. Place a repeating command block with 2 chain command blocks.
   
   Repeat: `execute as @e[tag=blockmarker] at @s if entity @a[distance=..8] if block ~ ~ ~ air run function blockmarker:turnback`
   
   Chain1: `execute as @e[tag=blockmarker] at @s unless entity @a[distance=..8] unless block ~ ~ ~ air run setblock ~ ~ ~ air`
   
   Chain2: `execute as @e[tag=blockmarker] at @s if entity @e[type=item,distance=..1] run function blockmarker:killdrops with entity @s data.block`

---

#### Credit
This pack uses lootables from [https://github.com/Triton365/BlockState](https://github.com/Triton365/BlockState) to get blockstate data.
