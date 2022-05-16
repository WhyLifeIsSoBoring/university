import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/events/events_screen.dart';
import 'package:home/schools/schools_screen.dart';
import 'package:presentation/presentation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.newspaper_rounded),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('События'),
                    )
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.school_rounded),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('Школы'),
                    )
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.star_outlined),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('Курсы'),
                    )
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.more_vert_outlined),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('Еще'),
                    )
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: AppColorTheme.lightGrey,
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    backgroundColor: AppColorTheme.white,
                    child: EventsScreen(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    backgroundColor: AppColorTheme.white,
                    child: SchoolsScreen(),
                  );
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    backgroundColor: AppColorTheme.white,
                    child: EventsScreen(),
                  );
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    backgroundColor: AppColorTheme.white,
                    child: EventsScreen(),
                  );
                },
              );
            case 4:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    backgroundColor: AppColorTheme.white,
                    child: EventsScreen(),
                  );
                },
              );
            default:
              return const CupertinoTabView();
          }
        },
      ),
    );
  }
}
