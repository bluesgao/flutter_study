import 'package:get/get.dart';

import 'counter_state.dart';

class CounterLogic extends GetxController {
  final CounterState state = CounterState();

  void increment() => {state.count++};

  void decrement() => {
        if (state.count > 0) {state.count--}
      };
}
