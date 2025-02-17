import 'package:flutter/material.dart';

class BillPage extends StatelessWidget {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Sliver Example"),
                  background: Image.network(
                    'https://images.pexels.com/photos/30699925/pexels-photo-30699925.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(title: Text('Item $index'));
                  },
                  childCount: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.0,
                  color: Colors.green,
                  child: Center(child: Text("Custom Box")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
