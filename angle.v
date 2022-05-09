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

pub fn new_angle(deg f64, rad f64) Angle {
	return Angle{
		deg: deg
		rad: rad
	}
}

pub fn from_deg(deg f64) Angle {
	return new_angle(deg, math.radians(deg))
}

pub fn from_rad(rad f64) Angle {
	return new_angle(math.degrees(rad), rad)
}

pub fn atan2(y f64, x f64) Angle {
	return from_rad(math.atan2(y, x))
}

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

pub fn fixed_deg(deg f64) Angle {
	return from_deg(fix_deg(deg))
}

pub fn fixed_rad(rad f64) Angle {
	return from_rad(fix_rad(rad))
}

pub fn add(a Angle, b Angle) Angle {
	return fixed_deg(a.deg + b.deg)
}

pub fn subtract(a Angle, b Angle) Angle {
	return fixed_deg(b.deg - a.deg)
}

pub fn (a Angle) fix() Angle {
	return fixed_deg(a.deg)
}

pub fn (a Angle) sin() f64 {
	return math.sin(a.rad)
}

pub fn (a Angle) cos() f64 {
	return math.cos(a.rad)
}

pub fn (a Angle) tan() f64 {
	return math.tan(a.rad)
}

pub fn (a Angle) add(b Angle) Angle {
	return add(a, b)
}

pub fn (a Angle) subtract(b Angle) Angle {
	return subtract(a, b)
}
