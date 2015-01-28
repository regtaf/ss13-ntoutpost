// shitty copy/paste of ladder.dm

/obj/structure/ladder/ntoutpost/alien/
	name = "alien object"
	desc = "You probably shouldn't touch this."
	icon = 'icons/obj/awaymission/ntmission/items.dmi'
	icon_state = "ano81"
	var/oneway = 0

/obj/structure/ladder/ntoutpost/alien/New()
	spawn(8)
		for(var/obj/structure/ladder/ntoutpost/alien/L in world)
			if(L.id == id)
				if(L.height == (height - 1))
					down = L
					continue
				if(L.height == (height + 1))
					up = L
					continue

			if(up && down)	//if both our connections are filled
				break
		update_icon()

/obj/structure/ladder/ntoutpost/alien/update_icon()
	if(up && down)
		icon_state = "ano81"

	else if(up)
		icon_state = "ano81"

	else if(down)
		icon_state = "ano81"

	else if(oneway == 1)
		icon_state = "empty"

	else	//wtf make your ladders properly assholes
		icon_state = "ano80"

/obj/structure/ladder/ntoutpost/alien/attack_hand(mob/user as mob)
	if(up && down)
		switch( alert("Go up or down the ladder?", "Ladder", "Up", "Down", "Cancel") )
			if("Up")
				user.visible_message("\red <b>[user] touches \the [src] and suddenly disappears! Holy shit!</b>", \
									 "<span class='notice'>You feel your body flay through existance and back.</span>")
				user.loc = get_turf(up)
				up.add_fingerprint(user)
			if("Down")
				user.visible_message("\red <b>[user] touches \the [src] and suddenly disappears! Holy shit!</b>", \
									 "<span class='notice'>You feel your body flay through existance and back.</span>")
				user.loc = get_turf(down)
				down.add_fingerprint(user)
			if("Cancel")
				return

	else if(up)
		user.visible_message("\red <b>[user] touches \the [src] and suddenly disappears! Holy shit!</b>", \
							 "<span class='notice'>You feel your body flay through existance and back.</span>")
		user.loc = get_turf(up)
		up.add_fingerprint(user)

	else if(down)
		user.visible_message("\red <b>[user] touches \the [src] and suddenly disappears! Holy shit!</b>", \
							 "<span class='notice'>You feel your body flay through existance and back.</span>")
		user.loc = get_turf(down)
		down.add_fingerprint(user)

	add_fingerprint(user)

/obj/structure/ladder/ntoutpost/alien/attack_paw(mob/user as mob)
	return attack_hand(user)

/obj/structure/ladder/ntoutpost/alien/attackby(obj/item/weapon/W, mob/user as mob)
	return attack_hand(user)