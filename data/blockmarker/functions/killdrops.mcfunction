$execute at @s as @e[type=item,distance=..1] run kill @s[nbt={PickupDelay:9s,Item:{id:"$(Item)"},Age:1s}]
$execute at @s as @e[type=item,distance=..1] run kill @s[nbt={PickupDelay:10s,Item:{id:"$(Item)"},Age:0s}]
execute at @s as @e[type=minecraft:experience_orb,distance=..1,nbt={Age:1s}] run kill @s
