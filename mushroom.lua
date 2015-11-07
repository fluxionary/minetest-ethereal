
-- does flowers:mushroom_red exists?
-- if not then create temporary shroom stuff

if minetest.registered_nodes["flowers:mushroom_red"] then

	print ("[Ethereal] Using current mushrooms in flowers mod")

else

	print ("[Ethereal] Defining temporary mushrooms")

-- The following code was taken from minetest 0.4.13's flowers mod
-- incase players are using older version of minetest

local mushrooms_datas = {
	{"brown", 2},
	{"red", -6}
}

for _, m in pairs(mushrooms_datas) do
	local name, nut = m[1], m[2]

	-- Register fertile mushrooms (these spawn on map and drop spores)

	minetest.register_node(":flowers:mushroom_fertile_" .. name, {
		description = string.sub(string.upper(name), 0, 1) ..
			string.sub(name, 2) .. " Fertile Mushroom",
		tiles = {"flowers_mushroom_" .. name .. ".png"},
		inventory_image = "flowers_mushroom_" .. name .. ".png",
		wield_image = "flowers_mushroom_" .. name .. ".png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, attached_node = 1,
			not_in_creative_inventory = 1},
		drop = {
			items = {
				{items = {"flowers:mushroom_" .. name}},
				{items = {"flowers:mushroom_spores_" .. name}, rarity = 4},
				{items = {"flowers:mushroom_spores_" .. name}, rarity = 2},
				{items = {"flowers:mushroom_spores_" .. name}, rarity = 2}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		on_use = minetest.item_eat(nut),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		}
	})

	-- Register infertile mushrooms (these do not drop spores)

	minetest.register_node(":flowers:mushroom_" .. name, {
		description = string.sub(string.upper(name), 0, 1) ..
			string.sub(name, 2) .. " Mushroom",
		tiles = {"flowers_mushroom_" .. name .. ".png"},
		inventory_image = "flowers_mushroom_" .. name .. ".png",
		wield_image = "flowers_mushroom_" .. name .. ".png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
		on_use = minetest.item_eat(nut),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		}
	})

	-- Register mushroom spores

	minetest.register_node(":flowers:mushroom_spores_" .. name, {
		description = string.sub(string.upper(name), 0, 1) ..
			string.sub(name, 2) .. " Mushroom Spores",
		drawtype = "signlike",
		tiles = {"flowers_mushroom_spores_" .. name .. ".png"},
		inventory_image = "flowers_mushroom_spores_" .. name .. ".png",
		wield_image = "flowers_mushroom_spores_" .. name .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		selection_box = {
			type = "wallmounted",
		},
		groups = {dig_immediate = 3, attached_node = 1},
	})

end

end -- END if red mushroom exists already

-- Register growing ABM

minetest.register_abm({
	nodenames = {"flowers:mushroom_spores_brown", "flowers:mushroom_spores_red"},
	interval = 11,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local node_under = minetest.get_node_or_nil({x = pos.x,
			y = pos.y - 1, z = pos.z})
		if not node_under then
			return
		end
		if minetest.get_item_group(node_under.name, "soil") ~= 0 and
				minetest.get_node_light(pos, nil) <= 13 then
			if node.name == "flowers:mushroom_spores_brown" then
				minetest.set_node(pos, {name = "flowers:mushroom_fertile_brown"})
			elseif node.name == "flowers:mushroom_spores_red" then
				minetest.set_node(pos, {name = "flowers:mushroom_fertile_red"})
			end
		end
	end
})

-- set compatibility with old ethereal shrooms
minetest.register_alias("ethereal:mushroom_craftingitem", "flowers:mushroom_spores_brown")
minetest.register_alias("ethereal:mushroom_plant", "flowers:mushroom_brown")
minetest.register_alias("ethereal:mushroom_soup_cooked", "ethereal:mushroom_soup")
minetest.register_alias("ethereal:mushroom_1", "flowers:mushroom_spores_brown")
minetest.register_alias("ethereal:mushroom_2", "flowers:mushroom_spores_brown")
minetest.register_alias("ethereal:mushroom_3", "flowers:mushroom_fertile_brown")
minetest.register_alias("ethereal:mushroom_4", "flowers:mushroom_fertile_brown")

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
