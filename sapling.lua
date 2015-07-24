-- Function to Register Saplings
ethereal.register_sapling = function(sapling_node_name, sapling_descr, sapling_texture)
	-- if the sapling does not exist yet, create a node for it
	if not minetest.registered_nodes[sapling_node_name] then
		minetest.register_node( sapling_node_name, {
			description = sapling_descr,
			drawtype = "plantlike",
			visual_scale = 1.0,
			tiles = {sapling_texture},
			inventory_image = sapling_texture,
			wield_image = sapling_texture,
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
				ethereal_sapling = 1, attached_node = 1
			},
			sounds = default.node_sound_defaults(),
		})
	end
end

-- Register Saplings
ethereal.register_sapling("ethereal:willow_sapling", "Willow Sapling", "willow_sapling.png")
ethereal.register_sapling("ethereal:yellow_tree_sapling", "Healing Tree Sapling", "yellow_tree_sapling.png")
ethereal.register_sapling("ethereal:tree_sapling", "Tree Sapling", "ethereal_tree_sapling.png")
ethereal.register_sapling("ethereal:jungle_tree_sapling","Jungletree Sapling", "ethereal_jungle_tree_sapling.png")
ethereal.register_sapling("ethereal:pine_tree_sapling", "Pine Sapling", "ethereal_pine_tree_sapling.png")
ethereal.register_sapling("ethereal:big_tree_sapling", "Big Tree Sapling", "ethereal_big_tree_sapling.png")
ethereal.register_sapling("ethereal:banana_tree_sapling", "Banana Tree Sapling", "banana_tree_sapling.png")
ethereal.register_sapling("ethereal:frost_tree_sapling", "Frost Sapling", "ethereal_frost_tree_sapling.png")
ethereal.register_sapling("ethereal:gray_tree_sapling", "Gray Sapling", "ethereal_gray_tree_sapling.png")
ethereal.register_sapling("ethereal:mushroom_sapling", "Mushroom Sapling", "ethereal_mushroom_sapling.png")
ethereal.register_sapling("ethereal:palm_sapling", "Palm Sapling", "moretrees_palm_sapling.png")
ethereal.register_sapling("ethereal:redwood_sapling", "Redwood Sapling", "redwood_sapling.png")
ethereal.register_sapling("ethereal:orange_tree_sapling", "Orange Tree Sapling", "orange_tree_sapling.png")
ethereal.register_sapling("ethereal:acacia_sapling", "Acacia Sapling", "moretrees_acacia_sapling.png")

-- current routine
ethereal.place_tree = function (pos, ofx, ofz, schem)
	-- Remove Sapling and Place Tree Schematic
	minetest.set_node(pos, {name = "air"})
	pos.x = pos.x - ofx
	pos.z = pos.z - ofz
	minetest.place_schematic(
		pos,
		minetest.get_modpath("ethereal").."/schematics/"..schem..".mts",
		"0", {}, false
	)
end

-- new routine
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

ethereal.grow_sapling = function (pos, node)

	local under =  minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if under then under = under.name else return end

	-- Check if Sapling is growing on correct substrate
	if (node.name == "ethereal:yellow_tree_sapling" and under == "default:dirt_with_snow") then
		ethereal.place_tree(pos, 4, 4, "yellowtree")
	elseif (node.name == "ethereal:tree_sapling" and under == "ethereal:green_dirt") then
		ethereal.add_tree(pos, 1, 1, ethereal.appletree)
	elseif (node.name == "ethereal:jungle_tree_sapling" and under == "ethereal:jungle_dirt") then
		ethereal.place_tree(pos, 6, 6, "jungletree")
	elseif (node.name == "ethereal:pine_tree_sapling" and under == "ethereal:cold_dirt") then
		ethereal.place_tree(pos, 3, 3, "pinetree")
	elseif (node.name == "ethereal:big_tree_sapling" and under == "ethereal:green_dirt") then
		ethereal.place_tree(pos, 4, 4, "bigtree")
	elseif (node.name == "ethereal:banana_tree_sapling" and under == "ethereal:grove_dirt") then
		ethereal.add_tree(pos, 3, 3, ethereal.bananatree)
	elseif (node.name == "ethereal:frost_tree_sapling" and under == "ethereal:crystal_dirt") then
		ethereal.place_tree(pos, 4, 4, "frosttrees")
	elseif (node.name == "ethereal:gray_tree_sapling" and under == "ethereal:gray_dirt") then
		ethereal.place_tree(pos, 2, 2, "graytrees")
	elseif (node.name == "ethereal:mushroom_sapling" and under == "ethereal:mushroom_dirt") then
		ethereal.place_tree(pos, 4, 4, "mushroomone")
	elseif (node.name == "ethereal:palm_sapling" and under == "default:sand") then
		ethereal.place_tree(pos, 4, 4, "palmtree")
	elseif (node.name == "ethereal:willow_sapling" and under == "ethereal:gray_dirt") then
		ethereal.place_tree(pos, 5, 5, "willow")
	elseif (node.name == "ethereal:redwood_sapling" and under == "bakedclay:red") then
		ethereal.place_tree(pos, 9, 9, "redwood")
	elseif (node.name == "ethereal:orange_tree_sapling" and under == "ethereal:prairie_dirt") then
		ethereal.add_tree(pos, 1, 1, ethereal.orangetree)
	elseif (node.name == "ethereal:acacia_sapling" and under == "default:desert_sand") then
		ethereal.place_tree(pos, 5, 5, "acaciatree")
	end
end

-- Grow saplings
minetest.register_abm({
	nodenames = {"group:ethereal_sapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		ethereal.grow_sapling(pos, node)
	end,
})