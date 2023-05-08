if Config.Framework == "QB" then
	QBCore = exports['qb-core']:GetCoreObject()

    function GetItemLabel(name)
		local label = ""

		if name == "money" then
			label = Config.moneyLabel
		elseif QBCore.Shared.Items[name] then
			label = QBCore.Shared.Items[name].label
		else
			label = name.." (no-label)"
		end

        return label
    end

	function GetPlayerFromId(source)
		return QBCore.Functions.GetPlayer(source)
	end

	function ShowNotification(source,text)
		TriggerClientEvent('QBCore:Notify', source, text)
	end

	function AddInventoryItem(xPlayer,item,count)
		if item == "money" then
			xPlayer.Functions.AddMoney("cash", count)
			return true
		else
			if xPlayer.Functions.AddItem(item,count) then
				return true
			else
				return false
			end
		end
	end

	

    -- local clothes = {
    --     ['hat'] = {mID = 1, mModelMax = 173, mTexture = 0, wID = 1, wModelMax = 172, wTexture = 0},
    --     ['torso'] = {mID = 11, mModelMax = 173, mTexture = 0, mTorso = 15, wID = 11, wModelMax = 172, wTexture = 0, wTorso = 15},
    --     ['pants'] = {mID = 4, mModelMax = 173, mTexture = 0, wID = 4, wModelMax = 172, wTexture = 0},
    --     ['shoes'] = {mID = 6, mModelMax = 173, mTexture = 0, wID = 6, wModelMax = 172, wTexture = 0},
    --     ['watch'] = {mID = 7, mModelMax = 173, mTexture = 0, wID = 7, wModelMax = 172, wTexture = 0},
    --     ['tshirt'] = {mID = 8, mModelMax = 173, mTexture = 0, wID = 8, wModelMax = 172, wTexture = 0}
    -- }

    -- function AddInventoryItem(xPlayer,item,count)
    --     local metadata = nil
        
    --     if clothes[item] then
    --         metadata = {}

    --         for k,v in pairs(clothes[item]) do
    --             if k == "mModelMax" then
    --                 metadata.mModel = math.random(0,v)
    --             elseif k == "wModelMax" then
    --                 metadata.wModel = math.random(0,v)
    --             else
    --                 metadata[k] = v
    --             end
    --         end
    --     end

    --     if xPlayer.Functions.AddItem(item,count,nil,metadata) then
    --         return true
    --     else
    --         return false
    --     end
    -- end

	function HasEnoughtInventoryItem(xPlayer,item,count)
		local itemAmount = xPlayer.Functions.GetItemByName(item)
		if itemAmount and itemAmount.amount >= count then
			return true
		else
			return false
		end
	end

	function GetChance(xPlayer)
		return math.random(1,1000)
	end

	function GetLoopAdd(xPlayer,type,coords,extraInfo)
		local loopIncrease = 0

		for k,v in ipairs(Config.lootIncreaseZones) do
			if #(v.coords - coords) < v.radious then
				if Config.types[type].probabilityLoots.loopIncrease then
					loopIncrease = Config.types[type].probabilityLoots.loopIncrease
				else
					loopIncrease = v.loopIncrease
				end
				
				break
			end
		end
    
		return loopIncrease
	end

end
