--[[

	Minetest Ethereal Mod 1.18 (14th November 2015)

	Created by ChinChow

	Updated by TenPlus1

]]

ethereal = {}
ethereal.leaftype = 0 -- 0 for 2D plantlike, 1 for 3D allfaces

-- Set following to 1 to enable biome or 0 to disable
ethereal.glacier   = 1 -- Ice glaciers with snow
ethereal.bamboo    = 1 -- Bamboo with sprouts
ethereal.mesa      = 1 -- Mesa red and orange clay with giant redwood
ethereal.alpine    = 1 -- Snowy grass
ethereal.healing   = 1 -- Snowy peaks with healing trees
ethereal.snowy     = 1 -- Cold grass with pine trees and snow spots
ethereal.frost     = 1 -- Blue dirt with blue/pink frost trees
ethereal.grassy    = 1 -- Green grass with flowers and trees
ethereal.caves     = 1 -- Desert stone ares with huge caverns underneath
ethereal.grayness  = 1 -- Grey grass with willow trees
ethereal.grassytwo = 1 -- Sparse trees with old trees and flowers
ethereal.prairie   = 1 -- Flowery grass with many plants and flowers
ethereal.jumble    = 1 -- Green grass with trees and jungle grass
ethereal.junglee   = 1 -- Jungle grass with tall jungle trees
ethereal.desert    = 1 -- Desert sand with cactus
ethereal.grove     = 1 -- Banana groves and ferns
ethereal.mushroom  = 1 -- Purple grass with giant mushrooms
ethereal.sandstone = 1 -- Sandstone with smaller cactus
ethereal.quicksand = 1 -- Quicksand banks
ethereal.lake      = 1 -- Small sandy lake areas with gravel below, also used for ocean floor
ethereal.plains    = 1 -- Dry dirt with scorched trees
ethereal.fiery     = 1 -- Red grass with lava craters
ethereal.sandclay  = 1 -- Sand areas with clay underneath

local path = minetest.get_modpath("ethereal")

dofile(path.."/plantlife.lua")
dofile(path.."/mushroom.lua")
dofile(path.."/onion.lua")
dofile(path.."/crystal.lua")
dofile(path.."/papyrus.lua")
dofile(path.."/flowers.lua")
dofile(path.."/water.lua")
dofile(path.."/dirt.lua")
dofile(path.."/leaves.lua")
dofile(path.."/wood.lua")
dofile(path.."/sapling.lua")
dofile(path.."/strawberry.lua")
dofile(path.."/fishing.lua")
dofile(path.."/extra.lua")
dofile(path.."/sealife.lua")
dofile(path.."/fences.lua")
dofile(path.."/gates.lua")
dofile(path.."/mapgen_v7n.lua") -- 0.4.12+

if minetest.get_modpath("xanadu") then
	dofile(path.."/plantpack.lua")
else
	dofile(path.."/stairs.lua")
end

print ("[MOD] Ethereal mod loaded")