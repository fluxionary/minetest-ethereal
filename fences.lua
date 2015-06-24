local fence = {}

fence.type = {
	{"junglewood",	"Jungle Wood", 	"default_junglewood.png",	"default:junglewood"},
	{"scorched",	"Scorched", 	"scorched_tree.png",		"ethereal:scorched_tree"},
	{"frostwood",	"Frost Wood",	"frost_wood.png",			"ethereal:frost_wood"},
	{"redwood",		"Redwood",		"redwood_wood.png",			"ethereal:redwood_wood"},
	{"willow",		"Willow",		"willow_wood.png",			"ethereal:willow_wood"},
	{"yellowwood",	"Healing Wood",	"yellow_wood.png",			"ethereal:yellow_wood"},
	{"palm",		"Palm Wood",	"moretrees_palm_wood.png",	"ethereal:palm_wood"},
	{"banana",		"Banana Wood",	"banana_wood.png",			"ethereal:banana_wood"},
	{"mushroom",	"Mushroom",		"mushroom_trunk.png",		"ethereal:mushroom_trunk"},
	{"acacia",		"Acacia Wood",	"moretrees_acacia_wood.png","ethereal:acacia_wood"},
	{"pine",		"Pine Wood",	"default_pinewood.png",		"default:pinewood"},
}

for _, row in ipairs(fence.type) do
	local name = row[1]
	local desc = row[2]
	local texture = row[3]
	local nod = row[4]

minetest.register_node("ethereal:fence_"..name, {
	description = desc.." Fence",
	drawtype = "fencelike",
	is_ground_content = false,
	tiles = {texture},
	inventory_image = "default_fence_overlay.png^"..texture.."^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^"..texture.."^default_fence_overlay.png^[makealpha:255,126,126",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "ethereal:fence_"..name.." 4",
	recipe = {
		{nod, "group:stick", nod},
		{nod, "group:stick", nod},
	}
})

end
