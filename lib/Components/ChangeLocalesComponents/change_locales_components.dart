import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class ChangeLocalesComponents extends StatelessWidget {
  const ChangeLocalesComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title:  const Text("Language"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("English"),
            onTap: () => LocaleNotifier.of(context)?.change('en'),
          ),
          ListTile(
            title: const Text("عربي"),
            onTap: () => LocaleNotifier.of(context)?.change('ar'),
          ),
        ],
      ),
    );
  }
}
