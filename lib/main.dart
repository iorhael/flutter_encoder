import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/file_encrypt/states/encrypting_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: ChangeNotifierProvider(
        create: (_) => EncryptingState(),
        child: MyApp(settingsController: settingsController)),
  ));
}
