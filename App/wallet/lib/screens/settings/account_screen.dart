import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:wallet/utils.dart';
import 'package:wallet/widgets/icon_widget.dart';

class AccountScreen extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Account Settings',
        subtitle: 'Privacy, Security, Language',
        leading: IconWidget(icon: Icons.person, color: Colors.green),
        child: SettingsScreen(
          title: 'Account Settings',
          children: <Widget>[
            buildLanguage(),
            buildLocation(),
            buildPassword(),
            buildPrivacy(context),
            buildSecurity(context),
            buildAccountInfo(context),
          ],
        ),
      );

  Widget buildLanguage() => DropDownSettingsTile(
        settingKey: keyLanguage,
        title: 'Language',
        selected: 1,
        values: <int, String>{
          1: 'English',
          2: 'Spanish',
          3: 'Chinese',
          4: 'Hindi',
        },
        onChange: (language) {/* NOOP */},
      );

  Widget buildLocation() => TextInputSettingsTile(
        settingKey: keyLocation,
        title: 'Location',
        initialValue: 'Australia',
        onChange: (location) {/* NOOP */},
      );

  Widget buildPassword() => TextInputSettingsTile(
        settingKey: keyPassword,
        title: 'Password',
        obscureText: true,
        validator: (password) => password != null && password.length >= 6
            ? null
            : 'Enter 6 characters',
      );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: 'Privacy',
        subtitle: '',
        leading: IconWidget(icon: Icons.lock, color: Colors.blue),
        onTap: () => Utils.showSnackBar('Clicked Privacy'),
      );

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
        title: 'Security',
        subtitle: '',
        leading: IconWidget(icon: Icons.security, color: Colors.red),
        onTap: () => Utils.showSnackBar('Clicked Security'),
      );

  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: 'Account Info',
        subtitle: '',
        leading: IconWidget(icon: Icons.text_snippet, color: Colors.purple),
        onTap: () => Utils.showSnackBar('Clicked Account Info'),
      );
}
