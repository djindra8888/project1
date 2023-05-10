ps_airdrops Config information
Any questions about this? Things we didn't include? Bugs or suggestions? Please join our discord: https://discord.gg/7qkZWdc67Y

`Contents`
**Config options**
**Config functions**
**Events**



**Config options**
Locations: A list of positions where a random airdrop can occur.
    Identifier: What name the script can recognise this drop for (needs to be unique, this is also the name used for manual dropping)
    Items: A list of what items can be found in the drops. (item means what item is given, display means what the label will say, the amount given is a random amount between minAmount and maxAmount)

    Location: The center of the circle in which the drops get spawned
    radius: The radius of the above described circle
    maxSpawnedIn: How many props can be spawned at a time (overwritten by maxPropsToTake)
    prop: What prop is used for the drop

    AT LEAST one of the above is required for all options: (both is also allowed)
    - maxSecActive: After how many seconds to despawn the props (a time limit)
    - maxPropsToTake: How many props are allowed to be spawned in

    attachZ: If the parachute is attached wrongly in height (too high or too low), try setting this at a higher value

- DropsPerMin: How many drops per minute are allowed to be dropped (60 means one per second, 120 means two per second, etc)
- drawRange: At what range the props should be rendered (too far means the prop possibly won't show up properly)
- interactRange: From what range the drop can be picked up
- collectKeybind: What keybind is used for picking up the drop (use https://docs.fivem.net/docs/game-references/controls/#controls)
- collectScenario: What scenario is used when picking up the drop
- collectTime: How many seconds it takes to pick up the item
- randomEventInterval: How many minutes there are between seperate airdrop events
- airplaneModel: What airplane is used to fly above the users
- pilotMode: What pilot is flying the airplane
- manualMode: If true, the airdrops won't randomly be enabled anymore and instead will drop when "ps_airdrops:server:startAirdrop" is triggered (has to be server-side). This way, your own scripts can control the airdropping.

*Target resources*
- using_ox_target: Set to true to use ox_target
- using_qb_target: Set to true to use qb-target
- target_settings: Options for target scripts

blips: Information about the blips:
 - Colour: https://docs.fivem.net/docs/game-references/blips/#blip-colors
 - Alpha: Transparancy, 0-255
 - Sprite: https://docs.fivem.net/docs/game-references/blips/#blips
 - Display: https://docs.fivem.net/natives/?_0x9029B2F3DA924928

lang: All the language used in the script, use this to translate to your server's language

**Config functions**
- GiveAward(item, amount)
    Triggered when someone picks up the item (server-side)

    An example for ESX and QBCore:
    `ESX`
    local ESX = exports["es_extended"]:getSharedObject()
    ESX.GetPlayerFromId(source).addInventoryItem(item, amount)

    `QBCore`
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")


- Config.GrabbingBar(label, time, cb)
    Triggered when someone wants to pick something up. If you don't run QBCore or you don't want to use the progressbar, edit this.

    `Default`
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.Progressbar('grabbing_airdrop', label, time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        task = Config.collectScenario
    }, {}, {}, function()
        ClearPedTasks(GetPlayerPed(-1))
        cb(true)
    end, function()
        ClearPedTasks(GetPlayerPed(-1))
        cb(false)
    end)

    `An example without the progressbar`
    TaskStartScenarioInPlace(
        GetPlayerPed(-1),
        Config.collectScenario,
        0,
        true
    )
    Citizen.Wait(time)
    ClearPedTasks(GetPlayerPed(-1))
    cb(true)


- Notify(text, type)
    When a user should get notified of something. If you don't run QBCore or want to edit the notification, edit this.

    `ESX`
    local ESX = exports["es_extended"]:getSharedObject()
    ESX.ShowNotification(text, type)

    `QBCore`
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.Notify(text, type)


- NewEventStarted(name)
    When a new event starts, this event gets triggered.

    `Default`
    TriggerClientEvent('chat:addMessage', -1, {
        color = {255, 255, 255},
        multiline = true,
        args = {"AIRDROP", "There is an airdrop incoming! Watch the air, and your map for more information!"}
    })


**Events**
*`These events get sent to all clients and the server.`*
*`In these examples, 'server' can be replaced with 'client' too.`*
- ps_airdrops:server:NewEventStarted
    Triggered when a new event gets started.
    Arguments:
    - item: The name of the item that has started to drop

- ps_airdrops:server:EventStopped:
    Triggered when an event is stopped (when the timer has run out or when the max amount of drops spawned is reached)
    No arguments

- ps_airdrops:server:ObjectSpawned
    Triggered when an object is spawned
    Arguments:
    - location: The location of the drop (Warning! The drop will still be in the air, however this location is where it's going to land)

- ps_airdrops:server:ItemGiven:
    Triggered when an item is awarded
    Arguments:
    - item: What item was given
    - amount: The amount of items that was given
    - identifier: At what airdrop the item was received


*`The following event(s) are able to be triggered by another script (server-only!)`*
- ps_airdrops:server:startAirdrop(identifier):
    When triggered, will start a new airdrop.
    Arguments:
    - identifier: What drop to start from Config.Locations