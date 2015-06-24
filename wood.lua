-- Define Trunks and Wood
minetest.register_node("ethereal:acacia_trunk", {			-- Acacia Trunk (thanks to VanessaE for acacia textures)
	description = "Acacia Trunk",
	tiles = {"moretrees_acacia_trunk_top.png", "moretrees_acacia_trunk_top.png", "moretrees_acacia_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:acacia_wood", {			-- Acacia Wood
	description = "Acacia Wood",
	tiles = {"moretrees_acacia_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:acacia_wood 4",
	recipe = {{"ethereal:acacia_trunk"}}
})

minetest.register_node("ethereal:willow_trunk", {		-- Willow Trunk
	description = "Willow Trunk",
	tiles = {"willow_trunk_top.png", "willow_trunk_top.png", "willow_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:willow_wood", {		-- Willow Wood
	description = "Willow Wood",
	tiles = {"willow_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:willow_wood 4",
	recipe = {{"ethereal:willow_trunk"}}
})

minetest.register_node("ethereal:redwood_trunk", {		-- Redwood Trunk
	description = "Redwood Trunk",
	tiles = {"redwood_trunk_top.png", "redwood_trunk_top.png", "redwood_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:redwood_wood", {		-- Redwood Wood
	description = "Redwood Wood",
	tiles = {"redwood_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:redwood_wood 4",
	recipe = {{"ethereal:redwood_trunk"}},
})

minetest.register_node("ethereal:frost_tree", {			-- Frost Trunk
	description = "Frost Tree",
	tiles = {"ethereal_frost_tree_top.png", "ethereal_frost_tree_top.png", "ethereal_frost_tree.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,put_out_fire=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:frost_wood", {			-- Frost Wood
	description = "Frost Wood",
	tiles = {"frost_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,put_out_fire=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:frost_wood 4",
	recipe = {{"ethereal:frost_tree"}}
})

minetest.register_node("ethereal:yellow_trunk", {		-- Healing Trunk
	description = "Healing Tree Trunk",
	tiles = {"yellow_tree_top.png", "yellow_tree_top.png", "yellow_tree.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,put_out_fire=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:yellow_wood", {		-- Healing Wood
	description = "Healing Tree Wood",
	tiles = {"yellow_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,put_out_fire=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:yellow_wood 4",
	recipe = {{"ethereal:yellow_trunk"}}
})

minetest.register_node("ethereal:palm_trunk", {			-- Palm Trunk
	description = "Palm Trunk",
	tiles = {"moretrees_palm_trunk_top.png", "moretrees_palm_trunk_top.png", "moretrees_palm_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:palm_wood", {			-- Palm Wood
	description = "Palm Wood",
	tiles = {"moretrees_palm_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:palm_wood 4",
	recipe = {{"ethereal:palm_trunk"}}
})

minetest.register_node("ethereal:banana_trunk", {		-- Banana Tree Trunk
	description = "Banana Trunk",
	tiles = {"banana_trunk_top.png", "banana_trunk_top.png", "banana_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("ethereal:banana_wood", {		-- Banana Tree Wood
	description = "Banana Wood",
	tiles = {"banana_wood.png"},
	is_ground_content = false,
	groups = {wood=1,choppy=2,oddly_breakable_by_hand=1,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:banana_wood 4",
	recipe = {{"ethereal:banana_trunk"}}
})

minetest.register_node("ethereal:scorched_tree", {		-- Scorched Trunk
	description = "Scorched Tree",
	tiles = {"scorched_tree_top.png", "scorched_tree_top.png", "scorched_tree.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_craft({
	output = "ethereal:scorched_tree 8",
	recipe = {
		{"group:tree", "group:tree", "group:tree"},
		{"group:tree", "default:torch", "group:tree"},
		{"group:tree", "group:tree", "group:tree"},
	}
})

minetest.register_node("ethereal:mushroom_trunk", {		-- Mushroom Trunk
	description = "Mushroom",
	tiles = {"mushroom_trunk_top.png", "mushroom_trunk_top.png", "mushroom_trunk.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})
