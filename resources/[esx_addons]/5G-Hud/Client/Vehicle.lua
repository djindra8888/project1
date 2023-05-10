-- ██    ██ ███████ ██   ██ ██  ██████ ██      ███████ 
-- ██    ██ ██      ██   ██ ██ ██      ██      ██      
-- ██    ██ █████   ███████ ██ ██      ██      █████   
--  ██  ██  ██      ██   ██ ██ ██      ██      ██      
--   ████   ███████ ██   ██ ██  ██████ ███████ ███████ 
                                                    
                                                    

if Config.USECarHUD then
    
    local cinturon = false 
    local bateria = true


    function Cinturon(ped)

        while true do 
            if cinturon then 
                DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
                DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            else
                Citizen.Wait(1000)
            end
            Citizen.Wait(0)
        end
    end


    Citizen.CreateThread(function()
        while true do 
            ped = PlayerPedId()
            if Config.SpeedMeter == "kmh" then
                SpeedMultiplier = 3.6
                SendNUIMessage({action = 'speed1'})
            elseif Config.SpeedMeter == "mph" then
                SpeedMultiplier = 2.2
                SendNUIMessage({action = 'speed2'})
            end
            Wait(100)
            if IsPedInAnyVehicle(ped) then
                _sleep = 200
                local vehiculo = GetVehiclePedIsUsing(ped)
                local velo = (GetEntitySpeed(vehiculo)* SpeedMultiplier)
                local gaso = Config.GetFuel(vehiculo)
                local position = GetEntityCoords(ped)
                local carhealth = GetVehicleBodyHealth(vehiculo)/10
                local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
                if Config.MinimapJustInCar == true then 
                    DisplayRadar(true)
                end
                SendNUIMessage({
                    action = 'showCarhud';
                    vel = velo; 
                    gasolina = gaso;
                    street = streetName;
                    cinturon = cinturon;
                    bateria = bateria;
                    vidav  = carhealth;
                })
            else
                if Config.MinimapJustInCar then 
                    DisplayRadar(false)
                    _sleep = 1000
                    SendNUIMessage({
                        action = 'hideCarhud';
                    })
                    SendNUIMessage({action = 'HideMap'})
                else
                    DisplayRadar(true)
                    _sleep = 1000
                    --if Config.Map == true then
                        SendNUIMessage({action = 'ShowMap'})
                   -- end
                    SendNUIMessage({
                        action = 'hideCarhud';
                    })
                end

            end
            Wait(_sleep)
        end
    end)

    function EngineControl()
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= nil and veh ~= 0 and GetPedInVehicleSeat(veh, 0) then
        if GetIsVehicleEngineRunning(veh) then
                SetVehicleEngineOn(veh, false, false, true)
                bateria = false
            -- apagaste el motor
        else
                SetVehicleEngineOn(veh, true, false, true)
                bateria = true
            -- Prendiste el motor
        end
        end
    end

    RegisterCommand('offmotor', function ()
        EngineControl()
    end)

    RegisterCommand('belt', function ()
        local jugador = PlayerPedId()
        if IsPedInAnyVehicle(jugador) then
            if cinturon then 
                --Notificacion de que se quito cinturon
                cinturon = false
                Cinturon(jugador)
            else
                --Notificacion de que se puso cinturon
                cinturon = true
                Cinturon(jugador)
            end
        end
    end)


    RegisterKeyMapping('belt', 'Car Belt', 'keyboard', Config.BeltKey)
    RegisterKeyMapping('offmotor', 'Turn ON/OFF the car', 'keyboard', Config.ONandOFFMotorKey)
    
end    
