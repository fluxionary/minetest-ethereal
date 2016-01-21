
-- does flowers:mushroom_red exists?
-- if not then create temporary shroom stuff

if minetest.registered_nodes["flowers:mushroom_red"] then

	print ("[Ethereal] Using current mushrooms in flowers mod")

else

	print ("[Ethereal] Defining temporary mushrooms")

-- The following code was taken from minetest 0.4.13 dev flowers mod
-- incase players are using older version of minetest

minetest.register_node(":flowers:mushroom_red", {
	description = "Red Mushroom",
	tiles = {"flowers_mushroom_red.png"},
	inventory_image = "flowers_mushroom_red.png",
	wield_image = "flowers_mushroom_red.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(-5),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	}
})

minetest.register_node(":flowers:mushroom_brown", {
	description = "Brown Mushroom",
	tiles = {"flowers_mushroom_brown.png"},
	inventory_image = "flowers_mushroom_brown.png",
	wield_image = "flowers_mushroom_brown.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	}
})

-- mushroom spread and death
minetest.register_abm({
	nodenames = {"flowers:mushroom_brown", "flowers:mushroom_red"},
	interval = 11,
	chance = 50,
	action = function(pos, node)

		if minetest.get_node_light(pos, nil) > 14 then

			minetest.remove_node(pos)

			return
		end

		local random = {
			x = pos.x + math.random(-2, 2),
			y = pos.y + math.random(-1, 1),
			z = pos.z + math.random(-2, 2)
		}

		local random_node = minetest.get_node_or_nil(random)

		if not random_node
		or random_node.name ~= "air" then
			return
		end

		local node_under = minetest.get_node_or_nil({
			x = random.x,
			y = random.y - 1,
			z = random.z
		})

		if not node_under then
			return
		end

		if minetest.get_item_group(node_under.name, "soil") ~= 0
		and minetest.get_node_light(pos, nil) < 9
		and minetest.get_node_light(random, nil) < 9 then
			minetest.swap_node(random, {name = node.name})
		end
	end
})

end

-- these old mushroom related nodes can be simplified now
minetest.register_alias("flowers:mushroom_spores_brown", "flowers:mushroom_brown")
minetest.register_alias("flowers:mushroom_spores_red", "flowers:mushroom_red")
minetest.register_alias("flowers:mushroom_fertile_brown", "flowers:mushroom_brown")
minetest.register_alias("flowers:mushroom_fertile_red", "flowers:mushroom_red")

-- set compatibility with old ethereal shrooms
minetest.register_alias("ethereal:mushroom_craftingitem", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_plant", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_soup_cooked", "ethereal:mushroom_soup")
minetest.register_alias("ethereal:mushroom_1", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_2", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_3", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_4", "flowers:mushroom_brown")

-- mushroom soup (Heals 1 heart)
minetest.register_craftitem("ethereal:mushroom_soup", {
	description = "Mushroom Soup",
	inventory_image = "mushroom_soup.png",
	on_use = minetest.item_eat(5, "ethereal:bowl"),
})

minetest.register_craft({
	output = "ethereal:mushroom_soup",
	recipe = {
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"},
		{"ethereal:bowl"},
	}
})
