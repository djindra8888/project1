
local registered = {}

function getExtraInfo()
    return 'info'
end

CreateThread(function()
    Wait(1000)


    if not Config.UsePressE then

        local options = {}
        table.insert(
            options,
            {
                type = 'client',
                icon = "fa-solid fa-magnifying-glass",
                label = Config.Locales['search'],
                action = function(entity)
                    if GetEntityType(entity) == 1 and not IsPedAPlayer(entity) and IsPedHuman(entity) and IsPedDeadOrDying(entity,true) then
                        lootPed(entity)
                    end
                end,
                canInteract = function(entity)
                    if GetEntityType(entity) == 1 and not IsPedAPlayer(entity) and IsPedHuman(entity) and IsPedDeadOrDying(entity,true) then return true end
                    return false
                end
            }
        )

        local label2 = Config.Locales['search_animal'] 
        if not label2 then
            label2 = "-"..Config.Locales['search']
        end

        table.insert(
            options,
            {
                type = 'client',
                icon = "fa-solid fa-magnifying-glass",
                label = label2,
                action = function(entity)
                    if GetEntityType(entity) == 1 and not IsPedAPlayer(entity) and not IsPedHuman(entity) and IsPedDeadOrDying(entity,true) then        
                        lootAnimal(entity)
                    end
                end,
                canInteract = function(entity)
                    if GetEntityType(entity) == 1 and not IsPedAPlayer(entity) and not IsPedHuman(entity) and IsPedDeadOrDying(entity,true) then return true end
                    return false
                end
            }
        )

        if Config.UseTargetExport == "qtarget" then
            exports[Config.UseTargetExport]:Ped({
                options = options,
                distance = 4.0, 
            })
        elseif Config.UseTargetExport == "ox_target" then
            Config.UseTargetExport = "qtarget"
            
            exports[Config.UseTargetExport]:Ped({
                options = options,
                distance = 4.0, 
            })
        else
            exports[Config.UseTargetExport]:AddGlobalPed({
                options = options,
                distance = 4.0,
            })
        end

    end

    for k,v in pairs(Config.lootByHashTypeProps) do

        local options = {}

        table.insert(
            options,
            {
                type = 'client',
                icon = "fa-solid fa-magnifying-glass",
                label = Config.Locales['search'],
                action = function(entity)
                    propLoot(entity)
                end
            }
        )

        exports[Config.UseTargetExport]:AddTargetModel(k, {
            options = options,
            distance = 4.0
        })
    end
end)





if Config.UsePressE then

    local pedLoot = nil
    local pedLootType = nil
    CreateThread(function()
        while true do
            Wait(500)
            local peds = GetGamePool('CPed')
            local dist = 3.0
            local myCoords = GetEntityCoords(PlayerPedId())

            local currentPedLoot = nil
            local currentPedLootType = nil

            for k,v in pairs(peds) do
                if IsEntityDead(v) then
                    if IsPedHuman(v) then
                        if not IsPedAPlayer(v) then
                            local distance = #(myCoords - GetEntityCoords(v))
                            if distance < dist then
                                dist = distance
                                currentPedLoot = v
                                currentPedLootType = 'zombie'
                            end
                        end
                    else
                        local distance = #(myCoords - GetEntityCoords(v))
                        if distance < dist then
                            dist = distance
                            currentPedLoot = v
                            currentPedLootType = 'animal'
                        end
                    end
                end
            end 
            
            pedLoot = currentPedLoot
            pedLootType = currentPedLootType
        end
    end)

    function Draw3DText(x, y, z, scl_factor, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
        local scale = (1 / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        local scale = scale * fov * scl_factor
        if onScreen then
            SetTextScale(0.0, scale)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x, _y)
        end
    end

    CreateThread(function()
        while true do
            Wait(0)
            if pedLoot and not IsNuiFocused() then
                local coords = GetWorldPositionOfEntityBone(pedLoot,GetPedRagdollBoneIndex(pedLoot,1))
                Draw3DText(coords.x,coords.y,coords.z,0.5,"[E] to Search")
                if IsControlJustPressed(0,51) then
                    if pedLootType == 'animal' then
                        lootAnimal(pedLoot)
                    else
                        lootPed(pedLoot)
                    end
                    Wait(500)
                end
            end
        end
    end)

end


function ProgressBar(index)
    if not Config.UseProgressBar then
        return true
    end

    local ped = PlayerPedId()
 
    local statusValue = nil

    local animType = Config.ProgressBars[index]

    progressBarActive = true

    if GetResourceState('ox_lib') ~= 'missing' then 

        statusValue = exports.ox_lib:progressCircle({
            duration = animType.duration,
            position = 'middle',
            useWhileDead = false,
            canCancel = true,
            label = animType.label,
            disable = {
                car = true,
                combat = true,
                move = true,
            },
            anim = {
                dict = animType.animation.animDict,
                clip = animType.animation.anim,
                scenario = animType.animation.task
            },
            prop = animType.prop
        })

    elseif GetResourceState('mythic_progbar') ~= 'missing' then

        TriggerEvent("mythic_progbar:client:progress", {
            name = type,
            duration = animType.duration,
            label = animType.label,
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = animType.animation.animDict,
                anim = animType.animation.anim,
                task = animType.animation.task,
                flags = animType.animation.flags
            },
            prop = animType.prop
        }, function(status)
            statusValue = not status 
        end) 

        while statusValue == nil do
            Wait(10)
        end

    elseif GetResourceState('esx_progressbar') ~= 'missing' then
        
        if animType.animation.task then
            TaskStartScenarioInPlace(ped, animType.animation.task, 0, true)
        elseif animType.animation.animDict then
            RequestAnimDict(animType.animation.animDict)
            while not HasAnimDictLoaded(animType.animation.animDict) do 
                Wait(10)
            end

            TaskPlayAnim(ped, animType.animation.animDict, animType.animation.anim, 1.0, 1.0, -1, 1, 1.0, false,false,false)
            RemoveAnimDict(animType.animation.animDict)       
        end

        ESX.Progressbar(animType.label, animType.duration,{
            FreezePlayer = true, 
            animation ={},
            onFinish = function()
                statusValue = true
        end, onCancel = function()
                statusValue = false
        end})

        ClearPedTasks(ped)
        ClearPedTasksImmediately(ped)
        if animType.animation.animDict then
            StopAnimTask(ped, animType.animation.animDict, animType.animation.anim, 1.0)
        end

    elseif GetResourceState('qb-core') ~= 'missing' then

        if animType.animation.task then
            TaskStartScenarioInPlace(ped, animType.animation.task, 0, true)
        elseif animType.animation.animDict then
            RequestAnimDict(animType.animation.animDict)
            while not HasAnimDictLoaded(animType.animation.animDict) do 
                Wait(10)
            end

            TaskPlayAnim(ped, animType.animation.animDict, animType.animation.anim, 1.0, 1.0, -1, 1, 1.0, false,false,false)
            RemoveAnimDict(animType.animation.animDict)       
        end

        QBCore.Functions.Progressbar(index, animType.label,animType.duration, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done   
            statusValue = true 
        end, function() -- Cancel
            statusValue = false
        end)

        while statusValue == nil do
            Wait(10)
        end
    
        ClearPedTasks(ped)
        ClearPedTasksImmediately(ped)
        if animType.animation.animDict then
            StopAnimTask(ped, animType.animation.animDict, animType.animation.anim, 1.0)
        end

    end

    progressBarActive = false

    return statusValue
end