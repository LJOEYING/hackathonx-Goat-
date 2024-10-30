import 'package:flutter/material.dart';

// Custom clipper class `CurvedEdges` to create a curved path for widget edges.
// This clipper will be used with widgets like `ClipPath` to give curved edges.
class CurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    // First curved edge at the bottom left corner:
    // Define control point and end point for the curve
    final firstCurve = Offset(0, size.height - 20); // Control point for curve
    final lastCurve = Offset(30, size.height - 20); // Endpoint for curve
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    // Second curved edge across the bottom:
    // Creates a larger curve from left to near the bottom right
    final secondFirstCurve = Offset(0, size.height - 20); // Control point
    final secondLastCurve = Offset(size.width - 30, size.height - 20); // Endpoint
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    // Third curved edge at the bottom right corner:
    // Creates the curve from near the bottom right corner to the right edge
    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    // Draws a straight line from bottom right to top right
    path.lineTo(size.width, 0);

    // Closes the path to form the completed shape
    path.close();
    return path;
  }

  // Determines whether to reclip when the clipper is redrawn
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Reclip every time to apply any layout changes
  }
}
