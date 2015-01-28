// a very half-assed copypaste of door_control.dm, snipped of all instances of power-usage. It's actually much, much shorter.

/obj/machinery/ntoutpost/alien_button
	name = "alien button"
	desc = "I think you touch this..."
	icon = 'icons/obj/awaymission/ntmission/items.dmi'
	icon_state = "ano80"
	desc = "I think you touch this..."
	density = 1
	var/id = null
	anchored = 1.0

/obj/machinery/ntoutpost/alien_button/attack_ai(mob/user as mob)
	user << "It rejects you."

/obj/machinery/ntoutpost/alien_button/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/ntoutpost/alien_button/attack_hand(mob/user as mob)
	src.add_fingerprint(usr)
	flick("ano81", src)
	user << "\red The object glows. Nothing happens, appearantly."
	add_fingerprint(user)
	for(var/obj/machinery/door/alien_door/M in world)
		if (M.id == src.id)
			if (M.density)
				spawn( 0 )
					M.open()
					return
			else
				spawn( 0 )
					M.close()
					return

/obj/machinery/ntoutpost/regular_button
	name = "broken button"
	desc = "It looks powered. But very, very smashed."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "doorctrl-p"
	desc = "It looks powered. But very, very smashed."
	density = 0
	var/id = null
	anchored = 1.0

/obj/machinery/ntoutpost/regular_button/attack_ai(mob/user as mob)
	user << "Doesn't work. Maybe it has to be controlled manually."

/obj/machinery/ntoutpost/regular_button/attack_paw(mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/ntoutpost/regular_button/attack_hand(mob/user as mob)
	src.add_fingerprint(usr)
	user << "\red The button fizzes a bit, but nothing happens. Appearantly."
	playsound(src.loc, "sparks", 100, 1)
	add_fingerprint(user)
	for(var/obj/machinery/door/poddoor/G in world)
		if (G.id == src.id)
			if (G.density)
				spawn( 0 )
					G.open()
					return
			else
				spawn( 0 )
					G.close()
					return

