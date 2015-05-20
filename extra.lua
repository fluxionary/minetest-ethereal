-- Vines
minetest.register_node("ethereal:vine", {
	description = "Vine",
	drawtype = "signlike",
	tiles = {"vine.png"},
	inventory_image = "vine.png",
	wield_image = "vine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=3, oddly_breakable_by_hand=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "ethereal:vine 2",
	recipe = {
		{"group:leaves", "group:leaves", ""},
		{"group:leaves", "group:leaves", ""},
		{"group:leaves", "group:leaves", ""},
	}
})

-- stone Ladder
minetest.register_node("ethereal:stone_ladder", {
	description = "Stone Ladder",
	drawtype = "signlike",
	tiles = {"stone_ladder.png"},
	inventory_image = "stone_ladder.png",
	wield_image = "stone_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "ethereal:stone_ladder 4",
	recipe = {
		{"default:cobble", "", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "", "default:cobble"},
	}
})

-- Paper Wall
minetest.register_node("ethereal:paper_wall", {
	drawtype = "nodebox",
	description = ("Paper Wall"),
	tiles = {"paper_wall.png",},
	paramtype = "light",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 5/11, 0.5, 0.5, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, 5/11, 0.5, 0.5, 8/16 }
		}
	},
})

minetest.register_craft({
	output = "ethereal:paper_wall",
	recipe = {
		{"default:stick", "default:paper", "default:stick"},
		{"default:stick", "default:paper", "default:stick"},
		{"default:stick", "default:paper", "default:stick"},
	}
})

-- Glostone (A little bit of light decoration)
minetest.register_node("ethereal:glostone", {
	description = "Glo Stone",
	tiles = {"glostone.png"},
	groups = {cracky=3},
	light_source = default.LIGHT_MAX - 1,
	drop = "ethereal:glostone",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "ethereal:glostone",
	recipe = {
		{"default:torch", "default:stone", "dye:yellow"},
		{"", "", ""},
		{"", "", ""},
	}
})

-- Ladder (Changes default recipe to give 2x ladders instead of only 1)
minetest.register_craft({
	output = "default:ladder 2",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

-- Signs (Changes default recipe to give 4x signs instead of only 1)
minetest.register_craft({
	output = "default:sign_wall 4",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{"", "group:stick", ""},
	}
})

-- Charcoal Lump
minetest.register_craftitem("ethereal:charcoal_lump", {
	description = "Lump of Charcoal",
	inventory_image = "charcoal_lump.png",
})

minetest.register_craft({
	output = "ethereal:charcoal_lump 2",
	recipe = {
		{"ethereal:scorched_tree"}
	}
})

minetest.register_craft({
	output = "ethereal:charcoal_lump 4",
	type = "cooking",
	recipe = "group:tree",
	cooktime = 4
})

minetest.register_craft({
	type = "fuel",
	recipe = "ethereal:charcoal_lump",
	burntime = 10,
})

-- Make Torch from Charcoal Lump
minetest.register_craft({
	output = "default:torch 4",
	recipe = {
		{"ethereal:charcoal_lump"},
		{"default:stick"},
	}
})

-- Obsidian Brick (now in default game so added compatibility for old maps)
minetest.register_alias("ethereal:obsidian_brick", "default:obsidianbrick")

-- Quicksand (old style, sinking inside shows black instead of yellow effect,
-- works ok with noclip enabled though)
minetest.register_node("ethereal:quicksand", {
	description = "Quicksand",
	tiles = {"default_sand.png"},
	drop = "default:sand",
	liquid_viscosity = 15,
	liquidtype = "source",
	liquid_alternative_flowing = "ethereal:quicksand",
	liquid_alternative_source = "ethereal:quicksand",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 1,
	walkable = false,
	climbable = false,
	post_effect_color = { r=230, g=210, b=160, a=245 },
	groups = {crumbly=3, falling_node=1, sand=1, liquid=3, disable_jump=1},
	sounds = default.node_sound_sand_defaults(),
})

-- Quicksand (new style, sinking inside shows yellow effect with or without noclip,
-- but old quicksand is shown as black until block placed nearby to update light)
minetest.register_node("ethereal:quicksand2", {
	description = "Quicksand",
	tiles = {"default_sand.png"},
	drawtype = "glasslike",
	paramtype = "light",
	drop = "default:sand",
	liquid_viscosity = 15,
	liquidtype = "source",
	liquid_alternative_flowing = "ethereal:quicksand2",
	liquid_alternative_source = "ethereal:quicksand2",
	liquid_renewable = false,
	liquid_range = 0,
	drowning = 1,
	walkable = false,
	climbable = false,
	post_effect_color = { r=230, g=210, b=160, a=245 },
	groups = {crumbly=3, falling_node=1, sand=1, liquid=3, disable_jump=1},
	sounds = default.node_sound_sand_defaults(),
})

-- Illuminated Cave Shrooms (Red, Green and Blue)
minetest.register_node("ethereal:illumishroom", {
	description = "Red Illumishroom",
	drawtype = "plantlike",
	tiles = { "illumishroom.png" },
	inventory_image = "illumishroom.png",
	wield_image = "illumishroom.png",
	paramtype = "light",
	light_source = 5,
	walkable = false,
	groups = {dig_immediate=3, attached_node=1,flammable=3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_node("ethereal:illumishroom2", {
	description = "Green Illumishroom",
	drawtype = "plantlike",
	tiles = { "illumishroom2.png" },
	inventory_image = "illumishroom2.png",
	wield_image = "illumishroom2.png",
	paramtype = "light",
	light_source = 5,
	walkable = false,
	groups = {dig_immediate=3, attached_node=1,flammable=3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_node("ethereal:illumishroom3", {
	description = "Cyan Illumishroom",
	drawtype = "plantlike",
	tiles = { "illumishroom3.png" },
	inventory_image = "illumishroom3.png",
	wield_image = "illumishroom3.png",
	paramtype = "light",
	light_source = 5,
	walkable = false,
	groups = {dig_immediate=3, attached_node=1,flammable=3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

local USES = 100

-- Staff of Light (by Xanthin)
minetest.register_tool("ethereal:light_staff", {
	description = "Staff of Light",
	inventory_image = "light_staff.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)

		local pos = pointed_thing.under

		if pointed_thing.type ~= "node" then return end

		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return
		end

		local node = minetest.get_node(pos).name

		if node == "default:stone" then
			minetest.add_node(pos, {name="ethereal:glostone"})
		elseif node == "ethereal:glostone" then
			minetest.add_node(pos, {name="default:stone"})
		end

		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535 / (USES - 1))
			end
			return itemstack
	end,
})

minetest.register_craft({
	output = "ethereal:light_staff",
		recipe = {
			{"ethereal:illumishroom", "default:mese_crystal", "ethereal:illumishroom"},
			{"ethereal:illumishroom2", "default:steel_ingot", "ethereal:illumishroom2"},
			{"ethereal:illumishroom3", "default:steel_ingot", "ethereal:illumishroom3"}
		}
})

-- Generate Illumishroom in caves next to coal
minetest.register_on_generated(function(minp, maxp, seed)

	local coal_nodes = minetest.find_nodes_in_area(minp, maxp, "default:stone_with_coal")
	local bpos
	for key, pos in pairs(coal_nodes) do

		bpos = { x=pos.x, y=pos.y + 1, z=pos.z }

		if minetest.get_node(bpos).name == "air" then
			if bpos.y > -3000 and bpos.y < -2000 then
				minetest.add_node(bpos, {name = "ethereal:illumishroom3"})
			elseif bpos.y > -2000 and bpos.y < -1000 then
				minetest.add_node(bpos, {name = "ethereal:illumishroom2"})
			elseif bpos.y > -1000 and bpos.y < -30 then
				minetest.add_node(bpos, {name = "ethereal:illumishroom"})
			end
		end
	end
end)
