Config = {}

Config.animalLoot = true ------ loot animals

Config.lootRefreshTime = 15 ------ refresh minutes for prop loot

Config.UseProgressBar = true ------ use progress bar

Config.DistanceCheckProtection = 10.0 ----- security reasons

Config.UsePressE = false --- if true you will use press E to search dead animals and dead peds instead of target i don't - much worst performance than target

Config.ProgressBars = {
    ["animal_interact"] = {
        duration = 1000,
        label = "Searching animal",
        animation = {
            animDict = 'amb@prop_human_bum_bin@base',
            anim = 'base'
        }
    },
    ["prop_interact"] = {
        duration = 1000,
        label = "Searching Object",
        animation = {
            animDict = 'amb@prop_human_bum_bin@base',
            anim = 'base'
        }
    },
    ["zombie_interact"] = {
        duration = 1000,
        label = "Searching Zombie",
        animation = {
            animDict = 'amb@prop_human_bum_bin@base',
            anim = 'base'
            -- animDict = 'anim@gangops@facility@servers@bodysearch@',
            -- anim = 'player_search',
            -- flags = 16
        }
    }
}

Config.moneyLabel = "Cash" --- you can edit the accounts on the open source side of the code in the server side of your Framework


---- PLEASE DON'T USE WORD 'DELETE' or 'PROP' when making this loot types

Config.types = {
    ["zombie_default"] = {
        fixedLoots = {
            {name = "bandage",count = 1} ----- this will always spawn on every loot from this type
        }, -- can be empty
        probabilityLoots = {
            loop = 6, ----- each loop an item from the list bellow will be chosen
            items = {
                {names = {'bandage','wood'},minValue = 1,maxValue = 2,probability = 20}, ------ there is 20% chance of getting 1 or 2 wood or 1 or 2 bandage
                {names = {'money'},minValue = 5,maxValue = 20,probability = 50} -------- there is 50% chance of getting a number from 5 to 20 of money and there is 100 - 50 - 20 = 30% -- 30% chance of getting nothing                                                              
            } ---- the sum of all the probabilities on this list can't be bigger than 100% ---- 20 + 50 = 70% => 70% < 100% so is all good
        } -- is optional
    },

    ["bossZombie"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 6,
            items = {
                {names = {'bandage','wood'},minValue = 1,maxValue = 2,probability = 10}, 
                {names = {'money'},minValue = 5,maxValue = 20,probability = 50} 
            } 
        }
    },

    ["animal_default"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 6, 
            items = {
                {names = {'bandage','wood'},minValue = 1,maxValue = 2,probability = 20}, 
                {names = {'money'},minValue = 5,maxValue = 20,probability = 10}                                                             
            } 
        }
    },

    ["pig_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },
  
    ["cat_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["bird_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["dog_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["cow_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["deer_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    
    ["mtlion_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["rabbit_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ["rat_loot"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        }
    },

    ---------------- weapon cases --------------------------------------------------------

    ["pistolCase"] = {
        fixedLoots = {
            --{name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {
                    names = {
                        'weapon_pistol',
                        'weapon_combatpistol',
                        'weapon_appistol',
                        'weapon_pistol50',
                        'weapon_snspistol'
                    },
                    minValue = 1,
                    maxValue = 1,
                    probability = 75
                }, 
            }
        }
    },

    ["explosivesCase_x1"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {names = {'weapon_grenade','weapon_pipebomb'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_bzgas'},minValue = 1,maxValue = 2,probability = 15},
                {names = {'weapon_molotov'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_stickybomb'},minValue = 1,maxValue = 2,probability = 5},
                {names = {'weapon_smokegrenade'},minValue = 1,maxValue = 2,probability = 40},
            }
        }
    },

    ["explosivesCase_x4"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 4,
            items = {
                {names = {'weapon_grenade','weapon_pipebomb'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_bzgas'},minValue = 1,maxValue = 2,probability = 15},
                {names = {'weapon_molotov'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_stickybomb'},minValue = 1,maxValue = 2,probability = 5},
                {names = {'weapon_smokegrenade'},minValue = 1,maxValue = 2,probability = 40},
            }
        }
    },

    ["explosivesCase_x6"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 6,
            items = {
                {names = {'weapon_grenade','weapon_pipebomb'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_bzgas'},minValue = 1,maxValue = 2,probability = 15},
                {names = {'weapon_molotov'},minValue = 1,maxValue = 2,probability = 10},
                {names = {'weapon_stickybomb'},minValue = 1,maxValue = 2,probability = 5},
                {names = {'weapon_smokegrenade'},minValue = 1,maxValue = 2,probability = 40},
            }
        }
    },

    ------------------ ammo ---------------------------------------------------------------------
    ["pistoAmmolCase"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {names = {'ammo-9'},minValue = 5,maxValue = 10,probability = 70},
                {names = {'ammo-38','ammo-22'},minValue = 5,maxValue = 10,probability = 20},
                {names = {'ammo-44','ammo-45','ammo-50'},minValue = 5,maxValue = 10,probability = 10}
            }
        }
    },
    ["rifleAmmoCase"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {names = {'ammo-rifle','ammo-rifle2'},minValue = 10,maxValue = 20,probability = 90}
            }
        }
    },
    ["shotgunAmmoCase"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {names = {'ammo-shotgun'},minValue = 5,maxValue = 10,probability = 90}
            }
        }
    },
    ["sniperAmmoCase"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            items = {
                {names = {'ammo-heavysniper'},minValue = 5,maxValue = 10,probability = 40},
                {names = {'ammo-sniper'},minValue = 5,maxValue = 10,probability = 50}
            }
        }
    },
    ["mixedAmmo"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 2,
            items = {
                {names = {'ammo-9'},minValue = 5,maxValue = 10,probability = 40},
                {names = {'ammo-38','ammo-22'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-44','ammo-45','ammo-50'},minValue = 5,maxValue = 10,probability = 10},
                {names = {'ammo-rifle','ammo-rifle2'},minValue = 10,maxValue = 20,probability = 7},
                {names = {'ammo-shotgun'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-heavysniper'},minValue = 5,maxValue = 10,probability = 3},
                {names = {'ammo-sniper'},minValue = 5,maxValue = 10,probability = 2}
            }
        }
    },
    ["mixedAmmoBig_x1"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 4,
            items = {
                {names = {'ammo-9'},minValue = 5,maxValue = 10,probability = 40},
                {names = {'ammo-38','ammo-22'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-44','ammo-45','ammo-50'},minValue = 5,maxValue = 10,probability = 10},
                {names = {'ammo-rifle','ammo-rifle2'},minValue = 10,maxValue = 20,probability = 7},
                {names = {'ammo-shotgun'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-heavysniper'},minValue = 5,maxValue = 10,probability = 3},
                {names = {'ammo-sniper'},minValue = 5,maxValue = 10,probability = 2}
            }
        }
    },
    ["mixedAmmoBig_x2"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 8,
            items = {
                {names = {'ammo-9'},minValue = 5,maxValue = 10,probability = 40},
                {names = {'ammo-38','ammo-22'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-44','ammo-45','ammo-50'},minValue = 5,maxValue = 10,probability = 10},
                {names = {'ammo-rifle','ammo-rifle2'},minValue = 10,maxValue = 20,probability = 7},
                {names = {'ammo-shotgun'},minValue = 5,maxValue = 10,probability = 15},
                {names = {'ammo-heavysniper'},minValue = 5,maxValue = 10,probability = 3},
                {names = {'ammo-sniper'},minValue = 5,maxValue = 10,probability = 2}
            }
        }
    },
    -------------------------------------------------------------------------------------

    ------ PROPS ------------------------------------------------------------------------

    ["prop_default"] = {
        fixedLoots = {
            {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 6,
            loopIncrease = 1, ----- how much loops will be added if you are in a lootIncreaseZone (see below) (overrides the zone increase for this prop)
            items = {
                {names = {'bandage'},minValue = 1,maxValue = 2,probability = 20},
                {names = {'wood'},minValue = 1,maxValue = 2,probability = 50},
                {names = {'metalscrap'},minValue = 1,maxValue = 2,probability = 30}
            }
        }
    },
    ["trashBig"] = {
        fixedLoots = {
           -- {name = "bandage",count = 1}
        },
        probabilityLoots = {
            loop = 1,
            --loopIncrease = 4, ----- how much loops will be added if you are in a lootIncreaseZone (see below) (overrides the zone increase for this prop)
            items = {
                {names = {'bandage'},minValue = 1,maxValue = 1,probability = 50}
            }
        }

    },
    ["blowtorch"] = {
        fixedLoots = {
           {name = "bandage",count = 1}
        }
    },
}

Config.lootByHashType = {
    ------- PEDS -------------------------
    ['u_m_y_zombie_01'] = 'bossZombie',

    ------- ANIMALS ----------------------

    --- pigs ---
    ['a_c_boar'] = 'pig_loot',
    ['a_c_pig'] = 'pig_loot',
    --- cats ---
    ['a_c_cat_01'] = 'cat_loot',
    --- birds ---
    ['a_c_chickenhawk'] = 'bird_loot',
    ['a_c_crow'] = 'bird_loot',
    ['a_c_cormorant'] = 'bird_loot',
    ['a_c_pigeon'] = 'bird_loot',
    ['a_c_hen'] = 'bird_loot',
    ['a_c_seagull'] = 'bird_loot',
    --- dogs ---
    ['a_c_chop'] = 'dog_loot',
    ['a_c_shepherd'] = 'dog_loot',
    ['a_c_coyote'] = 'dog_loot',
    ['a_c_husky'] = 'dog_loot',
    ['a_c_husky'] = 'dog_loot',
    ['a_c_poodle'] = 'dog_loot',
    ['a_c_pug'] = 'dog_loot',
    ['a_c_retriever'] = 'dog_loot',
    ['a_c_westy'] = 'dog_loot',
    ['a_c_rottweiler'] = 'dog_loot',
    --- cow ---
    ['a_c_cow'] = 'cow_loot',
    --- deer ---
    ['a_c_deer'] = 'deer_loot',
    --- mtlion ---
    ['a_c_mtlion'] = 'mtlion_loot',
    --- rabbit ---
    ['a_c_rabbit_01'] = 'rabbit_loot',
    --- rat ---
    ['a_c_rat'] = 'rat_loot',
}

Config.lootTypeItemNeeded = {
   -- ['trashBig'] = {items = {"bandage"},label = "You need a bandage to interact"} ----- example
} -------- you have to have one of this items in your inventory to interact with this loot type

Config.lootTypeWeaponNeeded = {
    ['animal_default'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['pig_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['cat_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['bird_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['dog_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['cow_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['deer_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['mtlion_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['rabbit_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"},
    ['rat_loot'] = {weapons = {"WEAPON_KNIFE","weapon_dagger","weapon_hatchet","weapon_machete","weapon_switchblade","weapon_battleaxe","weapon_stone_hatchet"},label = "You need a cutting weapon"}
} -------- you have to have one of this weapons on your hand to interact with this loot type

Config.lootByHashTypeProps = {
    ---- gun cases -----------------------
    ['prop_box_guncase_02a'] = "pistolCase",
    ['prop_box_guncase_01a'] = "pistolCase",
    ['prop_box_guncase_03a'] = "pistolCase",
    ---- ammo ----------------------------
    ['prop_ld_ammo_pack_01'] = "pistoAmmolCase",
    ['prop_ld_ammo_pack_03'] = "rifleAmmoCase",
    ['prop_ld_ammo_pack_02'] = "shotgunAmmoCase",
    ['v_ret_gc_ammo3'] = "shotgunAmmoCase",
    ['prop_box_ammo07b'] = "sniperAmmoCase",
    ['prop_box_ammo07a'] = "sniperAmmoCase",
    ['prop_box_ammo01a'] = "mixedAmmo",
    ['prop_box_ammo04a'] = "mixedAmmo",
    ['prop_box_ammo02a'] = "mixedAmmo",
    ['prop_box_ammo06a'] = "mixedAmmoBig_x1",
    ['hei_prop_hei_ammo_single'] = "mixedAmmoBig_x1",
    ['hei_prop_hei_ammo_pile'] = "mixedAmmoBig_x2",
    ['hei_prop_hei_ammo_pile_02'] = "mixedAmmoBig_x2",
    ['prop_box_ammo03a'] = "explosivesCase_x1",
    ['prop_box_ammo03a_set2'] = "explosivesCase_x4",
    ['prop_box_ammo03a_set'] = "explosivesCase_x6",

-----------------------------------------------
    ['prop_dumpster_3a'] = "trashBig",
    ['prop_skip_05a'] = "trashBig",
    ['prop_dumpster_4b'] = "trashBig",
    ['prop_bin_14a'] = "trashBig",
    ['prop_dumpster_4a'] = "trashBig",
    ['prop_dumpster_01a'] = "trashBig",
    ['prop_dumpster_02a'] = "trashBig",
    ['prop_dumpster_02b'] = "trashBig",
    ['prop_dumpster_02b'] = "trashBig",
    ['prop_battery_01'] = "blowtorch",
    ['prop_battery_02'] = "blowtorch",
    ['prop_car_battery_01'] = "blowtorch",
    ['prop_tool_blowtorch'] = "blowtorch",

    -- trash bags
    ['prop_rub_binbag_sd_01'] = "trashBig",
    ['prop_ld_rub_binbag_01'] = "trashBig",
    ['prop_rub_binbag_sd_02'] = "trashBig",
    ['prop_ld_binbag_01'] = "trashBig",
    ['prop_cs_rub_binbag_01'] = "trashBig",
    ['prop_cs_street_binbag_01'] = "trashBig",
    ['prop_rub_binbag_03b'] = "trashBig",
    ['prop_rub_binbag_04'] = "trashBig",
    ['prop_rub_binbag_01'] = "trashBig",
    ['prop_rub_binbag_08'] = "trashBig",
    ['prop_rub_binbag_05'] = "trashBig",
    ['p_rub_binbag_test'] = "trashBig",
    ['prop_rub_binbag_06'] = "trashBig",
    ['prop_rub_binbag_03'] = "trashBig",
    ['prop_rub_binbag_01b'] = "trashBig",
    ['hei_prop_heist_binbag'] = "trashBig",
    ['ng_proc_binbag_01a'] = "trashBig",
    ['p_binbag_01_s'] = "trashBig"
    
}

Config.propDeleteOnloot = {
    ['prop_tool_blowtorch'] = true,
    ['prop_battery_02'] = true,
    ['prop_battery_01'] = true,
    ['prop_car_battery_01'] = true,
    ['prop_rub_binbag_sd_01'] = true,
    ['prop_ld_rub_binbag_01'] = true,
    ['prop_rub_binbag_sd_02'] = true,
    ['prop_ld_binbag_01'] = true,
    ['prop_cs_rub_binbag_01'] = true,
    ['prop_cs_street_binbag_01'] = true,
    ['prop_rub_binbag_03b'] = true,
    ['prop_rub_binbag_04'] = true,
    ['prop_rub_binbag_01'] = true,
    ['prop_rub_binbag_08'] = true,
    ['prop_rub_binbag_05'] = true,
    ['p_rub_binbag_test'] = true,
    ['prop_rub_binbag_06'] = true,
    ['prop_rub_binbag_03'] = true,
    ['prop_rub_binbag_01b'] = true,
    ['hei_prop_heist_binbag'] = true,
    ['ng_proc_binbag_01a'] = true,
    ['p_binbag_01_s'] = true,
    ['prop_box_guncase_02a'] = true,
    ['prop_box_guncase_01a'] = true,
    ['prop_box_guncase_03a'] = true,
    ['prop_ld_ammo_pack_01'] = true,
    ['prop_ld_ammo_pack_03'] = true,
    ['prop_ld_ammo_pack_02'] = true,
    ['prop_box_ammo07b'] = true,
    ['prop_box_ammo07a'] = true,
    ['prop_box_ammo01a'] = true,
    ['prop_box_ammo04a'] = true,
    ['prop_box_ammo02a'] = true,
    ['v_ret_gc_ammo3'] = true,
}

Config.lootIncreaseZones = {
   -- {coords = vector3(215.578, -1135.859, 29.29675),radious = 400.0,loopIncrease = 2} --- default loopIncrease if the specific loop increase for the prop not defined
} ---- places where the loot will be increased

Config.Locales = {
    ["click_get_item"] = "Click to get this items",
    ["click_get_items"] = "Click to get all items",
    ["nothing_here"] = "There is nothing here",
    ["get_all"] = "Get all items",
    ["search"] = "Search",
    ["search_animal"] = "Search Animal",
    ["need_cut_weapon"] = "You need a cutting weapon",
}









Config.Framework = nil
Config.UseTargetExport = nil
--------------------------------------
if GetResourceState('es_extended') ~= 'missing' then 
    Config.Framework = "ESX"
elseif GetResourceState('qb-core') ~= 'missing' then 
    Config.Framework = "QB"
    print("HELLO I AM HERE AND I AM ON QB")
else
    print("[^3WARNING^7] NO COMPATIBLE FRAMEWORK FOUND")
end

if GetResourceState('ox_target') ~= 'missing' or GetResourceState('ox_target') ~= 'missing' then 
    Config.UseTargetExport = 'ox_target'
elseif GetResourceState('qb-target') ~= 'missing' then 
    Config.UseTargetExport = "qb-target"
else
    print("[^3WARNING^7] NO TARGET SCRIPT FOUND")
end

local errorTypes = nil
for k,v in pairs(Config.types) do
    if v.probabilityLoots and v.probabilityLoots.items then
        local count = 0
        for k2,v2 in ipairs(v.probabilityLoots.items) do
            count = count + v2.probability
        end
        if count > 100 then
            if not errorTypes then
                errorTypes = '[^3LIST^7] '..k
            else
                errorTypes = errorTypes..","..k
            end
        end
    end
end

if errorTypes then
    print("[^3WARNING^7] THE SUM OF YOUR PROBABILITY IS BIGGER THAN 100% IN THIS LOOT TYPES: \n"..errorTypes)
end
