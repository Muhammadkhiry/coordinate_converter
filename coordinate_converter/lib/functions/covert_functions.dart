import 'dart:math';

// --------------------------------------------------
// Converting from Cartesian to Spherical & Cylindrical
// --------------------------------------------------
Map<String, String> converterFromCartesian({
  required double x,
  required double y,
  required double z,
}) {
  double r = sqrt(x * x + y * y + z * z);
  double theta = acos(z / r);
  double phi = atan2(y, x);

  return {
    "cartesian": "($x, $y, $z)",
    "spherical":
        "(r = ${r.toStringAsFixed(3)}, θ = ${(theta * 180 / pi).toStringAsFixed(3)}°, φ = ${(phi * 180 / pi).toStringAsFixed(3)}°)",
    "cylindrical":
        "(ρ = ${sqrt(x * x + y * y).toStringAsFixed(3)}, φ = ${(phi * 180 / pi).toStringAsFixed(3)}°, z = $z)",
  };
}

// --------------------------------------------------
// Converting from Spherical to Cartesian & Cylindrical
// --------------------------------------------------
Map<String, String> converterFromSpherical({
  required double r,
  required double thetaDeg,
  required double phiDeg,
}) {
  double theta = thetaDeg * pi / 180; // convert to radians
  double phi = phiDeg * pi / 180;

  double x = r * sin(theta) * cos(phi);
  double y = r * sin(theta) * sin(phi);
  double z = r * cos(theta);

  return {
    "spherical":
        "(r = $r, θ = ${thetaDeg.toStringAsFixed(3)}°, φ = ${phiDeg.toStringAsFixed(3)}°)",
    "cartesian":
        "(x = ${x.toStringAsFixed(3)}, y = ${y.toStringAsFixed(3)}, z = ${z.toStringAsFixed(3)})",
    "cylindrical":
        "(ρ = ${(r * sin(theta)).toStringAsFixed(3)}, φ = ${phiDeg.toStringAsFixed(3)}°, z = ${z.toStringAsFixed(3)})",
  };
}

// --------------------------------------------------
// Converting from Cylindrical to Cartesian & Spherical
// --------------------------------------------------
Map<String, String> converterFromCylindrical({
  required double rho,
  required double phiDeg,
  required double z,
}) {
  double phi = phiDeg * pi / 180;

  double x = rho * cos(phi);
  double y = rho * sin(phi);
  double r = sqrt(rho * rho + z * z);
  double theta = atan(rho / z);

  return {
    "cylindrical": "(ρ = $rho, φ = ${phiDeg.toStringAsFixed(3)}°, z = $z)",
    "cartesian":
        "(x = ${x.toStringAsFixed(3)}, y = ${y.toStringAsFixed(3)}, z = $z)",
    "spherical":
        "(r = ${r.toStringAsFixed(3)}, θ = ${(theta * 180 / pi).toStringAsFixed(3)}°, φ = ${phiDeg.toStringAsFixed(3)}°)",
  };
}
