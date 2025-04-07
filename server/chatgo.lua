local QBCore = exports['qb-core']:GetCoreObject()

-- RegisterServerEvent('mrich-jobpack:pickedUpCocaLeaf', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.AddItem("coca_leaf", 1) then 
-- 		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coca_leaf"], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coca_leaf"), "success")
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:pickedUpCocaLeaf')
AddEventHandler('mrich-jobpack:pickedUpCocaLeaf', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("cay_go", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cay_go"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.chatgo"), "success")
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

-- RegisterServerEvent('mrich-jobpack:processCocaLeaf', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('coca_leaf', Config.CokeProcessing.CokeLeaf) then
-- 		if Player.Functions.AddItem('coke', Config.CokeProcessing.ProcessCokeLeaf) then
-- 			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coca_leaf'], "remove", Config.CokeProcessing.CokeLeaf)
-- 			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.ProcessCokeLeaf)
-- 			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke"), "success")
-- 		else
-- 			Player.Functions.AddItem('coca_leaf', Config.CokeProcessing.CokeLeaf)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:processCocaLeaf')
AddEventHandler('mrich-jobpack:processCocaLeaf', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('cay_go', Config.CokeProcessing.CokeLeaf) then
		if Player.Functions.AddItem('gothanhpham', Config.CokeProcessing.ProcessCokeLeaf) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cay_go'], "remove", Config.CokeProcessing.CokeLeaf)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['gothanhpham'], "add", Config.CokeProcessing.ProcessCokeLeaf)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.xego"), "success")
		else
			Player.Functions.AddItem('cay_go', Config.CokeProcessing.CokeLeaf)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_go"), "error")
	end
end)

local ItemList = {
    ["gothanhpham"] = math.random(85, 150),
}

RegisterServerEvent('mrich-jobpack:BanGo')
AddEventHandler('mrich-jobpack:BanGo', function()
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