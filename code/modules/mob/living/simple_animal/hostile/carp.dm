/mob/living/simple_animal/hostile/carp
	name = "space carp"
	desc = "A ferocious, fang-bearing creature that resembles a fish."
	icon = 'icons/mob/carp.dmi'
	icon_state = "carp"
	icon_gib = "carp_gib"
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	emote_taunt = list("gnashes")
	taunt_chance = 30
	speed = 0
	maxHealth = 25
	health = 25
	harm_intent_damage = 8
	obj_damage = 50
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("gnashes")

	//Space carp aren't affected by atmos.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("carp")
	flying = 1
	gold_core_spawnable = CHEM_MOB_SPAWN_HOSTILE

	var/carp_color = "carp" //holder for icon set
	var/list/icon_sets = list("carp", "blue", "yellow", "grape", "rust", "teal", "purple")

/mob/living/simple_animal/hostile/carp/Initialize(mapload)
	. = ..()
	carp_randomify()
	update_icons()

/mob/living/simple_animal/hostile/carp/proc/carp_randomify()
	if(prob(1))
		carp_color = pick("white", "black")
	else
		carp_color = pick(icon_sets)
	icon_state = "[carp_color]"
	icon_living = "[carp_color]"
	icon_dead = "[carp_color]_dead"

/mob/living/simple_animal/hostile/carp/Process_Spacemove(var/movement_dir = 0)
	return 1	//No drifting in space for space carp!	//original comments do not steal

/mob/living/simple_animal/hostile/carp/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjustStaminaLoss(8)

/mob/living/simple_animal/hostile/carp/holocarp
	icon_state = "holocarp"
	icon_living = "holocarp"
	maxbodytemp = INFINITY
	gold_core_spawnable = CHEM_MOB_SPAWN_INVALID
	del_on_death = 1

/mob/living/simple_animal/hostile/carp/holocarp/carp_randomify()
	return

/mob/living/simple_animal/hostile/carp/megacarp
	icon = 'icons/mob/alienqueen.dmi'
	name = "Mega Space Carp"
	desc = "A ferocious, fang bearing creature that resembles a shark. This one seems especially ticked off."
	icon_state = "megacarp"
	icon_living = "megacarp"
	icon_dead = "megacarp_dead"
	icon_gib = "megacarp_gib"
	maxHealth = 65
	health = 65
	pixel_x = -16
	mob_size = MOB_SIZE_LARGE
	obj_damage = 80
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/carp/megacarp/carp_randomify()
	return
