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
  ..addPolygon(const [Offset(0, 40), Offset(20, 0), Offset(40, 40)], true);

final triangleShapeBig = Path()
  ..addPolygon(const [Offset(0, 90), Offset(45, 0), Offset(90, 90)], true);

final circleShape = Path()..addOval(const Rect.fromLTWH(0, 0, 40, 40));
final circleShapeBig = Path()..addOval(const Rect.fromLTWH(0, 0, 90, 90));
