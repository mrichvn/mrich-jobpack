local QBCore = exports['qb-core']:GetCoreObject()

-- RegisterServerEvent('mrich-jobpack:pickedUpPoppy', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.AddItem("poppyresin", 1) then
-- 		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["poppyresin"], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.poppyresin"), "success")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:pickedUpPoppy')
AddEventHandler('mrich-jobpack:pickedUpPoppy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("soi_vai", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["soi_vai"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.haisoivai"), "success")
	end
end)

-- RegisterServerEvent('mrich-jobpack:processPoppyResin', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('poppyresin', Config.HeroinProcessing.Poppy) then
-- 		if Player.Functions.AddItem('heroin', 1) then
-- 			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['poppyresin'], "remove", Config.HeroinProcessing.Poppy)
-- 			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['heroin'], "add")
-- 			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.heroin"), "success")
-- 		else
-- 			Player.Functions.AddItem('poppyresin', 1)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_poppy_resin"), "error")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:processPoppyResin')
AddEventHandler('mrich-jobpack:processPoppyResin', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('soi_vai', Config.CuonVaiProcessing.soivai) then
		if Player.Functions.AddItem('cuon_vai', Config.CuonVaiProcessing.cuonvai) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['soi_vai'], "remove", Config.CuonVaiProcessing.soivai)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cuon_vai'], "add", Config.CuonVaiProcessing.cuonvai)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.detvai"), "success")
		else
			Player.Functions.AddItem('soi_vai', Config.CuonVaiProcessing.soivai)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_soi_vai"), "error")
	end
end)

RegisterServerEvent('mrich-jobpack:mayaothanhpham')
AddEventHandler('mrich-jobpack:mayaothanhpham', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('cuon_vai', Config.MayAoProcessing.cuonvai) then
		if Player.Functions.AddItem('ao_somi', Config.MayAoProcessing.aothanhpham) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cuon_vai'], "remove", Config.MayAoProcessing.cuonvai)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['ao_somi'], "add", Config.MayAoProcessing.aothanhpham)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.mayao"), "success")
		else
			Player.Functions.AddItem('cuon_vai', Config.MayAoProcessing.cuonvai)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_cuon_vai"), "error")
	end
end)

local ItemList = {
    ["ao_somi"] = math.random(150, 300),
}

RegisterServerEvent('mrich-jobpack:BanAo')
AddEventHandler('mrich-jobpack:BanAo', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('QBCore:Notify', src, "Bạn đã bán "..Player.PlayerData.items[k].amount.." "..Player.PlayerData.items[k].label)
    else
        TriggerClientEvent('QBCore:Notify', src, "Bạn đã bán "..Player.PlayerData.items[k].amount.." "..Player.PlayerData.items[k].label)
    end
end)