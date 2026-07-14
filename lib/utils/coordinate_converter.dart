import 'dart:math';

import 'package:coordinate_converter/models/coordinate_result.dart';

class CoordinateConverter {
  const CoordinateConverter._();

  static CoordinateResult convertFromCartesian({
    required double x,
    required double y,
    required double z,
  }) {
    final double r = sqrt(x * x + y * y + z * z);

    if (r == 0) {
      return const CoordinateResult(
        cartesian: "(0, 0, 0)",
        spherical: "(r = 0, θ = 0°, φ = 0°)",
        cylindrical: "(ρ = 0, φ = 0°, z = 0)",
      );
    }

    final double theta = acos(z / r);
    final double phi = atan2(y, x);
    final double rho = sqrt(x * x + y * y);

    return CoordinateResult(
      cartesian: "($x, $y, $z)",
      spherical:
          "(r = ${_format(r)}, θ = ${_format(_radToDeg(theta))}°, φ = ${_format(_radToDeg(phi))}°)",
      cylindrical:
          "(ρ = ${_format(rho)}, φ = ${_format(_radToDeg(phi))}°, z = ${_format(z)})",
    );
  }

  static CoordinateResult convertFromSpherical({
    required double r,
    required double thetaDeg,
    required double phiDeg,
  }) {
    final double theta = _degToRad(thetaDeg);
    final double phi = _degToRad(phiDeg);

    final double x = r * sin(theta) * cos(phi);
    final double y = r * sin(theta) * sin(phi);
    final double z = r * cos(theta);
    final double rho = r * sin(theta);

    return CoordinateResult(
      cartesian:
          "(x = ${_format(x)}, y = ${_format(y)}, z = ${_format(z)})",
      spherical:
          "(r = ${_format(r)}, θ = ${_format(thetaDeg)}°, φ = ${_format(phiDeg)}°)",
      cylindrical:
          "(ρ = ${_format(rho)}, φ = ${_format(phiDeg)}°, z = ${_format(z)})",
    );
  }

  static CoordinateResult convertFromCylindrical({
    required double rho,
    required double phiDeg,
    required double z,
  }) {
    final double phi = _degToRad(phiDeg);

    final double x = rho * cos(phi);
    final double y = rho * sin(phi);

    final double r = sqrt(rho * rho + z * z);

    final double theta = r == 0 ? 0 : atan2(rho, z);

    return CoordinateResult(
      cartesian:
          "(x = ${_format(x)}, y = ${_format(y)}, z = ${_format(z)})",
      spherical:
          "(r = ${_format(r)}, θ = ${_format(_radToDeg(theta))}°, φ = ${_format(phiDeg)}°)",
      cylindrical:
          "(ρ = ${_format(rho)}, φ = ${_format(phiDeg)}°, z = ${_format(z)})",
    );
  }

  static double _degToRad(double degree) {
    return degree * pi / 180;
  }

  static double _radToDeg(double radian) {
    return radian * 180 / pi;
  }

  static String _format(double value) {
    return value.toStringAsFixed(3);
  }
}
