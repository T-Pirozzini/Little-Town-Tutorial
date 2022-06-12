/// @description Player movement
// You can write your code in this editor

// check keys for movement
if (global.playerControl == true) {
	moveRight = keyboard_check(vk_right)
	moveLeft = keyboard_check(vk_left)
	moveUp = keyboard_check(vk_up)
	moveDown = keyboard_check(vk_down)
} else {
	moveRight = 0
	moveLeft = 0
	moveUp = 0
	moveDown = 0
}


// calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// if idle
if (vx == 0 && vy == 0) {
	myState = playerState.idle;
};

// if moving
if (vx != 0 || vy != 0) {
	if !collision_point(x+vx,y,obj_par_environment,true,true) {
	x += vx;
	}
	if !collision_point(x,y+vy,obj_par_environment,true,true) {
	y += vy;
	}
	
	// change direction based on movement
	// right
	if (vx > 0) {		
		dir = 0;
	}
	// left
	if (vx < 0) {		
		dir = 2;
	}
	// down
	if (vy > 0) {		
		dir = 3;
	}
	// up
	if (vy < 0) {		
		dir = 1;
	}
	// set state
	myState = playerState.walking;
	
	// move audio listener with me
	audio_listener_set_position(0,x,y,0);
};

// check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
if nearbyNPC {
	// play greeting sound
	if (hasGreeted == false) {
		if (!audio_is_playing(snd_greeting01)) {
		audio_play_sound(snd_greeting01,1,false);
		hasGreeted = true;
		}
	}
	// pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined) {
		npcPrompt = scr_showPrompt(nearbyNPC,nearbyNPC.x,nearbyNPC.y-450);
	}
	show_debug_message("obj_player has found an NPC!");
	}
if !nearbyNPC {
	// reset greeting
	if (hasGreeted == true) {
		hasGreeted = false;
	}
	// get rid of prompt
	scr_dismissPrompt(npcPrompt,0);	
	show_debug_message("obj_player hasn't found anything!");
	}

// check for collision with NPCs
nearbyItem = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_item,false,true);
if (nearbyItem) { 
	// pop up prompt
	if (itemPrompt == noone || itemPrompt == undefined) {
		show_debug_message("obj_player has found an item!");
		itemPrompt = scr_showPrompt(nearbyItem,nearbyItem.x,nearbyItem.y-300);
		}
	}
if (!nearbyItem) { 
	// Get rid of prompt
	scr_dismissPrompt(itemPrompt,1);
	}
	
// depth sorting
depth =- y;
