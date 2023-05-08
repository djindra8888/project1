function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end


SetRoutingBucketPopulationEnabled(0,false)

if Config.useEntityLockdown then
    SetRoutingBucketEntityLockdownMode(0,'strict')
end


RegisterNetEvent('hrs_zombies:damageNest')
AddEventHandler('hrs_zombies:damageNest', function(index,hash)
    ---- source = id of the player who damaged a Nest
    ---- index = index on the Config.Nests table
    ---- hash = weapon hash
end)


AddEventHandler('hrs_zombies:killNestInfo', function(source,index)
    ---- source = id of the player who killed a Nest
    ---- index = index on the Config.Nests table
    print('ID '..source.." Killed Nest "..index)
end)
