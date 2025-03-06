import 'package:easyrefresh_demo/util/color_utils.dart';
import 'package:easyrefresh_demo/widget/paths_painter.dart';
import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key, required this.iconButtons});

  final List<IconButton> iconButtons;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          iconButtons.map<IconButton>((IconButton btn) {
            return btn;
          }).toList(),
    );
  }
}
