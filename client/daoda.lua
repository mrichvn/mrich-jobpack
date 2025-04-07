local spawnedWeeds = 0
local weedPlants = {}
local isPickingUp, isProcessing, inWeedField = false, false, false
local QBCore = exports['qb-core']:GetCoreObject()

local function ValidateWeedCoord(plantCoord)
	local validate = true
	if spawnedWeeds > 0 then
		for _, v in pairs(weedPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if not inWeedField then
			validate = false
		end
	end
	return validate
end

local function GetCoordZWeed(x, y)
	local groundCheckHeights = { 50, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 53.85
end

local function GenerateWeedCoords()
	while true do
		Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = Config.CircleZones.WeedField.coords.x + modX
		weedCoordY = Config.CircleZones.WeedField.coords.y + modY

		local coordZ = GetCoordZWeed(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

local function SpawnWeedPlants()
	local model = `csx_coastsmalrock_01_`
	while spawnedWeeds < 15 do
		Wait(0)
		local weedCoords = GenerateWeedCoords()
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(100)
		end
		local obj = CreateObject(model, weedCoords.x, weedCoords.y, weedCoords.z, false, true, false)
		PlaceObjectOnGroundProperly(obj)
		FreezeEntityPosition(obj, true)
		table.insert(weedPlants, obj)
		spawnedWeeds += 1
	end
	SetModelAsNoLongerNeeded(model)
end

local function NungDaSach()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())
	
		exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
    	TriggerServerEvent("mrich-jobpack:NungDa")

    end
end

RegisterNetEvent('mrich-jobpack:nungkhoangsan', function()
	local hasItem = QBCore.Functions.HasItem('da_sach', Config.SoDaNung)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.nungda"), math.random(10000, 15000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'amb@prop_human_parking_meter@male@base',
			anim = 'base',
			-- flags = 16,
			}, {}, {}, function()
				NungDaSach()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn đá sạch.', "error")
	end
end)

local function ProcessWeed()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())
	
    	TriggerServerEvent("mrich-jobpack:processCannabis")

		local timeLeft = Config.Delays.WeedProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1

			if #(GetEntityCoords(playerPed)-Config.CircleZones.WeedProcessing.coords) > 4 then

				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:cancelProcessing')
				break
			end
		end

    end
end

RegisterNetEvent('mrich-jobpack:processWeed', function()
	local hasItem = QBCore.Functions.HasItem('da_tho', Config.SoDaRua)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.ruada"), math.random(8000, 12000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'amb@world_human_bum_wash@male@high@idle_a',
			anim = 'idle_c',
			-- flags = 16,
			}, {}, {}, function()
				ProcessWeed()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn đá thô.', "error")
	end
end)

RegisterNetEvent("mrich-jobpack:pickWeed", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID

	for i= 1, #weedPlants, 1 do
		if #(coords - GetEntityCoords(weedPlants[i])) < 3 then
			nearbyObject, nearbyID = weedPlants[i], i
		end
	end

	if nearbyObject and IsPedOnFoot(playerPed) then
		if not isPickingUp then
			isPickingUp = true

			local dict = loadDict('melee@large_wpn@streamed_core')
			TaskPlayAnim(PlayerPedId(), dict, 'ground_attack_on_spot', 3.0, 3.0, -1, 3, 0, 0, 0, 0, false, false, false)
			Citizen.Wait(0)

			pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
			AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 1, true) 
			TriggerServerEvent("mrich-sound:server:play:source", "Pickaxe", 0.2)
			ClearPedTasks(ped)
			DisableControlAction(0, 73,  true) --disable X

			QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.daoda"), 8000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				ClearPedTasks(PlayerPedId())
				SetEntityAsMissionEntity(nearbyObject, false, true)
				DeleteObject(nearbyObject)
				table.remove(weedPlants, nearbyID)
				spawnedWeeds = spawnedWeeds - 1

				DetachEntity(pickaxe, 1, true)
				DeleteEntity(pickaxe)
				DeleteObject(pickaxe)
				DisableControlAction(0, 73,  false) --disable X

				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:pickedUpCannabis')
				isPickingUp = false
			end, function()
				ClearPedTasks(PlayerPedId())
				isPickingUp = false
			end)
		end
	end
end)

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(5000) RequestAnimDict(dict) end
    return dict
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs (Config.Ruada) do
            local ten = v.ten
            local toado = v.toado
            local ruada_dist = GetDistanceBetweenCoords(playerCoords, toado.x, toado.y, toado.z, 1)
            DrawMarker(2, toado.x, toado.y, toado.z,0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 139, 255, 74, 155, 0, 0, 2, 1, 0, 0, 0)
            if ruada_dist > 2.0 and ruada_dist <= 20.0 then
                Draw3DText(toado.x, toado.y, toado.z, "Nơi rửa đá")	
            end
        
        end
    end
end)

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.25, 0.25)
    SetTextFont(fontId,4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 340
    DrawRect(_x,_y+0.0115, 0.015+ factor, 0.03, 31, 11, 41, 68)
end

Citizen.CreateThread(function()
	Citizen.Wait(1)
	blip1 = AddBlipForCoord(2952.93, 2788.58, 41.55)
	blip2 = AddBlipForCoord(1882.46, 403.29, 161.31)
	blip3 = AddBlipForCoord(1109.96, -2008.20, 31.06)

	SetBlipSprite(blip1, 85)
	SetBlipColour(blip1, 5)
	SetBlipScale(blip1, 0.8)
	SetBlipAsShortRange(blip1, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ ĐÁ] ~w~KHAI THÁC ĐÁ")
	EndTextCommandSetBlipName(blip1)

	SetBlipSprite(blip2, 85)
	SetBlipColour(blip2, 5)
	SetBlipScale(blip2, 0.8)
	SetBlipAsShortRange(blip2, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ ĐÁ] ~w~RỬA ĐÁ")
	EndTextCommandSetBlipName(blip2)

	SetBlipSprite(blip3, 85)
	SetBlipColour(blip3, 5)
	SetBlipScale(blip3, 0.8)
	SetBlipAsShortRange(blip3, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ ĐÁ] ~w~NUNG ĐÁ")
	EndTextCommandSetBlipName(blip3)   			
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(weedPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

CreateThread(function()
	local weedZone = CircleZone:Create(Config.CircleZones.WeedField.coords, 10.0, {
		name = "ps-weedzone",
		debugPoly = false
	})
	weedZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inWeedField = true
            SpawnWeedPlants()
        else
            inWeedField = false
        end
    end)
end)
