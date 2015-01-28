// Endboss for NT Outpost 27's Purple Maze. *wow*

/obj/machinery/ntoutpost/tablet
	name = "etched crystal"
	desc = "It's full of symbols you can't read."
	icon = 'icons/obj/awaymission/ntmission/items.dmi'
	icon_state = "ano70"
	var/active = 0
	anchored = 1
	luminosity = 6


/obj/machinery/ntoutpost/tablet/attack_ai(mob/user as mob)
	user << "It won't work for you. Bummer."

/obj/machinery/ntoutpost/tablet/attack_paw(mob/user as mob)
	user << "It won't work for you. Bummer."

/obj/machinery/ntoutpost/tablet/attack_hand(mob/user as mob)
	src.add_fingerprint(usr)
	user << "The symbols shift and contort, turning into something readable: '<b>THE DOOR PAST THIS WILL GIVE POWER, BUT A FOREBODING WARNING: WITH ATTEMPTS OF GAINING POWER COMES GREAT PRICE.</b>'"
	visible_message("\red <b>[mob]</b> touches the tablet.")
	sleep(30)

	src.active = src.active + 1

	if(src.active == 1)
		visible_message("\red <b>The tablet starts glowing! This isn't good!</b>")
		src.icon_state = "ano71"
		sleep(30)
		visible_message("\red <b>The tablet cracks open, revealing something... no, someONE!</b>")

		var/mob/living/simple_animal/hostile/ntoutpost/endboss/G = new /mob/living/simple_animal/hostile/ntoutpost/endboss
		G.loc = src.loc
		for(var/obj/machinery/door/alien_door/M in world)
			if (M.id == "sd4")
				if (M.density)
					spawn( 0 )
						M.open()
						return
				else
					spawn( 0 )
						M.close()
						return


		message_admins("\blue Event: NT-Outpost27 boss spawned at [G.loc.loc] ([G.x], [G.y], [G.z])")
	else
		visible_message("\red <b>The tablet glows a bit, and stops.</b>")

// The endboss itself

/mob/living/simple_animal/hostile/ntoutpost/endboss
	name = "robed person"
	desc = "Run."
	icon = 'icons/mob/mob.dmi'
	icon_state = "nim"
	icon_living = "nim"
	icon_dead = "empty"
	icon_gib = "syndicate_gib"
	response_help = "ruffles the robes on the"
	response_disarm = "shoves the"
	response_harm = "hits the"
	speed = -1
	maxHealth = 500
	health = 500
	ranged = 1
	harm_intent_damage = 7
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
	projectiletype = /obj/item/projectile/forcebolt/ntoutpost/endboss
	projectilesound = 'sound/weapons/pierce.ogg'

/mob/living/simple_animal/hostile/ntoutpost/endboss/Die()
	..()
	visible_message("\red <b>[src] suddenly turns into ash, disappearing from sight.</b>")
	sleep(10)
	for(var/obj/machinery/door/alien_door/M in world)
		if (M.id == "ending")
			if (M.density)
				spawn( 0 )
					M.open()
					return
			else
				spawn( 0 )
					M.close()
					return



/obj/item/projectile/forcebolt/ntoutpost/endboss
	name = "magic bolt"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "ice_1"
	damage = 5
	damage_type = BURN
	flag = "energy"
	embed = 1

// spawners (not working)

/*

/obj/effect/ntoutpost/alienspawner
	name = "landmark"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	anchored = 1.0
	unacidable = 1
	var/id = null
	var/uses = 0

*/




