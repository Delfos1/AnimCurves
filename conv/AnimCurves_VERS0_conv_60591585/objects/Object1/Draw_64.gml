// Box Dimensions
var _w = 500
var _h = 300
var _x0 = x
var _y0 = y

draw_set_color(c_white)

draw_rectangle(_x0,_y0-_h,_x0+_w,_y0,true)

draw_set_color(c_blue)
var _curve = animcurve_get_channel(ac_1,"curve1")
var points = _curve.points

for(var i = 0 ; i< array_length(points) ; i++)
{
	var _x = (points[i].posx * _w)+_x0
	var _y = (points[i].value * -_h)+_y0
	draw_circle(_x,_y,3,false)
	if i+1< array_length(points)
	{
		var _x1 = (points[i+1].posx * _w)+_x0
		var _y1 = (points[i+1].value * -_h)+_y0
		draw_line(_x,_y,_x1,_y1)
	}
}

draw_set_color(c_red)
var _curve = animcurve_get_channel(my_curve,"alpha")
var points = _curve.points

for(var i = 0 ; i< array_length(points) ; i++)
{
	var _x = (points[i].posx * _w)+_x0
	var _y = (points[i].value * -_h)+_y0
	draw_circle(_x,_y,3,false)
	if i+1< array_length(points)
	{
		var _x1 = (points[i+1].posx * _w)+_x0
		var _y1 = (points[i+1].value * -_h)+_y0
		draw_line(_x,_y,_x1,_y1)
	}
}