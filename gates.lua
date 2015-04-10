-- Node Box coords
local nb_gap = 	{
		{-1, 0.1875, -0.0625, -0.5, 0.3125, 0.0625},
		{-1, -0.1875, -0.0625, -0.5, -0.3125, 0.0625},
		{0.5, 0.1875, -0.0625, 1, 0.3125, 0.0625},
		{0.5, -0.1875, -0.0625, 1, -0.3125, 0.0625}
		}

local nb_pil = 	{
		{0.5, -0.5, -0.09375, 0.5625, 0.5, 0.09375},
		{-0.5625, -0.5, -0.09375, -0.5, 0.5, 0.09375},
		{-0.5, -0.3125, -0.0625, -0.375, 0.3125, 0.0625},
		{0.375, -0.3125, -0.0625, 0.5, 0.3125, 0.0625}
		}

-- Open/Close Gates
function gate_rightclick(pos, node)
	local data = nil
	data = string.split(node.name, "_", 2)
	local gate = data[1].."_"
	local open = data[2]
	
	if open == "open" then
		minetest.sound_play("doors_door_close", {pos=pos, gain = 0.3, max_hear_distance = 10})
		minetest.set_node(pos, {name=gate.."closed", param2=node.param2})
	else
		minetest.sound_play("doors_door_open", {pos=pos, gain = 0.3, max_hear_distance = 10})
		minetest.set_node(pos, {name=gate.."open", param2=node.param2})
	end
end

local gate = {}

gate.type = {
	{"wood",		"Wood",			"default_wood.png",			"default:wood"},
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

for _, row in ipairs(gate.type) do
	local name = row[1]
	local desc = row[2]
	local texture = row[3]
	local nod = row[4]
	
minetest.register_node("ethereal:"..name.."gate_open", {
	tiles = {texture},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_inventory = 1},
	drop = "ethereal:"..name.."gate_closed",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, 0.4375, -0.375, 0.3125, 0.5},
			{0.375, -0.3125, 0.4375, 0.5, 0.3125, 0.5},
			{-0.5, 0.1875, 0.0625, -0.375, 0.3125, 0.4375},
			{-0.5, -0.1875, 0.0625, -0.375, -0.3125, 0.4375},
			{0.375, 0.1875, 0.0625, 0.5, 0.3125, 0.4375},
			{0.375, -0.1875, 0.0625, 0.5, -0.3125, 0.4375},
			nb_pil[1], nb_pil[2],
			nb_pil[3], nb_pil[4],
			nb_gap[1], nb_gap[2],
			nb_gap[3], nb_gap[4],
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, -0.0625, -0.375, 0.3125, 0.5},
			{0.375, -0.3125, -0.0625, 0.5, 0.3125, 0.5},
			}
	},
	on_rightclick = gate_rightclick,
})

minetest.register_node("ethereal:"..name.."gate_closed", {
	description = desc.." Gate",
	tiles = {texture},
	inventory_image = "default_gate_overlay.png^"..texture.."^default_gate_overlay.png^[makealpha:255,126,126",
	wield_image = "default_gate_overlay.png^"..texture.."^default_gate_overlay.png^[makealpha:255,126,126",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			nb_pil[1], nb_pil[2],
			nb_pil[3], nb_pil[4],
			{-0.0625, -0.3125, -0.0625, 0.0625, 0.3125, 0.0625},
			{-1, 0.1875, -0.0625, 1, 0.3125, 0.0625},
			{-1, -0.1875, -0.0625, 1, -0.3125, 0.0625},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {{-0.5, -0.3125, -0.0625, 0.5, 0.3125, 0.0625}}
	},
	on_rightclick = gate_rightclick,
})

-- Fencegate Recipe
minetest.register_craft({
	output = "ethereal:"..name.."gate_closed",
	recipe = {
		 {"group:stick", nod, "group:stick"},
		 {"group:stick", nod, "group:stick"},
	}
})

end
