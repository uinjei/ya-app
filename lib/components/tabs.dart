import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ya/events/event-list-page.dart';

class TabsPage extends StatelessWidget {
  TabsPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabArgsList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('YA Vanguards'),
          bottom: TabBar(
            tabs: tabList,
          ),
        ),
        body: TabBarView(
          children: tabArgsList.map((tabData) {
            return tabData.page;
          }).toList(),
        ),
      ),
    );
  }
}

/* args */
class TabArgs {

  TabArgs({this.tab, this.page});
  
  Tab tab;
  Widget page;
}

final List<TabArgs> tabArgsList = <TabArgs>[
  TabArgs(
    tab: Tab(icon: Icon(Icons.calendar_view_day),),
    page: EventListPage(title: 'Events',)
  ),
];

final List<Tab> tabList = tabArgsList.map((e) => e.tab).toList();