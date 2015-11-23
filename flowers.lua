-- Flowers spread over all types of soil
minetest.register_abm({
	nodenames = {"group:flora"},
	neighbors = {"group:soil"},
	interval = 50,
	chance = 20,
	catch_up = false,
	action = function(pos, node)

		local light = minetest.get_node_light(pos)

		if not light or light < 13 then
			return
		end

		local pos0 = {x = pos.x - 4, y = pos.y - 2, z = pos.z - 4}
		local pos1 = {x = pos.x + 4, y = pos.y + 2, z = pos.z + 4}

		if #minetest.find_nodes_in_area_under_air(pos0, pos1, "group:flora") > 3 then

			local grass = minetest.find_nodes_in_area_under_air(pos0, pos1, {"ethereal:crystalgrass"})
			local crystal = minetest.find_nodes_in_area_under_air(pos0, pos1, {"ethereal:crystal_spike"})

			if #grass > 6 and #crystal < 1 then
				grass = grass[math.random(#grass)]
				grass.y = grass.y - 1
				if minetest.get_node(grass).name == "ethereal:crystal_dirt" then
					grass.y = grass.y + 1
					minetest.set_node(grass, {name = "ethereal:crystal_spike"})
				end
			end

			return
		end

		local seedling = minetest.find_nodes_in_area_under_air(pos0, pos1, {"group:soil"})

		if #seedling > 0 then
			seedling = seedling[math.random(#seedling)]
			seedling.y = seedling.y + 1
			light = minetest.get_node_light(seedling)
			if not light or light < 13 then
				return
			end
			if minetest.get_node(seedling).name == "air" then
				minetest.set_node(seedling, {name = node.name})
			end
		end
	end,
})