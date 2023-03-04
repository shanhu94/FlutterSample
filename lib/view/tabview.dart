import 'package:flutter/material.dart';
import 'package:product_browser/view/chat/chat_view.dart';
import 'package:product_browser/view/home/home_view.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int pageIndex = 0;
  HomeViewStyle style = HomeViewStyle.list;

  List<TabPage> get tabPage => [
        TabPage(
            title: '首页',
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      style = style.next();
                    });
                  },
                  icon: Icon(
                    Icons.change_circle_outlined,
                    color: Theme.of(context).colorScheme.onBackground,
                  ))
            ],
            body: HomeView(
              style: style,
            )),
        TabPage(
          title: '聊天',
          body: const ChatView(),
        ),
        TabPage(
            title: '我的',
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Hello World'), Text('Line')]),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(tabPage[pageIndex].title),
        actions: tabPage[pageIndex].actions,
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
  List<Widget>? actions;
  Widget body;
  TabPage({required this.title, required this.body, this.actions});
}
