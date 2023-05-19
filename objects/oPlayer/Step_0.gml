left_Key = keyboard_check(vk_left) || keyboard_check(ord("A"));
right_Key = keyboard_check(vk_right) || keyboard_check(ord("D"));
//no_Key = keyboard_check(vk_nokey);
action_Key = keyboard_check(ord("Z"));
reset_Key = keyboard_check(ord("R"));

var _inst = instance_place(x, y, oManipulate);
var _collide = place_meeting(x, y, oManipulate);

#region player movement
moveX = right_Key - left_Key

if moveX < 0 {
	image_xscale = -1;
}

if moveX > 0 {
	image_xscale = 1;
}

if _collide {
	moveX = 0;
}

x += moveX;
#endregion

if reset_Key {
	game_restart();
}

//Player can destroy child of oManipulate if the sprites collision mask are touching.
if _inst != noone && action_Key {
	instance_destroy(_inst);
}
