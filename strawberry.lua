-- Strawberry (can also be planted as seed)
minetest.register_craftitem("ethereal:strawberry", {
	description = "Strawberry",
	inventory_image = "strawberry.png",
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "ethereal:strawberry_1")
	end,
})

-- Define Strawberry Bush growth stages
minetest.register_node("ethereal:strawberry_1", {
	drawtype = "plantlike",
	tiles = {"strawberry_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable  =2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_2", {
	drawtype = "plantlike",
	tiles = {"strawberry_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 2, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_3", {
	drawtype = "plantlike",
	tiles = {"strawberry_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 3, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_4", {
	drawtype = "plantlike",
	tiles = {"strawberry_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 4, growing=1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_5", {
	drawtype = "plantlike",
	tiles = {"strawberry_5.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 5, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_6", {
	drawtype = "plantlike",
	tiles = {"strawberry_6.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:strawberry 1"},rarity = 2},
			{items = {"ethereal:strawberry 2"},rarity = 3},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 6, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- Mapgen places this stage on map so will use is_ground_content=true
minetest.register_node("ethereal:strawberry_7", {
	drawtype = "plantlike",
	tiles = {"strawberry_7.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:strawberry 1"},rarity = 1},
			{items = {"ethereal:strawberry 2"},rarity = 3},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 7, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal:strawberry_8", {
	drawtype = "plantlike",
	tiles = {"strawberry_8.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:strawberry 2"},rarity = 1},
			{items = {"ethereal:strawberry 3"},rarity = 3},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, strawberry = 8
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- Register Alias for backward compatibility with already generated Ethereal worlds
minetest.register_alias("ethereal:strawberry_bush", "ethereal:strawberry_7")
minetest.register_alias("ethereal:seed_strawberry", "ethereal:strawberry")

-- Amb for growing Strawberry Bush
if farming.mod ~= "redo" then

minetest.register_abm({
	nodenames = {"group:strawberry"},
	neighbors = {"farming:soil_wet"},
	interval = 50,
	chance = 3,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "strawberry") == 8 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y - 1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y + 1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 13 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "strawberry") + 1
		minetest.set_node(pos, {name = "ethereal:strawberry_"..height})
	end
})

end