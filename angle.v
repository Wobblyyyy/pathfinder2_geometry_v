module angle

import math

pub const (
	pi         = 3.14159265359
	angle_zero = Angle{
		deg: 0
		rad: 0
	}
	min_deg = 0.0
	max_deg = 360.0
	min_rad = 0.0
	max_rad = pi * 2
)

pub struct Angle {
pub:
	deg f64
	rad f64
}

// new_angle create a new angle
pub fn new_angle(deg f64, rad f64) Angle {
	return Angle{
		deg: deg
		rad: rad
	}
}

// from_deg create a new angle based on that angle's degrees value
pub fn from_deg(deg f64) Angle {
	return new_angle(deg, math.radians(deg))
}

// from_rad create a new angle based on the angle's radians value
pub fn from_rad(rad f64) Angle {
	return new_angle(math.degrees(rad), rad)
}

// atan2 create a new angle using math.atan2
pub fn atan2(y f64, x f64) Angle {
	return from_rad(math.atan2(y, x))
}

// fix_deg make sure a degree value is greater than or equal to 0 and less
// than or equal to 360
pub fn fix_deg(deg f64) f64 {
	mut ret := deg

	for ret > angle.max_deg {
		ret -= angle.max_deg
	}

	for ret < angle.min_deg {
		ret += angle.max_deg
	}

	return ret
}

// fix_rad make sure a radian value is greater than or equal to 0 and less
// than or equal to 2 * pi
pub fn fix_rad(rad f64) f64 {
	mut ret := rad

	for ret > angle.max_rad {
		ret -= angle.max_rad
	}

	for ret < angle.min_rad {
		ret += angle.max_rad
	}

	return ret
}

// fixed_deg create a new angle by fixing a provided degree value
pub fn fixed_deg(deg f64) Angle {
	return from_deg(fix_deg(deg))
}

// fixed_rad create a new angle by fixing a provided radian value
pub fn fixed_rad(rad f64) Angle {
	return from_rad(fix_rad(rad))
}

// add add two angles together and fix the result
pub fn add(a Angle, b Angle) Angle {
	return fixed_deg(a.deg + b.deg)
}

// subtract angle b from angle a and fix the result
pub fn subtract(a Angle, b Angle) Angle {
	return fixed_deg(b.deg - a.deg)
}

// fix fix an angle
pub fn (a Angle) fix() Angle {
	return fixed_deg(a.deg)
}

// sin get the sine of this angle
pub fn (a Angle) sin() f64 {
	return math.sin(a.rad)
}

// cos get the cosine of this angle
pub fn (a Angle) cos() f64 {
	return math.cos(a.rad)
}

// tan get the tangent of this angle
pub fn (a Angle) tan() f64 {
	return math.tan(a.rad)
}

// add add two angles together
pub fn (a Angle) add(b Angle) Angle {
	return add(a, b)
}

// subtract subtract an angle from this angle
pub fn (a Angle) subtract(b Angle) Angle {
	return subtract(a, b)
}
