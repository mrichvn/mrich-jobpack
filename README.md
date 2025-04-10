# Project MRICH JOB PACK Processing

# older qb-core  
qb-core/shared/item.lua
```lua
    -- CHẶT GỖ
	["cay_go"]						= {["name"] = "cay_go",						["label"] = "Gỗ thông", 		        ["weight"] = 200,       ["type"] = "item",      ["image"] = "cay_go.png",	        ["unique"] = false,	    ["useable"] = false,    ["shouldClose"] = false,    ['combinable'] = nil,   ["description"] = "Gỗ mới chặt trên cây xuống vẫn còn tươi rói"},
    ["gothanhpham"]					= {["name"] = "gothanhpham", 				["label"] = "Ván gỗ",		["weight"] = 500,       ["type"] = "item",      ["image"] = "gothanhpham.png",	        ["unique"] = false,	    ["useable"] = false,    ["shouldClose"] = false,    ['combinable'] = nil,   ["description"] = "Gỗ đã cắt thành phẩm & có thể bán"},

    -- HÁI SỢI VẢI
	["soi_vai"]						= {["name"] = "soi_vai",						["label"] = "Sợi vải", 		        ["weight"] = 200,       ["type"] = "item",      ["image"] = "soi_vai.png",	        ["unique"] = false,	    ["useable"] = false,    ["shouldClose"] = false,    ['combinable'] = nil,   ["description"] = "Sợi vải mới thu hoạch vẫn còn tươi rói"},
    ["cuon_vai"]					= {["name"] = "cuon_vai", 				["label"] = "Cuộn vải",		["weight"] = 500,       ["type"] = "item",      ["image"] = "cuon_vai.png",	        ["unique"] = false,	    ["useable"] = false,    ["shouldClose"] = false,    ['combinable'] = nil,   ["description"] = "Cuộn vải được dệt từ sợi vải"},
    ["ao_somi"]					= {["name"] = "ao_somi", 				["label"] = "Áo sơ mi",		["weight"] = 500,       ["type"] = "item",      ["image"] = "ao_somi.png",	        ["unique"] = false,	    ["useable"] = false,    ["shouldClose"] = false,    ['combinable'] = nil,   ["description"] = "Áo sơ mi đã may thành phẩm & có thể bán"},

    -- ĐÀO ĐÁ
    ["da_tho"]						= {["name"] = "da_tho",           			["label"] = "Đá thô",	 				["weight"] = 200, 	    ["type"] = "item", 		["image"] = "da_tho.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
	["da_sach"] 		 	 		 = {["name"] = "da_sach",           			["label"] = "Đá sạch",	 				["weight"] = 500, 	    ["type"] = "item", 		["image"] = "da_sach.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["thoi_dong"] 		 	 		 = {["name"] = "thoi_dong",           			["label"] = "Thỏi Đồng",	 			["weight"] = 500, 	    ["type"] = "item", 		["image"] = "thoi_dong.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["thoi_nhom"] 					 = {["name"] = "thoi_nhom", 			  	  	["label"] = "Thỏi Nhôm", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "thoi_nhom.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["thoi_sat"] 				     = {["name"] = "thoi_sat", 			  	        ["label"] = "Thỏi Sắt", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "thoi_sat.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["thoi_thep"] 				     = {["name"] = "thoi_thep", 			  	    ["label"] = "Thỏi Thép", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "thoi_thep.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["thoi_vang"] 					 = {["name"] = "thoi_vang", 			  	  	["label"] = "Thỏi Vàng", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "thoi_vang.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
```

# Add icon images

qb-inventory > html > images

# Dependencies
* [PolyZone](https://github.com/mkafrin/PolyZone)
* [qb-target](https://github.com/BerkieBb/qb-target)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
