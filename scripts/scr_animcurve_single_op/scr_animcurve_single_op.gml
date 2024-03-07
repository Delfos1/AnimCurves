/**
 * Takes an array of animation curve points and changes their values so the lower is 0 and the highest is 1. Returns a new array of points
 * @param { Array} _points The array of animation curve points to normalize
 * @return {Array}
 */
function animcurve_points_normalize(_points)
{
	var _i = 0,
	_min = _points[0].value,
	_max = _points[0].value,
	_length =array_length(_points)
	repeat(_length)
	{
		if _points[_i].value > _max
		{
			_max = _points[_i].value
		} else if _points[_i].value < _min
		{	
			_min = _points[_i].value
		}
		_i +=1
	}
	_min *= -1
	var _d = 1/(_max + _min)
	
	_i=0
	
	var _new_points = []
	repeat(_length)
	{
		var _value = (_points[_i].value + _min)*_d
		animcurve_point_add(_new_points,_points[_i].posx ,_value)

		_i +=1
	}
	
	return _new_points
}

/**
 * Takes an array of animation curve points and changes their values randomly between two values. Returns a new array of points
 * @param { Array} _points The array of animation curve points to be changed
 * @param { real} _lower_range  The low end of the range from which the random number will be selected.
 * @param { real} _higher_range The high end of the range from which the random number will be selected.
 * @return {Array}
 */
function animcurve_points_randomize(_points,_lower_range,_higher_range)
{
	var _i = 0,
	_length =array_length(_points)

	var _new_points = []
	repeat(_length)
	{
		var _value = _points[_i].value + random_range(_lower_range,_higher_range)
		animcurve_point_add(_new_points,_points[_i].posx ,_value)

		_i +=1
	}
	
	return _new_points
}


/**
 * Add points to a points array evenly throughout the desired section. Returns a new array of points
 * @param {Struct} _channel_src The channel as returned by animcurve_get_channel()
 * @param {Real} _amount Amount of subdivisions
 * @param {Real} _start Start the subdivisions from this x (0 to 1)
 * @param {Real} _end Make subdivisions until this x (0 to 1)
 * @return {Array}
 */
function animcurve_points_slice(_channel_src,_amount,_start=0,_end=1) 
{
	if _amount < 2 return _channel_src.points
	
	var _incr		= (_end-_start)/floor(_amount)
	var _points		= _channel_src.points
	for(var _pos = _start ; _pos < _end ; _pos += _incr )
	{
		animcurve_point_add(_points,_pos , animcurve_channel_evaluate(_channel_src,_pos),false)
	}

	return _points
}
