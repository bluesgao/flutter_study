import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class GroupListWidget extends StatelessWidget {
  //图片列表
  // final List<String> imgList;
  // const GroupListWidget({super.key, required this.imgList});
  List _elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
  ];
  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
      elements: _elements,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: SizedBox(
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const Icon(Icons.account_circle),
              title: Text(element['name']),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
    );
  }
}