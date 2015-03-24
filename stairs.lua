-- Register Stairs & Slabs

stairs.register_stair_and_slab("crystal_block", "ethereal:crystal_block",
	{cracky=1, level=2, not_in_craft_guide=1},
	{"crystal_block.png"},
	"Crystal Block Stair",
	"Crystal Block Slab",
	default.node_sound_glass_defaults())

stairs.register_stair_and_slab("icebrick", "ethereal:icebrick",
	{crumbly=3, melts = 1, not_in_craft_guide=1},
	{"brick_ice.png"},
	"Ice Brick Stair",
	"Ice Brick Slab",
	default.node_sound_glass_defaults())
		
stairs.register_stair_and_slab("snowbrick", "ethereal:snowbrick",
	{crumbly=3, melts = 1, not_in_craft_guide=1},
	{"brick_snow.png"},
	"Snow Brick Stair",
	"Snow Brick Slab",
	default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}))

stairs.register_stair_and_slab("dry_dirt", "ethereal:dry_dirt",
	{crumbly=3, not_in_craft_guide=1},
	{"ethereal_dry_dirt.png"},
	"Dry Dirt Stair",
	"Dry Dirt Slab",
	default.node_sound_dirt_defaults())

stairs.register_stair_and_slab("mushroom_trunk", "ethereal:mushroom_trunk",
	{choppy=2,oddly_breakable_by_hand=1,flammable=2, not_in_craft_guide=1},
	{"mushroom_trunk.png"},
	"Mushroom Trunk Stair",
	"Mushroom Trunk Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("mushroom", "ethereal:mushroom",
	{choppy=2,oddly_breakable_by_hand=1,flammable=2, not_in_craft_guide=1},
	{"mushroom_block.png"},
	"Mushroom Top Stair",
	"Mushroom Top Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("frost_wood", "ethereal:frost_wood",
	{choppy=2,oddly_breakable_by_hand=1,put_out_fire=1, not_in_craft_guide=1},
	{"frost_wood.png"},
	"Frost Wood Stair",
	"Frost Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("yellow_wood", "ethereal:yellow_wood",
	{choppy=2,oddly_breakable_by_hand=1,put_out_fire=1, not_in_craft_guide=1},
	{"yellow_wood.png"},
	"Healing Wood Stair",
	"Healing Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("palm_wood", "ethereal:palm_wood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"moretrees_palm_wood.png"},
	"Palm Wood Stair",
	"Palm Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("banana_wood", "ethereal:banana_wood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"banana_wood.png"},
	"Banana Wood Stair",
	"Banana Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("willow_wood", "ethereal:willow_wood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"willow_wood.png"},
	"Willow Wood Stair",
	"Willow Wood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("redwood_wood", "ethereal:redwood_wood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"redwood_wood.png"},
	"Redwood stair",
	"Redwood Slab",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("acacia_wood", "ethereal:acacia_wood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"moretrees_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	default.node_sound_wood_defaults())
