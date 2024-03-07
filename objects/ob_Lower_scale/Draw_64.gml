// Draw Box
draw_set_color(c_white)

draw_rectangle(x,ob_Upper_scale.y,ob_Upper_scale.x,y,true)

// Draw Selected Curve
var _channel = animcurve_get_channel(ac_1,selected_curve)

draw_animcurve(_channel,c_blue,x,y,_w,_h)

// Draw Base Curve
_channel = animcurve_get_channel(my_curve,"alpha")

draw_animcurve(_channel,c_red,x,y,_w,_h)