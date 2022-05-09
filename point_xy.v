module point_xy

import math
import angle

pub const (
	point_xy_zero = PointXY{
		x: 0
		y: 0
	}
)

pub struct PointXY {
pub:
	x f64
	y f64
}

// point_xy create a new PointXY with the given X and Y values
pub fn point_xy(x f64, y f64) PointXY {
	return PointXY{
		x: x
		y: y
	}
}

// add add two PointXY instances together
pub fn add(a PointXY, b PointXY) PointXY {
	return point_xy(a.x + b.x, a.y + b.y)
}

// add add a PointXY to this PointXY
pub fn (a PointXY) add(b PointXY) PointXY {
	return add(a, b)
}

// subtract subtract PointXY a from PointXY b
pub fn subtract(a PointXY, b PointXY) PointXY {
	return point_xy(b.x - a.x, b.y - a.y)
}

// subtract subtract a PointXY from this PointXY
pub fn (a PointXY) subtract(b PointXY) PointXY {
	return subtract(a, b)
}

// in_direction create a new PointXY a given distance away from the base
// point, in the provided direction. a direction of 0 degrees will only
// increase the new point's X value, while a direction of 90 degrees will
// only increase the new point's Y value.
pub fn in_direction(base PointXY, distance f64, angle angle.Angle) PointXY {
	return PointXY{
		x: base.x + (distance * angle.cos())
		y: base.y + (distance * angle.sin())
	}
}

// in_direction create a new PointXY a given distance away from this point,
// in the provided direction. a direction of 0 degrees will only
// increase the new point's X value, while a direction of 90 degrees will
// only increase the new point's Y value.
pub fn (base PointXY) in_direction(distance f64, angle angle.Angle) PointXY {
	return in_direction(base, distance, angle)
}

// distance get the distance between two points
pub fn distance(a PointXY, b PointXY) f64 {
	dx := b.x - a.x
	dy := b.y - a.y

	x := dx * dx
	y := dy * dy

	return math.sqrt(x + y)
}

// distance get how far from this point another point is
pub fn (a PointXY) distance(b PointXY) f64 {
	return distance(a, b)
}

// distance_x get the X distance between two points
pub fn distance_x(a PointXY, b PointXY) f64 {
	return b.x - a.x
}

// distance_x get the X distance between two points
pub fn (a PointXY) distance_x(b PointXY) f64 {
	return distance_x(a, b)
}

// distance_y get the Y distance between two points
pub fn distance_y(a PointXY, b PointXY) f64 {
	return b.y - a.y
}

// distance_y get the Y distance between two points
pub fn (a PointXY) distance_y(b PointXY) f64 {
	return distance_y(a, b)
}

// angle_to get the angle FROM point a TO point b
pub fn angle_to(a PointXY, b PointXY) angle.Angle {
	y := distance_y(a, b)
	x := distance_x(a, b)

	return angle.atan2(y, x)
}

// angle_to get the angle FROM this point TO the provided point
pub fn (a PointXY) angle_to(b PointXY) angle.Angle {
	return angle_to(a, b)
}

// angle_from get the angle TO point a FROM point b
pub fn angle_from(a PointXY, b PointXY) angle.Angle {
	return angle_to(b, a)
}

// angle_from get the angle TO this point FROM the provided point
pub fn (a PointXY) angle_from(b PointXY) angle.Angle {
	return angle_from(a, b)
}

// rotate rotate a point around a center point by a given angle
pub fn rotate(point PointXY, center PointXY, angle angle.Angle) PointXY {
	return in_direction(center, distance(center, point), angle_to(center, point).add(angle))
}

// rotate rotate a point around a center point by a given angle
pub fn (point PointXY) rotate(center PointXY, angle angle.Angle) PointXY {
	return rotate(point, center, angle)
}

// is_near check if two points are near. if the distance between the two points
// is less than or equal to max_distance, the points are considered "near." if
// the distance is greater than max_distance, the points are not near.
pub fn is_near(a PointXY, b PointXY, max_distance f64) bool {
	return distance(a, b) <= max_distance
}

// is_near check if two points are near. if the distance between the two points
// is less than or equal to max_distance, the points are considered "near." if
// the distance is greater than max_distance, the points are not near.
pub fn (a PointXY) is_near(b PointXY, max_distance f64) bool {
	return is_near(a, b, max_distance)
}
