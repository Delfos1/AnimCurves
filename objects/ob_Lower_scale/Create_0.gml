_w = 500
_h = 500


my_curve = animcurve_create();
my_curve.name = "My_Curve";
var _channels = array_create(1);
_channels[0] = animcurve_channel_new();
_channels[0].name = "alpha";
_channels[0].type = animcurvetype_catmullrom
_channels[0].iterations = 8;
var _points = array_create(3);
_points[0] = animcurve_point_new();
_points[0].posx = 0;
_points[0].value = 0;
_points[1] = animcurve_point_new();
_points[1].posx = 0.5;
_points[1].value = 0.3;
_points[2] = animcurve_point_new();
_points[2].posx = 1;
_points[2].value = 0;
_channels[0].points = _points;
my_curve.channels = _channels;

my_channel = my_curve.channels[0]

show_debug_overlay(true)

dbg_view("Curve Operations",true)


dbg_section("Multiple Curve operations",true)
selected_curve = 0

var _selection_ref = ref_create(self,"selected_curve")
dbg_drop_down(_selection_ref,"Curve1:0,Curve2:1","Select a Curve")

dbg_button("Add", function(){	
var _a =  my_channel
var _b = animcurve_get_channel(ac_1,selected_curve)

_a.points =  animcurve_points_additive(_a,_b)
})

dbg_button("Substract", function(){	
var _a = my_channel //animcurve_get_channel(ac_1,"curve1")
var _b = animcurve_get_channel(ac_1,selected_curve)

_a.points =  animcurve_points_substract(_a,_b)
})

dbg_button("Merge", function(){	
var _a = my_channel //animcurve_get_channel(ac_1,"curve1")
var _b = animcurve_get_channel(ac_1,selected_curve)

_a.points =  animcurve_points_merge(_a.points,_b.points)
})

mix_amount = 0.5
var _mix_ref = ref_create(self,"mix_amount")

dbg_button("Mix", function(){	
var _a = my_channel //animcurve_get_channel(ac_1,"curve1")
var _b = animcurve_get_channel(ac_1,selected_curve)

_a.points =  animcurve_points_mix(_a,_b)
})
	dbg_same_line()
	dbg_slider(_mix_ref,0,1, " ")
dbg_button("Intersect", function(){	
var _a = my_channel //animcurve_get_channel(ac_1,"curve1")
var _b = animcurve_get_channel(ac_1,selected_curve)

_a.points =  animcurve_points_intersect(_a,_b)
})

dbg_section("Single Curve operations",true)

dbg_button("Normalize", function(){	
var _a = my_channel // animcurve_get_channel(ac_1,"curve1")
_a.points = animcurve_points_normalize(_a.points)
})

slice_amount = 2
subdiv_amount = 2
simplify_amount = 0
random_lower = -.02
random_higher =  .02
var _slice_ref = ref_create(self,"slice_amount")
var _subdiv_ref = ref_create(self,"subdiv_amount")
var _simp_ref = ref_create(self,"simplify_amount")

var _rlower_ref = ref_create(self,"random_lower")
var _rhigher_ref = ref_create(self,"random_higher")

dbg_slider(_simp_ref,0,1,"Simplify Threshold")

dbg_button("Simplify", function(){	
var _a = my_channel 

_a.points =  animcurve_simplify(_a.points,simplify_amount)
})

dbg_button("Lucky Simplify", function(){	
var _a = my_channel 

_a.points =  animcurve_simplify(_a.points)
})

dbg_button("Slice", function(){	
var _a = my_channel 

 _a.points = animcurve_points_slice(_a,slice_amount)
})
	dbg_same_line()
	dbg_slider_int(_slice_ref,2,50," ")
	
dbg_button("Subdivide", function(){	
var _a = my_channel 

 _a.points = animcurve_points_subdivide(_a,subdiv_amount)
})
	dbg_same_line()
	dbg_slider_int(_subdiv_ref,2,50," ")
	
dbg_button("Randomize", function(){	
var _a = my_channel 

_a.points = animcurve_points_randomize(_a.points,random_lower,random_higher)
})

	dbg_slider(_rlower_ref,-1,1,"Lower Range")
	dbg_slider(_rhigher_ref,-1,1,"Higher Range")
	
curve_type_catmull = true
//var _ctype_ref = ref_create(self,"curve_type_catmull")
dbg_button("Catmull <-> Linear Interpolation ", function(){	

	curve_type_catmull = !curve_type_catmull
	if curve_type_catmull
	{
		animcurve_change_type(my_channel,animcurvetype_catmullrom,8)
	}else{
		animcurve_change_type(my_channel,animcurvetype_linear,0)
	}
	
})