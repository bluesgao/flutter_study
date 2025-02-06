import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();
  runApp(const App());
}

void init() async {
  await GetStorage.init();
}
