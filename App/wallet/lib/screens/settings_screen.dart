import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:wallet/screens/settings/account_screen.dart';
import 'package:wallet/screens/settings/header_screen.dart';
import 'package:wallet/screens/settings/notification_screen.dart';
import 'package:wallet/utils.dart';
import 'package:wallet/widgets/icon_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              HeaderScreen(),
              SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  AccountScreen(),
                  NotificationsScreen(),
                  buildLogout(),
                  buildDeleteAccount(),
                ],
              ),
              const SizedBox(height: 32),
              SettingsGroup(
                title: 'FEEDBACK',
                children: <Widget>[
                  const SizedBox(height: 8),
                  buildReportBug(context),
                  buildSendFeedback(context),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent),
        onTap: () => FirebaseAuth.instance.signOut(),
      );

  Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete, color: Colors.pink),
        onTap: () => Utils.showSnackBar('Clicked Delete Account'),
      );

  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: '',
        leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
        onTap: () => Utils.showSnackBar('Clicked Report A Bug'),
      );

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
        onTap: () => Utils.showSnackBar('Clicked SendFeedback'),
      );
}
