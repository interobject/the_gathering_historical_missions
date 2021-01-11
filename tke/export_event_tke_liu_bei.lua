-- title = "([\w ]+)\."
-- title = "\1"

local tke_liu_bei_events = {

	faction_key = "tke_liu_bei",
	faction_tk_key = "3k_main_faction_liu_bei",
	historical_mod_id = "41",
	campaign_id = "1",
	campaign_name = "3k_main_campaign_map",
	faction_id = "02",
	id_prefix = "41102",
	
	missions = {
		['01_01'] = { index = 11, hero_kr = "조운", desc = "공통 : 유비로 야전에서 승리",
			mission_type = "FIGHT_SET_PIECE_BATTLE",
			objectives = {
				{ option = "GEN_TARGET_NONE" },
			},
			title = "난세 속의 빛",
			description = "당신은 공손찬 휘하 의병 시절 기주에서 만나 함께 침상을 사용했던 젊은 장수 조운을 생각합니다. '덕을 저버리지 않겠다.'라는 그 젊은 장수의 말을 기억하며 다시 만날 날을 고대하고 있습니다.",
			payload_text = "기주에서 인연을 맺은 젊은 장수를 만납니다",
			objective_text = "[[col:magic]]유비[[/col]]로 [[col:flavour]]야전(野戰)[[/col]]에서 승리하십시오.",
			dilemma = {
				title = "조운의 합류",
				description = "전투가 끝나가는 와중에, 한 기병이 앞으로 나와 홀로 길을 막습니다. 그는 완전 무장한 채 임전무퇴의 기상을 흩뿌리면서 자신을 조운이라고 소개하였으며, 당신의 휘하로 들어오길 바랍니다.",
				choices = {
					first = { title = "그를 합류시킨다", description = "조운이 말한다. '끝내 덕(德)을 저버리지는 않겠습니다.'" },
					second = { title = "지나친다", description = "공손찬에게 죄를 짓고 싶지않다." },
				},
				payload_text = "조운에게 기병을 맡긴다.",
				gen_target = true,
			},
		},
		['02_01'] = { index = 21, hero_kr = "서서", desc = "서주 : 점령 2군",
			-- 3k_main_historical_liu_xu_shu_joins_incident
			mission_type = "OWN_N_PROVINCES",
			objectives = {
				{ option = "VAR_OBJECTIVE_NUM_PROVINCES", value = "2" },
			},
			title = "손씻은 자경단원",
			description = "난세에는 뛰어난 책사가 진영에 필요하다는 것을 절실히 느끼고 있습니다. 불의한 일을 보면 참지 못하는 뛰어난 젊은 백면 서생이 있다는 소문을 들은 당신은 그를 만나고 싶어합니다.",
			payload_text = "용감한 자경단원 서생을 만나봅니다",
			dilemma = {
				title = "서서의 영입",
				description = "당신은 마을에서 수경 선생을 만나기 위해 기다린다는 내용의 노래를 부르며 어슬렁거리는 한 남자를 만납니다. 누추한 의복을 입고 있는 이 남자는 자신이 훌륭한 전략가임을 밝힙니다. 그는 봉추도 와룡도 아니지만 분명 뛰어난 재능을 가진 자임이 분명합니다.",
				choices = {
					first = { title = "그를 등용시킨다", description = "서서의 재능을 한 눈에 알아본 당신은 중얼거립니다.\\\\n'그의 뛰어난 재능은 우리에게 큰 도움이 될 것이다.'" },
					second = { title = "지나친다", description = "당장은 이 젊은이가 필요하지 않다." },
				},
				payload_text = "서서를 영입하여 군사로 대우합니다",
			},
		},
		['02_02'] = { index = 22, hero_kr = "서서", desc = "강릉 : 점령 <화용> 4현",
			-- 3k_main_historical_liu_xu_shu_joins_incident
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {
				{ option = "GEN_TARGET_NONE" }, -- 스크립트로 조정
			},
			title = "손씻은 자경단원",
			description = "난세에는 뛰어난 책사가 진영에 필요하다는 것을 절실히 느끼고 있습니다. 불의한 일을 보면 참지 못하는 뛰어난 젊은 백면 서생이 있다는 소문을 들은 당신은 그를 만나고 싶어합니다.",
			payload_text = "용감한 자경단원 서생을 만나봅니다",
			objective_text = "남군, [[col:flavour]]화용[[/col]]을 포함한 4지역을 점령하십시오.",
			dilemma = {
				title = "서서의 영입",
				description = "당신은 마을에서 수경 선생을 만나기 위해 기다린다는 내용의 노래를 부르며 어슬렁거리는 한 남자를 만납니다. 누추한 의복을 입고 있는 이 남자는 자신이 훌륭한 전략가임을 밝힙니다. 그는 봉추도 와룡도 아니지만 분명 뛰어난 재능을 가진 자임이 분명합니다.",
				choices = {
					first = { title = "그를 등용시킨다", description = "서서의 재능을 한 눈에 알아본 당신은 중얼거립니다.\\\\n'그의 뛰어난 재능은 우리에게 큰 도움이 될 것이다.'" },
					second = { title = "지나친다", description = "당장은 이 젊은이가 필요하지 않다." },
				},
				payload_text = "서서를 영입하여 군사로 대우합니다",
			},
		},
		['03_01'] = { index = 31, hero_kr = "주창", desc = "점령 여음(여남)", -- TUP
			mission_type = "CONTROL_N_REGIONS_INCLUDING",
			objectives = {	-- 여음(여남)
				{ option = "GEN_TARGET_NONE" },
			},
			title = "여남을 탐색하다",
			description = "여남에는 도적 무리들이 지역 세력을 장악하고 있습니다. 그 중에는 쓸만한 인재가 있다는 소문입니다.",
			payload_text = "도적 무리 두목 중 한명을 만납니다",
			dilemma = {
				title = "충성을 다하는 종복",
				description = "주창",
				choices = {
					first = { title = "환대한다", description = "주창을 반갑게 맞이합니다" },
					second = { title = "내버려둔다", description = "지금은 필요치않다" },
				},
				payload_text = "아군의 충실한 종복이 될 것입니다.",
			}
		},
	},

	join_incidents = {},
	join_dilemmas = {
		['huang_zhong'] = { index = 01, hero_kr = "황충", desc = "황충 소속 세력 멸망", -- 기본 유비
			title = "노익장",
			description = "노익장 황충은 오호대장군 중 한명으로 나이가 많음에도 불구하고 맹장으로 이름이 드높습니다",
			choices = { 
				first = { title = "그를 찾는다", description = "황충을 받아드린다" },
				second = { title = "무시한다", description = "지금은 황충이 필요하지않다" },
			},
			payload_text = "촉나라 오호대장군 중 한명이 될 것입니다.",
			gen_target = true,
		},
		['wei_yan'] = { index = 02, hero_kr = "위연", desc = "위연 소속 세력 멸망", -- 기본 유표, 선호 유비
			title = "위연",
			description = "소속한 세력이 멸망하고나자 위연은 갈 곳을 잃었습니다",
			choices = { 
				first = { title = "그를 찾는다", description = "위연이 합류합니다." },
				second = { title = "무시한다", description = "지금은 필요없다" },
			},
			payload_text = "아군에 큰 힘이 될 것입니다",
			gen_target = true,
		},
		['ma_chao'] = { index = 03, hero_kr = "마초", desc = "마초 소속 세력 멸망", -- 기본 마등, 선호 유비
			title = "금마초",
			description = "서량의 맹장 금마초가 소속없이 떠돌고 있습니다",
			choices = { 
				first = { title = "그를 찾는다", description = "마초는 주군의 휘하에서 복수를 준비합니다." },
				second = { title = "무시한다", description = "지금은 필요없다" },
			},
			payload_text = "촉나라 오호대장군 중 한명이 될 것입니다.",
			gen_target = true,
		},
	},
	
	special_dilemmas = {
		['to_jingzhou'] = { index = 00, desc = "유비 강릉 이동",
			ui_image = "ep_event_capturing_capital_good_sima_yue",
			title = "유비를 [[col:dark_r]]강릉[[/col]] 지역으로 이동시키겠습니까?",
			description = "\\\\n유비가 [[col:dark_r]]강릉[[/col]]으로 이동하여 삼국 정립을 준비할 수 있습니다.\\\\n\\\\n[[b]]'이동하기'[[/b]]를 선택하면 유비는 즉시 [[col:dark_r]]강릉[[/col]]으로 이동하고, 강릉에 있는 손견과 전유는 장사로 이동됩니다.\\\\n유비와 황건적 조백이 강릉으로 이동한 후, [[col:red]]조백[[/col]]을 처치 하십시오.\\\\n[[col:red]]동군과 낭야[[/col]]를 점령하는 튜토리얼 미션은 자동으로 완료됩니다.\\\\n\\\\n유비의 역사적 미션은 [[col:dark_r]]유표 합병 미션[[/col]]으로 연결됩니다.",
			options = {
				{ option = "GEN_CND_REGION", value = "3k_main_jingzhou_capital", target = "target_region_1" },
				{ option = "GEN_TARGET_REGION", value = "", target = "target_region_1" },
				{ option = "GEN_CND_CHARACTER_TEMPLATE", value = "3k_main_template_historical_liu_bei_hero_earth", target = "target_character_1" },
				{ option = "GEN_TARGET_CHARACTER", value = "", target = "target_character_1" },
			},
			choices = {
				first = {
					title = "강릉으로 이동한다",
					description = "손견과 화친하며 유표를 공략하며 삼국 정립을 대비한다.",
					payloads = {
						{ payload = "LOCATED", value = "REGION", target = "target_region_1" },
					},
					payload_texts = {
						"조운, 서서, 주창의 빠른 합류 미션(개발 중)",
						"유표를 조심하십시오.",
						"손견과 연맹을 고려하십시오",
					},
				},
				second = {
					title = "그대로 진행한다",
					description = "공용과 도겸을 보호하며 조조와 원소의 침공을 대비한다.",
					ui_text = "dummy_factual_choice",
					payloads = {
						{ payload = "LOCATED", value = "CHARACTER", target = "target_character_1" },
					},
				},
			},
		},
	},
	special_incidents = {},
}

return tke_liu_bei_events