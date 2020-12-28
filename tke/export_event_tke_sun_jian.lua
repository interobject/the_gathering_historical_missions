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

손견 191년 황조의 기습으로 사망
장사환왕(長沙桓王) 소패왕 손책(孫策) 194년 원술 휘하. 200년 사망 (허공 - 허소에게 사냥 중 중상을입고 병중 사망 - 우길?)

주유 - 수춘, 서현, 죽마고우

강동이교 (여남 환성, 교공의 두 딸 199년 약탈혼)

감녕(175) 유언->유장(194년) 때 유표. 유표 -> 황조(?) -> 손권(200년 집권 이후) -> 황조 복수(208년)
3k_main_char_historical_gan_ning_spawns_incident - 2:195 - 플레이어 손견 세력일 때 스폰

태사자(공융 잔존 세력 단양 항거 후 귀순)
여몽(178:196), 반장(182), 육손(183:201), 능통(189), 정봉(215) - 연의에선 손권 시절 등용
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
		-- 손견 시절 영입 - 한당, 주치, 주태, 장소
		['01_01'] = { index = 11, hero_kr = "주태", desc = "점령 장사항",
			-- 주태 : 01 손권 어린 시절 주태를 따르다 이벤트
			-- 주태 : 02 followup 손권 12군데 상처를 입으며 손권 구출 이벤트
			mission_type = "OWN_N_REGIONS_INCLUDING",
			objectives = {
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "몸에 난 상처마다 술 한잔씩",
			description = "주태의 강맹한 몸에 난 상처마다 술 한 잔씩 마신다면 취하지 않고는 못배길 정도입니다.",
			payload_text = "주태를 만나봅니다",
			dilemma = {
				title = "주태의 영입",
				description = "주태 딜레마 설명",
				choices = {
					first = { title = "그를 등용시킨다", description = "주태의 몸에 난 상처는 그가 얼마나 용맹한지를 보여줍니다." },
					second = { title = "지나친다", description = "흉악한 자로다." },
				},
				payload_text = "주태를 영입합니다.",
			},
		},
		['01_02'] = { index = 12, hero_kr = "장소", desc = "무역로 1개",
			mission_type = "HAVE_DIPLOMATIC_RELATIONSHIP",
			objectives = {
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_sun_jian_hero_metal", target = "mission_objective" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "mission_objective" },
				{ option = "VAR_OBJECTIVE_AMOUNT_INT", value = "1", target = "mission_objective" },
				{ option = "VAR_OBJECTIVE_TREATY_COMPONENTS", value = "3k_main_objective_treaties_trade", target = "mission_objective" },
			},
			title = "무역로 개설",
			description = "장사항을 점령하여 강북과 무역로를 개설할 수 있게 되었습니다. 무역을 시작하십시오.",
			payload_text = "장소가 합류합니다.",
			dilemma = {
				title = "장소의 합류",
				description = "장소 딜레마 설명",
				choices = {
					first = { title = "등용시킨다", description = "장소 딜레마 설명." },
					second = { title = "지나친다", description = "미정" },
				},
				payload_text = "장소를 영입합니다.",
			},
		},
		-- 손책 시절 영입, 손책 성인 후 - 주유, 장굉, 여범, 장흠
		['02_01'] = { index = 21, hero_kr = "주유", desc = "손책으로 전투 승리 : 주유 합류",
		-- 3k_main_char_historical_zhou_yu_spawns_incident
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			title = "선율의 책사",
			description = "손책은 수춘에서 죽마고우 주유를 만나 깊은 교류를 유지하고 있습니다. 성인이된 손책은 주유를 뛰어난 책사로 주군께 영입을 추천하고 있습니다. 이제 주유를 만나 아군에 합류시킬지 결정할 때가 왔습니다.",
			payload_text = "손책의 죽마고우를 만납니다.",
			dilemma = {
				title = "주유의 합류",
				description = "주유는 재능이 넘치고 충직하며 외모까지 출중한 인물로, 어린 시절부터 손책과 친구였습니다. 이 두 사람들은 어려서부터 떼려야 뗄 수 없는 사이가 되었으며, 서로의 집에서 많은 시간을 보내는 등 가족들까지도 서로 존중하는 사이가 되었습니다. 주유의 음악적 능력은 타의 추종을 불허하며, 이는 그의 명석함과 기품을 나타내는 증거입니다.",
				choices = {
					first = { title = "그를 등용시킨다", description = "주유의 범상치 않은 인상과 재능에 감탄합니다." },
					second = { title = "지나친다", description = "아직 때가 되지 않았다." },
				},
				payload_text = "주유를 영입합니다.",
			},
		},
		['02_02'] = { index = 22, hero_kr = "장굉", desc = "건업 점령",
			-- 3k_main_jianye_capital
			-- 손책이 영입을 위해 광릉의 장굉을 방문 195년
			-- 건업 천도를 손권에게 주장 - 천도 후 사망
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "몸에 난 상처마다 술 한잔씩",
			description = "주태의 강맹한 몸에 난 상처마다 술 한 잔씩 마신다면 취하지 않고는 못배길 정도입니다.",
			payload_text = "주태를 만나봅니다",
			dilemma = {
				title = "주태의 영입",
				description = "주태 딜레마 설명",
				choices = {
					first = { title = "그를 등용시킨다", description = "주태의 몸에 난 상처는 그가 얼마나 용맹한지를 보여줍니다." },
					second = { title = "지나친다", description = "흉악한 자로다." },
				},
				payload_text = "주태를 영입합니다.",
			},
		},
		['02_03'] = { index = 23, hero_kr = "여범", desc = "건업 점령",
			-- 3k_main_historical_liu_xu_shu_joins_incident
			mission_type = "OWN_N_PROVINCES",
			objectives = {
				{ option = "VAR_OBJECTIVE_NUM_PROVINCES", value = "1" },
			},
			title = "몸에 난 상처마다 술 한잔씩",
			description = "주태의 강맹한 몸에 난 상처마다 술 한 잔씩 마신다면 취하지 않고는 못배길 정도입니다.",
			payload_text = "주태를 만나봅니다",
			dilemma = {
				title = "주태의 영입",
				description = "주태 딜레마 설명",
				choices = {
					first = { title = "그를 등용시킨다", description = "주태의 몸에 난 상처는 그가 얼마나 용맹한지를 보여줍니다." },
					second = { title = "지나친다", description = "흉악한 자로다." },
				},
				payload_text = "주태를 영입합니다.",
			},
		},
		-- 주유 합류 라인 -- 강동 이교(대교, 소교) -- MTU와 충돌 회피 필요
		['03_01'] = { index = 31, hero_kr = "대교", desc = "합비(여남) 점령 : 대교 소교 합류 미션",
			-- 199년 즈음
			-- 대교, 소교 등장 스페셜 인시던트로 트리거
			mission_type = "OWN_N_REGIONS_INCLUDING",
			objectives = {	-- 합비(여강)
				--{ option = "VAR_OBJECTIVE_NUM_REGIONS", value = "7" },
				--{ option = "VAR_OBJECTIVE_REGIONS", value = "3k_main_lujiang_capital" },
				--{ option = "GEN_CND_REGION", value = "3k_main_lujiang_capital" },
				--{ option = "GEN_TARGET_REGION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" },
			},
			title = "대교 소교 등장 미션",
			description = "대교 소교 등장 미션",
			payload_text = "대교 소교 등장 미션",
			incident = {
				title = "강동이교 등장",
				description = "설명",
			},
		},
		['03_02'] = { index = 32, hero_kr = "소교", desc = "강동이교 혼인 미션",
			-- 여강 유훈 계략으로 빈집털이, 교공의 두 딸 (199년), 첩으로 약탈혼
			-- 여강 합비(수도), 심양, 서현 중 택 1
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			title = "손책:대교 주유:소교 혼인 미션",
			description = "손책:대교 주유:소교 혼인 미션",
			payload_text = "손책:대교 주유:소교 혼인 미션",
			incident = {
				title = "손책과 주유 강동이교와 연을 맺다",
				description = "설명",
			},
		},
		-- 손권 합류 라인 -- 여몽, 육손 -- 자동 스폰으로 성인화?
		-- 손인 합류 라인 -- 보연사?
	},
	
	join_dilemmas = {
		['taishi_ci'] = { index = 01, hero_kr = "태사자", desc = "태사자 소속 세력 멸망", -- 기본 공융
			title = "용건명궁",
			description = "용모가 뛰어나고 체격좋으며 명궁으로 유명한 태사자가 강남 손씨 세력에 가담하고자 합니다.",
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
		['lu_fan'] = { index = 01, hero_kr = "여범", desc = "점령 3현", regions = 3 },	-- 초기 FA
	},
	
	-- 자동화 할 수없거나 수동으로 조정해야하는 특별한 인시던트와 딜레마
	special_incidents = {
		-- 주태 손권 구출하기
		-- 손책, 주유 - 결의 형제
		-- 손책, 주유 - 대교.소교 결혼 이벤트
		['da_qiao_appear'] = { index = 61, hero_kr = "대교", desc = "파양 점령 후 여강의 강동이교 소문",
			-- 대교, 소교 출현 -- 파양군 점령
			-- 먼저 스폰하고 인시던트를 발생시킨다. 두 명다 LOCATE CHARACTER 가능하게 반수동으로 인시던트 제작
			title = "여강의 강동이교",
			description = "여강에 있는 교공의 두 딸이 강동이교라 불리우는 국색을 갖춘 재인들이라는 소문을 들었습니다. 죽마고우 사이인 손책과 주유의 좋은 짝이 될 것 같습니다.",
			-- 대교, 소교를 합비(여강) 소유 세력에 스폰
			-- 합비 점령하면 손견 세력으로 합류
		},
	},

	special_dilemmas = {
		-- 손책 성인 후 손견 사망 딜레마?
		-- 손권 승계 딜레마?
	},
}

return tke_sun_jian_events