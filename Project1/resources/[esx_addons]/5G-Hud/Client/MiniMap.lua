-- ███    ███ ██ ███    ██ ██     ███    ███  █████  ██████  
-- ████  ████ ██ ████   ██ ██     ████  ████ ██   ██ ██   ██ 
-- ██ ████ ██ ██ ██ ██  ██ ██     ██ ████ ██ ███████ ██████  
-- ██  ██  ██ ██ ██  ██ ██ ██     ██  ██  ██ ██   ██ ██      
-- ██      ██ ██ ██   ████ ██     ██      ██ ██   ██ ██      
                                                          
                                                          

if Config.USECarHUD then
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    Citizen.CreateThread(function()
        RequestStreamedTextureDict("circlemap", false)
        while not HasStreamedTextureDictLoaded("circlemap") do
            Wait(100)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        SetMinimapClipType(1)
        SetMinimapComponentPosition("minimap", "L", "B", 0.025, -0.03, 0.153, 0.24)
        SetMinimapComponentPosition("minimap_mask", "L", "B", 0.135, 0.12, 0.093, 0.164)
        SetMinimapComponentPosition("minimap_blur", "L", "B", 0.012, 0.022, 0.22, 0.32)
        local minimap = RequestScaleformMovie("minimap")
        SetRadarBigmapEnabled(true, false)
        Citizen.Wait(100)
        SetRadarBigmapEnabled(false, false)
        -- SetBigmapActive(true, false)
        -- --Citizen.Wait(100)
        -- SetBigmapActive(false, false)
        Citizen.Wait(1000)
        while true do
            Wait(500)
            BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
            ScaleformMovieMethodAddParamInt(3)
            EndScaleformMovieMethod()
        end
    end)
    -- RADAR ---
    local camz 
    CreateThread(function()
        while true do
            Wait(200)
            camz = GetGameplayCamRot().z
            
            SendNUIMessage({
                action = "updateRotation",
                rotation = camz
            })
        end
    end)
    --If you have a problem with the minimap, which gets bigger than the radar. uncomment this option below!
    Citizen.CreateThread(function()
         while true do
            Citizen.Wait(0)
             SetRadarBigmapEnabled(false, false)
        end
    end)
end



