--[[
https://github.com/interobject/the_gathering_historical_missions

https://git-scm.com/download/win
https://desktop.github.com/
]]

load_tup_mod = true
log_quiet = true
log_level = 0

package.path = package.path .. ";C:/Dev/TheGathering/workspace/loader/?.lua;C:/Dev/TheGathering/workspace/module/?.lua"
require("mod_loader_header_historical")

local logger 	= mod_loader_logger()
local util 		= mod_loader_util()
local utf8 		= mod_loader_utf8()
local lib 		= mod_loader_lib()

local _eq = function( ... ) return logger:eq( ... ) end
local _to = function( ... ) return logger:to( ... ) end
local _c2 = function( ... ) return logger:cto2(...) end

--=====================================================================--
							-- Module --
--=====================================================================--

package.path = package.path..";C:/Dev/TheGathering/workspace/module/historical_missions/?.lua"

local tke_sun_jian_events = require( "tke.export_event_tke_sun_jian" )
local tke_cao_cao_events  = require( "tke.export_event_tke_cao_cao" )
local tke_liu_bei_events  = require( "tke.export_event_tke_liu_bei" )

--=====================================================================--
							-- Missions --
--=====================================================================--

local payload_ui_text_keys = {}
local missions = {}

function missions:get_ui_text_key( key )
	return self.faction_key.."_mission_line_"..key
end

function missions:get_mission_key( key )
	return "historical_"..self:get_ui_text_key( key )
end

function missions:get_id( is_mission, index, count )
	return string.format( "%s%s%02d%02d", self.id_prefix, (is_mission and "1" or "0"), index, count )
end

function missions:init( events )

	self.id_prefix = events.id_prefix
	self.faction_key = events.faction_key
	self.faction_tk_key = events.faction_tk_key
	self.campaign_name = events.campaign_name
	self.missions = events.missions

	self.sorted = {}

	for key, row in pairs( events.missions ) do
		row.key = key
		row.is_mission = true

		table.insert( self.sorted, row )
	end
	
	table.sort( self.sorted, function( a, b ) return a.key < b.key end )

	for _, row in pairs( self.sorted ) do
		if row.payload_text then
			local text_key = self.faction_key.."_mission_line_"..row.key
			table.insert( payload_ui_text_keys, text_key )
		end
	end

	logger:line( "_", string.format("%s missions %d - %s", self.faction_key, #self.sorted, self:get_mission_key( self.sorted[1].key )) )
end

function missions:foreach( call_func )
	for _, row in pairs( self.sorted ) do
		call_func( row )
	end
end

function missions:get_mission_title( row )
	if not lib.is_empty(row.title) then
		return row.title
	end

	if row.desc then return row.desc end
	
	return row.hero_kr
end

function missions:missions_tables()
-- { key = '01_01', index = 11, hero_kr = "악진", desc = "부대 18", dilemma = "vanilla" },

	local function out_loc_mission_titles( row )
		local mission_key = self:get_mission_key( row.key )
		local title = self:get_mission_title( row )
		local description = row.hero_kr.." : "..row.desc
		
		logger:tsv( mission_key, "FALSE", description, title, row.mission_type )
	end
	
	logger:pline( "_", self.faction_key.."_missions" )
	logger( "" )
	
	local c_missions = 0
	self:foreach( function( row )
			out_loc_mission_titles( row )
			c_missions = c_missions + 1
		end )

	logger("")
	logger:line( "_", string.format( self.faction_key.."_missions %d", c_missions ) )
end



-- { option = "VAR_MISSION_LENGTH_INFINITE", value = "" },					

function missions:option_juntions()
	-- 351488415	3k_main_objective_liu_bei_02a	GEN_TARGET_NONE		mission_objective
	local function out_option_line( mission_key, index, count, option, value, target )
		target = target or "mission_objective"
		value = value or ""

		logger:tsv( self:get_id( true, index, count ), mission_key, option, value, target )
	end
	
	local function out_option_junctions_common_headers( mission_key, index, line_key )

		out_option_line( mission_key, index, 1, "CND_UNIQUE", "", "default" )
		out_option_line( mission_key, index, 2, "CND_CAMPAIGN", self.campaign_name, "default" )
		out_option_line( mission_key, index, 3, "GEN_CND_SELF", "", "target_faction_1" )
		out_option_line( mission_key, index, 4, "GEN_TARGET_FACTION", "", "target_faction_1" )
		out_option_line( mission_key, index, 5, "CND_FACTION", self.faction_tk_key, "target_faction_1" )
		
		return 5
	end

	logger:pline( "_", self.faction_key.."_missions option junctions" )
	logger( "" )
	
	local c_missions = 0
	
	self:foreach( function( row )
		local mission_key = self:get_mission_key( row.key )
		local index = row.index
		local count = out_option_junctions_common_headers( mission_key, index, row.key )
		
		for _, option in pairs( row.objectives ) do
			count = count + 1
			out_option_line( mission_key, index, count, option.option, option.value, option.target )
		end

		count = count + 1
		out_option_line( mission_key, index, count, "VAR_MISSION_LENGTH_INFINITE", "", "mission_objective" )
		
		c_missions = c_missions + 1
	end )

	logger("")
	logger:line( "_", string.format( self.faction_key.."_missions option_juntions %d", c_missions ) )
end

function missions:payloads()
	local function out_payload_line( mission_key, index, count, option, status, value, target )
		target = target or "mission_objective"
		value = value or ""
		
		logger:tsv( self:get_id( true, index, count ), mission_key, option, status, value, target )
	end
	
	local function out_payloads_common_headers( mission_key, index, line_key )

		out_payload_line( mission_key, index, 1, "TEXT_DISPLAY", "SUCCESS", "LOOKUP["..mission_key:match( "historical_([%w_]+)$").."]", "default" )
		
		return 1
	end

	logger:pline( "_", self.faction_key.."_missions payloads" )
	logger( "" )
	local c_payloads = 0
	self:foreach( function( row )
		local mission_key = self:get_mission_key( row.key )
		local index = row.index
		local count = out_payloads_common_headers( mission_key, index, row.key )

		if row.payloads and #row.payloads > 0 then
			for _, option in pairs( row.payloads ) do
				count = count + 1
				out_payload_line( mission_key, index, count, option.option, option.status, option.value, option.target )
			end
		else
			count = count + 1
			out_payload_line( mission_key, index, count, "EFFECT_BUNDLE", "SUCCESS", "KEY[3k_main_payload_faction_force_replenishment_increase];DURATION[5]", "target_faction_1" )
		end

		--count = count + 1
		--out_payload_line( mission_key, index, count, "LOCATED", "FACTION", "target_faction_1" )

		c_payloads = c_payloads + 1
	end )

	logger("")
	logger:line( "_", string.format( self.faction_key.."_missions payloads %d", c_payloads ) )
end

function missions:localisations()
	local function out_localisations( row )
		local head_title = "missions_localised_title_"
		local head_desc = "missions_localised_description_"
		
		local mission_key = self:get_mission_key( row.key )
		local hero_kr = row.hero_kr
		local title = row.title or hero_kr.." 합류 미션"
		local description = row.description
		local ui_text_key = self:get_ui_text_key( row.key )
		
		if lib.is_empty( description ) then description = hero_kr.." 미션(설명) : "..row.desc end
		
		logger:tsv( head_title..mission_key, title, "FALSE" )
		logger:tsv( head_desc..mission_key, description, "FALSE" )

		local payload_ui_key = "campaign_payload_ui_details_description_"..ui_text_key
		local payload_ui_text = row.payload_text or hero_kr.." 장수가 아군 조정에 합류합니다."
		
		logger:tsv( payload_ui_key, payload_ui_text, "FALSE" )
		
		-- missions_localised_supplementary_text_3k_main_tutorial_mission_sun_jian_recruit_units
		if row.objective_text then
			local objective_ui_key = "mission_text_text_objective_"..ui_text_key
			local objective_ui_text = row.objective_text
		
			logger:tsv( objective_ui_key, objective_ui_text, "FALSE" )
		end
		if row.supplementary_text then
			local objective_ui_key = "missions_localised_supplementary_text_"..mission_key
			local objective_ui_text = row.supplementary_text
		
			logger:tsv( objective_ui_key, objective_ui_text, "FALSE" )
		end
	end

	logger:pline( "_", self.faction_key.."_missions loc" )
	logger( "" )

	local c_missions = 0
	self:foreach( function( row )
			out_localisations( row )
			c_missions = c_missions + 1
		end )
	
	logger("")
	logger:line( "_", string.format( self.faction_key.."_missions loc %d", c_missions ) )
end

--=====================================================================--
								-- Dilemmas --
--=====================================================================--

local dilemmas = {}

function dilemmas:get_id( is_mission, index, count )
	return string.format( "%s%s%02d%02d", self.id_prefix, (is_mission and "1" or "0"), index, count )
end

function dilemmas:get_ui_text_key( row )
	if row.is_mission == true then
		local en_key = historical.db_heroes[historical.db_heroes_kr[row.hero_kr]].en_key
		if en_key then
			return self.faction_key.."_"..row.key.."_"..en_key
		end
	elseif row.is_special == true then
		return string.format( "%s_%s", self.faction_key, row.key )
	else
		return string.format( "%s_%02d_join_%s", self.faction_key, row.index, row.key )
	end
end

function dilemmas:get_dilemma_key( row )
	return "historical_"..self:get_ui_text_key(row).."_dilemma"
end

function dilemmas:get_dilemma_title( row, brief )
	if not brief and not lib.is_empty(row.title) then
		return row.title
	end

	local hero_kr = row.hero_kr and row.hero_kr.." " or ""

	if row.is_mission == true then
		return hero_kr.."미션 : "..(row.desc and row.desc or "")
	elseif row.is_special == true then
		return hero_kr.."특수 : "..(row.desc and row.desc or "")
	else
		return hero_kr.."합류 : "..(row.desc and row.desc or "")
	end
end

function dilemmas:get_dilemma_description( row, brief )
	if not brief and not lib.is_empty(row.description) then
		return row.description
	end
	
	local hero_kr = row.hero_kr and row.hero_kr or ""
	
	if row.is_mission == true then
		return "미션 : "..hero_kr.." : "..(row.desc and row.desc or "")
	elseif row.is_special == true then
		return "특수 : "..hero_kr.." : "..(row.desc and row.desc or "")
	else
		return "합류 : "..hero_kr.." : "..(row.desc and row.desc or "")
	end
end

function dilemmas:init( events )

	self.id_prefix = events.id_prefix
	self.faction_key = events.faction_key
	self.faction_tk_key = events.faction_tk_key
	self.campaign_name = events.campaign_name

	self.sorted = {}

	local count = 0
	
	for line_key, row in pairs( events.missions ) do
		if row.dilemma == true or type(row.dilemma) == 'table' then
			local dilemma = row.dilemma
			
			dilemma.key = line_key
			dilemma.hero_kr = row.hero_kr
			dilemma.index = row.index
			dilemma.desc = row.desc
			dilemma.is_mission = true
			dilemma.order = 1
			
			table.insert( self.sorted, dilemma )
			count = count + 1
		end
	end

	for en_key, row in pairs( events.join_dilemmas ) do
		row.key = en_key
		row.order = 2
		
		table.insert( self.sorted, row )
		count = count + 1
	end

	for key, row in pairs( events.special_dilemmas ) do
		row.key = key
		row.is_special = true
		row.order = 3
		
		table.insert( self.sorted, row )
		count = count + 1
	end

	logger( "dilemmas.sorted", lib.rows( self.sorted ), "_[:"..count )
	
	table.sort( self.sorted,
		function( a, b )
			if a.order == 3 and a.index == 0 then return true end
			if b.order == 3 and b.index == 0 then return false end
			
			if a.order ~= b.order then return a.order < b.order
			else
				return a.index < b.index
			end
		end )

	for _, dilemma in pairs( self.sorted ) do
		local ui_text_key = self:get_ui_text_key( dilemma )

		dilemma.choice = dilemma.choice or 2

		for i = 0, dilemma.choice - 1 do
			local choice = historical.index_2_choice[ i ]
			local curr_choice = dilemma.choices and dilemma.choices[ choice ] or nil
			
			if curr_choice
				and (dilemma.payload_text or curr_choice.payload_text or curr_choice.payload_texts )
			then
				if choice == 'first' and dilemma.payload_text then
					table.insert( payload_ui_text_keys, ui_text_key )
				elseif curr_choice.payload_text then
					table.insert( payload_ui_text_keys, ui_text_key.."_"..choice )
				elseif curr_choice.payload_texts then
					for idx, _ in pairs( curr_choice.payload_texts ) do
						table.insert( payload_ui_text_keys, string.format( "%s_%s_%02d", ui_text_key, choice, idx ) )
					end
				end
			end
		end
	end
end

function dilemmas:foreach( call_func )
	for _, row in pairs( self.sorted ) do
		call_func( row )
	end
end

function dilemmas:dilemmas_table()
--historical_tke_cao_cao_08_01_sima_yi_02_dilemma	false	사마의 02	historical_tke_cao_cao_mission_line_08_01_2
--historical_tke_cao_cao_yang_xiu_dilemma	false	양수	dummy_yang_xiu

	local function out_dilemmas_title( row )
		local dilemma_key = self:get_dilemma_key( row )
		local desc = self:get_dilemma_description( row, true )
		local title = self:get_dilemma_title( row, true )
		
		logger:tsv( dilemma_key, "FALSE", desc, title )
	end

	logger("")
	local count = 0
	self:foreach( function( row )
			out_dilemmas_title( row )
			count = count + 1
		end 
	)

	logger("")
	logger:line( "_", string.format( "dilemmas_table %d", count ) )
end

function dilemmas:choice_details_table()
--FIRST	historical_tke_cao_cao_01_01_yue_jin_dilemma
--SECOND	historical_tke_cao_cao_01_01_yue_jin_dilemma
	
	local function out_dilemmas_choice_details( row )
		local dilemma_key = self:get_dilemma_key( row )
		
		logger:tsv( "FIRST", dilemma_key )
		logger:tsv( "SECOND", dilemma_key )
		
		if row.choice and row.choice >= 3 then logger:tsv( "THIRD", dilemma_key ) end
		if row.choice and row.choice >= 4 then logger:tsv( "FOURTH", dilemma_key ) end
	end

	logger("")
	local count = 0
	self:foreach( function( row )
			out_dilemmas_choice_details( row )
			count = count + 1
		end 
	)

	logger("")
	logger:line( "_", string.format( "out_dilemmas_choice_details %d", count ) )
end

function dilemmas:option_juntions( out_special, index )
	local function out_option_line( is_mission, row, dilemma_key, count, option, value, target )
		
		target = target or "default"
		value = value or ""
		
		logger:tsv( self:get_id( is_mission, row.index, count ), dilemma_key, option, value, target )
	end
	
	local function out_junctions_common_headers( row, dilemma_key )
		local is_mission = row.is_mission
		local var_chance = row.var_chance or 500
		local cnd_random = row.cnd_random or 100
		local count = 6
		
		out_option_line( is_mission, row, dilemma_key, 1, "CND_UNIQUE", "", "default" )
		out_option_line( is_mission, row, dilemma_key, 2, "CND_CAMPAIGN", self.campaign_name, "default" )
		out_option_line( is_mission, row, dilemma_key, 3, "GEN_CND_SELF", "", "target_faction_1" )
		out_option_line( is_mission, row, dilemma_key, 4, "GEN_TARGET_FACTION", "", "target_faction_1" )
		out_option_line( is_mission, row, dilemma_key, 5, "CND_FACTION", self.faction_tk_key, "target_faction_1" )
		out_option_line( is_mission, row, dilemma_key, 6, "VAR_CHANCE", var_chance, "default" )
		if cnd_random > 0 then
			out_option_line( is_mission, row, dilemma_key, 7, "CND_RANDOM", cnd_random, "default" )
			count = 7
		end

		return count
	end

	logger:pline( "_", self.faction_key.."_dilemmas option_juntions" )
	logger( "" )
	
	local c_junctions = 0
	self:foreach( function( row )
		if ((out_special and row.is_special) or (not out_special and not row.is_special ))
			and (index == nil or row.index == index)
		then
			local dilemma_key = self:get_dilemma_key( row )
			local template_key = historical.db_heroes_kr[ row.hero_kr ]
			local gen_character = (row.gen_target) or (row.owns == true) or ( row.not_owns == true )
			local is_mission = row.is_mission

			if not row.index then
				logger:inspect( "invalid index", row )
				logger:fatal( dilemma_key, "invalid index" )
			end
			local count = out_junctions_common_headers( row, dilemma_key )

			if row.options and #row.options > 0 then
				for _, option in pairs( row.options ) do
					count = count + 1
					out_option_line( is_mission, row, dilemma_key, count, option.option, option.value, option.target )
				end
			end

			if gen_character then
				count = count + 1
				out_option_line( is_mission, row, dilemma_key, count, "GEN_CND_CHARACTER_TEMPLATE", template_key, "target_character_1" )
				count = count + 1
				out_option_line( is_mission, row, dilemma_key, count, "GEN_TARGET_CHARACTER", "", "target_character_1" )
			end

			if row.not_owns then
				count = count + 1
				out_option_line( is_mission, row, dilemma_key, count, "GEN_CND_NOT_OWNS", "", "target_character_1" )
			elseif row.owns then
				count = count + 1
				out_option_line( is_mission, row, dilemma_key, count, "GEN_CND_OWNS", "", "target_character_1" )
			end
			
			c_junctions = c_junctions + 1
		end
	end )
	
	logger( "" )
	logger:line( "_", string.format( "out_dilemmas_option_juntions %d", c_junctions ) )
end

function dilemmas:payloads( out_special, index )

	local function out_payload_line( is_mission, dilemma_key, index, count, choice, option, value, target )
		target = target or "default"
		value = value or ""
		
		logger:tsv( self:get_id( is_mission, index, count ), choice, dilemma_key, option, value, target )
	end
	
	local function out_dilemma_payloads( is_mission, dilemma, dilemma_key )

		local count = 0
		local c_choice = dilemma.choice or 2
		local index = dilemma.index
		local ui_text_key = self:get_ui_text_key(dilemma)

		if dilemma.gen_target then dilemma.choices.first.gen_target = true end

		for i = 0, c_choice - 1 do
			local choice = historical.index_2_choice[ i ]
			local curr_choice = dilemma.choices and dilemma.choices[ choice ] or nil
			
			if curr_choice
				and ( curr_choice.payloads
					or (choice == 'first' and dilemma.payload_text)
					or curr_choice.payload_text or curr_choice.payload_texts
					or curr_choice.ui_text
					or curr_choice.gen_target )
			then
				if curr_choice.payloads and #curr_choice.payloads > 0 then
					for _, payload in pairs( curr_choice.payloads ) do
						count = count + 1
						out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), payload.payload, payload.value, payload.target )
					end
				end

				if choice == 'first' and dilemma.payload_text then
					count = count + 1
					out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), "TEXT_DISPLAY", "LOOKUP["..ui_text_key.."]", "default" )
				elseif curr_choice.payload_text then
					local ui_choice_text_key = string.format( "%s_%s", ui_text_key, choice )
					count = count + 1
					out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), "TEXT_DISPLAY", "LOOKUP["..ui_choice_text_key.."]", "default" )
				elseif curr_choice.payload_texts then
					for idx, payload_text in ipairs( curr_choice.payload_texts ) do
						local ui_choice_idx_text_key = string.format( "%s_%s_%02d", ui_text_key, choice, idx )
						count = count + 1
						out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), "TEXT_DISPLAY", "LOOKUP["..ui_choice_idx_text_key.."]", "default" )
					end
				end

				if curr_choice.ui_text then
					count = count + 1
					out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), "TEXT_DISPLAY", "LOOKUP["..curr_choice.ui_text.."]", "default" )
				end

				if curr_choice.gen_target then
					count = count + 1
					out_payload_line( is_mission, dilemma_key, index, count, "FIRST", "LOCATED", "CHARACTER", "target_character_1" )
				end
			else
				count = count + 1
				out_payload_line( is_mission, dilemma_key, index, count, choice:upper(), "DUMMY", "", "default" )
			end
		end
		
		return count
	end

	logger:pline( "_", self.faction_key.."_dilemmas payloads" )
	logger( "" )
	
	local c_payloads = 0
	self:foreach( function( row )
		if ((out_special and row.is_special) or (not out_special and not row.is_special ))
			and (not index or row.index == index )
		then
			local dilemma_key = self:get_dilemma_key( row )
			local index = row.index
			local count = out_dilemma_payloads( row.is_mission, row, dilemma_key )

			c_payloads = c_payloads + 1
		end
	end )

	logger( "" )
	logger:line( "_", string.format( "out_dilemmas_payloads %d", c_payloads ) )
end

function dilemmas:localisations( index )

	local function out_payload_text( dilemma, dilemma_key, choice, index, payload_text )
		local ui_text_key = self:get_ui_text_key( dilemma )..((choice and "_"..choice) or "")
		
		if index and index ~= 0 then ui_text_key = string.format( "%s_%02d", ui_text_key, index ) end
		
		local payload_ui_key = "campaign_payload_ui_details_description_"..ui_text_key
		
		logger:tsv( payload_ui_key, payload_text, "FALSE" )
	end
	
	local function out_localisations( row )
		local tk_choices = { [1] = "first", [2] = "second", [3] = "third", [4] = "fourth" }
		local choice_tails = { [1] = "합류", [2] = "무시", [3] = "다른 장수", [4] = "모두 다" }
		
		local head_title = "dilemmas_localised_title_"
		local head_desc = "dilemmas_localised_description_"
		local head_choice_label = "cdir_events_dilemma_choice_details_localised_choice_label_"
		local head_choice_title = "cdir_events_dilemma_choice_details_localised_choice_title_"

		local dilemma_key = self:get_dilemma_key( row )
		local description = self:get_dilemma_description( row )
		local title = self:get_dilemma_title( row )
		
		logger:tsv( head_title..dilemma_key, title, "FALSE" )
		logger:tsv( head_desc..dilemma_key, description, "FALSE" )

		local hero_kr = row.hero_kr or ""
		local c_choice = row.choice or 2

		if row.choices then c_choice = lib.rows( row.choices ) end

		for index = 1, c_choice do
			local choice = tk_choices[ index ]
			local u_choice = choice:upper()
			local entry = row.choices and row.choices[ choice ] or nil
			
			if entry then
				local label = entry.title
				local title = entry.description
				
				logger:tsv( head_choice_label..dilemma_key..u_choice, label )
				logger:tsv( head_choice_title..dilemma_key..u_choice, title )
				
				if choice == 'first' and row.payload_text then
					out_payload_text( row, dilemma_key, nil, nil, row.payload_text )
				elseif entry.payload_text then
					out_payload_text( row, dilemma_key, choice, nil, entry.payload_text )
				elseif entry.payload_texts then
					for idx, payload_text in ipairs( entry.payload_texts ) do
						out_payload_text( row, dilemma_key, choice, idx, payload_text )
					end
				end
			else
				logger:tsv( head_choice_label..dilemma_key..u_choice, "선택("..choice..") "..hero_kr.." "..choice_tails[index] )
				logger:tsv( head_choice_title..dilemma_key..u_choice, "설명("..choice.."/"..c_choice..") "..hero_kr.." "..choice_tails[index] )
			end
		end
	end
 

	logger("")
	local count = 0

	self:foreach( function( row )
			if not index or row.index == index then
				out_localisations( row )
				count = count + 1
			end 
		end
	)

	logger("")
	logger:line( "_", string.format( "out_dilemmas_localisations %d", count ) )
end

--=====================================================================--
							-- Incidents --
--=====================================================================--

local incidents = {}

function incidents:init( events )

	self.id_prefix = events.id_prefix
	self.faction_key = events.faction_key
	self.faction_tk_key = events.faction_tk_key
	self.campaign_name = events.campaign_name
	
	self.sorted = {}

	local count = 0
	for line_key, row in pairs( events.missions ) do
		if row.incident == true or type(row.incident) == 'table' then
			if type(row.incident) == 'table' then row = row.incident end
			
			row.key = line_key
			row.hero_kr = events.missions[ line_key ].hero_kr
			row.index = events.missions[ line_key ].index
			row.desc = events.missions[ line_key ].desc
			row.is_mission = true
			row.order = 1
			
			table.insert( self.sorted, row )
			count = count + 1
		end
	end

	for en_key, row in pairs( events.join_incidents ) do
		row.key = en_key
		row.order = 2
			
		table.insert( self.sorted, row )
		count = count + 1
	end

	for key, row in pairs( events.special_incidents ) do
		row.key = key
		row.is_special = true
		row.order = 3
		
		table.insert( self.sorted, row )
		count = count + 1
	end

	logger( "incidents.sorted", lib.rows( self.sorted ), "_[:"..count )
	
	table.sort( self.sorted,
		function( a, b )
			if a.order ~= b.order then return a.order < b.order
			else
				return a.index < b.index
			end
		end )

	for _, row in pairs( self.sorted ) do
		if row.payload_text then
			local text_key = self:get_ui_text_key( row )
			table.insert( payload_ui_text_keys, text_key )
		end
	end
end

function incidents:foreach( call_func )
	for _, row in pairs( self.sorted ) do
		call_func( row )
	end
end

function incidents:get_ui_text_key( row )
	if row.is_mission == true then
		local en_key = historical.db_heroes[historical.db_heroes_kr[ row.hero_kr ]].en_key
		return self.faction_key.."_"..row.key.."_"..en_key
	elseif row.is_special == true then
		return string.format( "%s_%02d_%s", self.faction_key, row.index, row.key )
	else
		return string.format( "%s_%02d_join_%s", self.faction_key, row.index, row.key )
	end
end

function incidents:get_incident_key( row )
	return "historical_"..self:get_ui_text_key( row ).."_incident"
end

function incidents:get_incident_title( row )
	if not lib.is_empty(row.title) then
		return row.title
	end
	
	if row.is_mission == true then
		return "미션 : "..row.hero_kr
	elseif row.is_special == true then
		return "스페셜 : "..row.hero_kr
	else
		return "합류 : "..row.hero_kr
	end
end

function incidents:get_incident_desc( row, brief )
	if not brief and not lib.is_empty(row.description) then
		return row.description
	end
	
	local hero_kr = row.hero_kr and row.hero_kr or ""
	local desc = (row.desc and row.desc or "")
	
	if row.is_mission == true then
		return "미션 : "..hero_kr.." : "..desc
	elseif row.is_special == true then
		return "스페셜 : "..hero_kr.." : "..desc
	else
		return "합류 : "..hero_kr.." : "..desc
	end
end

function incidents:incidents_table()
--historical_tke_cao_cao_08_01_sima_yi_02_incident	false	사마의 02	historical_tke_cao_cao_mission_line_08_01_2
--historical_tke_cao_cao_yang_xiu_incident	false	양수	dummy_yang_xiu

	local function out_incidents_title( row )
		local incident_key = self:get_incident_key( row )
		local desc = self:get_incident_desc( row, true )
		local title = self:get_incident_title( row )
		
		logger:tsv( incident_key )
	end

	logger("")
	local count = 0
	self:foreach( function( row )
			out_incidents_title( row )
			count = count + 1
		end 
	)

	logger("")
	logger:line( "_", string.format( "incidents_table %d", count ) )
end

function incidents:get_id( is_mission, index, count )
	return string.format( "%s%s%02d%02d", self.id_prefix, (is_mission and "1" or "0"), index, count )
end

function incidents:option_juntions( out_special )
	local function out_option_line( is_mission, incident_key, index, count, option, value, target )
		
		if not index or not count then
			logger:fatal( incident_key, index, count )
		end
		
		target = target or "default"
		value = value or ""
		
		logger:tsv( self:get_id( is_mission, index, count ), incident_key, option, value, target )
	end
	
	local function out_junctions_common_headers( row, incident_key, index, template_key, gen_character )
		local is_mission = row.is_mission
		local var_chance = row.var_chance or 500
		local cnd_random = row.cnd_random or 100
		local count = 6
		
		out_option_line( is_mission, incident_key, index, 1, "CND_UNIQUE", "", "default" )
		out_option_line( is_mission, incident_key, index, 2, "CND_CAMPAIGN", self.campaign_name, "default" )
		out_option_line( is_mission, incident_key, index, 3, "GEN_CND_SELF", "", "target_faction_1" )
		out_option_line( is_mission, incident_key, index, 4, "GEN_TARGET_FACTION", "", "target_faction_1" )
		out_option_line( is_mission, incident_key, index, 5, "CND_FACTION", self.faction_tk_key, "target_faction_1" )
		out_option_line( is_mission, incident_key, index, 6, "VAR_CHANCE", var_chance, "default" )
		if cnd_random > 0 then
			out_option_line( is_mission, incident_key, index, 7, "CND_RANDOM", cnd_random, "default" )
			count = 7
		end

		if gen_character then
			out_option_line( is_mission, incident_key, index, count+1, "GEN_CND_CHARACTER_TEMPLATE", template_key, "target_character_1" )
			out_option_line( is_mission, incident_key, index, count+2, "GEN_TARGET_CHARACTER", "", "target_character_1" )
			count = count + 2
		end

		return count
	end

	logger:pline( "_", self.faction_key.."_incidents option_juntions" )
	logger( "" )
	
	local c_junctions = 0
	
	self:foreach( function( row )
		if (out_special and row.is_special) or (not out_special and not row.is_special ) then
			local incident_key = self:get_incident_key( row )
			local index = row.index
			local template_key = historical.db_heroes_kr[ row.hero_kr ]
			local gen_character = (row.gen_target) or (row.owns == true) or ( row.not_owns == true )
				
			local count = out_junctions_common_headers( row, incident_key, index, template_key, gen_character )

			if row.options and #row.options > 0 then
				for _, option in pairs( row.options ) do
					count = count + 1
					out_option_line( row, incident_key, index, count, option.option, option.value, option.target )
				end
			end

			if row.not_owns then
				count = count + 1
				out_option_line( row, incident_key, index, count, "GEN_CND_NOT_OWNS", "", "target_character_1" )
			elseif row.owns then
				count = count + 1
				out_option_line( row, incident_key, index, count, "GEN_CND_OWNS", "", "target_character_1" )
			end
			
			c_junctions = c_junctions + 1
		end
	end )
	
	logger( "" )
	logger:line( "_", string.format( "incidents_option_juntions %s %d", _c2( out_special, "special", "" ), c_junctions ) )
end

function incidents:payloads( out_special )
	
	local payload_texts = {}

	local function out_payload_line( is_mission, incident_key, index, count, payload, value, target )
		target = target or "default"
		value = value or ""
		
		logger:tsv( self:get_id( is_mission, index, count ), incident_key, payload, value, target )
	end
	
	logger( "" )
	logger:pline( "_", self.faction_key.."_incidents payloads" )
	
	local c_payloads = 0
	
	self:foreach( function( row )
		if (out_special and row.is_special) or (not out_special and not row.is_special ) then
			local incident_key = self:get_incident_key( row )
			local is_mission = row.is_mission
			local index = row.index
			local count = 0

			if row.payloads and #row.payloads > 0 then
				for _, payload in pairs( row.payloads ) do
					count = count + 1
					out_payload_line( row.is_mission, incident_key, index, count, payload.payload, payload.value, payload.target )
				end
			else
				count = count + 1
				if row.gen_target then
					out_payload_line( row.is_mission, incident_key, index, count, "LOCATED", "CHARACTER", "target_character_1" )
				else
					out_payload_line( row.is_mission, incident_key, index, count, "DUMMY", "", "default" )
				end
			end

			if row.payload_text then
				local text_key = self:get_ui_text_key(row)
				count = count + 1
				out_payload_line( is_mission, incident_key, index, count, "TEXT_DISPLAY", "LOOKUP["..text_key.."]", "default" )
			end

			c_payloads = c_payloads + 1
		end
	end )

	logger( "" )
	logger:line( "_", string.format( "out_incidents_payloads %d", c_payloads ) )
end

function incidents:localisations()

	local function out_localisations( row )
		local head_title = "incidents_localised_title_"
		local head_desc = "incidents_localised_description_"
		
		local title = self:get_incident_title( row )
		local description = self:get_incident_desc( row, false )
		local incident_key = self:get_incident_key( row )
		local hero_kr = row.hero_kr
		local ui_text_key = self:get_ui_text_key(row)

		logger:tsv( head_title..incident_key, title, "FALSE" )
		logger:tsv( head_desc..incident_key, description, "FALSE" )

		if row.payload_text then
			local payload_ui_key = "campaign_payload_ui_details_description_"..ui_text_key
			
			logger:tsv( payload_ui_key, row.payload_text, "FALSE" )
		end
	end

	logger( "" )

	local count = 0
	self:foreach( function( row )
			out_localisations( row )
			count = count + 1
		end 
	)

	logger( "" )
	logger:line( "_", string.format( "out_incidents_localisations %d", count ) )
end

-- ============================================================= --
						-- Process --
-- ============================================================= --

local curr_events = tke_liu_bei_events
local curr_events = tke_sun_jian_events
local curr_events = tke_cao_cao_events

local out_tables, out_missions, out_dilemmas, out_incidents = true, true, true, false

missions:init( curr_events )
dilemmas:init( curr_events )
incidents:init( curr_events )

if out_tables then
	missions:missions_tables()
	dilemmas:dilemmas_table()
	incidents:incidents_table()
	logger( "" )
	for _, ui_text_key in pairs( payload_ui_text_keys ) do
		logger( ui_text_key )
	end
	logger( "" )
end

if out_missions then
	missions:option_juntions()
	missions:payloads()
	missions:localisations()
end

local out_special = true

if out_dilemmas then
	--dilemmas:choice_details_table()
	--dilemmas:option_juntions( out_special )
	--dilemmas:option_juntions( not out_special )
	--dilemmas:payloads( out_special )
	--dilemmas:payloads( not out_special )
	--dilemmas:localisations()
	dilemmas:option_juntions( out_special, 91 )
	dilemmas:option_juntions( out_special, 92 )
	dilemmas:payloads( out_special, 91 )
	dilemmas:payloads( out_special, 92 )
	dilemmas:localisations( 91 )
	dilemmas:localisations( 92 )
end

if out_incidents then
	incidents:option_juntions( out_special )
	incidents:option_juntions( not out_special )
	incidents:payloads( out_special )
	incidents:payloads( not out_special )
	incidents:localisations()
end

-- ============================================================= --
					  -- Process End --
-- ============================================================= --
logger( "" )
logger:line( "=", "End" )