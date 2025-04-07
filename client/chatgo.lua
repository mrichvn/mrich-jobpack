local QBCore = exports['qb-core']:GetCoreObject()
local spawnedCocaLeaf = 0
local CocaPlants = {}
local isPickingUp, isProcessing, inCokeField = false, false, false

local function ProcessCoke()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())
	
    	TriggerServerEvent("mrich-jobpack:processCocaLeaf")

		local timeLeft = Config.Delays.CokeProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1

			if #(GetEntityCoords(playerPed)-Config.CircleZones.CokeProcessing.coords) > 4 then
				
				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:cancelProcessing')
				break
			end
		end

    end
end


local function ValidateCocaLeafCoord(plantCoord)
	local validate = true
	if spawnedCocaLeaf > 0 then
		for _, v in pairs(CocaPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if not inCokeField then
			validate = false
		end
	end
	return validate
end

local function GetCoordZCoke(x, y)
	local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 77
end

local function GenerateCocaLeafCoords()
	while true do
		Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-35, 35)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-35, 35)

		weedCoordX = Config.CircleZones.CokeField.coords.x + modX
		weedCoordY = Config.CircleZones.CokeField.coords.y + modY

		local coordZ = GetCoordZCoke(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateCocaLeafCoord(coord) then
			return coord
		end
	end
end

local function SpawnCocaPlants()
	local model = `prop_tree_fallen_pine_01`
    while spawnedCocaLeaf < 15 do
        Wait(0)
        local weedCoords = GenerateCocaLeafCoords()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
        local obj = CreateObject(model, weedCoords.x, weedCoords.y, weedCoords.z, false, true, false)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
		table.insert(CocaPlants, obj)
        spawnedCocaLeaf += 1
    end
	SetModelAsNoLongerNeeded(model)
end

RegisterNetEvent('mrich-jobpack:ProcessCocaFarm', function()
	local hasItem = QBCore.Functions.HasItem('cay_go', Config.XeVanGo)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.xego"), math.random(7000, 8000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'mp_am_hold_up',
			anim = 'purchase_beerbox_shopkeeper',
			}, {}, {}, function()
				ProcessCoke()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn gỗ thông.', "error")
	end
end)

local function BanGoThanhPham()
    local count = 0
    if(count == 0) then

		Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)
		ClearPedTasks(PlayerPedId())

		exports.XNLRankBar:Exp_XNL_AddPlayerXP(10)
    	TriggerServerEvent("mrich-jobpack:BanGo")
    end
end

RegisterNetEvent('mrich-jobpack:BanThanhPham', function()
	local hasItem = QBCore.Functions.HasItem('gothanhpham', Config.XeVanGo)
	if hasItem then
		QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.bango"), math.random(9000, 9000), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = 'switch@michael@talks_to_guard',
			anim = '001393_02_mics3_3_talks_to_guard_exit_guard',
			}, {}, {}, function()
				BanGoThanhPham()
			end, function()
				QBCore.Functions.Notify('Hủy bỏ', "error")
		end)
	else
		QBCore.Functions.Notify('Bạn không còn ván gỗ.', "error")
	end
end)

RegisterNetEvent('mrich-jobpack:pickCocaLeaves', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID

	for i=1, #CocaPlants, 1 do
		if #(coords - GetEntityCoords(CocaPlants[i])) < 3 then
			nearbyObject, nearbyID = CocaPlants[i], i
		end
	end

	if nearbyObject and IsPedOnFoot(playerPed) then
		if not isPickingUp then
			isPickingUp = true

			local dict = loadDict('melee@large_wpn@streamed_core')
			TaskPlayAnim(PlayerPedId(), dict, 'short_0_attack', 3.0, 3.0, -1, 3, 0, 0, 0, 0, false, false, false)
			Citizen.Wait(0)

			RiuChatGo = CreateObject(GetHashKey("prop_w_me_hatchet"), 0, 0, 0, true, true, true) 
			AttachEntityToEntity(RiuChatGo, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.08, 0.08, -0.09, -78.0, 13.0, 28.0, false, true, true, true, 1, true)					
			ClearPedTasks(ped)
			DisableControlAction(0, 73,  true) --disable X

			QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.chatgo"), 9000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				ClearPedTasks(playerPed)
				SetEntityAsMissionEntity(nearbyObject, false, true)
				DeleteObject(nearbyObject)

				table.remove(CocaPlants, nearbyID)
				spawnedCocaLeaf = spawnedCocaLeaf - 1

				DetachEntity(RiuChatGo, 1, true)
				DeleteEntity(RiuChatGo)
				DeleteObject(RiuChatGo)
				DisableControlAction(0, 73,  false) --disable X

				exports.XNLRankBar:Exp_XNL_AddPlayerXP(3)
				TriggerServerEvent('mrich-jobpack:pickedUpCocaLeaf')
				isPickingUp = false
			end, function()
				ClearPedTasks(playerPed)
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
	Citizen.Wait(1)
	blip1 = AddBlipForCoord(-500.2549, 5470.918, 80.16626)
	blip2 = AddBlipForCoord(-556.16, 5320.36, 72.59485)
	blip3 = AddBlipForCoord(-567.48, 5253.10, 70.49)

	SetBlipSprite(blip1, 479)
	SetBlipColour(blip1, 7)
	SetBlipScale(blip1, 0.8)
	SetBlipAsShortRange(blip1, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ GỖ] ~w~KHAI THÁC GỖ")
	EndTextCommandSetBlipName(blip1)

	SetBlipSprite(blip2, 479)
	SetBlipColour(blip2, 7)
	SetBlipScale(blip2, 0.8)
	SetBlipAsShortRange(blip2, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ GỖ] ~w~XƯỞNG XẺ GỖ")
	EndTextCommandSetBlipName(blip2)

	SetBlipSprite(blip3, 479)
	SetBlipColour(blip3, 7)
	SetBlipScale(blip3, 0.8)
	SetBlipAsShortRange(blip3, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("~g~[NGHỀ GỖ] ~w~BÁN GỖ")
	EndTextCommandSetBlipName(blip3)

end)

--Tao may xe go

Citizen.CreateThread(function()
	for k, v in pairs (Config.Xego) do
        local BanCuaGo = CreateObject("bkr_prop_fakeid_papercutter", v.toadoban, true, true, true)
        PlaceObjectOnGroundProperly(BanCuaGo)
		FreezeEntityPosition(obj, true)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(CocaPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

RegisterCommand('propfix', function()
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

CreateThread(function()
	local cokeZone = CircleZone:Create(Config.CircleZones.CokeField.coords, 10.0, {
		name = "ps-cokezone",
		debugPoly = false
	})
	cokeZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inCokeField = true
            SpawnCocaPlants()
        else
            inCokeField = false
        end
    end)
end)
