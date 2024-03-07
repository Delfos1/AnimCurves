// This should insert a new channel in the curve
animcurve_channel_copy(ac_1,"curve1",ac_1,"curve3")

var _b = animcurve_get_channel(ac_1,"curve3")
var _c = animcurve_points_normalize(_b.points)
_b.points = _c