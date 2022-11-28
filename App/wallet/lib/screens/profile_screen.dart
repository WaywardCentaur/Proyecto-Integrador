import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:wallet/screens/settings/header_screen.dart';
import 'package:wallet/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String title = 'Settings';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: HeaderScreen.keyDarkMode,
      defaultValue: true,
      builder: (_, isDarkMode, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ProfileScreen.title,
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.teal,
                scaffoldBackgroundColor: Color(0xFF170635),
                canvasColor: Color(0xFF170635),
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
              )
            : ThemeData.light().copyWith(accentColor: Colors.black),
        home: SettingsPage(),
      ),
    );
  }
}
