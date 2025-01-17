import 'package:flutter/material.dart';
import 'package:flutter_study/model/game_model.dart';

class CardWidget extends StatelessWidget {
  final GameInfo gameInfo;

  const CardWidget({super.key, required this.gameInfo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 0),
        elevation: 5, // 阴影效果
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // 圆角
        ),
        child: Container(
            padding: EdgeInsets.all(0),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // 圆角
                image: DecorationImage(
                  image: NetworkImage(gameInfo.imageUrl),
                  fit: BoxFit.cover,
                )),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  gameInfo.name,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  gameInfo.desc,
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('玩法'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('开始'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
