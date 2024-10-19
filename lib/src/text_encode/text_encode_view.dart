import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../file_encode/file_encode_view.dart';
import 'text_input_view.dart';

class TextEncodeView extends StatelessWidget {
  TextEncodeView({super.key});

  final List<Widget> _tabs = [
    TextInputView(),
    FileEncodeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.text_fields_rounded),
                  text: context.tr('textTabTitle')),
              Tab(
                  icon: Icon(Icons.upload_file_rounded),
                  text: context.tr('fileTabTitle')),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
