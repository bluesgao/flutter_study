import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

/// 获取存储权限
Future<void> getStoragePermission() async {
  late PermissionStatus myPermission;

  /// 读取系统权限
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    myPermission = await Permission.photosAddOnly.request();
  } else {
    myPermission = await Permission.storage.request();
  }
  if (myPermission == PermissionStatus.granted) {
    print('getStoragePermission: $myPermission');
  } else {
    if (myPermission == PermissionStatus.permanentlyDenied) {
      print('getStoragePermission: permanentlyDenied');
      openAppSettings();
    } else if (myPermission == PermissionStatus.denied) {
      print('getStoragePermission: denied');
    } else if (myPermission == PermissionStatus.limited) {
      print('getStoragePermission: limited');
    }
  }
}

/// 获取相机权限
Future<bool> getCameraPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.camera.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取麦克风权限
Future<bool> getMicrophonePermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.microphone.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取通讯录权限
Future<bool> getContactsPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.contacts.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取位置权限
Future<bool> getLocationPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.location.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取网络权限
// Future<bool> getNetworkPermission() async {
//   late PermissionStatus myPermission;
//   myPermission = await Permission.network.request();
//   if (myPermission != PermissionStatus.granted) {
//     return false;
//   } else {
//     return true;
//   }
// }

/// 获取电话权限
Future<bool> getPhonePermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.phone.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取短信权限
Future<bool> getSmsPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.sms.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取日历权限
Future<bool> getCalendarPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.calendar.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取蓝牙权限
Future<bool> getBluetoothPermission() async {
  late PermissionStatus myPermission;
  myPermission = await Permission.bluetooth.request();
  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

/// 获取系统设置权限
// Future<bool> getSystemSettingPermission() async {
//   late PermissionStatus myPermission;
//   myPermission = await Permission.systemSetting.request();
//   if (myPermission != PermissionStatus.granted) {
//     return false;
//   } else {
//     return true;
//   }
// }

Future<void> checkPermission() async {
  print('checkPermission');
  // 请求存储权限
  await getStoragePermission();
  await getCameraPermission();
  await getMicrophonePermission();
  await getContactsPermission();
  await getLocationPermission();
  await getPhonePermission();
  await getSmsPermission();
}
