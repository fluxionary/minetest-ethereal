
--= Register Biome Decoration Using Plants Mega Pack Lite

--= Desert Biome

-- Cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"desert", "desertstone"},
	decoration = {"bakedclay:cactus_echinocereus", "bakedclay:cactus_matucana", "bakedclay:cactus_baseball", "bakedclay:cactus_golden"},
})

-- Desert Plants
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone", "default:sand"},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"desert", "desertstone"},
	decoration = {"bakedclay:desert_kangaroo", "bakedclay:desert_brittle", "bakedclay:desert_ocotillo", "bakedclay:desert_whitesage"},
})

--=  Prairie Biome

-- Grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:prairie_dirt", "ethereal:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo"},
	decoration = {"bakedclay:grass_prairie", "bakedclay:grass_cord", "bakedclay:grass_wheatgrass", "bakedclay:desert_whitesage"},
})

-- Flowers
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:prairie_grass", "ethereal:green_dirt", "ethereal:grove_dirt", "ethereal:bamboo_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "bamboo"},
	decoration = {"bakedclay:flower_jacobsladder", "bakedclay:flower_thistle", "bakedclay:flower_wildcarrot"},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:prairie_grass", "ethereal:green_dirt", "ethereal:grove_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "grove"},
	decoration = {"bakedclay:flower_delphinium", "bakedclay:flower_celosia", "bakedclay:flower_daisy", "bakedclay:flower_bluerose"},
})

-- Shrubs
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:prairie_grass", "ethereal:green_dirt", "ethereal:grove_dirt", "ethereal:jungle_grass", "ethereal:gray_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "grove", "junglee", "grayness", "jumble"},
	decoration = {"bakedclay:shrub_kerria", "bakedclay:shrub_spicebush"},
})

--= Jungle Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt", "ethereal:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.007,
	biomes = {"junglee", "jumble"},
	decoration = {"bakedclay:rainforest_guzmania", "bakedclay:rainforest_devil", "bakedclay:rainforest_lazarus", "bakedclay:rainforest_lollipop", "bakedclay:mushroom_woolly"},
})

--= Cold Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_snow", "ethereal:cold_dirt", "ethereal:gray_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"snowy", "alpine", "grayness"},
	decoration = {"bakedclay:mountain_edelweiss", "bakedclay:mountain_armeria", "bakedclay:mountain_bellflower", "bakedclay:mountain_willowherb", "bakedclay:mountain_bistort"},

})

--= Mushroom Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:mushroom_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"mushroom"},
	decoration = {"bakedclay:mushroom_powderpuff", "bakedclay:mushroom_chanterelle", "bakedclay:mushroom_parasol"},
})

--= Lakeside

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand", "default:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.015,
	biomes = {"sandclay", "lake", "grassy", "grassytwo", "jumble"},
	decoration = {"bakedclay:wetlands_cattails", "bakedclay:wetlands_pickerel", "bakedclay:wetlands_mannagrass", "bakedclay:wetlands_turtle"},
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

--= Harsh Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:mushroom_dirt", "ethereal:green_dirt", "ethereal:gray_dirt", "ethereal:cold_dirt", "ethereal:dirt_with_snow", "ethereal:jungle_dirt", "ethereal:prairie_dirt", "ethereal:grove_dirt", "ethereal:dry_dirt", "ethereal:fiery_dirt", "default:sand", "default:desert_sand", "bakedclay:red", "ethereal:bamboo_dirt"},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"mushroom", "prairie", "grayness", "plains", "desert", "lake", "junglee", "grassy", "grassytwo", "jumble", "snowy", "alpine", "fiery", "mesa", "bamboo"},
	decoration = {"bakedclay:spooky_thornbush", "bakedclay:spooky_baneberry"},
})
