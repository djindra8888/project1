
-- !! IMPORTANT !!
-- IF YOU HAVE ANY PROBLEMS WITH THE MAP, PLEASE ENLARGE IT. GO TO Client/Minimap.lua and uncomment line 68 to 73

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! NEW  
---  TriggerEvent('5G-Hud:showhudall')  
---  TriggerEvent('5G-Hud:Hideall')
---  This is for people who use Multicharacter or some script and want to hide the HUD via a trigger!...
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! NEW  

Config = {}

Config.Framework = "ESXNEW"                             -- QBCORE o ESX, ESXNEW

Config.ESXPrefix = 'esx' --!! NEW                       -- ONLY ESX (If you don't know what this is, I recommend not changing it.)
Config.playerLoaded = 'playerLoaded'  --!! NEW          -- ONLY ESX If you don't know what this is, I recommend not changing it.
Config.getSharedObject = 'es_extended' --!! NEW     -- ONLY ESX If you don't know what this is, I recommend not changing it.


Config.CommandHideAllHUD = "Hidehud"                -- THIS COMMAND CAN COMPLETELY HIDE THE ENTIRE HUD  
Config.CommandShowAllHUD = "Showhud"                -- THIS COMMAND IS TO SEE ALL THE HUD COMPLETELY

Config.USEPanelMenu = true                          -- TRUE / FALSE THIS OPTION ALLOWS USING THE PERSONALIZATION MENU WITHIN THE CITY
Config.Openpanel = "hud"                            -- COMMAND TO OPEN THE CONFIGURATION MENU
Config.WaitValue = 4000                             -- FUNCTION TIMEOUT, THE HIGHER, THE MORE MS
Config.waitResource = 100                           -- TIME TO SET HUD SAVED, AFTER RESOURCE START

Config.USELogo = true                              -- TRUE / FALSE IF YOU WANT TO USE THE LOGO IF TRUE, PUT (Config.USELogoTEXT = false)
Config.Logo = "https://i.ibb.co/GnPhbzx/the-last-4.png"     -- IF ABOVE IS TRUE, HERE YOU PUT THE LINK OF THE LOGO

Config.USELogoTEXT = false                           -- TRUE / FALSE IF YOU WANT TO USE THE NAME OF THE SERVER, INSTEAD OF THE LOGO. IF TRUE, PUT (Config.USELogo = false)
Config.LogoTEXT = "THE LAST SURVIVOR"                     -- SERVER NAME, IF ABOVE LINE IS TRUE
Config.USENumberPorcentStatus = true                     -- THIS IS IN CASE YOU WANT TO USE ONLY THE CIRCLES, WITHOUT THE PERCENTAGE OF 100% NEXT.

Config.USEPlayerID = true                           -- TRUE / FALSE IF YOU WANT TO USE THE PLAYER ID HUD

Config.USEScorePlayer = true                                    -- TRUE / FALSE IF YOU WANT TO USE THE ONLINE PLAYERS SCORE HUD
Config.MaxPlayers = GetConvarInt('sv_maxclients', 8)          -- IF THE LINE ABOVE IS TRUE, HERE YOU PUT THE AMOUNT OF PLAYERS

Config.TypeIconMoney = " $ "                        -- HERE YOU CAN CHANGE THE CURRENCY ICON YOU USE IN YOUR COUNTRY
Config.USEMoneyCash = true                          -- TRUE / FALSE TO ENABLE OR DISABLE MONEY CASH
Config.USEMoneyBank = true                          -- TRUE / FALSE TO ENABLE OR DISABLE MONEY BANK

Config.USEMoneyDuty = true                         -- TRUE / FALSE TO ENABLE OR DISABLE MONEY BLACK (FOR QB CORE, IN THE QB-READ ME THERE ARE THE INSTRUCTIONS TO INSTALL THE DIRTY MONEY)
Config.MoneyDutyName = 'black_money' --!! NEW               

Config.USEMoneyVIP = false                          -- TRUE / FALSE TO ENABLE OR DISABLE VIP COINS (IN THE README ARE THE INSTRUCTIONS ON HOW TO INSTALL THE VIP COINS)
Config.MoneyVIPName = 'coins' --!! NEW 

Config.USEClock = true                              -- TRUE / FALSE TO ENABLE OR DISABLE CLOCK

Config.USEJob = true                                -- TRUE / FALSE IF YOU WANT TO USE THE JOB HUD
Config.USEAmmoHUD = false                            -- TRUE / FALSE IF YOU WANT TO USE THE AMMUNITION HUD

-- NEWWW
Config.USEKeybindHUD = false                        -- TRUE / FALSE IF YOU WANT TO USE THE KEYBIND HUD

----------------------------------------------------------------------------------  
--HERE BELOW YOU CAN CHANGE THE NAME AND THE KEY OF THE KEYBIND HUD EASIER.         |
Config.KeyDetail1 = "Inventary"                                                   --|
Config.Key1 = "F2"                                                                --|

Config.KeyDetail2 = "PHONE"                                                       --|
Config.Key2 = "F1"                                                                --|

Config.KeyDetail3 = "CHAT"                                                        --|
Config.Key3 = "T"                                                                 --|

Config.KeyDetail4 = "SCOREBOARD"                                                  --|
Config.Key4 = "F10"                                                               --|
--------------------------------------------------------------------------------------

Config.Microphone = true                            -- TRUE / FALSE IF YOU WANT TO USE THE MICROPHONE HUD
Config.WaitTalk = 300                               -- I RECOMMEND TO LEAVE IT LIKE THIS

Config.oxygenMax = 10                               -- MAX OXYGEN 
Config.Stamina = 100                                -- MAX STAMINA

Config.USEStress = false                   
-- FOR ESX. IF YOU ARE GOING TO USE THE STRESS SYSTEM, YOU MUST ENTER YOUR OWN STRESS SCRIPT, THIS IS JUST THE STRESS HUD. 
-- FOR QBCORE, HAS THE STRESS SYSTEM INTEGRATED IN THE HUD
-- if you use QBCore you must put true Config.USEStress = true

Config.USEStatusHUD = true                          -- TRUE / FALSE TO ENABLE OR DISABLE THE HUD FOR HUNGRY, THIRST, HEALTH, ETC

Config.statustrigger = 'esx_status:getStatus'       -- ONLY ESX
Config.statustriggerhunger = 'hunger'               -- ONLY ESX
Config.statustriggerthirst = 'thirst'               -- ONLY ESX
Config.statustriggerstress = 'stress'               -- ONLY ESX


-- ███████  █████  ███████ ███████     ███████  ██████  ███    ██ ███████ 
-- ██      ██   ██ ██      ██             ███  ██    ██ ████   ██ ██      
-- ███████ ███████ █████   █████         ███   ██    ██ ██ ██  ██ █████   
--      ██ ██   ██ ██      ██           ███    ██    ██ ██  ██ ██ ██      
-- ███████ ██   ██ ██      ███████     ███████  ██████  ██   ████ ███████ 

Config.USESafeZone = true       -- TRUE / FALSE IF YOU WANT THE SAFE AREAS

-- when it enters the safe zone, this is the event
    -- TriggerEvent('5G-Hud:INZone')

--when it leaves the safe zone, this is the event
    -- TriggerEvent('5G-Hud:OUTZone')


-- ███    ██  ██████  ████████ ██ ███████ ██    ██ 
-- ████   ██ ██    ██    ██    ██ ██       ██  ██  
-- ██ ██  ██ ██    ██    ██    ██ █████     ████   
-- ██  ██ ██ ██    ██    ██    ██ ██         ██    
-- ██   ████  ██████     ██    ██ ██         ██    
                                                                        
Config.USENofity = true         --TRUE / FALSE IF YOU WANT TO USE THE NOTIFICATION OR NOT
--NOTIFY    

--exports['5G-Hud']:Alert(type, title, msg, time) 
    -- type = infor, error, success
    -- title = here goes the title of the notification
    -- msg = here is the message you are going to send, if it is custom
    -- time = here goes the notification time, recommended (5000)

-- To use the notification you must use the following:

-- if you will use an INFORMATION notification use the following, example:
    --exports['5G-Hud']:Alert('info', "title" , 'msg', 5000)

--if you will use an ERROR notification use the following, example
    --exports['5G-Hud']:Alert('error', "title" , 'msg', 5000)

--if you will use an SUCCESS notification use the following, example
    --exports['5G-Hud']:Alert('success', "title" , 'msg', 5000)
---------------------------------------------------------------------------------------

-- ██    ██ ███████ ██   ██ ██  ██████ ██      ███████ 
-- ██    ██ ██      ██   ██ ██ ██      ██      ██      
-- ██    ██ █████   ███████ ██ ██      ██      █████   
--  ██  ██  ██      ██   ██ ██ ██      ██      ██      
--   ████   ███████ ██   ██ ██  ██████ ███████ ███████ 
                                                    
                                                    
Config.USECarHUD = true         -- TRUE / FALSE IF YOU WANT TO USE THE CAR HUD
Config.MinimapJustInCar = true  -- TRUE / FALSE IF YOU WANT THE MINIMAP TO EXIT ONLY WHEN YOU ARE IN A VEHICLE
Config.Map = true               -- TRUE / FALSE IF YOU DO NOT WANT TO USE THE MAP 
Config.SpeedMeter = "kmh"       -- mph OR kmh SPEED MODE
Config.BeltKey = 'B'            -- KEY FOR THE BELT
Config.ONandOFFMotorKey = 'Y'   -- KEY TO TURN THE VEHICLE ON OR OFF



Config.GetFuel = function(vehiculo)
    --return exports["LegacyFuel"]:GetFuel(vehiculo)    -- IF YOU USE LegacyFuel (UNCOMMENT THE LINE BELOW)
    return GetVehicleFuelLevel(vehiculo)
end

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
-----------------ONLY QBCORE CONFIGURATION OF THE STRESS SYSTEM------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

Config.StressChance = 0.1                   -- Default: 10% -- Percentage Stress Chance When Shooting (0-1)
Config.MinimumStress = 50                   -- Minimum Stress Level For Screen Shaking
Config.MinimumSpeedUnbuckled = 50           -- Going Over This Speed Will Cause Stress
Config.MinimumSpeed = 60                    -- Going Over This Speed Will Cause Stress
Config.DisablePoliceStress = false          -- If true will disable stress for people with the police job

-- Stress
Config.WhitelistedWeaponArmed = {           -- weapons specifically whitelisted to not show armed mode
    -- miscellaneous
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`,
    -- melee
    `weapon_dagger`,
    `weapon_bat`,
    `weapon_bottle`,
    `weapon_crowbar`,
    `weapon_flashlight`,
    `weapon_golfclub`,
    `weapon_hammer`,
    `weapon_hatchet`,
    `weapon_knuckle`,
    `weapon_knife`,
    `weapon_machete`,
    `weapon_switchblade`,
    `weapon_nightstick`,
    `weapon_wrench`,
    `weapon_battleaxe`,
    `weapon_poolcue`,
    `weapon_briefcase`,
    `weapon_briefcase_02`,
    `weapon_garbagebag`,
    `weapon_handcuffs`,
    `weapon_bread`,
    `weapon_stone_hatchet`,
    -- throwables
    `weapon_grenade`,
    `weapon_bzgas`,
    `weapon_molotov`,
    `weapon_stickybomb`,
    `weapon_proxmine`,
    `weapon_snowball`,
    `weapon_pipebomb`,
    `weapon_ball`,
    `weapon_smokegrenade`,
    `weapon_flare`
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.Intensity = {
    ["blur"] = {
        [1] = {
            min = 50,
            max = 60,
            intensity = 1500,
        },
        [2] = {
            min = 60,
            max = 70,
            intensity = 2000,
        },
        [3] = {
            min = 70,
            max = 80,
            intensity = 2500,
        },
        [4] = {
            min = 80,
            max = 90,
            intensity = 2700,
        },
        [5] = {
            min = 90,
            max = 100,
            intensity = 3000,
        },
    }
}

Config.EffectInterval = {
    [1] = {
        min = 50,
        max = 60,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 60,
        max = 70,
        timeout = math.random(40000, 50000)
    },
    [3] = {
        min = 70,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [4] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [5] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
}