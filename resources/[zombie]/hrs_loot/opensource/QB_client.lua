if Config.Framework == "QB" then

    QBCore = exports['qb-core']:GetCoreObject()

    function ShowNotification(text)
        QBCore.Functions.Notify(text)
    end

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
        TriggerServerEvent('hrs_loot:lists')
    end)

    AddEventHandler('hrs_zombies:menuevent', function(data)
        if lastEntity then
            TriggerServerEvent('hrs_zombies:getLoot',data.id, data.value)
        end
    end)

    AddEventHandler('hrs_zombies:menuevent2', function(data)
        if lastEntity then
            TriggerServerEvent('hrs_zombies:getLootAll',data.id)
        end
    end)

    RegisterNetEvent('hrs_zombies:openLootMenu')
    AddEventHandler('hrs_zombies:openLootMenu', function(id,list)
        local elements = {}

        for k,v in pairs(list) do
            table.insert(elements,{
                header = v.label.." x"..v.count,
                params = {
                    event = "hrs_zombies:menuevent",
                    args = {
                        id = id,
                        value = k
                    }
                },
                txt = Config.Locales["click_get_items"]
            })
        end

        table.insert(elements,{
            header = Config.Locales["get_all"],
            params = {
                event = "hrs_zombies:menuevent2",
                args = {
                    id = id
                }
            },
            txt = Config.Locales["click_get_items"]
        })

        exports["qb-menu"]:openMenu(elements)
    
    end)

    -- function ProgressBar(index)
    --     if not Config.UseProgressBar then
    --         return true
    --     end
    
    --     local ped = PlayerPedId()
     
    --     local statusValue = nil
    
    --     local animType = Config.ProgressBars[index]

    --     if animType.animation.task then
    --         TaskStartScenarioInPlace(ped, animType.animation.task, 0, true)
    --     elseif animType.animation.animDict then
    --         RequestAnimDict(animType.animation.animDict)
    --         while not HasAnimDictLoaded(animType.animation.animDict) do 
    --             Wait(10)
    --         end

    --         TaskPlayAnim(ped, animType.animation.animDict, animType.animation.anim, 1.0, 1.0, -1, 1, 1.0, false,false,false)
    --         RemoveAnimDict(animType.animation.animDict)       
    --     end


    --     QBCore.Functions.Progressbar(index, animType.label,animType.duration, false, true, {
    --         disableMovement = true,
    --         disableCarMovement = true,
    --         disableMouse = false,
    --         disableCombat = true,
    --     }, {}, {}, {}, function() -- Done   
    --         statusValue = true 
    --     end, function() -- Cancel
    --         statusValue = false
    --     end)

    --     while statusValue == nil do
    --         Wait(10)
    --     end
    
    --     ClearPedTasks(ped)
    --     ClearPedTasksImmediately(ped)
    --     if animType.animation.animDict then
    --         StopAnimTask(ped, animType.animation.animDict, animType.animation.anim, 1.0)
    --     end
    --     return statusValue
    -- end

end








