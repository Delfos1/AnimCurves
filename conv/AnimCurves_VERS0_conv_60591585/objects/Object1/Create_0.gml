// This works fine

my_curve = animcurve_create();
my_curve.name = "My_Curve";
var _channels = array_create(1);
_channels[0] = animcurve_channel_new();
_channels[0].name = "alpha";
_channels[0].type = animcurvetype_catmullrom;
_channels[0].iterations = 8;
var _points = array_create(3);
_points[0] = animcurve_point_new();
_points[0].posx = 0;
_points[0].value = 0;
_points[1] = animcurve_point_new();
_points[1].posx = 0.5;
_points[1].value = 1;
_points[2] = animcurve_point_new();
_points[2].posx = 1;
_points[2].value = 0;
_channels[0].points = _points;
my_curve.channels = _channels;

//This loses the var _channels2 reference (or _points2) and crashes the game
/*
my_curve2 = animcurve_get(ac_1)
my_curve.name = "My_Curve";
var _channels2= array_create(1);
_channels2[0] = animcurve_channel_new();
_channels2[0].name = "curve1";
_channels2[0].type = animcurvetype_catmullrom;
_channels2[0].iterations = 8;
var _points2 = array_create(3);
_points2[0] = animcurve_point_new();
_points2[0].posx = 0;
_points2[0].value = 0;
_points2[1] = animcurve_point_new();
_points2[1].posx = 0.5;
_points2[1].value = 1;
_points2[2] = animcurve_point_new();
_points2[2].posx = 1;
_points2[2].value = 0;
_channels2[0].points = _points2;
my_curve2.channels = _channels2;