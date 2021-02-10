local timer_check = 5 -- seconds per check
local flight_secs = 5 * 60 -- seconds of flight
local S = ethereal.intllib


-- disable flight
local function set_flight(user, set)

	local privs = minetest.get_player_privs(user:get_player_name())
	privs.fly = set
	minetest.set_player_privs(user:get_player_name(), privs)
end


-- after function
local function ethereal_set_flight(user)

	local meta = user:get_meta() ; if not meta then return end
	local timer = tonumber(meta:get_string("ethereal:fly_timer"))
	local privs = minetest.get_player_privs(user:get_player_name())

	-- timer ran out, remove 'fly' privelage
	if not timer or timer <= 0 then
		set_flight(user, nil)
		return
	end

	-- have we already applied 'fly' privelage?
	if not privs.fly then
		set_flight(user, true)
	end

	-- handle timer
	timer = timer - timer_check

	local name = user:get_player_name()

	if timer < 10 then

		minetest.chat_send_player(name,
				minetest.get_color_escape_sequence("#ff5500")
						.. S("Flight timer about to expire!"))

		minetest.sound_play("default_dig_dig_immediate",
				{to_player = name, gain = 1.0}, true)
	end

	meta:set_string("ethereal:fly_timer", timer) -- lower timer

	minetest.after(timer_check, function()
		ethereal_set_flight(user)
	end)
end


-- on join / leave
minetest.register_on_joinplayer(function(player)

	local meta = player:get_meta() ; if not meta then return end
	local privs = minetest.get_player_privs(player:get_player_name())

	if privs.fly then

		local timer = tonumber(meta:get_string("ethereal:fly_timer"))

		if timer <= 0 then
			set_flight(player, nil)
		else
			ethereal_set_flight(player)
		end
	end
end)


-- potion item
minetest.register_node("ethereal:flight_potion", {
	description = S("Flight Potion"),
	drawtype = "plantlike",
	tiles = {"ethereal_flight_potion.png"},
	inventory_image = "ethereal_flight_potion.png",
	wield_image = "ethereal_flight_potion.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.37, -0.2, 0.2, 0.31, 0.2}
	},
	groups = {dig_immediate = 3},
	sounds = default.node_sound_glass_defaults(),

	on_use = function(itemstack, user, pointed_thing)

		-- get privs
		local name = user:get_player_name()
		local privs = minetest.get_player_privs(name)
		local meta = user:get_meta()
		local timer = meta:get_string("ethereal:fly_timer")

		if privs.fly then
			minetest.chat_send_player(name,
				minetest.get_color_escape_sequence("#ffff00")
						.. S("Flight already granted, @1 seconds left!", timer))
			return
		end

		if not meta then return end

		meta:set_string("ethereal:fly_timer", flight_secs)

		minetest.chat_send_player(name,
				minetest.get_color_escape_sequence("#1eff00")
						.. S("Flight granted, you have @1 seconds!", flight_secs))

		ethereal_set_flight(user)

		-- take item
		itemstack:take_item()

		-- return empty bottle
		local inv = user:get_inventory()

		if inv:room_for_item("main", {name = "vessels:glass_bottle"}) then
			user:get_inventory():add_item("main", "vessels:glass_bottle")
		else
			local pos = user:get_pos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "vessels:glass_bottle"})
		end

		return itemstack
	end
})


-- recipe
if ethereal.flight then
minetest.register_craft({
	output = "ethereal:flight_potion",
	recipe = {
		{"ethereal:etherium_dust", "ethereal:etherium_dust", "ethereal:etherium_dust"},
		{"ethereal:etherium_dust", "ethereal:fire_dust", "ethereal:etherium_dust"},
		{"ethereal:etherium_dust", "vessels:glass_bottle", "ethereal:etherium_dust"},
	}
})
end
