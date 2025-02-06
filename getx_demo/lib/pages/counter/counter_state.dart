import 'package:get/get.dart';

class CounterState {
  CounterState() {}

  var count = 0.obs; // 使用 .obs 使其成为响应式变量
}
