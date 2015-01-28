// see those pink things? this is the code for them

/mob/living/simple_animal/hostile/ntoutpost/alien
	name = "alien thing"
	desc = "holy jesus christ what the <b>fuck</b> is that"
	icon = 'icons/mob/mob.dmi'
	icon_state = "horror"
	icon_living = "horror"
	icon_dead = "empty"
	icon_gib = "syndicate_gib"
	response_help = "touches the"
	response_disarm = "shoves the"
	response_harm = "hits the"
	speed = -1
	maxHealth = 50
	health = 50
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "hits the"
	a_intent = "harm"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "alien"
	wall_smash = 1
	status_flags = CANPUSH
	minbodytemp = 0
	heat_damage_per_tick = 20