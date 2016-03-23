
-- Is More Blocks mod installed?

if not minetest.global_exists("stairsplus") then

-- If NOT then register standard stairs

stairs.register_stair_and_slab("crystal_block", "ethereal:crystal_block",
	{cracky = 1, level = 2},
	{"crystal_block.png"},
	"Crystal Block Stair",
	"Crystal Block Slab",
	default.node_sound_glass_defaults())

stairs.register_stair_and_slab("icebrick", "ethereal:icebrick",
	{crumbly = 3, melts = 1},
	{"brick_ice.png"},
	"Ice Brick Stair",
	"Ice Brick Slab",
	default.node_sound_glass_defaults())
		
stairs.register_stair_and_slab("snowbrick", "ethereal:snowbrick",
	{crumbly = 3, melts = 1},
	{"brick_snow.png"},
	"Snow Brick Stair",
	"Snow Brick Slab",
	default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
		dug = {name = "default_snow_footstep", gain = 0.75},
	}))

stairs.register_stair_and_slab("dry_dirt", "ethereal:dry_dirt",
	{crumbly = 3},
	{"ethereal_dry_dirt.png"},
	"Dry Dirt Stair",
	"Dry Dirt Slab",
	default.node_sound_dirt_defaults())

stairs.register_stair_and_slab("mushroom_trunk", "ethereal:mushroom_trunk",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mushroom_trunk.png"},
	"Mushroom Trunk Stair",
	"Mushroom Trunk Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("mushroom", "ethereal:mushroom",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	{"mushroom_block.png"},
	"Mushroom Top Stair",
	"Mushroom Top Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("frost_wood", "ethereal:frost_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	{"frost_wood.png"},
	"Frost Wood Stair",
	"Frost Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("yellow_wood", "ethereal:yellow_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	{"yellow_wood.png"},
	"Healing Wood Stair",
	"Healing Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("palm_wood", "ethereal:palm_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"moretrees_palm_wood.png"},
	"Palm Wood Stair",
	"Palm Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("birch_wood", "ethereal:birch_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"moretrees_birch_wood.png"},
	"Birch Wood Stair",
	"Birch Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("banana_wood", "ethereal:banana_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"banana_wood.png"},
	"Banana Wood Stair",
	"Banana Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("willow_wood", "ethereal:willow_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"willow_wood.png"},
	"Willow Wood Stair",
	"Willow Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("redwood_wood", "ethereal:redwood_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"redwood_wood.png"},
	"Redwood stair",
	"Redwood Slab",
	default.node_sound_wood_defaults())

else

-- if SO then register stairs plus stairs

stairsplus:register_all("ethereal", "crystal_block", "ethereal:crystal_block", {
	description = "Crystal block",
	tiles = {"crystal_block.png"},
	groups = {cracky = 1, falling_node = 1, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("ethereal", "icebrick", "ethereal:icebrick", {
	description = "Ice Brick",
	tiles = {"brick_ice.png"},
	groups = {crumbly = 3, melts = 1},
	sounds = default.node_sound_glass_defaults(),
})

stairsplus:register_all("ethereal", "snowbrick", "ethereal:snowbrick", {
	description = "Snow Brick",
	tiles = {"brick_snow.png"},
	groups = {crumbly = 3, melts = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.25},
		dug = {name = "default_snow_footstep", gain = 0.75},
	})
})

stairsplus:register_all("ethereal", "dry_dirt", "ethereal:dry_dirt", {
	description = "Dry Dirt",
	tiles = {"ethereal_dry_dirt.png"},
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
})

stairsplus:register_all("ethereal", "mushroom_trunk", "ethereal:mushroom_trunk", {
	description = "Mushroom Trunk",
	tiles = {"mushroom_trunk.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "mushroom", "ethereal:mushroom", {
	description = "Mushroom Top",
	tiles = {"mushroom_block.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "frost_wood", "ethereal:frost_wood", {
	description = "Frost Wood",
	tiles = {"frost_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "yellow_wood", "ethereal:yellow_wood", {
	description = "Healing Wood",
	tiles = {"yellow_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "palm_wood", "ethereal:palm_wood", {
	description = "Palm Wood",
	tiles = {"moretrees_palm_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "birch_wood", "ethereal:birch_wood", {
	description = "Birch Wood",
	tiles = {"moretrees_birch_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "banana_wood", "ethereal:banana_wood", {
	description = "Banana Wood",
	tiles = {"banana_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "willow_wood", "ethereal:willow_wood", {
	description = "Willow Wood",
	tiles = {"willow_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

stairsplus:register_all("ethereal", "redwood_wood", "ethereal:redwood_wood", {
	description = "Redwood",
	tiles = {"redwood_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

end -- END IF
