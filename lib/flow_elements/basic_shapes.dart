import 'dart:ui';

final rectangleShape = Path()..addRect(const Rect.fromLTWH(0, 0, 40, 20));
final rectangleShapeBig = Path()..addRect(const Rect.fromLTWH(0, 0, 180, 90));

final roundedRectangleShape = Path()
  ..addRRect(RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, 40, 20), const Radius.circular(4)));

final roundedRectangleShapeBig = Path()
  ..addRRect(RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, 180, 90), const Radius.circular(8)));

final triangleShape = Path()
  ..moveTo(0, 40)
  ..lineTo(20, 0)
  ..lineTo(40, 40)
  ..lineTo(0, 40)
  ..close();
final triangleShapeBig = Path()
  ..moveTo(0, 90)
  ..lineTo(45, 0)
  ..lineTo(90, 90)
  ..lineTo(0, 90)
  ..close();

final circleShape = Path()..addOval(const Rect.fromLTWH(0, 0, 40, 40));
final circleShapeBig = Path()..addOval(const Rect.fromLTWH(0, 0, 90, 90));
