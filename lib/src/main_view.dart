import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'settings/settings_view.dart';
import 'text_encode/text_encode_view.dart';
import 'history/history_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String nameRoute = '/';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    TextEncodeView(),
    HistoryView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('mainTitle')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (context.locale == const Locale('en')) {
                context.setLocale(const Locale('ru'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: context.tr('homeNavTitle'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: context.tr('historyNavTitle'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
