/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 28801E22
/// @DnDArgument : "code" "#region //Player input$(13_10)$(13_10)if (hascontrol)$(13_10){$(13_10)key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));$(13_10)key_right =	keyboard_check(vk_right) || keyboard_check(ord("D"));$(13_10)key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("F"));$(13_10)$(13_10)if (key_left) || (key_right) || (key_jump)$(13_10){$(13_10)	controller = 0;	$(13_10)	$(13_10)}	$(13_10)$(13_10)if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)$(13_10){$(13_10)	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));$(13_10)	key_right = max(gamepad_axis_value(0,gp_axislh),0);$(13_10)	controller = 1;$(13_10)}$(13_10)$(13_10)if (gamepad_button_check_pressed(0,gp_face1))$(13_10){$(13_10)	key_jump = 1;$(13_10)	controller = 1;$(13_10)}$(13_10)}$(13_10)else$(13_10){$(13_10)	key_right = 0;$(13_10)	key_left = 0;$(13_10)	key_jump = 0;$(13_10)	$(13_10)}$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region //Calculate Movement$(13_10)var move = key_right - key_left;$(13_10)$(13_10)hsp = move * walksp;$(13_10)$(13_10)vsp = vsp + grv;$(13_10)$(13_10)if (place_meeting(x,y+1,oWall)) && (key_jump)$(13_10){$(13_10)	vsp = -7;	$(13_10)}$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region //Horizontal Collision$(13_10)if (place_meeting(x+hsp,y,oWall))$(13_10){$(13_10)	while (!place_meeting(x+sign(hsp),y,oWall))$(13_10)	{$(13_10)		x = x + sign(hsp);$(13_10)	}	$(13_10)	hsp = 0;$(13_10)}$(13_10)x = x + hsp;$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region//Vertical Collision$(13_10)if (place_meeting(x,y+vsp,oWall))$(13_10){$(13_10)	while (!place_meeting(x,y+sign(vsp),oWall))$(13_10)	{$(13_10)		y = y + sign(vsp);$(13_10)	}	$(13_10)	vsp = 0;$(13_10)}$(13_10)$(13_10)y = y + vsp;$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region //Animation$(13_10)if (!place_meeting(x,y+1,oWall))$(13_10){$(13_10)	sprite_index = sPlayerA;$(13_10)	image_speed = 0$(13_10)	if (sign(vsp) > 0) image_index = 1; else image_index = 0;	$(13_10)}$(13_10)else$(13_10){$(13_10)	image_speed = 1;$(13_10)	if (hsp == 0)$(13_10)	{$(13_10)		sprite_index = sPlayer;$(13_10)	}	$(13_10)	else$(13_10)	{$(13_10)		sprite_index = sPlayerR;$(13_10)	}$(13_10)}$(13_10)$(13_10)if (hsp != 0) image_xscale = sign(hsp);$(13_10)#endregion$(13_10)"
#region //Player input

if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right =	keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("F"));

if (key_left) || (key_right) || (key_jump)
{
	controller = 0;	
	
}	

if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
{
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_jump = 1;
	controller = 1;
}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	
}

#endregion

#region //Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;	
}

#endregion

#region //Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}	
	hsp = 0;
}
x = x + hsp;

#endregion

#region//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}	
	vsp = 0;
}

y = y + vsp;

#endregion

#region //Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;	
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}	
	else
	{
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 545F9545
var l545F9545_0;
l545F9545_0 = keyboard_check_pressed(vk_space);
if (l545F9545_0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 7479BC81
	/// @DnDParent : 545F9545
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-4"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += -4;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 3811E2E3
/// @DnDArgument : "key" "vk_left"
var l3811E2E3_0;
l3811E2E3_0 = keyboard_check(vk_left);
if (l3811E2E3_0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 1FB44E7F
	/// @DnDParent : 3811E2E3
	/// @DnDArgument : "x" "-4"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "0"
	/// @DnDArgument : "y_relative" "1"
	x += -4;
	y += 0;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 3C00AD8E
/// @DnDArgument : "key" "vk_right"
var l3C00AD8E_0;
l3C00AD8E_0 = keyboard_check(vk_right);
if (l3C00AD8E_0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 6CB73873
	/// @DnDParent : 3C00AD8E
	/// @DnDArgument : "x" "4"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "0"
	/// @DnDArgument : "y_relative" "1"
	x += 4;
	y += 0;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 60CC3100
/// @DnDArgument : "key" "vk_up"
var l60CC3100_0;
l60CC3100_0 = keyboard_check(vk_up);
if (l60CC3100_0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 06D770E3
	/// @DnDParent : 60CC3100
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-4"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += -4;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 258C231E
/// @DnDArgument : "key" "vk_down"
var l258C231E_0;
l258C231E_0 = keyboard_check(vk_down);
if (l258C231E_0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 66BC75EC
	/// @DnDParent : 258C231E
	/// @DnDArgument : "x" "0"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "4"
	/// @DnDArgument : "y_relative" "1"
	x += 0;
	y += 4;
}