-- Wild Onion Plant
minetest.register_craftitem("ethereal:wild_onion_plant", {
	description = "Wild Onion",
	groups = {not_in_creative_inventory=1},
	inventory_image = "wild_onion.png",
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "ethereal:wild_onion_1")
	end
})
minetest.register_alias("ethereal:wild_onion_craftingitem", "ethereal:wild_onion_plant")

-- Define Onion growth stages
local onion_def = {
	drawtype = "plantlike",
	tiles = {"ethereal_wild_onion_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"ethereal:wild_onion_plant"},rarity=1},
			}
	},
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,attached_node=1,onion=1,growing=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
}
minetest.register_node("ethereal:onion_1", table.copy(onion_def))

onion_def.tiles[1] = "ethereal_wild_onion_2.png"
onion_def.groups.onion = 2
minetest.register_node("ethereal:onion_2", table.copy(onion_def))

onion_def.tiles[1] = "ethereal_wild_onion_3.png"
onion_def.groups.onion = 3
onion_def.drop.items[2] = {
	items = {"ethereal:wild_onion_plant 2"}, rarity=3
}
minetest.register_node("ethereal:onion_3", table.copy(onion_def))

onion_def.tiles[1] = "ethereal_wild_onion_4.png"
onion_def.groups.onion = 4
onion_def.drop.items[2] = {
	items = {"ethereal:wild_onion_plant 3"}, rarity=3
}
minetest.register_node("ethereal:onion_4", table.copy(onion_def))

onion_def.tiles[1] = "ethereal_wild_onion_5.png"
onion_def.groups.onion = 5
onion_def.groups.growing = nil
onion_def.drop.items = {
	{items = {"ethereal:wild_onion_plant 2"},rarity=1},
	{items = {"ethereal:wild_onion_plant 3"},rarity=2},
}
minetest.register_node("ethereal:onion_5", table.copy(onion_def))

-- Abm for growing Wild Onion
if farming.mod ~= "redo" then

minetest.register_abm({
	nodenames = {"group:onion"},
	neighbors = {"farming:soil_wet"},
	interval = 50,
	chance = 3,
	action = function(pos, node)
		-- return if already full grown
		if minetest.get_item_group(node.name, "growing") < 1 then
			return
		end
		
		-- check if on wet soil
		pos.y = pos.y-1
		if minetest.get_item_group(minetest.get_node(pos).name, "soil") < 3 then
			return
		end
		pos.y = pos.y+1
		
		-- check light
		local light = minetest.get_node_light(pos)
		if not light
		or light < 13 then
			return
		end
		
		-- grow
		node.name = "ethereal:onion_" .. minetest.get_item_group(node.name, "onion") + 1
		minetest.set_node(pos, node)
	end
})

end


-- Legacy

minetest.register_alias("ethereal:wild_onion_craftingitem", "ethereal:wild_onion_plant")
for i = 1,5 do
	minetest.register_alias("ethereal:wild_onion_"..i, "ethereal:onion_"..i)
end

-- Temporary compatibility lines for Xanadu server
minetest.register_alias("ethereal:onion_7", "ethereal:onion_4")
minetest.register_alias("ethereal:onion_8", "ethereal:onion_5")
minetest.register_alias("ethereal:wild_onion_7", "ethereal:onion_4")
minetest.register_alias("ethereal:wild_onion_8", "ethereal:onion_5")
