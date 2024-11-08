import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'settings/settings_view.dart';
import 'text_encrypt/text_encrypting_view.dart';
import 'file_encrypt/file_encrypting_view.dart';
import 'file_encrypt/states/encrypting_state.dart';
import 'file_encrypt/components/loading_card.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String nameRoute = '/';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _tabs = [
    TextEncryptingView(),
    FileEncryptingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isEncrypting = context.watch<EncryptingState>().isEncrypting;

    return Scaffold(
      body: Stack(
        children: [
          DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
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
                      Navigator.restorablePushNamed(
                          context, SettingsView.routeName);
                    },
                  ),
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.text_fields_rounded),
                      text: context.tr('textTabTitle'),
                    ),
                    Tab(
                      icon: Icon(Icons.upload_file_rounded),
                      text: context.tr('fileTabTitle'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: _tabs,
              ),
            ),
          ),
          if (isEncrypting) ...[
            ModalBarrier(
              dismissible: false,
              color: Colors.black54,
            ),
            Center(child: LoadingCard()),
          ]
        ],
      ),
    );
  }
}
