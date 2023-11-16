import 'package:attendance/Hive/all_student_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:attendance/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'Hive/absent_student_adapter.dart';
import 'Models/student_model.dart';
import 'Utils/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Student>(StudentAdapter());
  Hive.registerAdapter<StudentAbsent>(StudentAbsentAdapter());
  await Hive.initFlutter();
  await Locales.init(['en', 'ar']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
        builder: (locale) => MultiProvider(
              providers: providers,
              child: MaterialApp(
                title: 'Attendance System',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const LoginScreen(),
              ),
            ));
  }
}
