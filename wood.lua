--= Define Trunks and Wood

-- Acacia Trunk (thanks to VanessaE for acacia textures)
if minetest.registered_nodes["default:acacia_tree"] then
	minetest.register_alias("ethereal:acacia_trunk", "default:acacia_tree")
	minetest.register_alias("ethereal:acacia_wood", "default:acacia_wood")
	print ("using acacia tree in default game")
else
minetest.register_node("ethereal:acacia_trunk", {
	description = "Acacia Trunk",
	tiles = {
		"moretrees_acacia_trunk_top.png",
		"moretrees_acacia_trunk_top.png",
		"moretrees_acacia_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Acacia Wood
minetest.register_node("ethereal:acacia_wood", {
	description = "Acacia Wood",
	tiles = {"moretrees_acacia_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:acacia_wood 4",
	recipe = {{"ethereal:acacia_trunk"}}
})
end

-- Willow Trunk
minetest.register_node("ethereal:willow_trunk", {
	description = "Willow Trunk",
	tiles = {
		"willow_trunk_top.png",
		"willow_trunk_top.png",
		"willow_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Willow Wood
minetest.register_node("ethereal:willow_wood", {
	description = "Willow Wood",
	tiles = {"willow_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:willow_wood 4",
	recipe = {{"ethereal:willow_trunk"}}
})

-- Redwood Trunk
minetest.register_node("ethereal:redwood_trunk", {
	description = "Redwood Trunk",
	tiles = {
		"redwood_trunk_top.png",
		"redwood_trunk_top.png",
		"redwood_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Redwood Wood
minetest.register_node("ethereal:redwood_wood", {
	description = "Redwood Wood",
	tiles = {"redwood_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:redwood_wood 4",
	recipe = {{"ethereal:redwood_trunk"}},
})

-- Frost Trunk
minetest.register_node("ethereal:frost_tree", {
	description = "Frost Tree",
	tiles = {
		"ethereal_frost_tree_top.png",
		"ethereal_frost_tree_top.png",
		"ethereal_frost_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Frost Wood
minetest.register_node("ethereal:frost_wood", {
	description = "Frost Wood",
	tiles = {"frost_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:frost_wood 4",
	recipe = {{"ethereal:frost_tree"}}
})

-- Healing Trunk
minetest.register_node("ethereal:yellow_trunk", {
	description = "Healing Tree Trunk",
	tiles = {
		"yellow_tree_top.png",
		"yellow_tree_top.png",
		"yellow_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Healing Wood
minetest.register_node("ethereal:yellow_wood", {
	description = "Healing Tree Wood",
	tiles = {"yellow_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:yellow_wood 4",
	recipe = {{"ethereal:yellow_trunk"}}
})

-- Palm Trunk (thanks to VanessaE for palm textures)
minetest.register_node("ethereal:palm_trunk", {
	description = "Palm Trunk",
	tiles = {
		"moretrees_palm_trunk_top.png",
		"moretrees_palm_trunk_top.png",
		"moretrees_palm_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Palm Wood
minetest.register_node("ethereal:palm_wood", {
	description = "Palm Wood",
	tiles = {"moretrees_palm_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:palm_wood 4",
	recipe = {{"ethereal:palm_trunk"}}
})

-- Banana Tree Trunk
minetest.register_node("ethereal:banana_trunk", {
	description = "Banana Trunk",
	tiles = {
		"banana_trunk_top.png",
		"banana_trunk_top.png",
		"banana_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Banana Tree Wood
minetest.register_node("ethereal:banana_wood", {
	description = "Banana Wood",
	tiles = {"banana_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:banana_wood 4",
	recipe = {{"ethereal:banana_trunk"}}
})

-- Scorched Trunk
minetest.register_node("ethereal:scorched_tree", {
	description = "Scorched Tree",
	tiles = {
		"scorched_tree_top.png",
		"scorched_tree_top.png",
		"scorched_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	output = "ethereal:scorched_tree 8",
	recipe = {
		{"group:tree", "group:tree", "group:tree"},
		{"group:tree", "default:torch", "group:tree"},
		{"group:tree", "group:tree", "group:tree"},
	}
})

-- Mushroom Trunk
minetest.register_node("ethereal:mushroom_trunk", {
	description = "Mushroom",
	tiles = {
		"mushroom_trunk_top.png",
		"mushroom_trunk_top.png",
		"mushroom_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Birch Trunk (thanks to VanessaE for birch textures)
minetest.register_node("ethereal:birch_trunk", {
	description = "Birch Trunk",
	tiles = {
		"moretrees_birch_trunk_top.png",
		"moretrees_birch_trunk_top.png",
		"moretrees_birch_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- Birch Wood
minetest.register_node("ethereal:birch_wood", {
	description = "Birch Wood",
	tiles = {"moretrees_birch_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:birch_wood 4",
	recipe = {{"ethereal:birch_trunk"}}
})