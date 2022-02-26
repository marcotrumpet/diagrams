// import 'package:flutter/foundation.dart';
// import 'package:system_tray/system_tray.dart';

// class AppSystemTray {
//   Future<void> initSystemTray() async {
//     final SystemTray _systemTray = SystemTray();
//     final AppWindow _appWindow = AppWindow();

//     String path = 'AppIcon';

//     final menu = [
//       MenuItem(label: 'Show', onClicked: _appWindow.show),
//       MenuItem(label: 'Hide', onClicked: _appWindow.hide),
//       MenuItem(
//         label: 'Start flash tray icon',
//         onClicked: () {
//           debugPrint("Start flash tray icon");
//         },
//       ),
//       MenuSeparator(),
//       SubMenu(
//         label: "Test API",
//         children: [
//           SubMenu(
//             label: "setSystemTrayInfo",
//             children: [
//               MenuItem(
//                 label: 'set title',
//                 onClicked: () {
//                   _systemTray.setSystemTrayInfo(
//                     title: 'text',
//                   );
//                 },
//               ),
//               MenuItem(
//                 label: 'set icon path',
//                 onClicked: () {
//                   debugPrint("click 'set icon path' : $path");
//                   _systemTray.setSystemTrayInfo(
//                     iconPath: path,
//                   );
//                 },
//               ),
//             ],
//           ),
//           MenuItem(label: 'disabled Item', enabled: false),
//         ],
//       ),
//       MenuSeparator(),
//       MenuItem(
//         label: 'Exit',
//         onClicked: _appWindow.close,
//       ),
//     ];

//     // We first init the systray menu and then add the menu entries
//     await _systemTray.initSystemTray(
//       title: "",
//       iconPath: path,
//       toolTip: "How to use system tray with Flutter",
//     );

//     await _systemTray.setContextMenu(menu);

//     // handle system tray event
//     _systemTray.registerSystemTrayEventHandler((eventName) {
//       debugPrint("eventName: $eventName");
//       if (eventName == "leftMouseDown") {
//       } else if (eventName == "leftMouseUp") {
//         _appWindow.show();
//       } else if (eventName == "rightMouseDown") {
//       } else if (eventName == "rightMouseUp") {
//         _systemTray.popUpContextMenu();
//       }
//     });
//   }
// }
