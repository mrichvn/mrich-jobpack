local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = 's_m_y_construct_01',
        coords = vector4(-567.48, 5253.10, 70.49, 75.21), 
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        target = { 
            options = {
                {
					type = "client",
					event = "mrich-jobpack:BanThanhPham",
					icon = "fas fa-key",
					label = Lang:t("target.bango"),
                }
            },
          distance = 2.5,
        },
    }) --Bán gỗ
    exports['qb-target']:SpawnPed({
        model = 'mp_f_boatstaff_01',
        coords = vector4(429.23, -807.38, 29.49, 186.68), 
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        target = { 
            options = {
                {
					type = "client",
					event = "mrich-jobpack:BanAoThanhPham",
					icon = "fas fa-key",
					label = Lang:t("target.banao"),
                }
            },
          distance = 2.5,
        },
    }) --Bán áo
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("RuaDa", vector4(1882.46, 403.29, 161.31, 151.31), 2.5, 4.5, {
        name="RuaDa",
        heading = 4.6,
        debugPoly= false,
        minZ= 161.91 - 10.0,
        maxZ= 161.91 + 10.0,
    }, {
        options = {
            {
                event = "mrich-jobpack:processWeed",
                icon = "fas fa-circle",
                -- item = "khay_loc",
                label = Lang:t("target.ruada"),
                coords = vector3(1882.46, 403.29, 161.31)
                --job = "pawnshop", -- Xóa dòng này nếu bạn không muốn kiểm tra công việc.
            },
        },
    distance = 2.0
    }) --Rửa đá
    exports['qb-target']:AddBoxZone("NungDa", vector4(1109.96, -2008.20, 31.06, 227.68), 2.5, 2.5, {
        name="NungDa",
        heading = 2.5,
        debugPoly= false,
        minZ= 31.06 - 10.0,
        maxZ= 31.06 + 10.0,
    }, {
        options = {
            {
                event = "mrich-jobpack:nungkhoangsan",
                icon = "fas fa-circle",
                -- item = "khay_loc",
                label = Lang:t("target.nungda"),
                coords = vector3(1109.96, -2008.20, 31.06)
                --job = "pawnshop", -- Xóa dòng này nếu bạn không muốn kiểm tra công việc.
            },
        },
    distance = 2.0
    }) --Nung đá
    exports['qb-target']:AddBoxZone("DetVai", vector4(711.79, -973.98, 30.75, 136.70), 2.5, 6.5, {
        name="DetVai",
        heading = 136,
        debugPoly= false,
        minZ= 30.40 - 10.0,
        maxZ= 30.40 + 10.0,
    }, {
        options = {
            {
                event = "mrich-jobpack:ProcessPoppy",
                icon = "fas fa-circle",
                label = Lang:t("target.detvai"),
                coords = vector3(711.16, -971.53, 30.40)
                --job = "pawnshop", -- Xóa dòng này nếu bạn không muốn kiểm tra công việc.
            },
        },
    distance = 2.0
    }) --Dệt vải
    exports['qb-target']:AddBoxZone("MayAo", vector4(716.65, -961.59, 30.40, 5.60), 4.5, 8.5, {
        name="MayAo",
        heading = 2.5,
        debugPoly= false,
        minZ= 30.40 - 10.0,
        maxZ= 30.40 + 10.0,
    }, {
        options = {
            {
                event = "mrich-jobpack:mayao",
                icon = "fas fa-circle",
                label = Lang:t("target.mayao"),
                coords = vector3(716.65, -961.59, 30.40)
                --job = "pawnshop", -- Xóa dòng này nếu bạn không muốn kiểm tra công việc.
            },
        },
    distance = 2.0
    }) --May Áo
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel("prop_tree_fallen_pine_01", {
        options = {
            {
                type = "client",
                event = "mrich-jobpack:pickCocaLeaves",
                icon = "fas fa-leaf",
                label = Lang:t("target.chatgo"),
            },
        },
        distance = 4.0
    }) --Chặt gỗ 
    exports['qb-target']:AddTargetModel("bkr_prop_fakeid_papercutter", {
        options = {
            {
                type = "client",
                event = "mrich-jobpack:ProcessCocaFarm",
                icon = "fas fa-dna",
                label = Lang:t("target.xego"),
            },
        },
        distance = 4.0
    }) --Cưa ván gỗ
    exports['qb-target']:AddTargetModel("prop_plant_cane_02b", {
        options = {
            {
                type = "client",
                event = "mrich-jobpack:pickHeroin",
                icon = "fas fa-leaf",
                label = Lang:t("target.haisoivai"),
            },
        },
        distance = 4.0
    }) --Hái cây dầu gai
    exports['qb-target']:AddTargetModel("csx_coastsmalrock_01_", {
        options = {
            {
                type = "client",
                event = "mrich-jobpack:pickWeed",
                icon = "fas fa-envira",
                label = Lang:t("target.khaithacda"),
            },
        },
        distance = 4.0
    }) --Đào đá
end)
