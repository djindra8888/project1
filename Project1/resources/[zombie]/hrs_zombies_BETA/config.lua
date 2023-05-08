Config = {}

Config.showNoiseWave = true ---- show minimap noise
Config.showNoiseWaveInfo = {color = 1,alpha = 80}

Config.zombiesAudioMemory = 600 -- 60 seconds (the time the zombies will follow you after they fisrt heared you)

Config.poolLimit = 100 --- recommend not changing this

Config.betterHitBox = true --------- makes the zombie attack harder to dodge 

Config.zombieVehicleExternalDamage = true ------------ if the zombie can do exterior damage to the vehicle

Config.ragdollOnZombieAttackProbability = 5 -------- 1% probability of ragdoll when zombie attack you

Config.debug = false -- check location, zombie numbers , pool size

Config.useEntityLockdown = false --- this prevents any kind of client side spawn on your server

Config.zombieApproach = false --- if true zombies will get closer to you with time 

Config.zombieIgnoreFire = true --- zombie will ignore beeing on fire

Config.safeZoneBlips = {
    label = "Safe Zone",
    color = 2,
    alpha = 128,
    scale = 1.0,
    sprite = 176,
    shortRange = true      
} ----------- false if you dont want them

Config.RedZoneBlips = {
    label = "Red Zone",
    color = 1,
    alpha = 128,
    scale = 1.0,
    sprite = 630,
    shortRange = true      
} ----------- false if you dont want them

Config.nightMult = 1.0 ---- ped spawn mult at night
Config.dayMult = 0.6 ---- ped spawn mult at day

Config.nightMultAnimals = 0.5 ---- animal spawn mult at night 
Config.dayMultAnimals = 1.0 ---- animal spawn mult at day

Config.nightHealthMult = 1.5 ---- health mult at night
Config.nightDamageMult = 1.5 ---- damage mult at night 

Config.redZoneHealthMult = 1.8 ---- health mult at redzone
Config.redZoneDamageMult = 1.8 ---- damage mult at redzone 

Config.canRemoveFromVehicle = true ------ zombies can remove you from the car

Config.maxBossesAroundYou = 50 -- max number of bosses around you

Config.poisonGasRadious = 5.0

Config.eletricRadious = 5.0

Config.fireRadious = 5.0

Config.eletricChargeMissProbability = 50 --- 50% chance of the eletric zombie to miss his attack

Config.fireChargeMissProbability = 50 --- 50% chance of the fire zombie to miss his attack

Config.maxOwnedDeadPeds = 10

Config.deadDeleteTime = 180 --- seconds

Config.deleteZombieOnSafe = true

Config.zombiesUseLadders = false

Config.specialZombiesProb = {
    {models = {"ig_orleans"},probability = 0,probabilityRedzone = 2},
    {models = {"u_f_y_corpse_01","u_m_y_corpse_01"},probability = 0,probabilityRedzone = 2},
    {models = {"u_m_y_zombie_01"},probability = 0,probabilityRedzone = 2}
} ---- this zombies will replace population zombies with this models based on the percentage you choose

Config.zombiesLeaveYouOnceDead = true

Config.specialZombiesSpecs = {
    ['u_m_y_zombie_01'] = {
        life = 1400,
        headShotResistent = true,
        disableRagdoll = true,
        setProofs = {false,true,false,false,true,false,false,false},
        pedDamage = 14,
        carDamage = 4,
        blip = true,
        poisonGas = true,
        poisonGasDamage = 5,
        -- eletric = true,
        -- eletricDamage = 5,
        -- fire = true,
        -- fireDamage = 5
    }, 
    ['ig_orleans'] = {
        life = 1000,
        headShotResistent = true,
        disableRagdoll = true,
        setProofs = {false,true,false,false,true,false,false,false},
        pedDamage = 14,
        carDamage = 4,
        blip = true,
        -- poisonGas = true,
        -- poisonGasDamage = 5,
        -- eletric = true,
        -- eletricDamage = 5,
        fire = true,
        fireDamage = 5
    },
    ['u_m_y_juggernaut_01'] = {
        life = 1800,
        headShotResistent = true,
        disableRagdoll = true,
        setProofs = {false,true,false,false,true,false,false,false},
        pedDamage = 14,
        carDamage = 4,
        blip = true,
        -- poisonGas = true,
        -- poisonGasDamage = 5,
        eletric = true,
        eletricDamage = 5
    },
    ['u_f_y_corpse_01'] = {
        life = 1400,
        headShotResistent = true,
        disableRagdoll = true,
        setProofs = {false,true,false,false,true,false,false,false},
        pedDamage = 14,
        carDamage = 4,
        blip = true,
        poisonGas = true,
        poisonGasDamage = 5,
        -- eletric = true,
        -- eletricDamage = 5
    },
    ['u_m_y_corpse_01'] = {
        life = 1400,
        headShotResistent = true,
        disableRagdoll = true,
        setProofs = {false,true,false,false,true,false,false,false},
        pedDamage = 14,
        carDamage = 4,
        blip = true,
        poisonGas = true,
        poisonGasDamage = 5,
        -- eletric = true,
        -- eletricDamage = 5
    }

} --- change some zombies features

Config.defaultZombies = {
    life = 125,
    headShotResistent = false,
    disableRagdoll = false,
    setProofs = nil,
    pedDamage = 3,
    carDamage = 1,
    blip = false
}

Config.noSpawnZones = {
    --{coords = vector3(215.578, -1135.859, 29.29675),radious = 400.0,label = "Safe Zone 1",hiden = true}
}

Config.redZones = {
    {
        coords = vector3(188.8815, -950.6802, 30.0919),
        radious = 150.0,
        label = "Hardcore Zone 1",
        bosses = {
            {models = {"ig_orleans"},probability = 15},
            --{models = {'u_f_y_corpse_01','u_m_y_corpse_01'},probability = 1},
            --{models = {'u_m_y_zombie_01'},probability = 1}
        }
    },

    {
        coords = vector3(-1778.2087, -1165.4779, 12.3628),
        radious = 250.0,
        label = "Hardcore Zone 2",
        bosses = {
            {models = {"ig_orleans"},probability = 15},
            {models = {'u_f_y_corpse_01','u_m_y_corpse_01','u_m_y_zombie_01'},probability = 15},
            --{models = {'u_m_y_zombie_01'},probability = 1}
        }
    },

    {
        coords = vector3(1716.9733, 2580.3083, 59.8860),
        radious = 250.0,
        label = "Hardcore Zone 3",
        bosses = {
            {models = {"ig_orleans"},probability = 15},
            {models = {'u_f_y_corpse_01','u_m_y_corpse_01','u_m_y_zombie_01'},probability = 15},
            {models = {'u_m_y_juggernaut_01'},probability = 15}
        }
    }
}

Config.pedLists = {
    ['test'] = {
        'ig_orleans'
    },
    ['jail'] = {
        'csb_rashcosvki',
        's_m_y_prismuscl_01',
        's_m_y_prisoner_01',
        'csb_prolsec',
        'ig_rashcosvki',
        's_m_m_prisguard_01',
        's_m_m_security_01'
    },
    ['airp'] = {
        'csb_trafficwarden',
        's_m_m_gardener_01',
        's_m_m_ups_01',
        's_m_y_airworker',
        's_m_m_strpreach_01',
        's_m_m_highsec_01',
        's_m_m_highsec_02'
    },
    ['farm'] = {
        'cs_hunter',
        'cs_josef',
        'cs_old_man1a',
        'cs_old_man2',
        'cs_nervousron',
        'cs_russiandrunk',
        'csb_cletus',
        'csb_maude',
        'g_f_importexport_01',
        'u_m_y_proldriver_01'
    },
    ['city'] = {
        'a_f_m_bevhills_01',
        'a_f_y_bevhills_01',
        'a_f_y_bevhills_03',
        'a_f_y_clubcust_01',
        'a_f_y_genhot_01',
        'a_m_m_soucent_02',
        'a_m_m_stlat_02',
        'a_m_y_business_02',
        'a_m_y_business_03',
        'a_m_y_genstreet_01',
        'cs_joeminuteman',
        'g_m_y_famdnf_01',
        'g_m_y_famca_01'
    },
    ['military'] = {
        'csb_ramp_marine',
        's_m_m_marine_01',
        's_m_y_blackops_01',
        's_m_y_blackops_02',
        's_m_y_blackops_03',
        's_m_y_marine_01',
        's_m_y_marine_02',
        's_m_y_marine_03',
        's_m_y_swat_01',
        's_m_m_marine_02',
        'u_m_o_filmnoir'
    },
    ['workers'] = {
        's_m_m_dockwork_01',
        's_m_m_gaffer_01',
        's_m_m_gardener_01',
        's_m_m_lathandy_01',
        's_m_y_airworker',
        's_m_y_construct_01',
        's_m_y_construct_02',
        's_m_y_dockwork_01',
        's_m_y_garbage'
    },
    ['beach'] = {
        'a_f_m_beach_01',
        'a_f_m_bodybuild_01',
        'a_f_m_fatcult_01',
        'a_f_y_beach_01',
        'a_f_y_juggalo_01',
        'a_f_y_topless_01',
        'a_m_m_beach_02',
        'a_m_m_tranvest_01',
        'a_m_y_jetski_01',
        'a_m_y_musclbeac_01',
        'a_m_y_surfer_01',
        's_f_y_baywatch_01',
        's_m_y_baywatch_01',
        'ig_tylerdix'
    },
    ['animals'] = {
        'a_c_boar',
        'a_c_coyote',
        'a_c_deer',
      --  'a_c_mtlion',
        'a_c_rabbit_01'
    }, --- animals that will spawn in dirt and grass locations
    ['hospital'] = {
        's_f_y_scrubs_01',
        's_m_m_doctor_01',
        's_m_y_autopsy_01',
        'u_f_y_corpse_02' 
    },
    ['walk'] = {
        'a_f_y_fitness_01',
        'a_f_y_fitness_02',
        'a_f_y_runner_01',
        'a_f_y_tourist_01',
        'a_m_y_breakdance_01',
        'a_m_y_runner_01',
        'a_m_y_runner_02',
        'cs_maryann'
    },
    ['motard'] = {
        'cs_clay',
        'csb_jackhowitzer',
        'g_m_y_lost_01',
        'g_m_y_lost_02',
        'g_m_y_lost_03',
        'g_m_y_mexgang_01'
    },
    ['police'] = {
        'cs_casey',
        'cs_michelle',
        'csb_ramp_marine',
        'mp_m_fibsec_01',
        'mp_s_m_armoured_01',
        's_f_y_cop_01',
        's_m_m_armoured_01',
        's_m_m_armoured_02',
        's_m_m_fibsec_01',
        's_m_y_cop_01',
        'ig_casey'
    },
}

Config.AnimalModels = {
    ['a_c_boar'] = true,
    ['a_c_cat_01'] = true,
    ['a_c_chickenhawk'] = true,
    ['a_c_chimp'] = true,
    ['a_c_chop'] = true,
    ['a_c_cormorant'] = true,
    ['a_c_cow'] = true,
    ['a_c_coyote'] = true,
    ['a_c_crow'] = true,
    ['a_c_deer'] = true,
    ['a_c_dolphin'] = true,
    ['a_c_fish'] = true,
    ['a_c_hen'] = true,
    ['a_c_humpback'] = true,
    ['a_c_husky'] = true,
    ['a_c_killerwhale'] = true,
    ['a_c_mtlion'] = true,
    ['a_c_pig'] = true,
    ['a_c_pigeon'] = true,
    ['a_c_poodle'] = true,
    ['a_c_pug'] = true,
    ['a_c_rabbit_01'] = true,
    ['a_c_rat'] = true,
    ['a_c_retriever'] = true,
    ['a_c_rhesus'] = true,
    ['a_c_rottweiler'] = true,
    ['a_c_seagull'] = true,
    ['a_c_sharkhammer'] = true,
    ['a_c_sharktiger'] = true,
    ['a_c_shepherd'] = true,
    ['a_c_stingray'] = true,
    ['a_c_westy'] = true
} --- this models will have animal behaviour 

Config.mapLocations = {
    ['AIRP'] = {
        humansList = 'airp',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10,
    },
    ['ALAMO'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15,
    },
    ['ALTA'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10,
    },
    ['ARMYB'] = {
        humansList = 'military',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['BHAMCA'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['BANNING'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['BEACH'] = {
        humansList = 'beach',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['BHAMCA'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['BRADT'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['BURTON'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['CANNY'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 15
    },
    ['CCREAK'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['CHAMH'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['CHIL'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['CHU'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['CMSW'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['CYPRE'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['DAVIS'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['DELBE'] = {
        humansList = 'beach',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['DELPE'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['DELSOL'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['DTVINE'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['DESRT'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['EAST_V'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['EBURO'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['ELGORL'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },

    ['ELYSIAN'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['GALFISH'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['GOLF'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['GRAPES'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['GREATC'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['HARMO'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['HAWICK'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['HORS'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['HUMLAB'] = {
        humansList = 'hospital',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['JAIL'] = {
        humansList = 'jail',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['KOREAT'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['LACT'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['LAGO'] = {
        humansList = 'military',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['LDAM'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['LEGSQU'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['LMESA'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['LOSPUER'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['MIRR'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['MOVIE'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['MTCHIL'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['MTGORDO'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['MTJOSE'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['MURRI'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['NCHU'] = {
        humansList = 'motard',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['NOOSE'] = {
        humansList = 'military',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['OCEANA'] = {
        humansList = 'beach',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['PALCOV'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['PALETO'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['PALFOR'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['PALHIGH'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['PALMPOW'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['PBLUFF'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['PBOX'] = {
        humansList = 'hospital',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['PROCOB'] = {
        humansList = 'beach',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['RANCHO'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['RGLEN'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['RICHM'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['ROCKF'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['RTRAK'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['SANAND'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['SANCHIA'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['SANDY'] = {
        humansList = 'farm',
        animalsList = 'animals',
        maxHumans = 15,
        maxAnimals = 15
    },
    ['SKID'] = {
        humansList = 'police',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['SLAB'] = {
        humansList = 'motard',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['STAD'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['STRAW'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['TATAMO'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['TERMINA'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['TEXTI'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['TONGVAH'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['TONGVAV'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['VCANA'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['VESP'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['VINE'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['WINDF'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['WVINE'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['ZANCUDO'] = {
        humansList = 'walk',
        animalsList = 'animals',
        maxHumans = 5,
        maxAnimals = 20
    },
    ['ZP_ORT'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['ZQ_UAR'] = {
        humansList = 'workers',
        animalsList = 'animals',
        maxHumans = 25,
        maxAnimals = 5
    },
    ['PROL'] = {
        humansList = 'city',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
    ['ISHEIST'] = {
        humansList = 'military',
        animalsList = 'animals',
        maxHumans = 35,
        maxAnimals = 10
    },
}

Config.NestWeaponDamages = {
    [`weapon_molotov`] = 5.0,
   -- [-544306709] = 0.5, ---- GAME FIRE
}

Config.Nests = {
    ['Boat_Nest_1'] = {
        coords = vector3(3061.5498, -4683.6440, 15.2623),
        propModel = `prop_bush_lrg_01c_cr`,
        pedsType = 'military',
        damageRadius = 5.0,
        damagePed = 15,
        drawDistance = 80.0, ---- recommended value
        blip = {
            label = "Zombie Nest",
            color = 1,
            alpha = 128,
            scale = 1.0,
            sprite = 378,
            shortRange = true  
        }, -- false will disable it
        maxHealth = 10.00,
        regenTime = 120, --- seconds
        maxZombies = 40
    },
    ['Boat_Nest_2'] = {
        coords = vector3(3080.6509, -4760.6401, 6.0772),
        propModel = `prop_bush_lrg_01c_cr`,
        pedsType = 'military',
        damageRadius = 5.0,
        damagePed = 15,
        drawDistance = 80.0, ---- recommended value
        blip = {
            label = "Zombie Nest",
            color = 1,
            alpha = 128,
            scale = 1.0,
            sprite = 378,
            shortRange = true  
        }, -- false will disable it
        maxHealth = 10.0,
        regenTime = 120, --- seconds
        maxZombies = 40
    }
}
