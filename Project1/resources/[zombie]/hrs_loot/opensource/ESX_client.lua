if Config.Framework == "ESX" then

    ESX = exports["es_extended"]:getSharedObject()

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        TriggerServerEvent('hrs_loot:lists')
    end)

    function ShowNotification(text)
        ESX.ShowNotification(text)
    end


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
    
        if GetResourceState('ox_lib') ~= 'missing' then
            for k,v in pairs(list) do
                table.insert(elements,{
                    icon = 'hand',
                    title = v.label.." x"..v.count,
                    event = 'hrs_zombies:menuevent',
                    args = {
                        id = id,
                        value = k
                    },
                    description = Config.Locales["click_get_item"]
                })
            end

            table.insert(elements,{
                icon = 'hand',
                title = Config.Locales["get_all"],
                event = 'hrs_zombies:menuevent2',
                args = {
                    id = id,
                },
                description = Config.Locales["click_get_items"],
            })

            exports.ox_lib:registerContext({
                id = 'loot_menu',
                title = 'Loot Menu',
                options = elements
            })

            exports.ox_lib:showContext('loot_menu')
        elseif GetResourceState('esx_context') ~= 'missing' then
            for k,v in pairs(list) do
                table.insert(elements,{
                    icon = "fa-regular fa-hand",
                    title = v.label.." x"..v.count,
                    value = k,
                    description = Config.Locales["click_get_item"]
                })
            end

            table.insert(elements,{
                icon = "fa-regular fa-hand",
                title = Config.Locales["get_all"],
                value = "all_items_list",
                description = Config.Locales["click_get_items"]
            })
                
            exports["esx_context"]:Open("center" , elements,
            function(menu,element) -- On Select Function

                if lastEntity then

                    if element.value == "all_items_list" then
                        TriggerServerEvent('hrs_zombies:getLootAll',id)
                    else
                        TriggerServerEvent('hrs_zombies:getLoot',id,element.value)
                    end

                end
            

                exports["esx_context"]:Close()

            end, function(menu) -- on close

            end)
        else
            for k,v in pairs(list) do
                table.insert(elements,{label = v.label.." x"..v.count,value = k})
            end

            table.insert(elements,{label = Config.Locales["get_all"],value = "all_items_list"})
    
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'loot_menu', {
                title = "Get Item",
                align = 'top-left',
                elements = elements
            }, function(data, menu)
                menu.close()

                if lastEntity then

                    if data.current.value == "all_items_list" then
                        TriggerServerEvent('hrs_zombies:getLootAll',id)
                    else
                        TriggerServerEvent('hrs_zombies:getLoot',id,data.current.value)
                    end

                end
            end, function(data, menu)
                menu.close()
            end)
        end
    end)

end








