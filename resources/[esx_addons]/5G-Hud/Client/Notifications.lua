-- ███    ██  ██████  ████████ ██ ███████ ██    ██ 
-- ████   ██ ██    ██    ██    ██ ██       ██  ██  
-- ██ ██  ██ ██    ██    ██    ██ █████     ████   
-- ██  ██ ██ ██    ██    ██    ██ ██         ██    
-- ██   ████  ██████     ██    ██ ██         ██    
                                                
function Alert(type, title, msg, time)
    if Config.USENofity then
        SendNUIMessage({
            action = 'showNoti',
            type = type,
            title = title,
            msg = msg,
            time = time
        })
    else 
        SendNUIMessage({
            action = 'notifyhide2',
        })
    end
end

RegisterNetEvent('5G-Hud:Alert')
AddEventHandler('5G-Hud:Alert', function (type, title, msg, time)
    Alert(type, title, msg, time)
end)     

-- ███████  █████  ███████ ███████     ███████  ██████  ███    ██ ███████ 
-- ██      ██   ██ ██      ██             ███  ██    ██ ████   ██ ██      
-- ███████ ███████ █████   █████         ███   ██    ██ ██ ██  ██ █████   
--      ██ ██   ██ ██      ██           ███    ██    ██ ██  ██ ██ ██      
-- ███████ ██   ██ ██      ███████     ███████  ██████  ██   ████ ███████ 
                                                                       
                                                                       

function ZonaSegura(enable)
    SendNUIMessage({
        showZone = enable
    })
end

RegisterNetEvent('5G-Hud:INZone')
AddEventHandler('5G-Hud:INZone', function()
    if Config.USESafeZone then
	    ZonaSegura(true)
    end
end)

RegisterNetEvent('5G-Hud:OUTZone')
AddEventHandler('5G-Hud:OUTZone', function()
    if Config.USESafeZone then
	    ZonaSegura(false)
    end
end)
