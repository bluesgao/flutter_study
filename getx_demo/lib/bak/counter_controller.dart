import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs; // 使用 .obs 使其成为响应式变量

  void increment() => count++;

  void decrement() => {
        if (count > 0) {count--}
      };
}
