import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> myTabs = <Tab>[
      Tab(text: 'All'),
      Tab(text: 'Going'),
    ];

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.grey,
            unselectedLabelColor: Colors.amber,
            indicatorColor: Colors.blue,
            indicatorWeight: 2,
            tabs: myTabs,
          ),
          Container(
            height: 300 ,
            child: TabBarView(
              children: myTabs.map((Tab tab) {
                return const Center(
                  child: Text(
                    'Content',
                    style: const TextStyle(fontSize: 36),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
