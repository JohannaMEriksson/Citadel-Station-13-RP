/*
	Earmuffs
*/
/obj/item/clothing/ears/earmuffs
	name = "earmuffs"
	desc = "Protects your hearing from loud noises, and quiet ones as well."
	icon_state = "earmuffs"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "earmuffs", SLOT_ID_LEFT_HAND = "earmuffs")
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	ear_protection = 2

/obj/item/clothing/ears/earmuffs/headphones
	name = "headphones"
	desc = "Unce unce unce unce."
	var/headphones_on = 0
	icon_state = "headphones_off"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "headphones", SLOT_ID_LEFT_HAND = "headphones")
	slot_flags = SLOT_EARS
	ear_protection = 0

/obj/item/clothing/ears/earmuffs/headphones/verb/togglemusic()
	set name = "Toggle Headphone Music"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	var/base_icon = copytext(icon_state,1,(length(icon_state) - 3 + headphones_on))

	if(headphones_on)
		icon_state = "[base_icon]_off"
		headphones_on = 0
		to_chat(usr, "<span class='notice'>You turn the music off.</span>")
	else
		icon_state = "[base_icon]_on"
		headphones_on = 1
		to_chat(usr, "<span class='notice'>You turn the music on.</span>")

	update_worn_icon()

/obj/item/clothing/ears/earmuffs/headphones/AltClick(mob/user)
	if(!Adjacent(user))
		return
	else if(!headphones_on)
		togglemusic()
	else
		togglemusic()
/*
	Skrell tentacle wear
*/
/obj/item/clothing/ears/skrell
	name = "skrell tentacle wear"
	desc = "Some stuff worn by skrell to adorn their head tentacles."
	icon = 'icons/obj/clothing/ears.dmi'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = SLOT_EARS

/obj/item/clothing/ears/skrell/chain
	name = "Gold headtail chains"
	desc = "A delicate golden chain worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg5", SLOT_ID_LEFT_HAND = "egg5")
	drop_sound = 'sound/items/drop/accessory.ogg'
	pickup_sound = 'sound/items/pickup/accessory.ogg'

/obj/item/clothing/ears/skrell/chain/silver
	name = "Silver headtail chains"
	desc = "A delicate silver chain worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain_sil"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg", SLOT_ID_LEFT_HAND = "egg")
	drop_sound = 'sound/items/drop/accessory.ogg'
	pickup_sound = 'sound/items/pickup/accessory.ogg'

/obj/item/clothing/ears/skrell/chain/bluejewels
	name = "Blue jeweled golden headtail chains"
	desc = "A delicate golden chain adorned with blue jewels worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain_bjewel"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/skrell/chain/redjewels
	name = "Red jeweled golden headtail chains"
	desc = "A delicate golden chain adorned with red jewels worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain_rjewel"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg4", SLOT_ID_LEFT_HAND = "egg4")

/obj/item/clothing/ears/skrell/chain/ebony
	name = "Ebony headtail chains"
	desc = "A delicate ebony chain worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain_ebony"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg6", SLOT_ID_LEFT_HAND = "egg6")

/obj/item/clothing/ears/skrell/band
	name = "Gold headtail bands"
	desc = "Golden metallic bands worn by male skrell to adorn their head tails."
	icon_state = "skrell_band"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg5", SLOT_ID_LEFT_HAND = "egg5")

/obj/item/clothing/ears/skrell/band/silver
	name = "Silver headtail bands"
	desc = "Silver metallic bands worn by male skrell to adorn their head tails."
	icon_state = "skrell_band_sil"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg", SLOT_ID_LEFT_HAND = "egg")

/obj/item/clothing/ears/skrell/band/bluejewels
	name = "Blue jeweled golden headtail bands"
	desc = "Golden metallic bands adorned with blue jewels worn by male skrell to adorn their head tails."
	icon_state = "skrell_band_bjewel"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/skrell/band/redjewels
	name = "Red jeweled golden headtail bands"
	desc = "Golden metallic bands adorned with red jewels worn by male skrell to adorn their head tails."
	icon_state = "skrell_band_rjewel"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg4", SLOT_ID_LEFT_HAND = "egg4")

/obj/item/clothing/ears/skrell/band/ebony
	name = "Ebony headtail bands"
	desc = "Ebony bands worn by male skrell to adorn their head tails."
	icon_state = "skrell_band_ebony"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg6", SLOT_ID_LEFT_HAND = "egg6")

/obj/item/clothing/ears/skrell/colored/band
	name = "Colored headtail bands"
	desc = "Metallic bands worn by male skrell to adorn their head tails."
	icon_state = "skrell_band_sil"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg", SLOT_ID_LEFT_HAND = "egg")

/obj/item/clothing/ears/skrell/colored/chain
	name = "Colored headtail chains"
	desc = "A delicate chain worn by female skrell to decorate their head tails."
	icon_state = "skrell_chain_sil"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg", SLOT_ID_LEFT_HAND = "egg")

/obj/item/clothing/ears/skrell/cloth_female
	name = "red headtail cloth"
	desc = "A cloth shawl worn by female skrell draped around their head tails."
	icon_state = "skrell_cloth_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg4", SLOT_ID_LEFT_HAND = "egg4")

/obj/item/clothing/ears/skrell/cloth_female/black
	name = "black headtail cloth"
	icon_state = "skrell_cloth_black_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg6", SLOT_ID_LEFT_HAND = "egg6")

/obj/item/clothing/ears/skrell/cloth_female/blue
	name = "blue headtail cloth"
	icon_state = "skrell_cloth_blue_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/skrell/cloth_female/green
	name = "green headtail cloth"
	icon_state = "skrell_cloth_green_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg3", SLOT_ID_LEFT_HAND = "egg3")

/obj/item/clothing/ears/skrell/cloth_female/pink
	name = "pink headtail cloth"
	icon_state = "skrell_cloth_pink_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg1", SLOT_ID_LEFT_HAND = "egg1")

/obj/item/clothing/ears/skrell/cloth_female/lightblue
	name = "light blue headtail cloth"
	icon_state = "skrell_cloth_lblue_female"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/skrell/cloth_male
	name = "red headtail cloth"
	desc = "A cloth band worn by male skrell around their head tails."
	icon_state = "skrell_cloth_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg4", SLOT_ID_LEFT_HAND = "egg4")

/obj/item/clothing/ears/skrell/cloth_male/black
	name = "black headtail cloth"
	icon_state = "skrell_cloth_black_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg6", SLOT_ID_LEFT_HAND = "egg6")

/obj/item/clothing/ears/skrell/cloth_male/blue
	name = "blue headtail cloth"
	icon_state = "skrell_cloth_blue_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/skrell/cloth_male/green
	name = "green headtail cloth"
	icon_state = "skrell_cloth_green_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg3", SLOT_ID_LEFT_HAND = "egg3")

/obj/item/clothing/ears/skrell/cloth_male/pink
	name = "pink headtail cloth"
	icon_state = "skrell_cloth_pink_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg1", SLOT_ID_LEFT_HAND = "egg1")

/obj/item/clothing/ears/skrell/cloth_male/lightblue
	name = "light blue headtail cloth"
	icon_state = "skrell_cloth_lblue_male"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "egg2", SLOT_ID_LEFT_HAND = "egg2")

/obj/item/clothing/ears/laurel
	name = "laurel wreath"
	desc = "A dark green laurel wreath that's worn tight around the head."
	icon = 'icons/obj/clothing/ears.dmi'
	icon_state = "laurel"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = SLOT_EARS
	drop_sound = 'sound/items/drop/wrapper.ogg'
	pickup_sound = 'sound/items/drop/wrapper.ogg'

/obj/item/clothing/ears/laurel/silver
	name = "silver laurel wreath"
	desc = "A laurel wreath made of silver that's worn tight around the head."
	icon_state = "laurel_s"
	slot_flags = SLOT_EARS
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/clothing/ears/laurel/gold
	name = "golden laurel wreath"
	desc = "A laurel wreath made of gold that's worn tight around the head."
	icon_state = "laurel_g"
	slot_flags = SLOT_EARS
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'
