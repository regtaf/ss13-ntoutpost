// the filename is misleading, this is where i put random things so that one file isn't the longest piece of shit you've ever seen
// this is still going to be the longest piece of shit you've seen by the way

// areas

/area/awaymission/ntoutpost/overground
	name = "\improper NT-Outpost-27"
	icon_state = "away"

/area/awaymission/ntoutpost/underground
	name = "\improper Cave"
	icon_state = "away1"

/area/awaymission/ntoutpost/underground/maze
	name = "\improper Strange Place"
	icon_state = "away2"

/area/awaymission/ntoutpost/underground/comsat
	name = "\improper Underground Place"
	icon_state = "away3"

// special safe in the Hidden Com-Sat bunker

/obj/item/weapon/storage/secure/safe/ntoutpost/money
	New()
		..()
		new /obj/item/weapon/spacecash/c1000(src)
		new /obj/item/weapon/spacecash/c1000(src)
		new /obj/item/weapon/spacecash/c1000(src)
		new /obj/item/weapon/spacecash/c1000(src)
		new /obj/item/weapon/spacecash/c500(src)
		new /obj/item/weapon/gun/projectile/russian(src)

	attack_hand(mob/user as mob)
		return attack_self(user)

// special alien weapon you get at the end of the boss fight

/obj/item/weapon/gun/energy/alien
	name = "odd stone"
	desc = "It pulses with power. I don't think you should hold this too long."
	icon = 'icons/obj/awaymission/ntmission/items.dmi'
	icon_state = "Phazon"
	cell_type = "/obj/item/weapon/cell/infinite"
	force = 15
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = "/obj/item/projectile/beam/pulse"
	fire_delay = 25

	attack_self(mob/living/user as mob)
		user << "\red The [src.name] pulses in your hand. You don't feel any different."

/* This doesn't work

	attack_hand(var/mob/user as mob)
		if(istype(user,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = user
			if(!H.gloves)
				visible_message("\red [src.name] suddenly glows, and then stops.")
				sleep(50)
				H << "\red The [src.name] glows wildly, and you feel as if it was taking something away from your body!"
				visible_message("\red <b>[src.name] suddenly rips off a bit of its holder's skin! Holy shit!</b>")
				H.adjustBruteLoss(20)
				H.emote("scream")

*/

/* Alternate description, commented out because it won't be used anyways. Also since Phazons are actually in Metroid this description would make no sense
/obj/item/weapon/gun/energy/alien/Phazon
	name = "Phazon Stone"
	desc = "A stone with infinite power. You can feel pure energy rush through your entire body as you hold it."

	attack_self(mob/living/user as mob)
		user << "\red The [src.name] pulses in your hand. You don't feel any different."
*/