Config = {}

Config.Locations = {
    {
        identifier = 'senjata',
        items = {
            {
                item = 'ammo-9',
                display = 'AIRDROP ITEMS',
                minAmount = 50,
                maxAmount = 300
            },
            {
                item = 'weapon_pistol',
                display = 'AIRDROP ITEMS',
                minAmount = 1,
                maxAmount = 3
            },
            {
                item = 'bandage',
                display = 'AIRDROP ITEMS',
                minAmount = 10,
                maxAmount = 20
            },
            {
                item = 'burger',
                display = 'AIRDROP ITEMS',
                minAmount = 10,
                maxAmount = 40
            },
            {
                item = 'water',
                display = 'AIRDROP ITEMS',
                minAmount = 10,
                maxAmount = 40
            },
        },

        location = vector3(-1787.11, -805.12, 7.78),
        radius = 40,
        maxSpawnedIn = 4,
        prop = 'hei_prop_heist_wooden_box',

        -- You need to use at least one of those settings below!
        maxSecActive = 120,
        maxPropsToTake = nil,

        attachZ = 0.7,
    },
    
}

Config.DropsPerMin = 2
Config.drawRange = 100
Config.interactRange = 5
Config.collectKeybind = 51
Config.collectScenario = "PROP_HUMAN_BUM_BIN"
Config.collectTime = 5
Config.randomEventInterval = 2
Config.airplaneModel = "bombushka"
Config.pilotModel = "s_m_m_pilot_02"
Config.manualMode = false
Config.devmode = true

-- ox_target settings, leave as false if not used
Config.using_ox_target = false
Config.ox_target_settings = {
    label = 'Open airdrop',
    icon = 'fa-solid fa-road',
}

Config.blips = {
    ['circle'] = {
        enabled = true,
        colour = 5,
        alpha = 128
    },
    ['centerpoint'] = {
        enabled = true,
        sprite = 94,
        display = 4,
        scale = 0.9,
        colour = 48
    }
}

Config.lang = {
    ['map_markername'] = 'Airdrops',
    ['press_to_grab'] = 'Press ~g~E~w~ to pick up ~r~{item}~w~',
    ['get_out_of_vehicle'] = 'Get out of your vehicle to pick up ~r~{item}~w~',
    ['grabbing'] = 'Membuka Kotak Airdrop {item}..',
    ['grabbed'] = 'Berhasil mengambil Airdrop',
    ['cancelled'] = 'Cancelled..',
}

Config.GiveAward = function(item, amount)
    if Config.devmode then print('Giving ' .. tostring(amount) .. 'x ' .. item .. ' to ID ' .. tostring(source)) end
    local ESX = exports["es_extended"]:getSharedObject()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, amount)
end

Config.GrabbingBar = function(label, time, cb)
    -- PERINGATAN: Fungsi ini tidak boleh kosong.
    TaskStartScenarioInPlace(
        GetPlayerPed(-1),
        Config.collectScenario,
        0,
        true
    )
    Citizen.Wait(time)
    ClearPedTasks(GetPlayerPed(-1))
    cb(true)
end

Config.Notify = function(text, type)
    local ESX = exports["es_extended"]:getSharedObject()
    ESX.ShowNotification(text, type)
end

Config.NewEventStarted = function(name)
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 255, 255},
        multiline = true,
        args = {"AIRDROP", "Ada airdrop yang dalam perjalanan! Perhatikan udara, dan peta. segera persiapkan diri anda!"}
    })
end
