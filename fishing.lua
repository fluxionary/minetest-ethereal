--[[

This fishing routine is inspired by the great work Rootyjr did for MineClone2

]]--

local S = ethereal.intllib

local fish_items = {
	"ethereal:fish_bluefin",
	"ethereal:fish_blueram",
	"ethereal:fish_catfish",
	"ethereal:fish_clownfish",
	"ethereal:fish_pike",
	"ethereal:fish_flathead",
	"ethereal:fish_plaice",
	"ethereal:fish_pufferfish",
	"ethereal:fish_redsnapper",
	"ethereal:fish_salmon",
	"ethereal:fish_chichlid"
}

local junk_items = {
	"ethereal:bowl",
	"default:stick",
	"farming:string",
	"ethereal:bamboo",
	"dye:black"
}

local bonus_items = {
	"mobs:nametag",
	"mobs:saddle",
	"flowers:waterlily"
}

local default_item = "default:dirt"

local random = math.random -- yup we use this a lot

-- add item function
ethereal.add_item = function(fish, junk, bonus)

	if fish and fish ~= "" then
		table.insert(fish_items, fish)
	end

	if junk and junk ~= "" then
		table.insert(junk_items, junk)
	end

	if bonus and bonus ~= "" then
		table.insert(bonus_items, bonus)
	end
end


minetest.register_entity("ethereal:prebob_entity", {

	textures = {"ethereal_fishing_bob.png"},
	visual_size = {x = 0.5, y = 0.5},
	collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
	pointable = false,
	physical = false,

	lastpos = {},
	fisher = nil,

	on_step = function(self, dtime)

		local pos = self.object:get_pos()

		-- Destroy when hitting a solid node
		if self.lastpos.x then

			local node = minetest.get_node(pos)
			local def = minetest.registered_nodes[node.name]

			-- remove if we hit something hard
			if def and def.walkable then
				self.object:remove()
				return
			end

			if def and def.liquidtype == "source"
			and minetest.get_item_group(node.name, "water") > 0 then

--print("---water")

				local obj = minetest.add_entity(self.lastpos, "ethereal:bob_entity")
				local ent = obj:get_luaentity()

				ent.player = self.fisher

				minetest.sound_play("default_water_footstep", {
					pos = self.lastpos, gain = 0.1}, true)

				self.object:remove()

				return
			end
		end

		self.lastpos = {x = pos.x, y = pos.y, z = pos.z}
	end
})


local use_rod = function(itemstack, player, pointed_thing)

	local pos = player:get_pos()
	local objs = minetest.get_objects_inside_radius(pos, 25)
	local found = true
	local ent

	-- loop through entities and look for bobs
	for n = 1, #objs do

		ent = objs[n]:get_luaentity()

		if ent
		and ent.player
		and (ent.name == "ethereal:prebob_entity" or ent.name == "ethereal:bob_entity")
		and player:get_player_name() == ent.player then

			found = false

			if ent.bob == true then

				local item
				local r = random(100)

				if r < 80 then

					item = fish_items[random(#fish_items)]

				elseif r > 80 and r < 96 then

					item = junk_items[random(#junk_items)]

				else

					item = bonus_items[random(#bonus_items)]
				end

				-- make sure item exists, if not replace with default item
				if not minetest.registered_items[item] then
					item = default_item
				end

--print ("---caught", item, r)

				item = ItemStack(item)

				local inv = player:get_inventory()

				if inv:room_for_item("main", item) then
					inv:add_item("main", item)
				else
					minetest.add_item(pos, item)
				end
			end

			ent.object:remove()

			return itemstack
		end
	end

	-- loop through entities and look for bobs
	for n = 1, #objs do

		ent = objs[n]:get_luaentity()

		if ent
		and ent.fisher
		and (ent.name == "ethereal:prebob_entity" or ent.name == "ethereal:bob_entity")
		and player:get_player_name() == ent.fisher then

			found = false

			break
		end
	end

	if found == true then

		local playerpos = player:get_pos()
		local dir = player:get_look_dir()
		local pos = {x = playerpos.x, y = playerpos.y + 1.5, z = playerpos.z}

		minetest.sound_play("default_dig_crumbly",
			{pos = pos, gain = 0.4, max_hear_distance = 16}, true)

		-- place actual bob
		local obj = minetest.add_entity(pos, "ethereal:prebob_entity")

		obj:set_velocity({x = dir.x * 5, y = dir.y * 5, z = dir.z * 5})
		obj:set_acceleration({x = dir.x * -3, y = -9.8, z = dir.z * -3})
		obj:get_luaentity().fisher = player and player:get_player_name()
	end
end


minetest.register_entity("ethereal:bob_entity", {

	textures = {"ethereal_fishing_bob.png"},
	visual_size = {x = 0.5, y = 0.5},
	collisionbox = {0.4,0.4,0.4,0.4,0.4,0.4},
	physical = false,
	pointable = false,
	static_save = false,

	lastpos = {},
	timer = 0,
	patience = nil,
	old_y = nil,
	bob = false,
	player = nil,

	on_step = function(self, dtime)

		-- we need a name
		if self.player == nil or self.player == "" then

			self.object:remove()

			return
		end

		local player = minetest.get_player_by_name(self.player)

		-- we need an actual person
		if not player then

			self.object:remove()

			return
		end

		local pos = self.object:get_pos()

		pos.y = math.floor(pos.y)

		local node = minetest.get_node(pos)
		local def = minetest.registered_nodes[node.name]
		local wield = player:get_wielded_item()

		-- we also need a rod to fish with
		if not wield
		or minetest.get_item_group(wield:get_name(), "ethereal_rod") <= 0 then

			self.object:remove()

			return
		end

		-- remove bob if player is too far away
		local bob_pos = self.object:get_pos()
		local pla_pos = player:get_pos()

		if (pla_pos.y - bob_pos.y) > 25
		or (pla_pos.y - bob_pos.y) < -25
		or (pla_pos.x - bob_pos.x) > 25
		or (pla_pos.x - bob_pos.x) < -25
		or (pla_pos.z - bob_pos.z) > 25
		or (pla_pos.z - bob_pos.z) < -25 then

--print("-- out of range")

			self.object:remove()

			return
		end

		-- when in water, bob.
		if def and def.liquidtype == "source"
		and minetest.get_item_group(def.name, "water") ~= 0 then

			if self.old_y == nil then

				self.object:set_pos({
					x = self.object:get_pos().x,
					y = math.floor(self.object:get_pos().y) + 0.5,
					z = self.object:get_pos().z})

				self.old_y = self.object:get_pos().y
			end

			-- reset to original position after dive.
			if self.object:get_pos().y > self.old_y then

				self.object:set_pos({
					x = self.object:get_pos().x,
					y = self.old_y,
					z = self.object:get_pos().z})

				self.object:set_velocity({x = 0, y = 0, z = 0})
				self.object:set_acceleration({x = 0, y = 0, z = 0})
			end

			-- choose random time to wait
			if not self.patience or self.patience <= 0 then
				self.patience = random(10, 45)
			end

			-- add particles if bobber bobbing
			if self.bob then

				minetest.add_particle({
					pos = {
						x = pos.x + random() - 0.5,
						y = pos.y + 0.1,
						z = pos.z + random() - 0.5
					},
					velocity = {x = 0, y = 4, z = 0},
					acceleration = {x = 0, y = -5, z = 0},
					expirationtime = random() * 0.5,
					size = random(),
					collisiondetection = false,
					vertical = false,
					texture = "bubble.png",
				})

				-- handle timer
				if self.timer < self.patience then
					self.timer = self.timer + dtime
				else
					self.patience = 0
					self.timer = 0
					self.bob = false
				end
			else
				-- handle timer
				if self.timer < self.patience then
					self.timer = self.timer + dtime
				else
					-- waiting over, bob that bobber and play splash sound
					self.bob = true
					self.patience = 0.8
					self.timer = 0

					self.object:set_velocity({x = 0, y = -2, z = 0})
					self.object:set_acceleration({x = 0, y = 5, z = 0})

					minetest.sound_play("default_water_footstep", {
						pos = pos, gain = 0.1}, true)
				end
			end
		end
	end
})


local remove_bob = function(player)

	local objs = minetest.get_objects_inside_radius(player:get_pos(), 25)
	local ent

	for n = 1, #objs do

		ent = objs[n]:get_luaentity()

		if ent
		and (ent.name == "ethereal:prebob_entity"
		or ent.name == "ethereal:bob_entity") then

			if ent.player or ent.fisher then
				ent.object:remove()
			end
		end
	end
end


-- remove bob if player signs off
minetest.register_on_leaveplayer(function(player)
	remove_bob(player)
end)


-- remove bob if player dies
minetest.register_on_dieplayer(function(player)
	remove_bob(player)
end)


-- fishing rod
minetest.register_tool("ethereal:fishing_rod", {
	description = S("Fishing Rod (USE to cast and again when the time is right)"),
	groups = {tool = 1, ethereal_rod = 1},
	inventory_image = "ethereal_fishing_rod.png",
	wield_image = "ethereal_fishing_rod.png^[transformFX",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	stack_max = 1,
	on_use = use_rod,
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "ethereal:fishing_rod",
	recipe = {
		{"","","group:stick"},
		{"","group:stick","farming:string"},
		{"group:stick","","farming:string"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:fishing_rod",
	burntime = 15,
})


local fish = {
	{"Blue Fin", "bluefin", 2},
	{"Blue Ram", "blueram", 2},
	{"Catfish", "catfish", 2},
	{"Clownfish", "clownfish", 2},
	{"Pike", "pike", 2},
	{"Flathead", "flathead", 2},
	{"Plaice", "plaice", 2},
	{"Pufferfish", "pufferfish", -2},
	{"Red Snapper", "redsnapper", 2},
	{"Salmon", "salmon", 2},
	{"Chichlid", "chichlid", 2}
}

for n = 1, #fish do

	minetest.register_craftitem("ethereal:fish_" .. fish[n][2], {
		description = S(fish[n][1]),
		inventory_image = "ethereal_fish_" .. fish[n][2] .. ".png",
		on_use = minetest.item_eat(fish[n][3]),
		groups = {food_fish_raw = 1, ethereal_fish = 1}
	})
end


-- cooked fish
minetest.register_craftitem(":ethereal:fish_cooked", {
	description = S("Cooked Fish"),
	inventory_image = "ethereal_fish_cooked.png",
	wield_image = "ethereal_fish_cooked.png",
	groups = {food_fish = 1, flammable = 3},
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	output = "ethereal:fish_cooked",
	recipe = "group:ethereal_fish",
	cooktime = 8,
})


-- compatibility
minetest.register_alias("ethereal:fish_raw", "ethereal:fish_chichlid")


-- Sashimi (Thanks to Natalia Grosner for letting me use the sashimi image)
minetest.register_craftitem("ethereal:sashimi", {
	description = S("Sashimi"),
	inventory_image = "sashimi.png",
	wield_image = "sashimi.png",
	on_use = minetest.item_eat(4)
})

minetest.register_craft({
	output = "ethereal:sashimi 2",
	recipe = {
		{"group:food_seaweed", "group:food_fish_raw", "group:food_seaweed"},
	}
})

-- Worm
minetest.register_craftitem("ethereal:worm", {
	description = S("Worm"),
	inventory_image = "worm.png",
	wield_image = "worm.png",
})

minetest.register_craft({
	output = "ethereal:worm",
	recipe = {
		{"default:dirt","default:dirt"},
	}
})
