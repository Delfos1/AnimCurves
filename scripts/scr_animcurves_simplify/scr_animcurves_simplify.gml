//feather ignore all
function animcurve_simplify(_points,_epsilon){

	var _start = 0
	var _end = array_length(_points)-1
	var simple_point_list = []

	animcurve_point_add(simple_point_list,_points[_start].posx	,_points[_start].value)
	animcurve_point_add(simple_point_list,_points[_end].posx	,_points[_end].value)
	
	simple_point_list = animcurve_points_merge(simple_point_list,__simplify_step(_points,_epsilon,_start,_end))
	
	return simple_point_list
}
function __simplify_step(_points,_epsilon,_start,_end)
{
		static pointToLineDistance = function (x1,y1,x2,y2,x3,y3){
			static vector_length = function(_vec)
			{
				return sqrt(sqr(_vec[0])+sqr(_vec[1]))
			}
		// dot product of normalized AB and AP. AB being the original line and AP the vector from point A to the point we want to know.
		// this is the projection on AB of the distance to point P

		//define AB vector
		var _ABvec = [(x3-x2),(y3-y2)]

		// define AP vector
		var _APvec = [(x1-x2),(y1-y2)]

		var _ABlength = vector_length(_ABvec)
		var _APlength = vector_length(_APvec)
		
		_ABvec = [_ABvec[0]/_ABlength,_ABvec[1]/_ABlength]

		var _l = dot_product(_APvec[0],_APvec[1],_ABvec[0],_ABvec[1])
	
		return sqrt(sqr(_APlength)-sqr(_l))
	};
		var _maxDist = -1
		var _maxIndex = -1

		var point_list = []
			animcurve_point_add(point_list,_points[_start].posx	,_points[_start].value)
			animcurve_point_add(point_list,_points[_end].posx	,_points[_end].value)	
			
		// Go through all points to find the point that is furthest from the line between A and B
		for(var _i = _start ; _i< _end ;_i++)
		{
			var _d = pointToLineDistance(	_points[_i].posx		,_points[_i].value,
											_points[_start].posx	,_points[_start].value,
											_points[_end].posx	,_points[_end].value)
			if _d > _maxDist
			{
				  _maxDist =	_d
				 _maxIndex = _i
				 var _posx = _points[_i].posx ,	
				 _value = _points[_i].value
			}
		}

		// If the point is further than epsilon, add it to the collection and try again between left and right sides of the point
	    if (_maxDist > _epsilon)
		{
			animcurve_point_add(point_list,_posx,_value);
	        if (_maxIndex - _start > 1)
			{
				point_list = animcurve_points_merge(point_list, __simplify_step(_points,_epsilon,_start,_maxIndex))//recursion from start to index
			}
	        if (_end - _maxIndex > 1)
			{
				point_list = animcurve_points_merge(point_list,__simplify_step(_points,_epsilon,_maxIndex,_end))// recursion from index to end
			}
	    }
		return  point_list
	}