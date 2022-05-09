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

pub fn point_xy(x f64, y f64) PointXY {
	return PointXY{
		x: x
		y: y
	}
}

pub fn add(a PointXY, b PointXY) PointXY {
	return point_xy(a.x + b.x, a.y + b.y)
}

pub fn (a PointXY) add(b PointXY) PointXY {
	return add(a, b)
}

pub fn subtract(a PointXY, b PointXY) PointXY {
	return point_xy(b.x - a.x, b.y - a.y)
}

pub fn (a PointXY) subtract(b PointXY) PointXY {
	return subtract(a, b)
}

pub fn in_direction(base PointXY, distance f64, angle angle.Angle) PointXY {
	return PointXY{
		x: base.x + (distance * angle.cos())
		y: base.y + (distance * angle.sin())
	}
}

pub fn (base PointXY) in_direction(distance f64, angle angle.Angle) PointXY {
	return in_direction(base, distance, angle)
}

pub fn distance(a PointXY, b PointXY) f64 {
	dx := b.x - a.x
	dy := b.y - a.y

	x := dx * dx
	y := dy * dy

	return math.sqrt(x + y)
}

pub fn (a PointXY) distance(b PointXY) f64 {
	return distance(a, b)
}

pub fn distance_x(a PointXY, b PointXY) f64 {
	return b.x - a.x
}

pub fn (a PointXY) distance_x(b PointXY) f64 {
	return distance_x(a, b)
}

pub fn distance_y(a PointXY, b PointXY) f64 {
	return b.y - a.y
}

pub fn (a PointXY) distance_y(b PointXY) f64 {
	return distance_y(a, b)
}

pub fn angle_to(a PointXY, b PointXY) angle.Angle {
	y := distance_y(a, b)
	x := distance_x(a, b)

	return angle.atan2(y, x)
}

pub fn (a PointXY) angle_to(b PointXY) angle.Angle {
	return angle_to(a, b)
}

pub fn angle_from(a PointXY, b PointXY) angle.Angle {
	return angle_to(b, a)
}

pub fn (a PointXY) angle_from(b PointXY) angle.Angle {
	return angle_from(a, b)
}

pub fn rotate(point PointXY, center PointXY, angle angle.Angle) PointXY {
	return in_direction(center, distance(center, point), angle_to(center, point).add(angle))
}

pub fn (point PointXY) rotate(center PointXY, angle angle.Angle) PointXY {
	return rotate(point, center, angle)
}

pub fn is_near(a PointXY, b PointXY, max_distance f64) bool {
	return distance(a, b) <= max_distance
}

pub fn (a PointXY) is_near(b PointXY, max_distance f64) bool {
	return is_near(a, b, max_distance)
}
