-- Mushroom Spores
minetest.register_craftitem("ethereal:mushroom_craftingitem", {
	description = "Mushroom Spores",
	groups = {not_in_creative_inventory=1},
	inventory_image = "mushroom_spores.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "ethereal:mushroom_garden_1")
	end,
})

-- Mushroom Plant (Must be farmed to become edible)
minetest.register_node("ethereal:mushroom_plant", {
	description = "Mushroom (edible)",
	drawtype = "plantlike",
	tiles = {"mushroom.png"},
	inventory_image = "mushroom.png",
	selection_box = {type = "fixed",fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}},
	drop = "ethereal:mushroom_craftingitem",
	wield_image = "mushroom.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})

-- Mushroom Soup (Heals 1 heart)
minetest.register_craftitem("ethereal:mushroom_soup", {
	description = "Mushroom Soup",
	inventory_image = "mushroom_soup.png",
	on_use = minetest.item_eat(2, "ethereal:bowl"),
})

minetest.register_craft({
	output = "ethereal:mushroom_soup",
	recipe = {
		{"ethereal:mushroom_plant", ""},
		{"ethereal:mushroom_plant", ""},
		{"ethereal:bowl", ""},
	}
})

-- Cooked Mushroom Soup (Heals 1 and half heart)
minetest.register_craftitem("ethereal:mushroom_soup_cooked", {
	description = "Mushroom Soup Cooked",
	inventory_image = "mushroom_soup_cooked.png",
	on_use = minetest.item_eat(3, "ethereal:bowl"),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "ethereal:mushroom_soup_cooked",
	recipe = "ethereal:mushroom_soup"
})

-- Define Mushroom growth stages
minetest.register_node("ethereal:mushroom_1", {
	drawtype = "plantlike",
	tiles = {"ethereal_mushroom_garden_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:mushroom_craftingitem 1"},rarity=1},
			{items = {"ethereal:mushroom_plant 1"},rarity=14},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,mushroom=1,attached_node=1,growing=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("ethereal:mushroom_garden_1", "ethereal:mushroom_1")

minetest.register_node("ethereal:mushroom_2", {
	drawtype = "plantlike",
	tiles = {"ethereal_mushroom_garden_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = {
		items = {
			{items = {"ethereal:mushroom_craftingitem 1"},rarity=1},
			{items = {"ethereal:mushroom_plant 1"},rarity=7},
			}
	},
	buildable_to = true,
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,mushroom=2,attached_node=1,growing=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("ethereal:mushroom_garden_2", "ethereal:mushroom_2")

minetest.register_node("ethereal:mushroom_3", {
	drawtype = "plantlike",
	tiles = {"ethereal_mushroom_garden_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = {
		items = {
			{items = {"ethereal:mushroom_craftingitem 1"},rarity=1},
			{items = {"ethereal:mushroom_plant 3"},rarity=3},
			}
	},
	buildable_to = true,
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,mushroom=3,attached_node=1,growing=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("ethereal:mushroom_garden_3", "ethereal:mushroom_3")

minetest.register_node("ethereal:mushroom_4", {
	drawtype = "plantlike",
	tiles = {"ethereal_mushroom_garden_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:mushroom_craftingitem 1"},rarity=1},
			{items = {"ethereal:mushroom_plant 3"},rarity=1},
			{items = {"ethereal:mushroom_plant 3"},rarity=7},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,mushroom=4,attached_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_alias("ethereal:mushroom_garden_4", "ethereal:mushroom_4")

-- Abm for growing Mushroom
if farming.mod ~= "redo" then

minetest.register_abm({
	nodenames = {"group:mushroom"},
	neighbors = {"farming:soil_wet"},
	interval = 30,
	chance = 2,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "mushroom") == 4 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		local n = minetest.get_node(pos)
		if minetest.get_item_group(n.name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) < 5 then
			return
		end
		
		-- grow
		local height = minetest.get_item_group(node.name, "mushroom") + 1
		minetest.set_node(pos, {name="ethereal:mushroom_garden_"..height})
	end
})

end

-- Temporary compatibility lines for Xanadu server
minetest.register_alias("ethereal:mushroom_7", "ethereal:mushroom_3")
minetest.register_alias("ethereal:mushroom_8", "ethereal:mushroom_4")
