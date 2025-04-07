local QBCore = exports['qb-core']:GetCoreObject()

-- RegisterServerEvent('mrich-jobpack:pickedUpCannabis')
-- AddEventHandler('mrich-jobpack:pickedUpCannabis', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.AddItem("da_tho", 1) then
-- 		TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items["da_tho"], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.DaoDa"), "success")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:pickedUpCannabis')
AddEventHandler('mrich-jobpack:pickedUpCannabis', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("da_tho", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["da_tho"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.DaoDa"), "success")
	-- else
	-- 	TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

-- RegisterServerEvent('mrich-jobpack:pickedUpCannabis', function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.AddItem("da_tho", 1) then
-- 		TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items["da_tho"], "add")
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.DaoDa"), "success")
-- 	end
-- end)

-- RegisterServerEvent('mrich-jobpack:processCannabis', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('da_tho', 1) then
-- 		if Player.Functions.AddItem('da_sach', 1) then
-- 			TriggerClientEvent("ps-inventory:client:ItemBox", source, QBCore.Shared.Items['da_tho'], "remove")
-- 			TriggerClientEvent("ps-inventory:client:ItemBox", source, QBCore.Shared.Items['da_sach'], "add")
-- 			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.ruada"), "success")
-- 		else
-- 			Player.Functions.AddItem('da_tho', 1)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_da_tho"), "error")
-- 	end
-- end)

-- RegisterServerEvent('mrich-jobpack:processCannabis')
-- AddEventHandler('mrich-jobpack:processCannabis', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('da_tho', 1) then
-- 		if Player.Functions.AddItem('da_sach', 1) then
-- 			TriggerClientEvent("ps-inventory:client:ItemBox", source, QBCore.Shared.Items['da_tho'], "remove")
-- 			TriggerClientEvent("ps-inventory:client:ItemBox", source, QBCore.Shared.Items['da_sach'], "add")
-- 			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.ruada"), "success")
-- 		else
-- 			Player.Functions.AddItem('da_tho', 1)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_da_tho"), "error")
-- 	end
-- end)

RegisterServerEvent('mrich-jobpack:processCannabis')
AddEventHandler('mrich-jobpack:processCannabis', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('da_tho', Config.WeedProcessing.datho) then
		if Player.Functions.AddItem('da_sach', Config.WeedProcessing.dasach) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['da_tho'], "remove", Config.WeedProcessing.datho)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['da_sach'], "add", Config.WeedProcessing.dasach)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.ruada"), "success")
		else
			Player.Functions.AddItem('da_tho', Config.WeedProcessing.datho)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.het_da_tho"), "error")
	end
end)

RegisterServerEvent('mrich-jobpack:NungDa')
AddEventHandler('mrich-jobpack:NungDa', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randomItem = Config.Items[math.random(1, #Config.Items)]
    if  Player ~= nil then
        Player.Functions.RemoveItem('da_sach', 1)
        Player.Functions.AddItem(randomItem, math.random(1,3), false, nil, 'nung-da')   ----chnage these to give different amounts once completed mining
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], 'add')
    end
end)

-- RegisterServerEvent('mrich-jobpack:rollJoint', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('marijuana', 1) then
-- 		if Player.Functions.RemoveItem('rolling_paper', 1) then
-- 			if Player.Functions.AddItem('joint', 1) then
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['marijuana'], "remove")
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
-- 				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.joint"), "success")
-- 			else
-- 				Player.Functions.AddItem('marijuana', 1)
-- 				Player.Functions.AddItem('rolling_paper', 1)
-- 			end
-- 		else
-- 			Player.Functions.AddItem('marijuana', 1)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_marijuhana"), "error")
-- 	end
-- end)

-- QBCore.Functions.CreateUseableItem("rolling_paper", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
--     TriggerClientEvent('mrich-jobpack:client:rollJoint', source, 'marijuana', item)
-- end)

-- RegisterServerEvent('mrich-jobpack:bagskunk', function()
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

-- 	if Player.Functions.RemoveItem('marijuana', 1) then
-- 		if Player.Functions.RemoveItem('empty_weed_bag', 1) then
-- 			if Player.Functions.AddItem('weed_skunk', 1) then
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['marijuana'], "remove")
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
-- 				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_skunk'], "add")
-- 				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.baggy"), "success")
-- 			else
-- 				Player.Functions.AddItem('marijuana', 1)
-- 				Player.Functions.AddItem('empty_weed_bag', 1)
-- 			end
-- 		else
-- 			Player.Functions.AddItem('marijuana', 1)
-- 		end
-- 	else
-- 		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_marijuhana"), "error")
-- 	end
-- end)

-- QBCore.Functions.CreateUseableItem("empty_weed_bag", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
--     TriggerClientEvent('mrich-jobpack:client:bagskunk', source, 'marijuana', item)
-- end)

QBCore.Functions.CreateCallback('ps-drugprocessing:validate_items', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

	local hasItems = {
		ret = true,
		items = {}
	}
	for name,amount in pairs(data) do
		local item = Player.Functions.GetItemByName(name)
		if not item or item and item.amount < amount then
			hasItems.ret = false
			hasItems.items[#hasItems.items+1] = QBCore.Shared.Items[name].label
		end
		if not hasItems then break end
	end
	hasItems.item = table.concat(hasItems.items, ", ")
	cb(hasItems)
end)