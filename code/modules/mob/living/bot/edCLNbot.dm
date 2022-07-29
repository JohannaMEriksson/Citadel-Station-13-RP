/datum/category_item/catalogue/technology/bot/cleanbot/edCLN
	name = "Bot - ED CLN"
	desc = "ED CLN units are the end result of a marketing campaign designed \
	to change the ED series robot's public image. Although marginally successful, \
	design flaws in the ED chassis - including its difficulty traversing stairwells, \
	its size, and the complexity of its mechanisms made it an inferior choice in \
	comparison to the more compact cleanbot."
	value = CATALOGUER_REWARD_TRIVIAL

/mob/living/bot/cleanbot/edCLN
	name = "ED-CLN Cleaning Robot"
	desc = "A large cleaning robot. It looks rather efficient."
	icon_state = "edCLN0"
	req_one_access = list(access_robotics, access_janitor)
	botcard_access = list(access_janitor, access_maint_tunnels)
	catalogue_data = list(/datum/category_item/catalogue/technology/bot/cleanbot/edCLN)

	locked = FALSE //Starts unlocked so roboticist can set them to patrol.
	wait_if_pulled = FALSE //One big boi.
	min_target_dist = 0

	patrol_speed = 3
	target_speed = 6

	cleaning = FALSE
	blood = FALSE
	var/red_switch = 0
	var/blue_switch = 0
	var/green_switch = 0

/mob/living/bot/cleanbot/edCLN/update_icons()
	if(on && busy)
		icon_state = "edCLN"
	else
		icon_state = "edCLN[on]"

/mob/living/bot/cleanbot/edCLN/handleIdle()
	if(prob(10))
		custom_emote(2, "makes a less than thrilled beeping sound.")
		playsound(src.loc, 'sound/machines/synth_yes.ogg', 50, 0)

	if(red_switch && !blue_switch && !green_switch && prob(10) || src.emagged)
		if(istype(loc, /turf/simulated))
			var/turf/simulated/T = loc
			T.add_blood()

	if(!red_switch && blue_switch && !green_switch && prob(50) || src.emagged)
		if(istype(loc, /turf/simulated))
			var/turf/simulated/T = loc
			visible_message("<span class='notice'>\The [src] squirts a puddle of water on the floor!</span>")
			T.wet_floor()

	if(!red_switch && !blue_switch && green_switch && prob(10) || src.emagged)
		if(istype(loc, /turf/simulated))
			var/turf/simulated/T = loc
			visible_message("<span class='warning'>\The [src] stomps on \the [T], breaking it!</span>")
			qdel(T)

	if(red_switch && blue_switch && green_switch && prob(1))
		src.explode()

/mob/living/bot/cleanbot/edCLN/explode()
	on = 0
	visible_message("<span class='danger'>[src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/item/secbot_assembly/ed209_assembly(Tsec)
	if(prob(50))
		new /obj/item/robot_parts/l_leg(Tsec)
	if(prob(50))
		new /obj/item/robot_parts/r_leg(Tsec)
	if(prob(50))
		if(prob(50))
			new /obj/item/reagent_containers/glass/bucket(Tsec)
		else
			new /obj/item/assembly/prox_sensor(Tsec)

	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/cleanbot/edCLN/ui_data(mob/user)
	var/list/data = ..()
	data["version"] = "v3.0"
	data["rgbpanel"] = TRUE
	data["red_switch"] = red_switch
	data["green_switch"] = green_switch
	data["blue_switch"] = blue_switch
	return data

/mob/living/bot/cleanbot/edCLN/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(..())
		return TRUE

	switch(action)
		if("red_switch")
			red_switch = !red_switch
			to_chat(usr, SPAN_NOTICE("You flip the red switch [red_switch ? "on" : "off"]."))
			. = TRUE

		if("green_switch")
			green_switch = !green_switch
			to_chat(usr, SPAN_NOTICE("You flip the green switch [green_switch ? "on" : "off"]."))
			. = TRUE

		if("blue_switch")
			blue_switch = !blue_switch
			to_chat(usr, SPAN_NOTICE("You flip the blue switch [blue_switch ? "on" : "off"]."))
			. = TRUE

/mob/living/bot/cleanbot/edCLN/emag_act(var/remaining_uses, var/mob/user)
	. = ..()
	if(!emagged)
		if(user)
			to_chat(user, "<span class='notice'>The [src] buzzes and beeps.</span>")
			playsound(src.loc, 'sound/machines/buzzbeep.ogg', 50, 0)
		emagged = 1
		return 1

// Assembly

/obj/item/secbot_assembly/edCLN_assembly
	name = "ED-CLN assembly"
	desc = "Some sort of bizarre assembly."
	icon = 'icons/obj/aibots.dmi'
	icon_state = "ed209_frame"
	item_state = "buildpipe"
	created_name = "ED-CLN Security Robot"

/obj/item/secbot_assembly/edCLN_assembly/attackby(var/obj/item/W as obj, var/mob/user as mob)
	..()

	if(istype(W, /obj/item/pen))
		var/t = sanitizeSafe(input(user, "Enter new robot name", name, created_name), MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && src.loc != usr)
			return
		created_name = t
		return

	switch(build_step)
		if(0, 1)
			if(istype(W, /obj/item/robot_parts/l_leg) || istype(W, /obj/item/robot_parts/r_leg) || (istype(W, /obj/item/organ/external/leg) && ((W.name == "robotic right leg") || (W.name == "robotic left leg"))))
				if(!user.attempt_insert_item_for_installation(W, src))
					return
				build_step++
				to_chat(user, "<span class='notice'>You add \the [W] to \the [src].</span>")
				name = "legs/frame assembly"
				if(build_step == 1)
					icon_state = "ed209_leg"
				else
					icon_state = "ed209_legs"

		if(2)
			if(istype(W, /obj/item/reagent_containers/glass/bucket))
				if(!user.attempt_insert_item_for_installation(W, src))
					return
				build_step++
				to_chat(user, "<span class='notice'>You add \the [W] to \the [src].</span>")
				name = "bucket/legs/frame assembly"
				item_state = "edCLN_bucket"
				icon_state = "edCLN_bucket"

		if(3)
			if(istype(W, /obj/item/weldingtool))
				var/obj/item/weldingtool/WT = W
				if(WT.remove_fuel(0, user))
					build_step++
					name = "bucketed frame assembly"
					to_chat(user, "<span class='notice'>You welded the bucket to \the [src].</span>")
		if(4)
			if(isprox(W))
				if(!user.attempt_insert_item_for_installation(W, src))
					return
				build_step++
				to_chat(user, "<span class='notice'>You add \the [W] to \the [src].</span>")
				name = "proximity bucket ED assembly"
				item_state = "edCLN_prox"
				icon_state = "edCLN_prox"

		if(5)
			if(istype(W, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/C = W
				if (C.get_amount() < 1)
					to_chat(user, "<span class='warning'>You need one coil of wire to wire \the [src].</span>")
					return
				to_chat(user, "<span class='notice'>You start to wire \the [src].</span>")
				if(do_after(user, 40))
					if(C.use(1))
						build_step++
						to_chat(user, "<span class='notice'>You wire the ED-CLN assembly.</span>")
						name = "wired ED-CLN assembly"
				return

		if(6)
			if(istype(W, /obj/item/mop))
				if(!user.attempt_insert_item_for_installation(W, src))
					return
				name = "mop ED-CLN assembly"
				build_step++
				to_chat(user, "<span class='notice'>You add \the [W] to \the [src].</span>")
				item_state = "edCLN_mop"
				icon_state = "edCLN_mop"

		if(7)
			if(W.is_screwdriver())
				playsound(src, W.usesound, 100, 1)
				var/turf/T = get_turf(user)
				to_chat(user, "<span class='notice'>Attatching the mop to the frame...</span>")
				if(do_after(user, 40) && get_turf(user) == T)
					build_step++
					name = "mopped ED-CLN assembly"
					to_chat(user, "<span class='notice'>Mop attached.</span>")

		if(8)
			if(istype(W, /obj/item/cell))
				if(!user.attempt_insert_item_for_installation(W, src))
					return
				build_step++
				to_chat(user, "<span class='notice'>You complete the ED-CLN.</span>")
				var/turf/T = get_turf(src)
				new /mob/living/bot/cleanbot/edCLN(T,created_name)
				qdel(src)
