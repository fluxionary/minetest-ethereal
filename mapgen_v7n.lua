-- clear default mapgen biomes and decorations
minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

-- register ore's
minetest.register_ore({
	ore_type         = "blob",
	ore              = "bakedclay:red",
	wherein          = {"bakedclay:orange"},
	clust_scarcity   = 4 * 4 * 4,
	clust_num_ores = 8,
	clust_size       = 6,
	y_min            = -10,
	y_max            = 71,
	noise_params     = {
		offset = 0.35,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -316,
		octaves = 1,
		persist = 0.5
	},
})

minetest.register_ore({
	ore_type         = "blob",
	ore              = "bakedclay:grey",
	wherein          = {"bakedclay:orange"},
	clust_scarcity   = 4 * 4 * 4,
	clust_num_ores = 8,
	clust_size       = 6,
	y_min            = -10,
	y_max            = 71,
	noise_params     = {
		offset = 0.35,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -613,
		octaves = 1,
		persist = 0.5
	},
})

local path = minetest.get_modpath("ethereal").."/schematics/"

-- tree schematics
dofile(path.."apple_tree.lua")
dofile(path.."orange_tree.lua")
dofile(path.."banana_tree.lua")
dofile(path.."bamboo_tree.lua")
dofile(path.."birch_tree.lua")
dofile(path.."bush.lua")
dofile(path.."waterlily.lua")

--= Biomes (Minetest 0.4.13 and above)

local add_biome = function(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)

	if p ~= 1 then return end

	minetest.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
		node_water_top = h,
		depth_water_top = i,
		node_water = j,
		node_river_water = k,
		y_min = l,
		y_max = m,
		heat_point = n,
		humidity_point = o,
	})
end

add_biome("underground", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	-31000, -192, 50, 50, 1)

add_biome("desert", nil, "default:desert_sand", 1, "default:desert_sand", 3,
	"default:desert_stone", nil, nil, nil, nil, 3, 23, 35, 20, ethereal.desert)

add_biome("desert_ocean", nil, "default:sand", 1, "default:sand", 2,
	"default:desert_stone", nil, nil, nil, nil, -192, 3, 35, 20, ethereal.desert)

add_biome("glacier", "default:snowblock", "default:snowblock", 1,
	"default:snowblock", 3, "default:ice", "default:ice", 10, -8, 31000, 0, 50, ethereal.glacier)

add_biome("glacier_ocean", "default:snowblock", "default:sand", 1, "default:sand", 3,
	nil, nil, nil, nil, nil, -112, -9, 0, 50, ethereal.glacier)

add_biome("bamboo", nil, "ethereal:bamboo_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 71, 45, 75, ethereal.bamboo)

add_biome("bamboo_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 75, ethereal.bamboo)

add_biome("mesa", nil, "bakedclay:orange", 1, "bakedclay:orange", 15,
	nil, nil, nil, nil, nil, 1, 71, 25, 28, ethereal.mesa)

add_biome("mesa_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 25, 28, ethereal.mesa)

add_biome("alpine", nil, "default:dirt_with_snow", 1, "default:dirt", 2,
	nil, nil, nil, nil, nil, 40, 140, 10, 40, ethereal.alpine)

add_biome("snowy", nil, "ethereal:cold_dirt", 1, "default:dirt", 2,
	nil, nil, nil, nil, nil, 4, 40, 10, 40, ethereal.snowy)

add_biome("frost", nil, "ethereal:crystal_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 10, 40, ethereal.frost)

add_biome("frost_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 10, 40, ethereal.frost)

add_biome("grassy", nil, "ethereal:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 91, 13, 40, ethereal.grassy)

add_biome("grassy_ocean", nil, "defaut:sand", 2, "default:gravel", 1,
	nil, nil, nil, nil, nil, -31000, 3, 13, 40, ethereal.grassy)

add_biome("caves", nil, "default:desert_stone", 3, "air", 8,
	nil, nil, nil, nil, nil, 4, 41, 15, 25, ethereal.caves)

add_biome("grayness", nil, "ethereal:gray_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 2, 41, 15, 30, ethereal.grayness)

add_biome("grayness_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 15, 30, ethereal.grayness)

add_biome("grassytwo", nil, "ethereal:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 91, 15, 40, ethereal.grassytwo)

add_biome("grassytwo_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 15, 40, ethereal.grassytwo)

add_biome("prairie", nil, "ethereal:prairie_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 26, 20, 40, ethereal.prairie)

add_biome("prairie_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 20, 40, ethereal.prairie)

add_biome("jumble", nil, "ethereal:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 25, 50, ethereal.jumble)

add_biome("jumble_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 25, 50, ethereal.jumble)

add_biome("junglee", nil, "ethereal:jungle_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 30, 60, ethereal.junglee)

add_biome("junglee_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 30, 60, ethereal.junglee)

add_biome("grove", nil, "ethereal:grove_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 23, 45, 35, ethereal.grove)

add_biome("grove_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 35, ethereal.grove)

add_biome("mushroom", nil, "ethereal:mushroom_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 50, 45, 55, ethereal.mushroom)

add_biome("mushroom_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 55, ethereal.mushroom)

add_biome("sandstone", nil, "default:sandstone", 1, "default:sandstone", 1,
	"default:sandstone", nil, nil, nil, nil, 3, 23, 50, 20, ethereal.sandstone)

add_biome("sandstone_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 50, 20, ethereal.sandstone)

add_biome("quicksand", nil, "ethereal:quicksand2", 3, "default:gravel", 1,
	nil, nil, nil, nil, nil, 1, 1, 50, 38, ethereal.quicksand)

add_biome("plains", nil, "ethereal:dry_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 25, 65, 25, ethereal.plains)

add_biome("plains_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 55, 25, ethereal.plains)

add_biome("savannah", nil, "default:dirt_with_dry_grass", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 50, 55, 25, ethereal.savannah)

add_biome("savannah_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 55, 25, ethereal.savannah)

add_biome("fiery", nil, "ethereal:fiery_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 5, 20, 75, 10, ethereal.fiery)

add_biome("fiery_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 4, 75, 10, ethereal.fiery)

add_biome("sandclay", nil, "default:sand", 3, "default:clay", 2,
	nil, nil, nil, nil, nil, 1, 11, 65, 2, ethereal.sandclay)

--= schematic decorations

-- redwood tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"bakedclay:red"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"mesa"},
	schematic = path.."redwood.mts",
	flags = "place_center_x, place_center_z",
})

-- banana tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grove"},
	schematic = ethereal.bananatree,
	flags = "place_center_x, place_center_z",
})

-- healing tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "default:dirt_with_snow",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"alpine"},
	y_min = 120,
	y_max = 140,
	schematic = path.."yellowtree.mts",
	flags = "place_center_x, place_center_z",
})

-- crystal frost tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"frost"},
	schematic = path.."frosttrees.mts",
	flags = "place_center_x, place_center_z",
})

-- giant mushroom
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"mushroom"},
	schematic = path.."mushroomone.mts",
	flags = "place_center_x, place_center_z",
})

-- small lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"fiery"},
	schematic = path.."volcanom.mts",
	flags = "place_center_x, place_center_z",
})

-- large lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"fiery"},
	schematic = path.."volcanol.mts",
	flags = "place_center_x, place_center_z",
})

-- jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:jungle_dirt",
	sidelen = 80,
	fill_ratio = 0.08,
	biomes = {"junglee"},
	schematic = path.."jungletree.mts",
	flags = "place_center_x, place_center_z",
})

-- willow tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:gray_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"grayness"},
	schematic = path.."willow.mts",
	flags = "place_center_x, place_center_z",
})

-- pine tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"snowy", "alpine"},
	schematic = path.."pinetree.mts",
	flags = "place_center_x, place_center_z",
})

-- apple tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassy", "jumble"},
	schematic = ethereal.appletree,
	flags = "place_center_x, place_center_z",
})

-- big old tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.0025,
	biomes = {"jumble"},
	schematic = path.."bigtree.mts",
	flags = "place_center_x, place_center_z",
})

-- birch tree (was apple)
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassytwo"},
	schematic = ethereal.birchtree,
	flags = "place_center_x, place_center_z",
})

-- orange tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"prairie"},
	schematic = ethereal.orangetree,
	flags = "place_center_x, place_center_z",
})

-- acacia tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 80,
	fill_ratio = 0.004,
	biomes = {"savannah"},
	schematic = path.."acaciatree.mts",
	flags = "place_center_x, place_center_z",
})

-- large cactus (by Paramat)
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	schematic = path.."large_cactus.mts",
	flags = "place_center_x", --, place_center_z",
	rotation = "random",
})

-- palm tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 80,
	fill_ratio = 0.0025,
	biomes = {
		"desert_ocean", "plains_ocean", "sandclay",
		"sandstone_ocean", "mesa_ocean", "grove_ocean", "grassy_ocean",
	},
	y_min = 1,
	y_max = 1,
	schematic = path.."palmtree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

--= simple decorations

-- scorched tree
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:dry_dirt",
	sidelen = 80,
	fill_ratio = 0.006,
	biomes = {"plains"},
	decoration = "ethereal:scorched_tree",
	height_max = 6,
})

-- bamboo tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"bamboo"},
	schematic = ethereal.bambootree,
	flags = "place_center_x, place_center_z",
})

-- bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.08,
	biomes = {"bamboo"},
	schematic = ethereal.bush,
	flags = "place_center_x, place_center_z",
})

-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.35,
	biomes = {"bamboo"},
	decoration = {"default:grass_2", "default:grass_3"},
})

-- dry shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:dry_dirt", "default:sand", "default:desert_sand",
		"sandstone", "bakedclay:red", "bakedclay:orange"
	},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"plains", "grassy_ocean", "desert", "sandstone", "mesa"},
	decoration = "default:dry_shrub",
})

-- dry grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"savannah"},
	decoration = {
		"default:dry_grass_2", "default:dry_grass_3",
		"default:dry_grass_4", "default:dry_grass_5"
	},
})

-- flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"grassy", "grassy", "grassytwo"},
	decoration = {
		"flowers:dandelion_white", "flowers:dandelion_yellow",
		"flowers:geranium", "flowers:rose", "flowers:tulip",
		"flowers:viola", "ethereal:strawberry_7"
	},
})

-- prairie flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:prairie_dirt",
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"prairie"},
	decoration = {
		"flowers:dandelion_white", "flowers:dandelion_yellow",
		"flowers:geranium", "flowers:rose", "flowers:tulip",
		"flowers:viola", "ethereal:strawberry_7"
	},
})

-- crystal spike & crystal grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"frost"},
	decoration = {"ethereal:crystal_spike", "ethereal:crystalgrass"},
})

-- red shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:fiery_dirt", 
	sidelen = 80,
	fill_ratio = 0.20,
	biomes = {"fiery"},
	decoration = {"ethereal:dry_shrub"},
})

-- fire flower
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"fiery"},
	decoration = {"ethereal:fire_flower"},
})

-- snowy grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:gray_dirt", "ethereal:cold_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grayness", "snowy"},
	decoration = "ethereal:snowygrass",
})

-- cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:sandstone",
	sidelen = 80,
	fill_ratio = 0.0025,
	biomes = {"sandstone"},
	decoration = "default:cactus",
	height_max = 3,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"desert"},
	decoration = "default:cactus",
	height_max = 4,
})

-- wild mushrooms
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"mushroom"},
	decoration = "flowers:mushroom_fertile_red",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt",
		"ethereal:prairie_dirt", "ethereal:mushroom_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.009,
		spread = {x = 200, y = 200, z = 200},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"junglee", "grassy", "grassytwo", "prairie", "mushroom"},
	y_min = 1,
	y_max = 120,
	decoration = {"flowers:mushroom_fertile_brown", "flowers:mushroom_fertile_red"},
})

-- jungle grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt", "ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.15,
	biomes = {"junglee", "jumble"},
	decoration = "default:junglegrass",
})

-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:green_dirt_top", "ethereal:jungle_dirt",
		"ethereal:prairie_dirt", "ethereal:grove_dirt"
	},
	sidelen = 80,
	fill_ratio = 0.35,
	biomes = {"grassy", "grassytwo", "jumble", "junglee", "prairie", "grove"},
	decoration = {
		"default:grass_2", "default:grass_3",
		"default:grass_4", "default:grass_5"
	},
})

-- ferns
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.2,
	biomes = {"grove"},
	decoration = "ethereal:fern",
})

-- snow
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.8,
	biomes = {"snowy", "alpine"},
	decoration = "default:snow",
})

-- wild onion
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"grassy", "grassytwo", "jumble", "prairie"},
	decoration = "ethereal:onion_4",
})

-- papyrus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"grassy", "junglee"},
	decoration = "default:papyrus",
	height_max = 4,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

--= Farming Redo plants

if farming.mod and farming.mod == "redo" then

print ("[MOD] Ethereal - Farming Redo detected and in use")

-- potato
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"junglee"},
	decoration = "farming:potato_3",
})

-- carrot, cucumber, potato, tomato, corn, coffee, raspberry, rhubarb
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grassy", "grassytwo", "prairie", "jumble"},
	decoration = {
		"farming:carrot_7", "farming:cucumber_4", "farming:potato_3",
		"farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"
	},
})

-- melon and pumpkin
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grassy", "grassytwo", "junglee", "jumble"},
	decoration = {"farming:melon_8", "farming:pumpkin_8"},
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- green beans
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"grassytwo"},
	decoration = "farming:beanbush",
})

-- grape bushel
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"grassytwo", "grassy", "prairie"},
	decoration = "farming:grapebush",
})

end

-- is waterlily in game?
if minetest.registered_nodes["flowers:waterlily"] then
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"desert_ocean", "plains_ocean", "sandclay",
			"sandstone_ocean", "mesa_ocean", "grove_ocean", "grassy_ocean",
		},
		y_min = 0,
		y_max = 0,
		schematic = ethereal.waterlily,
		rotation = "random",
	})
end
