--[[

	Minetest Ethereal Mod 1.16 (25th April 2015)

	Created by ChinChow

	Updated by TenPlus1

]]

ethereal = {}
ethereal.leaftype = 0 -- 0 for 2D plantlike, 1 for 3D allfaces

-- Set following to 1 to enable biome or 0 to disable

ethereal.bamboo 		= 1 -- Bamboo with sprouts
ethereal.mesa   		= 1 -- Mesa red and orange clay with giant redwood
ethereal.alpine 		= 1 -- Snowy grass
ethereal.healing 		= 1 -- Snowy peaks with healing trees
ethereal.snowy 			= 1 -- Cold grass with pine trees and snow spots
ethereal.frost 			= 1 -- Blue dirt with blue/pink frost trees
ethereal.grassy 		= 1 -- Green grass with flowers and trees
ethereal.caves 			= 1 -- Desert stone ares with huge caverns underneath
ethereal.grayness 		= 1 -- Grey grass with willow trees
ethereal.grassytwo 		= 1 -- Sparse trees with old trees and flowers
ethereal.prairie 		= 1 -- Flowery grass with many plants and flowers
ethereal.jumble 		= 1 -- Green grass with trees and jungle grass
ethereal.junglee 		= 1 -- Jungle grass with tall jungle trees
ethereal.desert 		= 1 -- Desert sand with cactus
ethereal.grove 			= 1 -- Banana groves and ferns
ethereal.mushroom 		= 1 -- Purple grass with giant mushrooms
ethereal.desertstone 	= 1 -- Desert stone with smaller cactus
ethereal.quicksand 		= 1 -- Quicksand banks
ethereal.lake 			= 1 -- Small sandy lake areas with gravel below, also used for ocean floor
ethereal.plains 		= 1 -- Dry dirt with scorched trees
ethereal.fiery 			= 1 -- Red grass with lava craters
ethereal.sandclay		= 1 -- Sand areas with clay underneath
ethereal.icewater		= 1 -- Ice surrounding cold coastal areas

dofile(minetest.get_modpath("ethereal").."/plantlife.lua")
dofile(minetest.get_modpath("ethereal").."/mushroom.lua")
dofile(minetest.get_modpath("ethereal").."/onion.lua")
dofile(minetest.get_modpath("ethereal").."/crystal.lua")
dofile(minetest.get_modpath("ethereal").."/papyrus.lua")
dofile(minetest.get_modpath("ethereal").."/flowers.lua")
dofile(minetest.get_modpath("ethereal").."/water.lua")
dofile(minetest.get_modpath("ethereal").."/dirt.lua")
dofile(minetest.get_modpath("ethereal").."/leaves.lua")
dofile(minetest.get_modpath("ethereal").."/wood.lua")
dofile(minetest.get_modpath("ethereal").."/sapling.lua")
dofile(minetest.get_modpath("ethereal").."/strawberry.lua")
dofile(minetest.get_modpath("ethereal").."/fishing.lua")
dofile(minetest.get_modpath("ethereal").."/extra.lua")
dofile(minetest.get_modpath("ethereal").."/sealife.lua")
dofile(minetest.get_modpath("ethereal").."/fences.lua")
dofile(minetest.get_modpath("ethereal").."/gates.lua")
dofile(minetest.get_modpath("ethereal").."/stairs.lua")
dofile(minetest.get_modpath("ethereal").."/mapgen_v7n.lua") -- 0.4.12 and above

-- Xanadu server Only
--dofile(minetest.get_modpath("ethereal").."/plantpack.lua")
