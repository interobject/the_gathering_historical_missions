--[[
mission{
	key historical_tke_cao_cao_mission_line_03_01;
	issuer 3k_main_victory_objective_issuer;
	primary_objectives_and_payload
	{
		objective{
			type CONTROL_N_REGIONS_INCLUDING;
			total 7;
			region 3k_main_yingchuan_capital;
			region 3k_main_runan_capital;
			region 3k_main_yangzhou_capital;
			exclude_allies;
		}
		payload{
			effect_bundle
			{
				bundle_key 3k_main_historical_mission_payload_01;turns 5;
			}
			text_display{lookup tke_cao_cao_mission_line_03_01;}
		}
	}
}
	HAVE_DIPLOMATIC_RELATIONSHIP
    "3k_dlc04_progression_cao_cao_chen_03_mission",                     -- mission key
    "SCRIPTED",                      -- objective type
    {
		"script_key cao_cao_manipulated",
		"override_text mission_text_text_3k_dlc04_scripted_manipulate_factions"
		
]]

local tke_cao_cao_events = {

	faction_key = "tke_cao_cao",
	faction_tk_key = "3k_main_faction_cao_cao",
	historical_mod_id = "41",
	campaign_id = "1",
	campaign_name = "3k_main_campaign_map",
	faction_id = "01",
	id_prefix = "41101",

	missions = { -- 바닐라 이벤트 트리거 방지 필요
		['01_01'] = { index = 11, hero_kr = "악진", desc = "유닛 18",
			-- cao_yue_jin
			mission_type = "OWN_N_UNITS",
			objectives = {
				{ option = "VAR_OBJECTIVE_AMOUNT_INT", value = "18" },
			},
			payloads = {
				-- default => TEXT_DISPLAY LOOKUP[tke_cao_cao_mission_line_01_01]
				{ status = "SUCCESS", option = "EFFECT_BUNDLE", value = "KEY[3k_main_payload_faction_force_replenishment_increase];DURATION[5]", target = "target_faction_1" },
			},
			title = "군사를 모아가다",
			description = "아군에 지역 기반이 든든하고, 모병을 잘하는 아장이 있다는 소식입니다. 모병을 계속 추진하면 그를 만나게 될 것입니다.",
			payload_text = "모병의 달인을 만날 수 있습니다.",
			dilemma = {
				title = "모병의 달인",
				description = "함께 숙영을 하던 젊은 군관, 악진은 자신의 지위에 걸맞지 않는 엄청난 일을 해냈습니다. 그는 당신에게 알리지도 않은 채 자신의 고향에서 1,000명이나 되는 장정들을 새로 징병하여 당신의 대의에 동참시켰습니다.",
				choices = {
					first = { title = "그를 승진시킨다", description = "이런 적극적인 행동은 칭찬받아 마땅합니다!" },
					second = { title = "내버려둔다", description = "이런 행동은 당신이 부하들에게서 전혀 기대하지 않았던 행동입니다. 지금의 지위로 있게 내버려 둡니다." },
				},
				payload_text = "악진이 장수로 승진해서 아군에 합류합니다",
			},
		},
		['01_02'] = { index = 12, hero_kr = "전위", desc = "승리 5",
			mission_type = "DEFEAT_N_ARMIES_OF_FACTION",
			objectives = {
				{ option = "VAR_OBJECTIVE_NUM_ARMIES", value = "5" },
				{ option = "VAR_OBJECTIVE_SUBCULTURE", value = "3k_main_chinese" },
			},
			title = "전투를 계속하다",
			description = "용맹하고 날쎈 장수들이 섬길만한 주군을 찾아 강호를 떠돌고 있습니다. 전투에서 성과를 올려 위명을 알리면, 그들이 주군을 찾아올 것 입니다.",
			payload_text = "소문이 자자한 용사를 만날 수 있습니다",
			dilemma = {
				title = "필적할 수 없는 짐승",
				description = "전위는 드높은 충성심과 용력으로 유명합니다. 전해지는 바에 따르면 언젠가 거대한 군기가 바람에 밀려 쓰러지자, 열 명의 장정이 달려들어도 쩔쩔매던 것을 전위 혼자 한 손으로 손쉽게 일으켜 세우면서 큰 명성을 얻었다고 합니다.",
				choices = {
					first = { title = "호위를 맡긴다", description = "그의 근력은 호걸이라 부름이 마땅합니다. 당신은 전위를 호위로 삼았습니다." },
					second = { title = "내버려둔다", description = "지금은 필요치않다" },
				},
				payload_text = "전위가 합류하여 주군을 호위하게 됩니다.",
			},
		},
		['01_03'] = { index = 13, hero_kr = "허저", desc = "승리 10",
			mission_type = "DEFEAT_N_ARMIES_OF_FACTION",
			objectives = {
				{ option = "VAR_OBJECTIVE_NUM_ARMIES", value = "10" },
				{ option = "VAR_OBJECTIVE_SUBCULTURE", value = "3k_main_chinese" },
			},
			title = "승리를 계속하다",
			description = "아군의 진격이 계속되어 천하의 이목이 주군께 쏠리고 있습니다. 양질의 장수를 얻기위해 계속 전투에서 승리해 나가십시오.",
			dilemma = {
				title = "벌거벗은 장사",
				description = "당신의 군대가 작은 시골 마을을 들어서자, 한 남자가 당신을 맞이합니다. 거대한 풍채에 직설적이지만 정직해 보이는 이 사람은 진정 인재가 분명합니다. 소문에 따르면 그는 황건적과 싸울 당시, 한 손으로 황소의 꼬리를 잡아 백 보 이상을 끌어당기며 적에게 공포에 떨게 했다고 합니다.",
				choices = {
					first = { title = "이 자를 등용한다", description = "호치라고 불러도 될 풍채입니다. 사내 10명은 거뜬하게 맞서 싸울 용력이 있는 자입니다." },
					second = { title = "지나친다", description = "무례하기 짝이 없는 자입니다." },
				},
				payload_text = "호치 허저가 합류합니다.",
			},
		},
		['02_01'] = { index = 21, hero_kr = "순욱", desc = "점령 1군",		-- 초기 한복
			mission_type = "OWN_N_PROVINCES",
			objectives = {
				{ option = "VAR_OBJECTIVE_NUM_PROVINCES", value = "1" },
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_xun_yu_hero_water" },
				{ option = "GEN_TARGET_CHARACTER" },
			},
			title = "기반을 구축하다",
			description = "난세 속에 명군을 찾는 모사들이 있습니다. 그 들은 잠시 다른 세력에 조언을 하며 몸을 위탁하고 있지만, 주군과 같은 인물이 세력의 기반을 다지면 스스로 찾아올 것입니다.",
			payload_text = "주군을 보필할 인재를 만날 수 있습니다.",
			dilemma = {
				title = "왕을 보좌하는 재능",
				description = "기주에서 떠나 온 순욱은 주군을 알현키로 결정합니다. 일찍이 하옹으로부터 왕좌지재라는 극찬을 받았을 정도로 명성이 자자했던 순욱의 인물됨을 모를 리 없는 당신은 마침내 자신이 장량에 비견되는 자를 만나게 된 행운에 기뻐합니다.",
				options = {
					--{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_xun_yu_hero_water", target = "target_character_1" },
					--{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
				},
				choices = {
					first = { title = "알현을 허락한다", description = "순욱은 장량의 귀부와 마찬가지입니다. 당신은 그를 초대하였습니다.", },
					second = { title = "내버려둔다", description = "그 자를 만날 시간이 없습니다." },
				},
				payload_text = "왕좌지재 순욱이 주군을 보필하게 됩니다.",
				gen_target = true,
			},
		},
		['02_02'] = { index = 22, hero_kr = "곽가", desc = "순욱 전투 승리", -- 초기 FA
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			payload_text = "순욱이 모사를 추천합니다",
			objective_text = "모사 [[col:magic]]순욱[[/col]]과 함께 [[col:flavour]]전투[[/col]]에서 승리하십시오.",
			title = "순욱의 모사 천거",
			description = "순욱은 세상 이치에 밝고, 인재들과 교류가 많습니다. 순욱은 인재를 발굴하고 천거하는 재능을 가지고 있으니, 그가 인재를 천거할 때는 그의 말에 귀를 기울이십시오.",
			dilemma = {
				title = "귀모",
				description = "괜찮은 모사 한 명은 천 명의 전사들에 맞먹는 가치를 지닙니다. 당신의 책사 순욱은 곽가라는 유능하고 젊은 관리에 대한 소문을 듣고는 조정으로 그를 초청했습니다.",
				choices = {
					first = { title = "천거를 받아들인다", description = "아주 귀한 인재입니다. 다른 자가 채가기 전에 맞아들이는 게 좋겠습니다.", },
					second = { title = "무시한다", description = "지금 당장은 필요없다" },
				},
				payload_text = "귀모 곽가가 아군에 합류합니다.",
				gen_target = true,
			},
		},
		['02_03'] = { index = 23, hero_kr = "정욱", desc = "순욱의 야간 전투 승리", -- 스폰
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			payload_text = "순욱이 또 다른 모사를 천거합니다",
			objective_text = "모사 [[col:magic]]순욱[[/col]]의 기술 [[col:gold]]평정[[/col]]으로 [[col:flavour]]야간 전투[[/col]]에서 승리하십시오.",
			supplementary_text = "감시자 [[col:flavour]]조인[[/col]] 3레벨에 [[col:gold]]평정[[/col]]을 습득하여 순욱과 함께 전투를 진행할 수도 있습니다.",
			title = "순욱의 천거 연계",
			description = "순욱은 동탁, 한복과 원소 세력에 잠시 머물며 중원과 하북의 인재에 대한 식견이 높습니다. 그가 천거하는 인재는 아군에 큰 힘이 될 것입니다.",
			dilemma = {
				title = "냉철한 현실주의자",
				description = "연주에 훌륭한 선비가 있다는 소문을 들었습니다. 황건적을 임기응변으로 물리친 전력이 있으나 매번 관직을 마다하고 은둔하고 있다고 합니다. 그런데 그런 강직한 선비가 지금 주군을 뵈기 위해 찾아왔다고 하는군요.",
				choices = {
					first = { title = "천거를 받아들인다", description = "강직한 성품이 돗보이는 인재입니다.", },
					second = { title = "무시한다", description = "지금 당장은 필요없다" },
				},
				payload_text = "정욱이 아군에 합류합니다.",
			},
		},
		['02_04'] = { index = 24, hero_kr = "우금", desc = "매복 성공", -- 초기 FA -> 한나라
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			payload_text = "정욱이 인재를 추천합니다",
			objective_text = "매복을 성공 시키십시오",
			title = "정욱의 무관 천거",
			description = "정욱은 유대 세력에 잠시 머물렀을 때 인연을 맺은 포신과 포신 휘하의 장수들에 대해 알고 있습니다. 정욱이 추천하는 장수는 훌륭한 재목일 것이 분명해 보입니다.",
			dilemma = {
				title = "대장군의 재목",
				description = "이번 전투에서 눈에 띄는 무관이 있었습니다. 그가 이끄는 군대는 일사불란하였으며 가는 곳마다 파죽지세의 기세로 적을 몰아붙였습니다. 포신의 휘하였던 그 자는 자신의 이름을 우금이라고 밝혔으며 우금의 통솔력을 알아본 정욱은 우금에게 관직을 하사해야함을 역설하였습니다.",
				choices = {
					first = { title = "추천를 받아들인다", description = "훗날 대장군이 될 자질이 보입니다.", },
					second = { title = "무시한다", description = "지금 당장은 필요없다" },
				},
				payload_text = "오자양장 중 한 자리를 차지할 것입니다.",
				gen_target = true,
			},
		},
		['03_01'] = { index = 31, hero_kr = "순유", desc = "점령 허창(영천), 여음(여남), 수춘(양주) 중 1", -- 초기 한나라
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 허창(영천), 여음(여남)
				--{ option = "VAR_OBJECTIVE_REGIONS", value = "3k_main_yingchuan_capital;3k_main_runan_capital" },
				--{ option = "GEN_CND_REGION", value = "3k_main_yingchuan_capital" },
				--{ option = "GEN_TARGET_REGION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "기반을 확장하다",
			description = "망해가는 한나라에는 귀한 인재들이 있습니다. 주군이 세력을 넓혀가면, 대세의 흐름을 읽은 인재들이 모여들 것입니다.",
			payload_text = "삼책사 중 한명을 만납니다",
			dilemma = {
				title = "현명한 책략가",
				description = "환란을 피해 각지를 전전하던 순유는 사촌인 순욱의 편지를 받고 주군의 대의에 동참하였습니다. 그는 병법과 전략을 통달한 군사적 식견을 가진 자로 순욱이 평소에 극찬한 자입니다.",
				choices = {
					first = { title = "환대한다", description = "순유는 일찍이 훌륭한 통찰력을 가진 자입니다. 당신은 순유를 극진히 맞이합니다" },
					second = { title = "내버려둔다", description = "지금은 필요치않다" },
				},
				payload_text = "위나라 삼책사 중 한명이 될 것입니다.",
				gen_target = true,
			},
		},
		['03_02'] = { index = 32, hero_kr = "서황", desc = "점령 낙양(하내윤), 회음(광릉), 극현(북해) 중 1",		-- 초기 한나라
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 낙양(하내윤), 회음(광릉), 극현(북해)
				--{ option = "VAR_OBJECTIVE_REGIONS", value = "3k_main_luoyang_capital;3k_main_guangling_capital;3k_main_beihai_capital" },
				--{ option = "GEN_CND_REGION", value = "3k_main_luoyang_capital" },
				--{ option = "GEN_TARGET_REGION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" },
			},
			title = "중원을 장악하다",
			description = "동탁의 학정과 한나라 황실의 무능에 지친 장수들이 있습니다. 그들을 규합하려면 옛 수도 낙양으로 진격할 필요가 있습니다.",
			payload_text = "오자양장 중 한명을 만납니다",
			dilemma = {
				title = "백전불패의 맹장",
				description = "서황은 나라를 좀먹는 약탈자들에게 환멸을 느끼고 큰 대업을 이루고자 주군에게 귀순하기로 결심합니다.",
				choices = {
					first = { title = "그의 귀순을 환영한다", description = "이런 장수라면 대업을 이루는데 의심할 여지가 없습니다." },
					second = { title = "그를 돌려보낸다", description = "양봉의 휘하인 자를 쉽게 믿긴 어려울지도 모릅니다." },
				},
				payload_text = "서황은 주아부의 풍격이 있다.",
				gen_target = true,
			},
		},
		['04_01'] = { index = 41, hero_kr = "장료", desc = "동탁 멸망",	-- 초기 동탁
			mission_type = "DESTROY_FACTION",
			objectives = {
				--{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_zhang_liao_hero_metal", target = "target_character_1" },
				--{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
				--{ option = "GEN_CND_FACTION", value = "3k_main_faction_dong_zhuo" },
				--{ option = "GEN_TARGET_FACTION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" },
			},		
			title = "황실을 장악하다",
			description = "난세를 종결시키고, 천하를 얻기위해서는 동탁 세력을 멸망시켜야 합니다",
			objective_text = "장료가 소속한 세력을 멸망시키십시오.",
			payload_text = "오자양장 중의 한명인 장료가 합류합니다.",
			dilemma = {
				title = "천룡장의 귀순",
				description = "용렬한 주인 밑에서 충성을 바쳤던 장료는 그의 주군의 몰락을 지켜보고 비로소 투항을 결심하였습니다. 장료는 그간 자신의 재능을 꽃 피우지 못하였습니다. 그를 놓친다면 천하를 호령할 기회를 놓치는 것과 같습니다. 그를 맞이하고 최전선의 장군으로 임명할 것을 약속하시겠습니까?",
				choices = {
					first = { title = "약속한다", description = "장료를 놓친다면 평생의 후회가 될 것입니다." },
					second = { title = "참수한다", description = "뛰어나다고한들 여포의 휘하일 뿐입니다. 그 주인에 그 부하일 것입니다." },
				},
				payload_text = "장료는 신의와 품위를 아는 장수입니다.",
				gen_target = true,
			},
		},
		['05_01'] = { index = 51, hero_kr = "장합", desc = "원소 멸망",	-- 초기 한복
			mission_type = "DESTROY_FACTION",
			objectives = {
				--{ option = "GEN_CND_FACTION", value = "3k_main_faction_yuan_shao" },
				--{ option = "GEN_TARGET_FACTION", value = "", target = "mission_objective" },
				{ option = "GEN_TARGET_NONE" },
			},
			title = "천하를 다투다",
			description = "하북의 원소는 유능한 지휘관이며, 가장 강력한 군대를 가지고 있습니다. 원소를 몰아내고 하북을 차지하는 자가 천하 대권을 가지게 됩니다.",
			objective_text = "장합이 소속한 세력을 멸망시키십시오.",
			payload_text = "오자양장 중의 한명인 장합이 합류합니다.",
			dilemma = {
				title = "명장의 귀부",
				description = "우유부단한 원소 밑에서 장합의 진언은 받아들여지지 않았습니다. 더군다나 전투의 패배는 항상 장합의 탓으로만 돌렸습니다. 이간질과 정치싸움에 지친 장합은 막사에 불을 지른 후 혈혈단신으로 조조군에 투항합니다. 패전의 멍에를 휘하 장수들한테 떠넘기는 원소의 앞날도 불 보듯 뻔합니다.",
				choices = {
					first = { title = "투신을 받아들인다", description = "하북에서의 장합의 명성은 대단하여, 유용한 인재가 될 것입니다." },
					second = { title = "무시한다", description = "변절자까지 필요하지는 않습니다." },
				},
				payload_text = "아군의 오자양장이 될 것입니다.",
				gen_target = true,
			}
		},
		['06_01'] = { index = 61, hero_kr = "가후", desc = "명성 열후 : 동탁 세력 1명 암살", incident = "vanilla",	-- 초기 동탁
			-- 명성 열후가 되면 트리거 됨
			mission_type = "ASSASSINATE_CHARACTER",
			objectives = {
				--{ option = "VAR_OBJECTIVE_CHARACTER_ID", value = "757897105" },
				-- GEN_CND_CHARACTER_TEMPLATE	3k_main_template_historical_jia_xu_hero_water
				{ option = "GEN_CND_FACTION", value = "3k_main_faction_dong_zhuo" },
				{ option = "GEN_TARGET_FACTION", value = "", target = "mission_objective" },
			},
			title = "지략을 쓰다",
			description = "주군의 지략이 높음을 천하에 알리면, 뛰어난 인재들이 주군이 주인임을 인정하고 머리를 숙일 것입니다.",
			objective_text = "암수를 사용하십시오.",
			payload_text = "삼책사 중 한명이 합류합니다",
			dilemma = {
				title = "권력과 처세술",
				description = "모사 가후는 천자의 몰락과 폭군의 부흥을 두 눈으로 똑똑히 보았습니다. 그는 패권의 움직임을 알아보는 자이며, 이제 당신에게서 그 패권을 보고 있습니다. 하여 현재 모시는 주인을 버리고 당신의 대의를 따르고자 합니다.",
				choices = {
					first = { title = "투신을 받아들인다", description = "가후는 위나라 삼책사 중 하나가 될 것입니다." },
					second = { title = "무시한다", description = "이런 기회 주의자는 믿을 수가 없습니다." },
				},
				payload_text = "가후는 음모와 모략의 귀재입니다.",
				gen_target = true,
			},
		},
		['07_01'] = { index = 71, hero_kr = "사마의", desc = "명성 왕 : 조조 하내 이동",
			-- 명성 왕이 되면 트리거 됨 -- 사마의 랜덤 생성 나이 18세로 고칠 필요.. 바닐라는 208년 스폰
			mission_type = "MOVE_TO_REGION",
			objectives = {
				{ option = "GEN_CND_REGION", value = "3k_main_henei_capital" },
				{ option = "GEN_TARGET_REGION" },
				{ option = "GEN_CND_CHARACTER_ID", value = "2140783959", target = "default" },
				{ option = "VAR_OBJECTIVE_CHARACTER_ID", value = "2140783959" },
			},
			title = "천하를 얻다",
			description = "천하를 얻기위해서는 최고의 책사가 필요합니다. 최고의 재능을 가졌다는 은둔 거사를 찾아가서 주군을 보필하게 하십시오.",
			objective_text = "주군, 하내로 이동하여 은둔거사를 찾아보십시오.",
			payload_text = "은둔거사 사마의를 아군 조정에 초빙합니다.",
			dilemma = {
				title = "랑고의 상",
				description = "온현에 사마의라는 위인이 있다는 소문을 들었습니다. 그는 '사마팔달' 중 한 명이자 재능있는 관료입니다. 그를 수도로 불러들여야 할까요?",
				choices = {
					first = { title = "사람을 보내 초빙한다", description = "현명한 지도자는 뛰어난 재능을 갖춘 자를 알아보고 그를 적절히 이용해야 합니다. 당신은 이야기를 나눠보기 위해 그를 초대했습니다." },
					second = { title = "내버려둔다", description = "만약 그가 당신을 돕고자 했다면 이미 당신에게 접근했을 것입니다. 당신은 그의 개인사를 존중하여, 홀로 내버려두기로 했습니다." },
				},
				payload_text = "사마의를 군사로 초빙하기 위해 사람을 보냈습니다",
			},
		},
	},

	join_dilemmas = {
			-- 위서 하후.조 가문 (하후돈, 하후연, 조인, 조홍, 조휴, 조진, 하후상)
			-- 조조 & 하후가
		 ['cao_hong'] = { index = 01, hero_kr = "조홍", follow = "조조", desc = "점령 2현" },	-- 초기 FA
		  ['cao_xiu'] = { index = 02, hero_kr = "조휴", follow = "조비", desc = "205년" },
	 ['xiahou_shang'] = { index = 03, hero_kr = "하후상", follow = "하후연", desc = "195년" },
		['xiahou_en'] = { index = 04, hero_kr = "하후은", follow = "하후돈", desc = "197년" },
			-- 위서 오자양장 (*악진, 우금, +장합, *서황, *장료)
			-- 위서 이이장문여허전이방염 (*이전, 이통, 장패, 문빙, 여건, *허저, *전위, *방덕, 방육, 염온)
		   ['yu_jin'] = { index = 11, hero_kr = "우금", follow = "악진", desc = "관내후",	-- 초기 FA
					title = "대장군의 재목",
					description = "이번 전투에서 눈에 띄는 장수가 있었습니다. 그가 이끄는 군대는 일사불란하였으며 가는 곳마다 연전연승을 불러왔습니다. 포신의 휘하였던 그 자는 자신의 이름을 우금이라고 밝혔으며 우금의 통솔력을 알아본 정욱은 우금에게 관직을 하사해야함을 역설하였습니다.",
				},
		  ['li_dian'] = { index = 12, hero_kr = "이전", follow = "악진", desc = "점령 동군",
					title = "문무예지의 양장",
					description = "이전은 가문의 대를 잇기 위해 약관의 나이로 주군에게 한걸음에 달려왔습니다. 악진이 말하기를 이전은 숙부인 이건을 닮아 재주와 덕망이 자자하다고 합니다. 이전이라면 어린 나이에도 충분히 제 역할을 다 할 것입니다.",
				},
			-- 모사들
		 ['cheng_yu'] = { index = 21, hero_kr = "정욱", follow = "순욱", desc = "점령 하동",
					title = "냉철한 현실주의자",
					description = "이 지역에 훌륭한 선비가 있다는 소문을 들었습니다. 황건적을 임기응변으로 물리친 전력이 있으나 매번 관직을 마다하고 은둔하고 있다고 합니다. 그런데 그런 강직한 선비가 지금 주군을 뵈기 위해 찾아왔다고 하는군요.",
				},
		 ['chen_gun'] = { index = 22, hero_kr = "진군", follow = "순욱", desc = "점령 낭야",	-- DB 나이 수정, 생성 금지
					title = "청렴함의 대명사",
					description = "순욱은 재야에 은둔하고 있는 진군이라는 자를 추천하였습니다. 그 자는 본래 유비의 밑에 있었지만 이대로 재능을 썩히기엔 아까운 자라고 합니다. 그 자에게 기회를 준다면 필히 보답할 것입니다.",
				},
			['du_ji'] = { index = 23, hero_kr = "두기", follow = "순욱", desc = "점령 하동", -- 출생 장안
					title = "순욱의 안목",
					description = "두기의 능력은 출중하나 그 빛을 보지 못하고 재능을 썩히고 있음을 깨달은 순욱은 두기를 조정으로 불러들일 것을 적극 간언하였습니다.",
				},
		['zhong_yao'] = { index = 24, hero_kr = "종요", follow = "순욱", desc = "점령 장안 + 8현",
					title = "명망 높은 서법가",
					description = "장안도 이제 주군에게 넘어왔습니다. 폭군 무리들을 쫓아내는데 공을 세운 종요에게 큰 포상을 내려야할 것입니다. 순욱은 종요의 능력이라면 어떠한 임무도 수행해낼 재간이 있는 자라고 칭찬하였습니다.",
				},
		   ['liu_ye'] = { index = 25, hero_kr = "유엽", follow = "순욱", desc = "점령 수춘", -- 187년생
					title = "빈틈없는 조언자",
					description = "아직 체계가 잡히지 않은 수춘 지역은 하루가 멀다하고 반란이 일어났었습니다. 하지만 그 끈질기던 반란을 단숨에 제압한 자가 있다는 소식이 조정에까지 들려왔으니 얼른 그 자를 조정으로 불러들이는 게 어떻겠습니까?",
					choices = {
						first = { title = "조정으로 불러들인다", description = "이 자가 낸 수많은 공문에는 발석거의 개량을 주장한 공문도 존재했습니다. 필히 능력이 중한 자일 것입니다." },
						second = { title = "그럴 필요 없다", description = "" },
					},
				},
		['man_chong'] = { index = 26, hero_kr = "만총", follow = "정욱", desc = "관내후, 점령 6현",
					title = "엄격한 원칙주의자",
					description = "만총은 한나라의 부정부패에 질색을 하여 관직을 버리고 귀향했던 자입니다. 하지만 그의 완강한 성품을 익히 알고 있었던 정욱은 만총의 천거를 피력했습니다.",
				},
		   ['mo_jie'] = { index = 27, hero_kr = "모개", follow = "정욱", desc = "점령 3군",	-- 초기 FA
					title = "도덕적 귀감",
					description = "모개는 전란을 피해 형주로 피란하려 했으나, 그와 친분이 있는 정욱이 그의 천거를 적극 추천하였습니다. 정욱의 조언을 들은 모개는 주군에게 임관을 청합니다.",
				},
				-- 동탁, 여포 및 원술 세력 출신
		  ['zang_ba'] = { index = 31, hero_kr = "장패", follow = "장료", desc = "열후, 점령 팽성", -- 선호 도겸
					title = "교활한 수완가",
					description = "장패는 더 이상 주군의 상대가 안된다는 것을 깨닫고 항복을 청해왔습니다. 장패를 주군의 편으로 끌어들이는 것으로 그의 세력권을 확보하는데 있어 큰 영향력을 행사할 것입니다.",
				},
		  ['gao_lan'] = { index = 32, hero_kr = "고람", follow = "장합", desc = "(TUP) 점령 업", -- 선호 원소
					title = "하북사정주",
					description = "",
				},
		 ['guo_huai'] = { index = 33, hero_kr = "곽회", follow = "장합", desc = "점령 정형관(동관) + 20현", -- 선호 원소
					title = "용병술의 달인",
					description = "곽회는 기교와 전술로 수많은 전투에서 승리로 이끈 꾀가 많은 지휘관입니다. 장합은 자신의 후임이 곽회라면 걱정할 것이 없다고 할 정도로 곽회의 능력을 칭찬하였고 그가 이룬 군공을 조정에 보고하였습니다.",
				},
		  ['jia_kui'] = { index = 41, hero_kr = "가규", follow = "사마의", desc = "왕, 점령 함곡관 + 하동",
					title = "강인한 성품의 소유자",
					description = "가규는 어떤 일을 맡겨도 묵묵히 수행해내는 강직한 인물입니다. 전해지는 바에 따르면 성이 함락당할 위기에서 적에게 사로잡혀 목숨이 위태한 상황임에도 임기응변으로 죽을 고비를 넘기고 적을 무찌르는 전공을 세웠을정도로 명성이 자자하다고 합니다.",
				},
		  ['wang_ji'] = { index = 42, hero_kr = "왕기", follow = "사마의", desc = "왕, 미정", -- 190년생
					title = "문무겸전의 장수",
					description = "왕기는 학문과 품행이 곧고 청렴결백한 인물이라고 평가받았으며 백성들의 칭찬이 마르지 않을 정도로 그의 공적이 뛰어났다고합니다. 사마의는 왕기의 공로를 보고하였고 그를 초빙해 조정으로 불러들일 것을 간언하였습니다.",
				},
		  ['deng_ai'] = { index = 43, hero_kr = "등애", follow = "사마의", desc = "왕, 점령 무도 + 10군", -- 197년생
					title = "기상천외한 전략가",
					description = "농부의 자식으로 태어난 촌뜨기 등애는 말더듬이임에도 불구하고 밑에서부터 차근차근 자신의 능력을 펼친 입지전적인 인물입니다. 사마의는 이런 인물이야말로 변혁을 일으킬 자라고 생각하며 그를 추천하였습니다.",
				},
				-- 추가 합류 중요 인물들
		 ['yang_xiu'] = { index = 51, hero_kr = "양수", desc = "점령 허창", -- 스폰 밴, 175년생
					title = "뛰어난 언변의 소유자",
					description = "당대 최고의 명문가의 자손인 양수는 똑똑하기로는 최고에 버금간다고 할 정도로 소문이 자자합니다. 이런 자가 지금 낙양에 있으니 얼른 그를 조정으로 불러들이는게 어떻겠습니까?",
					choices = { 
						first = { title = "그를 불러들인다", description = "어찌되었든 인재는 많으면 많을수록 좋습니다." },
						second = { title = "내버려둔다", description = "재주는 많지만 정도를 구분할 줄 모르는 한량에 불과합니다." },
					},
				},
		  ['li_tong'] = { index = 52, hero_kr = "이통", desc = "열후, 점령 여남",
					title = "의협심의 무인",
					description = "의병을 일으켜 황건적 잔당을 무찌른 전력이 있는 이통은 여남 일대에서 상당한 세력으로 성장하였으나 주군의 명성을 듣고 한걸음에 달려와 주군에게 투항을 청합니다. ",
					choices = { 
						first = { title = "투항을 받아들인다", description = "이 자는 끝까지 주군을 따를 것같은 신뢰가 듭니다." },
						second = { title = "쫓아낸다", description = "" },
					},
				},
		  ['tian_yu'] = { index = 53, hero_kr = "전예", desc = "공손찬 멸망, 점령 우북평 + 대군", -- 선호 공손찬
					title = "심리전의 대가",
					description = "이제 유주의 대부분의 지역은 주군의 손아귀에 들어왔습니다. 하지만 이곳에 전예라는 인물이 은거하고 있다고 합니다. 이 자는 공손찬의 휘하였지만 혁혁한 공을 세웠음에도 그 재능이 빛을 보지 못했다고 합니다. 하여 이 곳을 지나치기 이전에 이 자를 한번 만나보시는 것이 어떻겠습니까?",
					choices = { 
						first = { title = "그를 찾는다", description = "부름을 받은 전예는 주군의 뜻을 따르기로 결심합니다." },
						second = { title = "무시한다", description = "" },
					},
				},
		  ['pang_de'] = { index = 54, hero_kr = "방덕", desc = "마등 멸망, 점령 무도", -- 초기 마등
					title = "길 잃은 백마장군",
					description = "관중의 길목은 이제 우리의 차지입니다. 하지만 이 곳에서 뜻밖의 무장을 만났습니다. 바로 방덕이라는 자 입니다. 자신의 주인이라는 자는 이미 도망쳐버렸고 홀로 이곳을 지켰다고 했습니다. 모든 제장들은 그의 등용을 만류했으나 이대로 놓치기엔 아쉬운 장수입니다. 주군의 결단이 필요할 때입니다.",
					choices = { 
						first = { title = "그를 후대한다", description = "방덕의 무용은 일당백입니다. 그의 합류는 득이 될 것입니다." },
						second = { title = "내버려둔다", description = "" },
					},
				},
	},

	join_incidents = {},

	special_dilemmas = {
		 ['guan_yu_captured'] = { index = 61, hero_kr = "관우", choice = 3, desc = "장료 하비에서 전투 중 관우 조우",
				title = "무신의 굴복",
				description = "장료는 무신 관우를 아군에 합류시킬 수 있었다고 보고했습니다. 다만 여성에게 해를 가하지 않을 것, 항상 다른 이들이 아닌 천자만을 섬길 것, 그리고 자신의 형제를 찾으면 조조에게서 떠나 형제에게로 돌아갈 것이라는 세 가지 조건을 걸었다고 합니다.",
				choices = { 
					first = { title = "조건을 받아들인다", description = "무신의 일화는 전설적입니다. 당신은 그의 무예를 얻는 대가로 그의 조건을 기꺼이 받아들였습니다." },
					second = { title = "조건을 무시한다", description = "당신은 관우의 요청을 거부했습니다. 결코 받아들일 수 없는 조건을 제시한 것으로 보아, 그의 요청은 그저 겉치레인 것 같습니다." },
					third = { title = "처형한다", description = "이따위 말도 안되는 조건을 제시하는 것은 당신을 모욕한 것입니다. 당신은 대화를 구실로 관우를 만나 처형했습니다." },
				},
				gen_target = true,
			},
		 ['liu_bei_faction_died'] = { index = 62, hero_kr = "유비", desc = "타 세력에게 유비 세력 멸망",
				title = "",
				description = "",
			},
		 ['xu_you_conversion'] = { index = 63, hero_kr = "허유", desc = "원소와 전쟁 중 대치",
				title = "",
				description = "",
			},
			--[[
			전위 사망 바닐라 이벤트
			양수 조비
			양수 계륵
			]]
		 ['sima_yi_followup_02'] = { index = 81, hero_kr = "사마의", desc = "사마의 등용 연계",
			-- 스크립트에서 2턴 뒤부터 확률로 트리거
			title = "뜻을 굽히지 않는 사마의",
			description = "사마의는 건강도 나빠지고 있고, 풍도 들었다는 핑계로 당신의 부름을 거절했습니다. 당신은 뭔가 미심쩍어, 사마의를 염탐하라고 사람을 보냈습니다. 근데 사마의가 비바람이 부는 날에 달리고 있다지 뭡니까!",
			choices = { 
				first = { title = "소환한다", description = "당신은 사마의의 거짓말과 거기에 숨은 동기에 분노하여, 그를 즉각 불러들였습니다." },
				second = { title = "내버려둔다", description = "스스로도 믿지 못하는 조언가는 신뢰할 수도 없으며 쓸모도 없습니다. 당신은 그를 내버려두기로 결정했습니다." },
			},
			options = {
				{ option = "GEN_TARGET_NONE", },
			},
			var_chance = 1000,
			cnd_random = 55,
			payload_text = "응시랑고의 상을 가진 [[col:flavour]]사마의[[/col]]가 합류합니다."
		},
		['mission_selection_01'] = { index = 91, choice = 4, desc = "1차 진출 목표 선택",
			title = "조조의 1차 진출 목표",
			description = "주군! 이제 군비가 확충되고 인재가 모여 아군의 힘이 강해지고 있습니다. 천하를 도모하기 위해 아군이 진격할 방향을 결정해주십시오.",
			options = {
				{ option = "GEN_CND_REGION", value = "3k_main_yingchuan_capital", target = "target_region_1" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_1" }, -- 북쪽 허창(영천)
				{ option = "GEN_CND_REGION", value = "3k_dlc06_xiapi_capital", target = "target_region_2" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_2" }, -- 동쪽 하비(서주)
				{ option = "GEN_CND_REGION", value = "3k_main_runan_capital", target = "target_region_3" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_3" }, -- 서쪽 여음(여남)
				{ option = "GEN_CND_REGION", value = "3k_main_yangzhou_capital", target = "target_region_4" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_4" }, -- 남쪽 수춘(양주)
			},
			choices = { 
				first = { 
					title = "북쪽으로 진출한다",
					payload_text = "연주를 공략하고 하북을 견제하자",
					description = "유총과 유대를 공략하고, 하북 세력을 견제합니다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_1" },
					},
				},
				second = {
					title = "당연히 동쪽이다",
					payload_text = "도겸을 처단하여 원한을 청산하자",
					description = "서주 도겸을 처단하여 합병하고, 유비와 공융 세력을 압박한다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_2" },
					},
				},
				third = { 
					title = "서쪽으로 가자",
					payload_text = "황건적 잔당을 소탕하고 형주를 노리자",
					description = "황건적 하의를 소탕하고, 여남을 확보하여 유표와 원술을 견제한다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_3" },
					},
				},
				fourth = {
					title = "남쪽이다",
					payload_text = "우선 장강으로 진출한다",
					description = "장강 무역로를 확보하여 산업을 부흥시키고, 농업을 진흥시킨다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_4" },
					},
				},
			},
		},
		['mission_selection_02'] = { index = 92, choice = 4, desc = "2차 진출 목표 선택",
			title = "조조의 2차 진출 목표",
			description = "주군! 1차 진격 목표가 달성되었습니다. 천하를 도모하기 위해 아군이 2차로 진격할 방향을 결정해주십시오.",
			options = {
				{ option = "GEN_CND_REGION", value = "3k_main_dongjun_capital", target = "target_region_1" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_1" }, -- 북쪽 복양(동군)
				{ option = "GEN_CND_REGION", value = "3k_main_donghai_capital", target = "target_region_2" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_2" }, -- 동쪽 담현(동해)
				{ option = "GEN_CND_REGION", value = "3k_main_luoyang_capital", target = "target_region_3" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_3" }, -- 서쪽 낙양(하내윤)
				{ option = "GEN_CND_REGION", value = "3k_main_guangling_capital", target = "target_region_4" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_4" }, -- 남쪽 회음(광릉)
			},
			choices = { 
				first = { 
					title = "하북을 노려본다",
					payload_text = "하북으로 가려면 복양을 거처야 합니다. 복양을 점령하여 원소와 대치합니다.",
					description = "하북을 향한 교두보를 마련합니다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_1" },
					},
				},
				second = {
					title = "동쪽으로 간다",
					payload_text = "유비의 본거지로 진격한다",
					description = "유비를 합병하고 공융을 견제합니다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_2" },
					},
				},
				third = { 
					title = "중원으로 가자",
					payload_text = "버려진 낙양으로 진출한다",
					description = "옛 수도 낙양으로 진출하여 한나라의 멸망을 재촉한다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_3" },
					},
				},
				fourth = {
					title = "강남을 도모하자",
					payload_text = "강남 정벌의 교두보를 만듭니다.",
					description = "강동을 정벌하기 위해선 장강 항구 도시에 거점을 만들어야 합니다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_4" },
					},
				},
			},
		},
	},
	
	special_incidents = {
		 ['guan_yu_leave'] = { index = 61, hero_kr = "관우", desc = "관우 등용 후 10턴 경과, 관우 포함 전투 3번 후",
					title = "홀연히 떠난 관우",
					description = "관우가 당신을 따랐지만 관우의 유비에 대한 충성심은 여전했습니다. 그는 유비의 행방을 알아차리자마자 곧바로 짐을 싸고 사라졌습니다.",
					gen_target = true,
				},
		 ['guan_yu_captured_string'] = { index = 62, hero_kr = "관우", desc = "하비 전투 후 관우 포로 메시지" },
		 ['liu_bei_rejoin_at_runan'] = { index = 63, hero_kr = "유비", desc = "여남/강릉에서 유비 봉기" }, -- 제갈량, 주창, 요화 합류
		 ['xu_you_advice_incident'] = { index = 64, hero_kr = "허유", desc = "원소와 전쟁 중 조언" },
		 ['xu_you_killed_by_xu_chu'] = { index = 65, hero_kr = "허유", desc = "원소 멸망 후" },
		 --[[
			조조 서주병
			조조 둔전법
			조조 서주 학살
			채염 문자 풀이
			마등 업 이주
			마초 장안 점령
			마등 삼족멸
		 ]]
	},
}

return tke_cao_cao_events