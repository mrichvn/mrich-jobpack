Config = {}

Config.KeyRequired = true

Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
}

Config.CircleZones = {
	WeedField = {coords = vector3(2951.27, 2788.29, 41.41), name = ('Weed Farm'), radius = 100.0}, --ĐÀO ĐÁ
	WeedProcessing = {coords = vector3(1882.46, 403.29, 161.31), name = ('Weed Process'), radius = 100.0},
	
	MethProcessing = {coords = vector3(978.17, -147.98, -48.53), name = ('Meth Process'), radius = 20.0},
	MethTemp = {coords = vector3(982.56, -145.59, -49.0), name = ('Meth Temperature'), radius = 20.0},
	
	CokeField = {coords = vector3(-500.2549, 5470.918, 80.16626), name = ('Coke'), radius = 100.0}, --CHẶT GỖ
	CokeProcessing = {coords = vector3(1087.14, -3195.31, -38.99), name = ('Coke Process'), radius = 20.0}, 
	
	HeroinField = {coords = vector3(3492.66, 2575.31, 12.64), name = ('Heroin'), radius = 100.0}, --HÁI SỢI VẢI
	HeroinProcessing = {coords = vector3(711.16, -971.53, 30.40), name = ('Heroin Process'), radius = 100.0},
}

--------------------------------
----------	NGHỀ ĐÁ  -----------
--------------------------------

Config.SoDaRua = 1   -- Số đá được rửa
Config.SoDaNung = 1   -- Số đá được Nung

Config.Items = {
		'thoi_thep',
		'sat_vun',
		'thoi_vang',
		'thoi_sat',
		'nhua',
}

Config.Ruada = {

	['ruada1'] = {
		ten = 'Nơi rửa đá #1',
		toado = vector3(1882.46, 403.29, 161.31),
	},	
}

Config.WeedProcessing = {
	datho = 1, -- Lượng lá cần thiết để xử lý
	dasach = math.random(1,2), -- Lượng Coke nhận được
}

--------------------------------
----------	NGHỀ gỗ  -----------
--------------------------------

Config.XeVanGo = 1   -- Số gỗ được cắt ra

Config.Xego = {

	['xego1'] = {
		ten = 'Nơi xẻ gỗ #1',
		toado = vector3(-561.90, 5315.85, 72.59485),
		toadoban = vector3(-561.90, 5315.85, 72.59485),
	},
	
	['xego2'] = {
		ten = 'Nơi xẻ gỗ #2',
		toado = vector3(-556.16, 5320.36, 72.59485),
		toadoban = vector3(-556.16, 5320.36, 72.59485),
	},
	
	['xego3'] = {
		ten = 'Nơi xẻ gỗ #3',
		toado = vector3(-552.6198, 5326.773, 72.59485),
		toadoban = vector3(-552.6198, 5326.773, 72.59485),
	},
}

--------------------------------
----------	NGHỀ VẢI  ----------
--------------------------------

Config.SoSoiVai = 3   -- Số đá được rửa
Config.SoCuonVai = 1   -- Số đá được Nung

Config.CuonVaiProcessing = {
	soivai = 1, -- Lượng lá cần thiết để xử lý
	cuonvai = math.random(1,2), -- Lượng SP nhận được
}

Config.MayAoProcessing = {
	cuonvai = 1, -- Lượng lá cần thiết để xử lý
	aothanhpham = 1, -- Lượng SP nhận được
}

Config.Items = {
		'thoi_thep',
		'sat_vun',
		'thoi_vang',
		'thoi_sat',
		'nhua',
}

Config.Ruada = {

	['ruada1'] = {
		ten = 'Nơi rửa đá #1',
		toado = vector3(1882.46, 403.29, 161.31),
	},
}


--------------------------------
-- DRUG CONFIG AMOUNTS --
--------------------------------

--------------------------------
-- COKE PROCESSING AMOUNTS --
--------------------------------

Config.CokeProcessing = {
	CokeLeaf = 1, -- Lượng lá cần thiết để xử lý
	ProcessCokeLeaf = math.random(1,2), -- Lượng Coke nhận được
	-- Xử lý những viên gạch nhỏ --
	Coke = 10, -- Lượng Coke cần thiết cho gạch nhỏ
	BakingSoda = 5, -- Số lượng baking soda cần thiết cho gạch nhỏ
	SmallCokeBrick = math.random(2,7),
	-- Xử lý những viên gạch nhỏ thành gạch lớn --
	SmallBrick = 4, -- Số lượng gạch nhỏ cần
	LargeBrick = 1, -- Những viên gạch lớn nhận được
}

--------------------------------
-- METH PROCESSING AMOUNTS --
--------------------------------
Config.MethProcessing = {
	-- Chemical Processing --
	SulfAcid = 1, -- Amount of Sulfuric Acid Needed for Liquid Mix
	HydAcid = 1, -- Amount of Hydrochloric Acid Needed for Liquid Mix
	SodHyd = 1, -- Amount of Sodium Hydroxide Needed for Liquid Mix
	Meth = math.random(5,12), -- Amount of Meth Recevied From 1 Tray
}

--------------------------------
-- HEROIN PROCESSING AMOUNTS --
--------------------------------
Config.HeroinProcessing = {
	Poppy = 2 -- Amount of Poppy Required for 1 Heroin
}
