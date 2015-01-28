/obj/machinery/ntoutpost/lava
	name = "lava"
	desc = "The floor is lava. Oh no."
	anchored = 1.0
	icon = 'icons/turf/floors.dmi'
	icon_state = "lava"
	luminosity = 4
	unacidable = 1
	density = 1



/obj/machinery/ntoutpost/lava/Bumped(atom/AM)
	if(ismob(AM))
		AM.visible_message("\red <b>[AM] falls into \the [src] and disappears forever. Fuck.</b>", "\red You fall into the [src], and feel your body disintegrating.")
		message_admins("[AM] fell into lava at [src.loc.loc] ([src.x], [src.y], [src.z])")
		del (AM)
	return

	if(istype(AM, /obj/item))
		visible_message("\red <b>[AM] falls into \the [src] and disappears forever. Fuck.</b>")
		del (AM)
	return

