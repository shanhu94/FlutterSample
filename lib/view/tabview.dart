import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  int pageIndex = 0;

  List<TabPage> get tabPage => [
    TabPage(
      title: '首页',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('lkajsdlkfjad World'),
            Text('Line')
          ]
        ),
      )
    ),
    TabPage(
      title: '聊天',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            Text('Line')
          ]
        ),
      )
    ),
    TabPage(
      title: '我的',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Hello World'),
            Text('Line')
          ]
        ),
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(tabPage[pageIndex].title),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: tabPage[pageIndex].body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Text('ALKJALK'), label: 'F'),
          BottomNavigationBarItem(icon: Text('Second'), label: 'S'),
          BottomNavigationBarItem(icon: Text('Third'), label: 'T'),
        ],
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}

class TabPage {
  final String title;
  Widget body;
  TabPage({required this.title, required this.body});
}