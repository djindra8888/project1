RegisterNetEvent('esx_rongsokan_mobil:mulaiMengelas')
AddEventHandler('esx_rongsokan_mobil:mulaiMengelas', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)

    Citizen.Wait(10000)  -- Tunggu 10 detik untuk proses mengelas

    ClearPedTasksImmediately(ped)

    TriggerServerEvent('esx_rongsokan_mobil:berhasilMengelas')
end)
