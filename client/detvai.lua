local spawnedPoppys = 0
local PoppyPlants = {}
local isPickingUp, isProcessing, inHeroinField = false, false, false
local QBCore = exports['qb-core']:GetCoreObject()

local function ValidateHeroinCoord(plantCoord)
	local validate = true
	if spawnedPoppys > 0 then
		for _, v in pairs(PoppyPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if not inHeroinField then
			validate = false
		end
	end
	return validate
end

local function GetCoordZHeroin(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 50.0, 75.0, 100.0, 110.0, 125.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 12.64
end

local function GenerateHeroinCoords()
	while true do
		Wait(1)

		local heroinCoordX, heroinCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-60, 60)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-60, 60)

		heroinCoordX = Config.CircleZones.HeroinField.coords.x + modX
		heroinCoordY = Config.CircleZones.HeroinField.coords.y + modY

		local coordZ = GetCoordZHeroin(heroinCoordX, heroinCoordY)
		local coord = vector3(heroinCoordX, heroinCoordY, coordZ)

		if ValidateHeroinCoord(coord) then
			return coord
		end
	end
end

local function SpawnPoppyPlants()
	local model = `prop_plant_cane_02b`
	while spawnedPoppys < 15 do
		Wait(0)
		local heroinCoords = GenerateHeroinCoords()
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(100)
		end
		local obj = CreateObject(model, heroinCoords.x, heroinCoords.y, heroinCoords.z, false, true, false)
		PlaceObjectOnGroundProperly(obj)
		FreezeEntityPosition(obj, true)
		table.insert(PoppyPlants, obj)
		spawnedPoppys += 1
	end
	SetModelAsNoLongerNeeded(model)
end

-- local function ProcessHeroin()
-- 	isProcessing = true
-- 	local playerPed = PlayerPedId()

-- 	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
-- 	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), 15000, false, true, {
-- 		disableMovement = true,
-- 		disableCarMovement = true,
-- 		disableMouse = false,
-- 		disableCombat = true,
-- 	}, {}, {}, {}, function()
-- 		TriggerServerEvent('mrich-jobpack:processPoppyResin')

-- 		local timeLeft = Config.Delays.HeroinProcessing / 1000
-- 		while timeLeft > 0 do
-- 			Wait(1000)
-- 			timeLeft -= 1

-- 			if #(GetEntityCoords(playerPed)-Config.CircleZones.HeroinProcessing.coords) > 4 then
-- 				TriggerServerEvent('mrich-jobpack:cancelProcessing')
-- 				break
-- 			end
-- 		end
-- 		ClearPedTasks(playerPed)
-- 		isProcessing = false
-- 	end, function()
-- 		ClearPedTasks(playerPed)
-- 		isProcessing = false
-- 	end)
-- end

-- RegisterNetEvent('mrich-jobpack:ProcessPoppy', function()
-- 	local coords = GetEntityCoords(PlayerPedId(source))
	
-- 	if #(coords-Config.CircleZones.HeroinProcessing.coords) < 5 then
-- 		if not isProcessing then
-- 			QBCore.Functions.TriggerCallback('mrich-jobpack:validate_items', function(result)
-- 				if result.ret then
-- 					ProcessHeroin()
-- 				else
-- 					QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
-- 				end
-- 			end, {poppyresin = Config.HeroinProcessing.Poppy})
-- 		end
-- 	end
-- end)

local function BanAoThanhPham()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())

		exports.XNLRankBar:Exp_XNL_AddPlayerXP(10)
    	TriggerServerEvent("mrich-jobpack:BanAo")
    end
end

RegisterNetEvent('mrich-jobpack:BanAoThanhPham', function()
	local hasItem = QBCore.Functions.HasItem('ao_somi')
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.banao"), math.random(9000, 9000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'switch@michael@talks_to_guard',
			anim = '001393_02_mics3_3_talks_to_guard_exit_guard',
			}, {}, {}, function()
				BanAoThanhPham()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn áo đã gia công.', "error")
	end
end)

local function MayAoThanhPham()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())
	
    	TriggerServerEvent("mrich-jobpack:mayaothanhpham")

		local timeLeft = Config.Delays.HeroinProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1

			if #(GetEntityCoords(playerPed)-Config.CircleZones.HeroinProcessing.coords) > 4 then

				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:cancelProcessing')
				break
			end
		end

    end
end

RegisterNetEvent('mrich-jobpack:mayao', function()
	local hasItem = QBCore.Functions.HasItem('cuon_vai', Config.SoCuonVai)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.mayao"), math.random(8000, 12000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = 'mini@repair',
				anim = 'fixing_a_ped',
			}, {}, {}, function()
				MayAoThanhPham()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn cuộn vải nào.', "error")
	end
end)

local function ProcessHeroin()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())
	
    	TriggerServerEvent("mrich-jobpack:processPoppyResin")

		local timeLeft = Config.Delays.HeroinProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1

			if #(GetEntityCoords(playerPed)-Config.CircleZones.HeroinProcessing.coords) > 4 then

				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:cancelProcessing')
				break
			end
		end

    end
end

RegisterNetEvent('mrich-jobpack:ProcessPoppy', function()
	local hasItem = QBCore.Functions.HasItem('soi_vai', Config.SoSoiVai)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.detvai"), math.random(8000, 12000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = 'mp_am_hold_up',
				anim = 'purchase_beerbox_shopkeeper',
			}, {}, {}, function()
				ProcessHeroin()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn sợi vải (cần 3).', "error")
	end
end)

RegisterNetEvent("mrich-jobpack:pickHeroin", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID

	for i=1, #PoppyPlants, 1 do
		if #(coords - GetEntityCoords(PoppyPlants[i])) < 3 then
			nearbyObject, nearbyID = PoppyPlants[i], i
		end
	end

	if nearbyObject and IsPedOnFoot(playerPed) then
		isPickingUp = true
		TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.haisoivai"), 10000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ClearPedTasks(playerPed)
			SetEntityAsMissionEntity(nearbyObject, false, true)
			DeleteObject(nearbyObject)

			table.remove(PoppyPlants, nearbyID)
			spawnedPoppys -= 1

			exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
			TriggerServerEvent('mrich-jobpack:pickedUpPoppy')
			isPickingUp = false

		end, function()
			ClearPedTasks(playerPed)
			isPickingUp = false
		end)
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1)
	blip1 = AddBlipForCoord(3492.66, 2575.31, 12.64)
	blip2 = AddBlipForCoord(711.16, -971.53, 30.40)
	blip3 = AddBlipForCoord(429.23, -807.38, 29.49)

	SetBlipSprite(blip1, 73)
	SetBlipColour(blip1, 5)
	SetBlipScale(blip1, 0.8)
	SetBlipAsShortRange(blip1, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ VẢI] ~w~BÃI DẦU GAI")
	EndTextCommandSetBlipName(blip1)

	SetBlipSprite(blip2, 73)
	SetBlipColour(blip2, 5)
	SetBlipScale(blip2, 0.8)
	SetBlipAsShortRange(blip2, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ VẢI] ~w~NHÀ MÁY DỆT")
	EndTextCommandSetBlipName(blip2)

	SetBlipSprite(blip3, 73)
	SetBlipColour(blip3, 5)
	SetBlipScale(blip3, 0.8)
	SetBlipAsShortRange(blip3, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ VẢI] ~w~BÁN VẢI")
	EndTextCommandSetBlipName(blip3)   			
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(PoppyPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

CreateThread(function()
	local heroinZone = CircleZone:Create(Config.CircleZones.HeroinField.coords, 50.0, {
		name = "ps-heroinzone",
		debugPoly = false
	})
	heroinZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inHeroinField = true
            SpawnPoppyPlants()
        else
            inHeroinField = false
        end
    end)
end)
