ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem('mesin_las', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(100)

    if chance <= 10 then
        TriggerClientEvent('esx:showNotification', source, "Las Anda rusak karena pemakaian.")
        xPlayer.removeInventoryItem('las', 1)
    else
        TriggerClientEvent('esx_rongsokan_mobil:mulaiMengelas', source)
    end
end)

RegisterServerEvent('esx_rongsokan_mobil:berhasilMengelas')
AddEventHandler('esx_rongsokan_mobil:berhasilMengelas', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomLoot = math.random(1, 100)

    if randomLoot <= 20 then
        xPlayer.addInventoryItem('metal', 1)
    elseif randomLoot <= 40 then
        xPlayer.addInventoryItem('besi', 1)
    elseif randomLoot <= 50 then
        xPlayer.addInventoryItem('sound', 1)
    elseif randomLoot <= 60 then
        xPlayer.addInventoryItem('rongsokan', 1)
    elseif randomLoot <= 70 then
        xPlayer.addInventoryItem('mesin', 1)
    elseif randomLoot <= 80 then
        xPlayer.addInventoryItem('pompa_oli', 1)
    elseif randomLoot <= 90 then
        xPlayer.addInventoryItem('pompa_air', 1)
    elseif randomLoot <= 95 then
        xPlayer.addInventoryItem('nitro', 1)
    else
        xPlayer.addInventoryItem('tembaga', 1)
    end

    TriggerClientEvent('esx:showNotification', source, "Anda berhasil mengambil barang dari rongsokan mobil.")
end)
