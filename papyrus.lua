-- override default papyrus to make it walkable
minetest.override_item("default:papyrus", {walkable=true, sunlight_propagates=true})

-- have papyrus grow up to 4 high and bamboo grow up to 5 in height (shared abm)
minetest.register_abm({
	nodenames = {"default:papyrus", "ethereal:bamboo"},
	neighbors = {"group:soil"},
	interval = 50,
	chance = 20,
	action = function(pos, node)

		local high = 4

		pos.y = pos.y - 1
		local nod = minetest.get_node_or_nil(pos)

		if not nod
		or minetest.get_item_group(nod.name, "soil") < 1
		or minetest.find_node_near(pos, 3, {"group:water"}) == nil then
			return
		end

		if node.name == "ethereal:bamboo" then
			high = 5
		end

		pos.y = pos.y + 1
		local height = 0

		while minetest.get_node(pos).name == node.name and height < high do
			height = height + 1
			pos.y = pos.y + 1
		end

		nod = minetest.get_node_or_nil(pos)
		if nod and nod.name == "air" and height < high then
			minetest.set_node(pos, {name=node.name})
		end

	end,
})
