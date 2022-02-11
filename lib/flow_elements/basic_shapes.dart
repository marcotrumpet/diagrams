import 'dart:ui';

final rectangleShape = Path()..addRect(const Rect.fromLTWH(0, 0, 180, 90));

final roundedRectangleShape = Path()
  ..addRRect(RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, 180, 90), const Radius.circular(8)));

final triangleShape = Path()
  ..moveTo(0, 90)
  ..lineTo(45, 0)
  ..lineTo(90, 90)
  ..lineTo(0, 90)
  ..close();

final circleShape = Path()..addOval(const Rect.fromLTWH(0, 0, 90, 90));
