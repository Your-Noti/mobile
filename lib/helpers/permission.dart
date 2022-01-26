import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

Future askNotificationPermission() async {
  await Permission.notification.request();
}

Future getNotificationPermission() async {
  var status = await Permission.notification.status;

  return status;
}

Future<bool> isAskNotificationPermission() async {
  PermissionStatus status = await Permission.notification.status;

  return !status.isDenied;
}
