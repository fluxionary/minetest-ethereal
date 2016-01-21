local fences = {
	{"junglewood", "Jungle Wood", "default_junglewood.png", "default:junglewood"},
	{"scorched", "Scorched", "scorched_tree.png", "ethereal:scorched_tree"},
	{"frostwood", "Frost Wood", "frost_wood.png", "ethereal:frost_wood"},
	{"redwood", "Redwood", "redwood_wood.png", "ethereal:redwood_wood"},
	{"willow", "Willow", "willow_wood.png", "ethereal:willow_wood"},
	{"yellowwood", "Healing Wood", "yellow_wood.png", "ethereal:yellow_wood"},
	{"palm", "Palm Wood", "moretrees_palm_wood.png", "ethereal:palm_wood"},
	{"banana", "Banana Wood", "banana_wood.png", "ethereal:banana_wood"},
	{"mushroom", "Mushroom", "mushroom_trunk.png", "ethereal:mushroom_trunk"},
	{"acacia", "Acacia Wood", "moretrees_acacia_wood.png", "ethereal:acacia_wood"},
	{"pine", "Pine Wood", "default_pine_wood.png", "default:pinewood"},
	{"birch", "Birch Wood", "moretrees_birch_wood.png", "ethereal:birch_wood"},
}

for _, row in pairs(fences) do

	minetest.register_node("ethereal:fence_"..row[1], {
		description = row[2].." Fence",
		drawtype = "fencelike",
		is_ground_content = false,
		tiles = {row[3]},
		inventory_image = "default_fence_overlay.png^" .. row[3]
			.. "^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^" .. row[3]
			.. "^default_fence_overlay.png^[makealpha:255,126,126",
		paramtype = "light",
		sunlight_propagates = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ethereal:fence_"..row[1].." 4",
		recipe = {
			{row[4], "group:stick", row[4]},
			{row[4], "group:stick", row[4]},
		}
	})

end
