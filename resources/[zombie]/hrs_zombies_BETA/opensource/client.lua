disableSounds = false
zombiesNumber = 0
isDay = false

bossNumber = 0
bossModels = {}


protectionTime = 0
gasProtectionTime = 0
extraSmellTime = 0
extraSmellRadious = 0.0

canSpawnPeds = false

CreateThread(function()
    while true do
        if protectionTime ~= 0 then
            protectionTime = protectionTime - 1
        end
        if gasProtectionTime ~= 0 then
            gasProtectionTime = gasProtectionTime - 1
        end
        if extraSmellTime ~= 0 then
            extraSmellTime = extraSmellTime - 1
            if extraSmellTime == 0 then
                extraSmellRadious = 0.0
            end
        end
        Wait(1000)
    end
end)

function setProtectionTime(value)
    protectionTime = value
end

function addProtectionTime(value)
    protectionTime = protectionTime + value
end

function getProtectionTime()
    return protectionTime 
end

function setGasProtectionTime(value)
    gasProtectionTime = value
end

function addGasProtectionTime(value)
    gasProtectionTime = gasProtectionTime + value
end

function getGasProtectionTime()
    return gasProtectionTime 
end

function setExtraSmellTime(value,radious)
    extraSmellTime = value
    if not radious then radious = 10.0 end
    extraSmellRadious = radious
end

function addExtraSmellTime(value)
    extraSmellTime = extraSmellTime + value
end

function getExtraSmellTime()
    return extraSmellTime 
end

exports("setExtraSmellTime", setExtraSmellTime)
exports("addExtraSmellTime", addExtraSmellTime)
exports("getExtraSmellTime", getExtraSmellTime)

exports("setProtectionTime", setProtectionTime)
exports("addProtectionTime", addProtectionTime)
exports("getProtectionTime", getProtectionTime)

exports("setGasProtectionTime", setGasProtectionTime)
exports("addGasProtectionTime", addGasProtectionTime)
exports("getGasProtectionTime", getGasProtectionTime)

hashList = {}

local debugTab = {}
for k,v in pairs(Config.specialZombiesSpecs) do
    local theHash = GetHashKey(k)
    bossModels[theHash] = true
    hashList[k] = theHash
    debugTab[theHash] = v
end
Config.specialZombiesSpecs = debugTab


CreateThread(function()
	StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
	SetAudioFlag("PoliceScannerDisabled", true)
end)

function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

function canBeZombie(entity)
    return true
end

CreateThread(function()
    while true do
        local peds = GetGamePool('CPed')
        local num = 0
        for k,v in ipairs(peds) do
            if not IsPedAPlayer(v) then
                if not IsPedDeadOrDying(v,true) then
                    if bossModels[GetEntityModel(v)] then
                        num = num + 1
                    end
                end
            end
        end
        bossNumber = num
        
        Wait(500)
    end
end)

function effectHandler(asset,name,coords,time,r,g,b,a,scale)

    if not HasNamedPtfxAssetLoaded(asset) then

        RequestNamedPtfxAsset(asset)
        while not HasNamedPtfxAssetLoaded(asset) do
            Citizen.Wait(1)
        end
    end

    SetPtfxAssetNextCall(asset)

    local x = coords.x
    local y = coords.y
    local z = coords.z

    local fx = StartParticleFxLoopedAtCoord(name, x, y, z, 0.0, 0.0, 0.0,scale, false, false, false, false)
    SetParticleFxLoopedColour(fx, r, g, b, 0)
    SetParticleFxLoopedAlpha(fx, a)
    Wait(time)
    StopParticleFxLooped(fx, 0)
end

function effectHandlerEntity(asset,name,entity,time,r,g,b,a,scale)
    CreateThread(function()
        if not HasNamedPtfxAssetLoaded(asset) then

            RequestNamedPtfxAsset(asset)
            while not HasNamedPtfxAssetLoaded(asset) do
                Citizen.Wait(1)
            end
        end
    
        SetPtfxAssetNextCall(asset)
    
        local fx = StartParticleFxLoopedOnEntity(name,entity, 0.0,0.0, 0.0, 0.0, 0.0, 0.0,scale, false, false, false, false)
        SetParticleFxLoopedColour(fx, r, g, b, 0)
        SetParticleFxLoopedAlpha(fx, a)
        Wait(time)
        StopParticleFxLooped(fx, 0)
    end)
end

function poisonGasPtfx(entity)
    effectHandlerEntity('core','exp_grd_rpg_post',entity,1000,0.0,10.0,0.0,1.0,1.0)
end

function eletricPtfx(entity)
    effectHandlerEntity('core','ent_dst_elec_crackle',entity,1000,0.0,10.0,0.0,1.0,5.0)
end

function firePtfx(entity)
    effectHandlerEntity('core','ent_amb_fbi_fire_beam',entity,1000,0.0,10.0,0.0,1.0,1.0)
end

function firePtfxAttack(entity)
    effectHandlerEntity('core','ent_amb_fbi_fire_beam',entity,1000,0.0,10.0,0.0,1.0,5.0)
end

function nestPtfx(entity)
    effectHandlerEntity('core','exp_grd_rpg_post',entity,1000,0.0,10.0,0.0,1.0,1.0)
end

function onNestAttackPed(entity,ped,damage)
    if gasProtectionTime == 0 then
        ApplyDamageToPed(ped, damage, false)
       
    end
end


AddEventHandler('onZombieDied', function(entity)

end)

AddEventHandler('onAnimalDied', function(entity)

end)

function onZombiePoisonPed(zombie,ped,damage)
    if gasProtectionTime == 0 then
        ApplyDamageToPed(ped, damage, false)
    end
end

function onZombieFirePed(zombie,ped,damage)
    CreateThread(function()
        StartEntityFire(ped)
        local time = 10
        while time > 0 do
            Wait(100)
            ApplyDamageToPed(ped, damage, false)  
            time = time - 1
        end
        StopEntityFire(ped)
    end)
end



function onZombieElectrocutePed(zombie,ped,damage)   
    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
    eletricPtfx(ped)
    ApplyDamageToPed(ped, damage, false)  
end

function onZombiePoisonVehicle(zombie,vehicle,damage)
    SetVehicleEngineHealth(vehicle,-4000.0)
end

function onZombieScream(zombie,radius)
    setExtraSmellTime(30,radius)
    print("screaming")
    -- CreateThread(function()
    --     local id = GetSoundId()
    --     RequestScriptAudioBank('NIGEL_02_SOUNDSET', false)
    --     PlaySoundFromEntity(id, "SCREAMS", zombie, 'NIGEL_02_SOUNDSET', 0, 0)
    --     while not HasSoundFinished(id) do
    --         Wait(100)
    --     end
    --     ReleaseSoundId(id)  
    --     print("releases")   
    -- end)
end

function onZombieFireVehicle(zombie,vehicle,damage)
    CreateThread(function()
        StartEntityFire(vehicle)
        Wait(1000)
        StopEntityFire(vehicle)
    end)
    --SetVehicleEngineHealth(vehicle,-4000.0)
end

function onZombieElectrocuteVehicle(zombie,vehicle,damage)
    eletricPtfx(vehicle)
    SetVehicleEngineOn(vehicle,false,true,false)
   -- print("eletrocute veh")
    SetVehicleEngineHealth(vehicle,-4000.0)
    
    --if IsEntityTouchingEntity(zombie,vehicle) then
        --ExplodeVehicle(vehicle,false,true)
    --end
end

function onZombieAttackPed(zombie,ped,damage)
    ApplyDamageToPed(ped, damage, false)
    if Config.ragdollOnZombieAttackProbability then
        local rdm = math.random(1,100)

        if rdm <= Config.ragdollOnZombieAttackProbability then 
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
        end
    end
end

function onZombieAttackVehicle(zombie,vehicle,damage,zombieCoords)
    if Config.zombieVehicleExternalDamage then
        local vec = GetOffsetFromEntityGivenWorldCoords(vehicle,zombieCoords.x,zombieCoords.y,zombieCoords.z)  
        SetVehicleDamage(vehicle, vec.x, vec.y, vec.z, damage * 10.0, 100.0, true)
    end
    SetVehicleEngineHealth(vehicle,GetVehicleEngineHealth(vehicle) - damage)

end


RegisterCommand('stopzombiesound', function()
    disableSounds = not disableSounds
end, false)

RegisterKeyMapping('stopzombiesound', 'Toggle Zombie sounds', 'keyboard', 'k')

function isInRedZoneCoords(coords)
    local defaulRedzone = nil
    local specialRedzone = nil

    for k,v in pairs(Config.redZones) do
        if #(v.coords.xy - coords.xy) < v.radious then
            if v.bosses then
                specialRedzone = k
            else
                defaulRedzone = k
            end
        end
    end

    if specialRedzone then
        return specialRedzone
    elseif defaulRedzone then
        return defaulRedzone
    else
        return false
    end
end

function isInSafeZoneCoords(coords)
    for k,v in pairs(Config.noSpawnZones) do
        if #(v.coords.xy - coords.xy) < v.radious then
            return true
        end
    end
    return false
end

function isInSafeZone(entity,coords)
    for k,v in pairs(Config.noSpawnZones) do
        if #(v.coords.xy - coords.xy) < v.radious then
            return true
        end
    end
    return false
end

function isInRedZone(entity,coords)
    for k,v in pairs(Config.redZones) do
        if #(v.coords.xy - coords.xy) < v.radious then
            return k
        end
    end
    return false
end



pedMult = 1.0
animalMult = 1.0

CreateThread(function()
    while true do
        Wait(500)
        local hours = GetClockHours()
        if hours > 8 and hours < 20 then
            isDay = true
            pedMult = Config.dayMult
            animalMult = Config.dayMultAnimals
        else
            isDay = false
            pedMult = Config.nightMult
            animalMult = Config.nightMultAnimals
        end
    end
end)



CreateThread(function()
    if Config.safeZoneBlips then
        for k,v in ipairs(Config.noSpawnZones) do
            if not v.hiden then

                local x,y,z = table.unpack(v.coords)
                local blip = AddBlipForRadius(x,y,z, v.radious)
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.safeZoneBlips.color)
                SetBlipAlpha (blip, Config.safeZoneBlips.alpha)
                SetBlipAsShortRange(blip, Config.safeZoneBlips.shortRange)
                local blip2 = AddBlipForCoord(x,y,z) 
                SetBlipSprite(blip2, Config.safeZoneBlips.sprite)
                SetBlipScale(blip2, Config.safeZoneBlips.scale)
                SetBlipAsShortRange(blip2, Config.safeZoneBlips.shortRange)
                SetBlipColour(blip2,Config.safeZoneBlips.color)
                BeginTextCommandSetBlipName('STRING')
                if v.label then
                    AddTextComponentSubstringPlayerName(v.label)
                else
                    AddTextComponentSubstringPlayerName(Config.safeZoneBlips.label)
                end
                EndTextCommandSetBlipName(blip2)

            end
        end
    end

    if Config.RedZoneBlips then
        for k,v in ipairs(Config.redZones) do
            if not v.hiden then
                local x,y,z = table.unpack(v.coords)
                local blip = AddBlipForRadius(x,y,z, v.radious)
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.RedZoneBlips.color)
                SetBlipAlpha (blip, Config.RedZoneBlips.alpha)
                SetBlipAsShortRange(blip, Config.RedZoneBlips.shortRange)
                local blip2 = AddBlipForCoord(x,y,z) 
                SetBlipSprite(blip2, Config.RedZoneBlips.sprite)
                SetBlipScale(blip2, Config.RedZoneBlips.scale)
                SetBlipAsShortRange(blip2, Config.RedZoneBlips.shortRange)
                SetBlipColour(blip2,Config.RedZoneBlips.color)
                BeginTextCommandSetBlipName('STRING')
                if v.label then
                    AddTextComponentSubstringPlayerName(v.label)
                else
                    AddTextComponentSubstringPlayerName(Config.RedZoneBlips.label)
                end
                EndTextCommandSetBlipName(blip2)
            end
        end
    end


    for k,v in pairs(Config.Nests) do
        if v.blip then
            local x,y,z = table.unpack(v.coords)
            local blip = AddBlipForRadius(x,y,z, v.blip.radious)
            SetBlipHighDetail(blip, true)
            SetBlipColour(blip, v.blip.color)
            SetBlipAlpha (blip, v.blip.alpha)
            SetBlipAsShortRange(blip, v.blip.shortRange)
            local blip2 = AddBlipForCoord(x,y,z) 
            SetBlipSprite(blip2, v.blip.sprite)
            SetBlipScale(blip2, v.blip.scale)
            SetBlipAsShortRange(blip2, v.blip.shortRange)
            SetBlipColour(blip2,v.blip.color)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.blip.label)
            EndTextCommandSetBlipName(blip2)
        end
    end

end)


if not Config.useEntityLockdown then
    CreateThread(function()
        while true do
            Wait(0)
            SetVehiclePopulationBudget(0)
            SetPedPopulationBudget(0)
        end
    end)
end


function isMyPedDead(myPed)
    return IsPedDeadOrDying(myPed,true)
end


if GetResourceState('es_extended') ~= 'missing' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        canSpawnPeds = true
    end)
elseif GetResourceState('qb-core') ~= 'missing' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
        canSpawnPeds = true
    end)
else
    canSpawnPeds = true
end

RegisterNetEvent('hrs_zombies:canSpawnPeds')
AddEventHandler('hrs_zombies:canSpawnPeds', function()
    canSpawnPeds = true
end)




