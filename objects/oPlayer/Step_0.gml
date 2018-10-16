spd = 4;
sprite_index = sPlayerRun;
if(distance_to_point(dest_x,dest_y)<=0.01) {
	spd = 0;
	sprite_index = sPlayerStop;
	return;
}

//Speed
var dx = lengthdir_x(spd,point_direction(x,y,dest_x,dest_y));
var dy = lengthdir_y(spd,point_direction(x,y,dest_x,dest_y));

x += dx;
y += dy;

//Collision
if(place_meeting(x,y,oWall)) {
	if(abs(dy) > abs(dx)) {
		//vertical collision
		y -= dy;
	} else {
		x -= dx;
	}
}

if(place_meeting(x,y,oRedDoor) and !from_blue) {
	x = oBlueDoor.x;
	y = oBlueDoor.y;
	dest_x = x;
	dest_y = y;
	from_red = true;
}
if(place_meeting(x,y,oBlueDoor) and !from_red) {
	x = oRedDoor.x;
	y = oRedDoor.y;
	dest_x = x;
	dest_y = y;
	from_blue = true;
}
if(from_red && !place_meeting(x,y,oBlueDoor)) {
	from_red = false;
}
if(from_blue && !place_meeting(x,y,oRedDoor)) {
	from_blue = false;
}
