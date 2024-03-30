08-MARCH-2024

Welcome to the Animation Curves function library!

GameMaker 2024.2 required as this version fixes several issues with animation curves.

Inside the sample project there is a debug menu where you can try out the different available functions. There are operations that require two curves.
In some cases you need to provide a channel as an argument, in others just a set of points.

The functions provided to add and remove points will make sure that the array remains viable for animation curves.
If there is any function you would like to see you can look me up as Delfos in the main GameMaker Discord server or in the GameMaker Kitchen server.

Enjoy!

Functions included :

Basic functions

* animcurve_channel_exists (By attic-stuff) : verify if a specific channel exists in a curve
* animcurve_really_exists : verify if the animation curve exists without crashing the game
* animcurve_really_create : Create an animation curve with all its contents. Admits a struct as an argument to name channels
* animcurve_channel_copy : Copy a channel from one curve to another curve, or duplicate it into the same curve.
* animcurve_points_set : Set the points of a given channel.
* animcurve_change_type : Change type and resolution of the curve. Can't do Bezier as GameMaker doesn't expose the data required.

* animcurve_point_add : Takes an array of animation curve points and adds a point to it.
* animcurve_point_remove :  Takes an array of animation curve points and removes a point from it
* animcurve_point_find_closest : Takes an array of animation curve points and finds the closest point index to the provided x position. Returns an index
* animcurve_point_remove_closest : akes an array of animation curve points and deletes the point that is closest to the provided x position.

* draw_animcurve : Draws the animation curve

Operations on Single Curves

* animcurve_points_normalize : Takes an array of animation curve points and changes their values so the lower is 0 and the highest is 1. Returns a new array of points
* animcurve_points_randomize : Takes an array of animation curve points and changes their values randomly between two values. Returns a new array of points
* animcurve_points_slice : Add points to a points array evenly throughout the desired section. Returns a new array of points
* animcurve_points_subdivide : Subdivide between the points of an array of points. Returns a new array of points
* animcurve_simplify : Simplifies an animation curve based on an epsilon value from 0 to 1. 0 = no simplification 1 = Complete simplification. Its an implementation of the Ramer–Douglas–Peucker algorithm.

Operations between curves

* animcurve_points_intersect : Intersects two animation curve channels. Returns an array representing the overlap on the positive side.
* animcurve_points_additive : The values from two channels are added from eachother. Returns an array of points
* animcurve_points_substract : The values from two channels are substracted from eachother. Returns an array of points
* animcurve_points_mix : Mixes two animation curve channels, lerping between them. Returns an array of points
* animcurve_points_merge : Merges two sets of animation curve points, where all points are mantained as-is unless they overlap. Returns an array of points

