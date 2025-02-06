import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/log.dart';
import 'counter_logic.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  final CounterLogic logic = Get.put(CounterLogic());
  final CounterState state = Get.find<CounterLogic>().state;

  final log = Log();

  @override
  Widget build(BuildContext context) {
    // final CounterController controller = Get.find<CounterController>();

    // 获取路由传递的参数
    Map routeArgs = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("案例: ${routeArgs["title"]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text("${state.count}",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log.debug("logic点击了加号按钮");
                      logic.increment();
                    },
                    child: Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      log.debug("点击了减号按钮");
                      logic.decrement();
                    },
                    child: Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controllers.increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
