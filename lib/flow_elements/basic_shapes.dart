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
  ..addPolygon(const [Offset(0, 35), Offset(17.5, 0), Offset(35, 35)], true);

final triangleShapeBig = Path()
  ..addPolygon(const [Offset(0, 90), Offset(45, 0), Offset(90, 90)], true);

final circleShape = Path()..addOval(const Rect.fromLTWH(0, 0, 35, 35));
final circleShapeBig = Path()..addOval(const Rect.fromLTWH(0, 0, 90, 90));
