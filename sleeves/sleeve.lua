init = function()
  local backapply_orig = Back.apply_to_run
  function Back.apply_to_run(self)
    backapply_orig(self)
    			G.E_MANAGER:add_event(Event({
					func = function()
            if G.GAME.modifiers.poke_force_seal then
              for i = 1, #G.playing_cards do
                G.playing_cards[i]:set_seal(G.GAME.modifiers.poke_force_seal, true)
              end
            end
						return true
					end,
				}))
  end
end

-- Pokemon Sleeve
	local pokemonsleeve = {
		key = 'pokemonsleeve',
		name = 'Trainer Sleeve',
		prefix_config = {},
		atlas = "pokesleeves",
		pos = { x = 0, y = 0 },
		config = {vouchers = { "v_poke_goodrod"}, consumables = {'c_poke_pokeball'}},
		loc_vars = function(self, info_queue, center)
			return {vars = {localize("goodrod_variable"), localize("pokeball_variable")}}
		end,
	}
--- Obituary Sleeve
	local obituarysleeve = {
		key = 'obituarysleeve',
		name = 'Obituary Sleeve',
		prefix_config = {},
		atlas = "pokesleeves",
		pos = { x = 2, y = 0 },
		config = {},
		loc_vars = function(self, info_queue, center)
		  return {vars = {localize("pinkseal_variable")}}
		end,
		apply = function(self)
			G.GAME.modifiers.poke_force_seal = "poke_pink_seal"
		end
	}
  
  --- Revenant Sleeve
	local revenantsleeve = {
		key = 'revenantsleeve',
		name = 'Revenant Sleeve',
		prefix_config = {},
		atlas = "pokesleeves",
		pos = { x = 5, y = 0 },
		config = {},
		loc_vars = function(self, info_queue, center)
		  return {vars = {localize("silverseal_variable")}}
		end,
		apply = function(self)
			G.GAME.modifiers.poke_force_seal = "poke_silver"
		end
	}

--- Luminous Sleeve 
	local luminoussleeve = {
		key = 'luminoussleeve',
		name = 'Luminous Sleeve',
		prefix_config = {},
		atlas = "pokesleeves",
		pos = { x = 1, y = 0 },
		config = {},
		loc_vars = function(self, info_queue, center)
			return {
				vars = {
				}
		}
	end,
	apply = function(self)
	  G.GAME.modifiers.apply_type = true
	end
}

-- Telekinetic Sleeve
	local telekineticsleeve = {
		key = 'telekineticsleeve',
		name = 'Telekinetic Sleeve',
		prefix_config = {},
		atlas = "pokesleeves",
		pos = { x = 3, y = 0 },
		config = {vouchers = { "v_crystal_ball"}, consumables = {'c_poke_twisted_spoon', 'c_poke_twisted_spoon'}},
		loc_vars = function(self, info_queue, center)
			return {vars = {localize{type = 'name_text', key = 'v_crystal_ball', set = 'Voucher'}, localize("twisted_spoon_variable")}}
		end,
}

local ampedsleeve = {
	name = "ampedsleeve",
	key = "ampedsleeve",
  prefix_config = {},
  pos = { x = 4, y = 0 },
  atlas = "pokesleeves",
	config = {vouchers = { "v_poke_energysearch"}, consumables = {'c_poke_double_rainbow_energy'}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'v_poke_energysearch', set = 'Voucher'}, localize("double_rainbow_energy_variable")}}
  end,
} 

local slist = {pokemonsleeve, obituarysleeve, revenantsleeve, luminoussleeve, telekineticsleeve, ampedsleeve}

return {Name = "Sleeve",
				init = init,
				list = slist
}
