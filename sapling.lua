-- Register Saplings
ethereal.register_sapling = function(name, desc, texture)

	minetest.register_node(name .. "_sapling", {
		description = desc .. " Tree Sapling",
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {texture .. "_sapling.png"},
		inventory_image = texture .. "_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			ethereal_sapling = 1, sapling = 1, attached_node = 1
		},
		sounds = default.node_sound_defaults(),
	})
end

ethereal.register_sapling("ethereal:willow", "Willow", "willow")
ethereal.register_sapling("ethereal:yellow_tree", "Healing", "yellow_tree")
ethereal.register_sapling("ethereal:tree", "Apple", "ethereal_tree")
ethereal.register_sapling("ethereal:jungle_tree","Jungle", "ethereal_jungle_tree")
ethereal.register_sapling("ethereal:pine_tree", "Pine", "ethereal_pine_tree")
ethereal.register_sapling("ethereal:big_tree", "Big", "ethereal_big_tree")
ethereal.register_sapling("ethereal:banana_tree", "Banana", "banana_tree")
ethereal.register_sapling("ethereal:frost_tree", "Frost", "ethereal_frost_tree")
ethereal.register_sapling("ethereal:mushroom", "Mushroom", "ethereal_mushroom")
ethereal.register_sapling("ethereal:palm", "Palm", "moretrees_palm")
ethereal.register_sapling("ethereal:redwood", "Redwood", "redwood")
ethereal.register_sapling("ethereal:orange_tree", "Orange", "orange_tree")
ethereal.register_sapling("ethereal:acacia", "Acacia", "moretrees_acacia")
ethereal.register_sapling("ethereal:birch", "Birch", "moretrees_birch")

ethereal.add_tree = function (pos, ofx, ofz, schem)
	-- check for schematic
	if not schem then
		print ("Schematic not found")
		return
	end
	-- remove sapling and place schematic
	minetest.set_node(pos, {name = "air"})
	minetest.place_schematic(
		{x = pos.x - ofx, y = pos.y, z =pos.z - ofz},
		schem, "random", {}, false
	)
end

local path = minetest.get_modpath("ethereal").."/schematics/"

ethereal.grow_sapling = function (pos, node)

	local under =  minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if under then under = under.name else return end

	-- Check if Sapling is growing on correct substrate
	if node.name == "ethereal:yellow_tree_sapling"
	and under == "default:dirt_with_snow" then
		ethereal.add_tree(pos, 4, 4, path .. "yellowtree.mts")

	elseif node.name == "ethereal:tree_sapling"
	and under == "ethereal:green_dirt" then
		ethereal.add_tree(pos, 1, 1, ethereal.appletree)

	elseif node.name == "ethereal:jungle_tree_sapling"
	and under == "ethereal:jungle_dirt" then
		ethereal.add_tree(pos, 6, 6, path .. "jungletree.mts")

	elseif node.name == "ethereal:pine_tree_sapling"
	and under == "ethereal:cold_dirt" then
		ethereal.add_tree(pos, 3, 3, path .. "pinetree.mts")

	elseif node.name == "ethereal:big_tree_sapling"
	and under == "ethereal:green_dirt" then
		ethereal.add_tree(pos, 4, 4, path .. "bigtree.mts")

	elseif node.name == "ethereal:banana_tree_sapling"
	and under == "ethereal:grove_dirt" then
		ethereal.add_tree(pos, 3, 3, ethereal.bananatree)

	elseif node.name == "ethereal:frost_tree_sapling"
	and under == "ethereal:crystal_dirt" then
		ethereal.add_tree(pos, 4, 4, path .. "frosttrees.mts")

	elseif node.name == "ethereal:mushroom_sapling"
	and under == "ethereal:mushroom_dirt" then
		ethereal.add_tree(pos, 4, 4, path .. "mushroomone.mts")

	elseif node.name == "ethereal:palm_sapling"
	and under == "default:sand" then
		ethereal.add_tree(pos, 4, 4, path .. "palmtree.mts")

	elseif node.name == "ethereal:willow_sapling"
	and under == "ethereal:gray_dirt" then
		ethereal.add_tree(pos, 5, 5, path .. "willow.mts")

	elseif node.name == "ethereal:redwood_sapling"
	and under == "bakedclay:red" then
		ethereal.add_tree(pos, 9, 9, path .. "redwood.mts")

	elseif node.name == "ethereal:orange_tree_sapling"
	and under == "ethereal:prairie_dirt" then
		ethereal.add_tree(pos, 1, 1, ethereal.orangetree)

	elseif node.name == "ethereal:acacia_sapling"
	and under == "default:dirt_with_dry_grass" then
		ethereal.add_tree(pos, 5, 5, path .. "acaciatree.mts")

	elseif node.name == "ethereal:bamboo_sprout"
	and under == "ethereal:bamboo_dirt" then
		ethereal.add_tree(pos, 1, 1, ethereal.bambootree)

	elseif node.name == "ethereal:birch_sapling"
	and under == "ethereal:green_dirt" then
		ethereal.add_tree(pos, 2, 2, ethereal.birchtree)

	end
end

-- Grow saplings
minetest.register_abm({
	nodenames = {"group:ethereal_sapling"},
	interval = 10,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		ethereal.grow_sapling(pos, node)
	end,
})

minetest.register_craftitem("ethereal:tree_tool", {
	description = "Tree Tool",
	inventory_image = "default_stick.png",
	on_use = function(itemstack, user, pointed_thing)
		if not pointed_thing
		or pointed_thing.type ~= "node" then
			return
		end
		local pos = pointed_thing.under
		local nod = minetest.get_node_or_nil(pos)
		if not nod then return end
		ethereal.grow_sapling(pos, nod)
	end,
})
