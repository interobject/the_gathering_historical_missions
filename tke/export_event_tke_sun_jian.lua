-- missions_localised_supplementary_text_3k_main_tutorial_mission_sun_jian_recruit_units	[[i]]군대에 부대를 모집하십시오! 군대를 좌클릭한 후 '모집' 버튼을 눌러, 동원하고자 하는 부대를 선택하십시오. 다음 턴이 시작되는 시점까지 해당 부대를 유지하고 있어야 합니다.[[/i]]

--[[
진수의 오서 '정황한장주진동감능서반정전'에서 비롯한 말로 촉한의 오호대장군, 조위의 오자양장과 같이 후대사람들에 의해 만들어진 말이다.

정보 - 손씨 3대의 비서 역할을 하며 크고 작은 전투에 참전했다.
황개 - 오랫동안 오나라에 봉사했고 적벽대전에 참전하여 공을 세웠으며 행정 능력도 탁월했다.
한당 - 손견 때부터 따랐다. 이릉대전에 참전했다. 성격이 어질고 무예가 뛰어나서 손씨 가문과 일반 병졸들에게 모두 인정받았다.
장흠 - 문과 무를 겸비한 장수이다.
주태 - 손권의 호위장으로 손권을 구출하기 위해 크고 작은 전투에서 여러번 중상을 입으며 활약했다.
진무 - 오나라의 장수로 합비 전투에서 전사했다.
동습
감녕 - 본디 유표를 섬겼으나 손권에게 귀순하여 활약하였다.
능통 - 능조의 아들이다.
서성 - 문과 무를 겸비한 장수로 조비가 쳐들어오자 가짜 성벽을 만들어서 조비를 농락했다.
반장 - 전투와 상업 진작에 뛰어난 모습을 보였다. 다만 인성질을 많이 하긴 했다.
정봉 - 오나라 후반까지 활약한 명장이다.

강동이장 (장소:손견, 장굉:손책) -- 장소가 먼저이나, 삼탈워에는 장굉이 초반 FA...
	-내치(內治)의 두 기둥 ‘장소(張昭)와 장굉(張紘)’-
  
   원술에게 옥새를 맡기고 군사 3천을 얻어 강동으로 향하던 손책은 소식을 듣고 찾아온 의형제이며 옛 친구인 주유를 만나게 되었다. 두 사람이 함께 술을 마시며 그간의 회포를 푸는데, 문득 주유가 ‘형님께서 큰일을 하시려면 강동의 이장(二張)부터 찾아야 할 것입니다.’하고 말했다.

    ‘이장이라니, 누구누구인가?’ 하고 손책이 물었다.
   “한 사람은 장소(張昭) 자는 자포(子布)이고, 또 한 사람은 장굉(張紘) 자는 자강(子綱)입니다. 둘 다 배움이 깊고 지략이 뛰어나 능히 나라를 평안케 할 준재들입니다. 지금 난리를 피해 숨어 살고 있습니다.”

손견 191년 황조의 기습으로 사망
손견 - 3k_main_template_historical_sun_jian_hero_metal

손책(孫策) 	- 장사환왕(長沙桓王) 소패왕 194년 원술 휘하. 200년 사망 (허공 - 허소에게 사냥 중 중상을입고 병중 사망 - 우길?)
			- 194~5년 승계
손책 - 3k_main_template_historical_sun_ce_hero_fire
3k_main_historical_sun_death_of_sun_ce_npc_incident -- NPC 0:200 사망 이벤트, 팩션 리더

주유 - 수춘, 서현, 죽마고우, 바닐라 (2:197) 스폰 이벤트 - 유니크 아머로 체크하니 PC에서 미리 스폰해도 됨

강동이교 (여남 환성, 교공의 두 딸 199년 약탈혼)
3k_main_template_historical_lady_da_qiao_hero_earth
3k_main_template_historical_lady_xiao_qiao_hero_metal

3k_main_historical_sun_qiao_sisters_pc_incident - 스폰 이벤트  -- 중복 가능
	-- 1:197년 플레이어 팩션 - 열후, 손책이 리더, 주유 보유

감녕(175) 유언->유장(194년) 때 유표. 유표 -> 황조(?) -> 손권(200년 집권 이후) -> 황조 복수(208년)
3k_main_char_historical_gan_ning_spawns_incident - 2:195 - 플레이어 손견 세력일 때 스폰 - 손견 유표 세력 존재 조건?

태사자(공융 잔존 세력 단양 항거 후 귀순)
여몽(178:196), 반장(182), 육손(183:201), 능통(189), 정봉(215) - 연의에선 손권 시절 등용

강릉(남군), 적벽(장사), 심양(여강), 무호(신도), 건업(단양), 강도(광릉)

]]

local tke_sun_jian_events = {

	faction_key = "tke_sun_jian",
	faction_tk_key = "3k_main_faction_sun_jian",
	historical_mod_id = "41",
	campaign_id = "1",
	campaign_name = "3k_main_campaign_map",
	faction_id = "03",
	id_prefix = "41103",
	
	missions = {
		-- 한당, 주치는 스타팅으로 합류
		-- 손견 시절 영입 - 한당, 주치 
		['01_01'] = { index = 11, hero_kr = "한당", desc = "점령 적벽(장사)",
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 3k_main_changsha_resource_1 - 적벽(장사)
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "장강으로 진출",
			description = "장강은 아군의 교두보입니다. 장강 수역을 지배하여 강동으로 진출해야 합니다. 그러기 위해서는 항구가 있는 정착지를 확보해야 합니다.",
			payload_text = "창업 공신이 한당이 합류합니다",
			objective_text = "[[col:flavour]]강릉[[/col]] 또는 [[col:flavour]]적벽[[/col]] 항구을 점령하십시오",
			dilemma = {
				title = "창업 공신",
				description = "이자는 성실하며, 활쏘기와 말타기에 능숙하고 힘이 세니, 아군이 창업하는 고난 속을 함께 뚫고나갈 꼭 필요한 인물이다.",
				choices = {
					first = { title = "그를 등용시킨다", description = "궂은 일을 마다하지 않는 숨은 영웅이 될 것이다." },
					second = { title = "지나친다", description = "불필요한 자다." },
				},
				payload_text = "오국 창업 사대공신 한당이 합류합니다.",
			},
		},
		['01_02'] = { index = 12, hero_kr = "주치", desc = "장강 무역로 개설",
			mission_type = "HAVE_DIPLOMATIC_RELATIONSHIP",
			objectives = {
				--{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_sun_jian_hero_metal", target = "mission_objective" },
				--{ option = "GEN_TARGET_CHARACTER", value = "", target = "mission_objective" },
				{ option = "VAR_OBJECTIVE_AMOUNT_INT", value = "1", target = "mission_objective" },
				{ option = "VAR_OBJECTIVE_TREATY_COMPONENTS", value = "3k_main_objective_treaties_trade", target = "mission_objective" },
			},
			title = "무역로 개설",
			description = "장강 항구를 점령하여 강북과 무역로를 개설할 수 있게 되었습니다. 무역을 시작하여 아군 세력의 번영을 이끌어주십시오",
			payload_text = "창업 공신 주치가 합류합니다.",
			supplementary_text = "외교 패널에서 [[col:dark_r]]빠른 협상[[/col]]으로 무역 가능한 세력을 검색하십시오. 장강의 끝에 있는 세력이라도 무역을 시작할 수 있습니다.",
			dilemma = {
				title = "주치의 합류",
				description = "주치는 주군을 도와 창업하여 장사, 영릉, 계양 등 형주 남군 지역을 점유하며, 오국의 기초를 세워나갈 믿음직한 충복이 될 것입니다.",
				choices = {
					first = { title = "등용시킨다", description = "창업 초기 힘든 시기를 함께 극복합니다." },
					second = { title = "지나친다", description = "지금은 필요치 않다" },
				},
				payload_text = "주치가 합류합니다.",
			},
		},
		-- 손견 사망 인시던트
		-- 손책 시절 영입, 손책 성인 후 - 주유, 장소, 장굉 - 인시던트 : 여범, 장흠
		['02_01'] = { index = 21, hero_kr = "주유", desc = "손책으로 전투 승리 : 주유 합류",
			-- 194~6년
			-- 3k_main_char_historical_zhou_yu_spawns_incident
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			title = "군사를 영입하다",
			description = "손책은 수춘에서 죽마고우 주유를 만나 깊은 교류를 유지하고 있습니다. 성인이된 손책은 주유를 뛰어난 책사로 주군께 영입을 추천하고 있습니다. 이제 주유를 만나 아군에 합류시킬지 결정할 때가 왔습니다.",
			payload_text = "손책의 죽마고우를 만납니다.",
			objective_text = "[[col:magic]]손책[[/col]]으로 [[col:flavour]]전투[[/col]]에서 승리하십시오",
			incident = {
				title = "주유의 합류",
				description = "주유는 재능이 넘치고 충직하며 외모까지 출중한 인물로, 어린 시절부터 손책과 친구였습니다. 이 두 사람들은 어려서부터 떼려야 뗄 수 없는 사이가 되었으며, 서로의 집에서 많은 시간을 보내는 등 가족들까지도 서로 존중하는 사이가 되었습니다. 주유의 음악적 능력은 타의 추종을 불허하며, 이는 그의 명석함과 기품을 나타내는 증거입니다.",
				payload_text = "주유를 군사로 영입합니다.",
				gen_target = true,
			},
		},
		['02_02'] = { index = 22, hero_kr = "주태", desc = "주태와 장흠의 합류 : 항구 정착지 3 점령",
			-- 주태 : 01 손권 어린 시절 주태를 따르다 이벤트
			-- 주태 : 02 followup 손권 12군데 상처를 입으며 손권 구출 이벤트
			-- 강릉(남군), 적벽(장사), 심양(여강), 무호(신도), 건업(단양), 강도(광릉)
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "장강을 지배하다",
			description = "장강에는 수적들이 활동하고 있습니다. 그들 중에 주군이 영입할만한 인재가 있다는 소문입니다. 장강 항구에서 그들을 만나볼 수 있을 것입니다",
			payload_text = "수적들 중에 인재를 찾아봅니다.",
			objective_text = "다음 항구 정착지 중 [[col:dark_r]]3 지역[[/col]]을 점령하십시오.",
			dilemma = {
				title = "주태와 장흠이 세력에 합류합니다",
				description = "도망치는 적들 뒤로, 적 진지에서 연기가 피어오르는 것이 보입니다. 바로 두 명의 위대한 전사, 주태와 장흠이 불을 놓은 것입니다. 해적으로 살던 그들은 당신의 명성을 오래 전 부터 들어왔고, 당신에게 거두어 줄 것을 청합니다.",
				choices = {
					first = { title = "그를 등용시킨다", description = "주태의 흉터는 그가 얼마나 용맹한지를 보여줍니다." },
					second = { title = "지나친다", description = "흉악한 자로다." },
				},
				payload_text = "주태를 아군에 영입합니다.",
			},
		},
		-- 주유 합류 라인 -- 강동이장, 강동이교 -- MTU와 충돌 회피 필요
		['03_01'] = { index = 31, hero_kr = "장굉", desc = "강동이장 : 건업 점령",
			-- 3k_main_jianye_capital
			-- 주유 합류 후 미션 발동
			-- 손책이 영입을 위해 광릉의 장굉을 방문 195년
			-- 건업 천도를 손권에게 주장 - 천도 후 사망
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 3k_main_changsha_resource_1 - 적벽(장사)
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "강동에 진출하다",
			description = "강동에는 황건의 난을 피해 중원과 하북에서 피난온 많은 인재들이 있습니다. 그들은 강동에 주인이 나타나 그들을 이끌어주기를 바라고 있습니다. 주군, 강동으로 진출하여 인재를 규합하십시오.",
			payload_text = "강동의 인재들이 합류합니다.",
			objective_text = "[[col:flavour]]건업[[/col]]을 [[col:magic]]주유[[/col]]와 함께 점령하십시오.",
			dilemma = {
				title = "장소와 장굉의 합류",
				description = "주유는 강동에 두 명의 장씨 인재가 있다고 추천합니다. 이자들은 내정과 외교에 탁월한 재주가 있으며, 강동에 진출한 아군의 기반을 튼튼히 해줄 것입니다.",
				choices = {
					first = { title = "등용시킨다", description = "장소와 장굉을 영입합니다" },
					second = { title = "지나친다", description = "아군에 자리가 없다" },
				},
				payload_text = "장소와 장굉을 영입합니다.",
			},
		},
		['03_02'] = { index = 32, hero_kr = "대교", desc = "강동이교 합류 : 합비(여남) 점령",
			-- 정사 199년
			-- 대교, 소교 등장 스페셜 인시던트로 트리거 -- 합비 주변 정착지 점령시 발동시켜야...
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 합비(여강)
				--{ option = "VAR_OBJECTIVE_NUM_REGIONS", value = "7" },
				--{ option = "VAR_OBJECTIVE_REGIONS", value = "3k_main_lujiang_capital" },
				--{ option = "GEN_CND_REGION", value = "3k_main_lujiang_capital" },
				--{ option = "GEN_TARGET_REGION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" },
			},
			title = "강동이교의 합류",
			description = "천하가인으로 소문난 두 강동이교는 합비의 교공의 자식들입니다. 손책과 주유가 합비로 진격하면, 죽마고우이자 쌍절이 두 영웅이 절세가인들을 만날 수 있을 것입니다.",
			payload_text = "대교 소교의 아군 합류 ",
			objective_text = "[[col:flavour]]합비[[/col]]을 [[col:magic]]손책[[/col]]과 [[col:magic]]주유[[/col]]로 점령하십시오.",
			incident = {
				title = "강동이교의 합류",
				description = "손책과 주유는 합비에 있는 강동이교와 만남을 가지고, 강동이교는 소패왕 손책의 위엄과 주유의 아름다운 음율에 빠저 함께 난세를 해처나갈 것을 약속했습니다.",
				options = {
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_sun_ce_hero_fire", target = "target_character_1" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_zhou_yu_hero_water", target = "target_character_2" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_2" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_da_qiao_hero_earth", target = "target_character_3" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_3" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_xiao_qiao_hero_metal", target = "target_character_4" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_4" },
				},
				payloads = {
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_1" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_2" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_3" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_4" },
					{ payload = "CAMPAIGN_PAYLOAD_RECORD", value = "PAYLOAD[3k_main_campaign_payload_character_move_to_faction];FACTION;SOURCE_CHARACTER[target_character_3]", target = "target_faction_1" },
					{ payload = "CAMPAIGN_PAYLOAD_RECORD", value = "PAYLOAD[3k_main_campaign_payload_character_move_to_faction];FACTION;SOURCE_CHARACTER[target_character_4]", target = "target_faction_1" },
					{ payload = "RELATIONSHIP_TRIGGERS", value = "FRIENDSHIP_TARGET[target_character_1];TRIGGER_SET_RECORD[3k_main_relationship_trigger_set_event_positive_dilemma_large]", target = "target_character_3" },
					{ payload = "RELATIONSHIP_TRIGGERS", value = "FRIENDSHIP_TARGET[target_character_2];TRIGGER_SET_RECORD[3k_main_relationship_trigger_set_event_positive_dilemma_large]", target = "target_character_4" },
				},
			},
		},
		['03_03'] = { index = 33, hero_kr = "소교", desc = "강동이교 약탈혼 : 대교/소교와 전투 승리",
			-- 여강 유훈 계략으로 빈집털이, 교공의 두 딸 (199년), 첩으로 약탈혼
			-- 여강 합비(수도) 주변 도시
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			title = "손책과 대교 주유와 소교 인연을 맺다",
			description = "손책과 주유는 대교와 소교가 있는 합비를 점령하고, 강동이교와 조우했습니다. 그들간에 친밀도를 높여 인연을 성사시키십시오.",
			payload_text = "손책과 대교, 주유와소교 혼인",
			objective_text = "[[col:magic]]손책[[/col]]과 [[col:magic]]대교[[/col]] 또는 [[col:flavour]]주유[[/col]]와 [[col:magic]]소교[[/col]]가 함께 전투에서 승리하십시오.",
			incident = {
				title = "손책과 주유 강동이교와 연을 맺다",
				description = "손책은 강동이교의 언니 대교와 주유는 동생 소교와 각각 부부의 인연을 맺었습니다. 젤세영웅들과 젤서가인들간의 동반 인연은 천하에 소문이 퍼져나갔습니다.",
				options = {
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_sun_ce_hero_fire", target = "target_character_1" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_zhou_yu_hero_water", target = "target_character_2" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_2" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_da_qiao_hero_earth", target = "target_character_3" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_3" },
					{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_xiao_qiao_hero_metal", target = "target_character_4" },
					{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_4" },
				},
				payloads = {
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_1" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_2" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_3" },
					{ payload = "LOCATE", value = "CHARACTER", target = "target_character_4" },
					{ payload = "CAMPAIGN_PAYLOAD_RECORD", value = "PAYLOAD[3k_main_campaign_payload_marry];CHARACTER;SOURCE_CHARACTER[target_character_1]", target = "target_character_3" },
					{ payload = "CAMPAIGN_PAYLOAD_RECORD", value = "PAYLOAD[3k_main_campaign_payload_marry];CHARACTER;SOURCE_CHARACTER[target_character_2]", target = "target_character_4" },
				},
			},
		},
		-- 손권 합류 라인 -- 여몽, 육손 -- 자동 스폰으로 성인화?
		-- 손인 합류 라인 -- 보연사?
	},
	
	join_dilemmas = {
		['taishi_ci'] = { index = 01, hero_kr = "태사자", desc = "태사자 소속 세력 멸망", -- 기본 공융
			title = "용건명궁",
			description = "용모가 뛰어나고 체격좋으며 명궁으로 유명한 북해 출신 태사자가 강남 손씨 세력에 가담하고자 합니다.",
			choices = { 
				first = { title = "그를 찾는다", description = "태사자을 받아드린다" },
				second = { title = "무시한다", description = "지금은 태사자가 필요하지않다" },
			},
			payload_text = "오나라의 명장이 될 것입니다",
			gen_target = true,
		},
		['gan_ning'] = { index = 02, hero_kr = "감녕", desc = "감녕 소속 세력 멸망", -- 기본 유표, 선호 손권
			title = "금선유협",
			-- description = "장강에서 금빛 돗을 단 유협으로 유명한 감녕은 소속한 세력이 멸망하고나자 강남으로 돌아오고자 합니다.",
			description = "당신은 화려하게 치장한 전사 한 무리가 다가오는 것을 발견합니다. 성미가 사나워 보이는 한 남성이 한 걸음 앞으로 나와 자신은 한 때 해적으로 활동하던 감녕이라고 밝히고, 지금은 자신을 부와 성공의 길로 이끌어 줄 섬길 주군을 찾는 중이라고 말합니다.",
			choices = { 
				first = { title = "반갑게 받아드린다", description = "감녕이 합류합니다." },
				second = { title = "무시한다", description = "지금은 필요없다" },
			},
			payload_text = "선대의 원한을 복수할 기회가 왔습니다.",
			gen_target = true,
		},
	},

	-- 간단한 조건의 인시던트로 스크립트에서 조건을 체크한다.
	-- regions 지역 숫자, fame_rank 명성, occupy = 점령지 점령하면 트리거
	join_incidents = {
		['zu_mao'] = { index = 01, hero_kr = "조무", desc = "점령 3현",
				-- 스타팅 시 TUP 온일 때 리스너 등록
				title = "붉은 두건",
				description = "손견이 전투 중 위기에 처하자 한 명의 장수가 나타나, 손견의 붉은 두건을 자기 머리에 두르고 손견인 척 위장하고 적을 유인했다. 이에 손견은 위기를 탈출하여 무사할 수 있었다.",
				payload_text = "조무는 창업 4대공신이 됩니다.",
				gen_target = true
			},
		['lu_fan'] = { index = 02, hero_kr = "여범", desc = "손책 정착지 전투 승리",	-- 초기 FA
				-- 손책 성인 -> 주유 합류 후에 리스너 등록 - historical_tke_sun_jian_02_join_lu_fan_incident
				title = "민병대 출현",
				description = "손책이 전투를 시작하자, 어디선가 한 장수가 100여명의 민병대을 이끌고 도와주러 나타났습니다. 준수한 용모에 영리한 눈빛을 한 이 장수는 용맹하게 아군과 함께 싸웠습니다.",
				payload_text = "여범이 아군에 합류합니다.",
				gen_target = true
			},
	},
	
	-- 자동화 할 수없거나 수동으로 조정해야하는 특별한 인시던트와 딜레마
	special_incidents = {
		-- 손책, 주유 - 결의 형제
		['sun_ce_zhou_yu_oathsworn'] = { index = 61, hero_kr = "손책", desc = "손책과 주유 결의 형제",
			-- 주유 합류 후 ??? 같은 군대로 전투 2회 - 스크립트로 체크
			title = "소패왕과 선율의 책사",
			description = "죽마고우인 손책과 주유는 함께 이 난세를 평정하고 천하를 도모하자며 의기투합하여, 함께 태어나지는 못했어도 같은 날 죽을 맹세를 하며 결의형제의 인연을 맺었습니다.",
		},
		-- 손책, 주유 - 강동이교 인연 예언
		['yu_ji_prophecy_da_qiao'] = { index = 62, hero_kr = "우길", desc = "우길의 등장 : 강동이교 예언",
			-- 결의 형제 후 -- 턴 스타트 랜덤 35
			title = "우길의 예언",
			description = "손책과 주유가 군비를 점검하러 가는 길에 자신을 '우길'이라고 소개하는 노인을 만났습니다. 그 노인은 말합니다.\\\\n\\\\n\"여강에 당신들과 잘 어울리는 한쌍의 가인이 있어 당신들과 좋은 배필이 될 것이니...\"\\\\n\\\\n우길은 말만 남기고 홀연히 사라집니다.",
			cnd_random = 35,
			var_chance = 500,
			options = {
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_sun_ce_hero_fire", target = "target_character_1" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_zhou_yu_hero_water", target = "target_character_2" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_2" },
				{ option = "GEN_CND_OWNS", value = "", target = "target_character_1" },
				{ option = "GEN_CND_OWNS", value = "", target = "target_character_2" },
			},
			payloads = {
				{ payload = "EFFECT_BUNDLE", value = "KEY[3k_main_payload_faction_character_omen_satisfaction_increase];DURATION[5]", target = "default" },
			},
		},
		-- 손책, 주유 - 대교.소교 결혼 이벤트
		['da_qiao_appears'] = { index = 63, hero_kr = "대교", desc = "합비 주변 점령 시 여강의 강동이교 등장",
			-- 대교, 소교 출현 -- 합비 주변 지역 점령
			--[[
		      neighbor = 심양
			  neighbor = 서양
			  neighbor = 여음
			  neighbor = 서현
			  neighbor = 수춘
			  neighbor = 거소
			  neighbor = 서릉
			  neighbor = 고시
		  ]]--
			-- 먼저 합비 점령 세력에 스폰하고 인시던트를 발생시킨다. 두 명다 LOCATE CHARACTER 가능하게 반수동으로 인시던트 제작
			title = "합비 교공의 강동이교",
			description = "여강에 있는 교공의 두 딸이 강동이교라 불리우는 국색을 갖춘 재인들이라는 소문이 자자합니다. 죽마고우 사이인 손책과 주유는 이 소문을 듣고, 자기들과 좋은 짝이 될 것이라며 즐거워 합니다.",
			-- 대교, 소교를 합비(여강) 소유 세력에 스폰
			-- 합비 점령하면 손견 세력으로 합류하는 미션 트리거
			payload_text = "강동이교 대교와 소교가 합비 지역에 출현했습니다.",
			options = {
				{ option = "GEN_CND_OWNS_REGION", value = "3k_main_lujiang_capital", target = "target_faction_2" },
				{ option = "GEN_TARGET_FACTION", value = "", target = "target_faction_2" },
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_da_qiao_hero_earth", target = "target_character_3" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_3" },
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_lady_xiao_qiao_hero_metal", target = "target_character_4" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_4" },
				--{ option = "", value = "", target = "" },
			},
			payloads = {
				{ payload = "LOCATED", value = "FACTION", target = "target_faction_2" },
				{ payload = "LOCATED", value = "CHARACTER", target = "target_character_3" },
				{ payload = "LOCATED", value = "CHARACTER", target = "target_character_4" },
			}
		},
		-- 주태 손권 구출하기
	},

	special_dilemmas = {
		-- 손책 성인 후 손견 사망 딜레마?
		-- 손권 승계 딜레마?
	},
}

return tke_sun_jian_events